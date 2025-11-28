<?php

namespace App\Http\Controllers\Api\Games;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CategoryGame;
use App\Models\Game;
use App\Models\GameFavorite;
use App\Models\GameLike;
use App\Models\GamesKey;
use App\Models\Gateway;
use App\Models\Provider;
use App\Models\Wallet;
use App\Traits\Providers\PlayFiverTrait;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class GameController extends Controller
{
    use PlayFiverTrait;

    /**
     * @dev  
     * Display a listing of the resource.
     */
    public function index()
    {
        $providers = Cache::remember('api.games.providers', 600, function () {
            return Provider::with(['games' => function($query) {
                $query->where('status', 1)->select('id', 'provider_id', 'game_name', 'game_code', 'cover', 'views', 'is_featured');
            }, 'games.provider:id,name'])
                ->whereHas('games')
                ->orderBy('name', 'desc')
                ->where('status', 1)
                ->select('id', 'name', 'code', 'cover')
                ->get();
        });

        return response()->json(['providers' => $providers])
            ->header('Cache-Control', 'public, max-age=600')
            ->header('ETag', md5($providers->toJson()));
    }
    public function gamesCategories()
    {
        $games = Cache::remember('api.games.categories', 1800, function () {
            // Otimização: Usar eager loading para evitar N+1 queries
            // Buscar categorias e seus jogos através da tabela pivot
            $categories = Category::all();
            $result = [];
            
            // Buscar todos os jogos de uma vez com seus relacionamentos
            $allGames = Game::with(['provider:id,name', 'categories:id'])
                ->where('status', 1)
                ->select('id', 'game_name', 'game_code', 'cover', 'provider_id', 'views', 'is_featured')
                ->get()
                ->keyBy('id');
            
            // Buscar relacionamentos pivot de uma vez
            $categoryGames = CategoryGame::whereIn('category_id', $categories->pluck('id'))
                ->whereIn('game_id', $allGames->pluck('id'))
                ->get()
                ->groupBy('category_id');
            
            foreach ($categories as $category) {
                $categoryGameIds = $categoryGames->get($category->id, collect())->pluck('game_id');
                
                if ($categoryGameIds->isNotEmpty()) {
                    // Pegar apenas os primeiros 12 jogos ordenados por views
                    $gamesInCategory = $allGames->whereIn('id', $categoryGameIds)
                        ->sortByDesc('views')
                        ->take(12);
                    
                    if ($gamesInCategory->isNotEmpty()) {
                        $gamesList = [];
                        foreach ($gamesInCategory as $game) {
                            $gamesList[$game->game_name] = $game;
                        }
                        
                        // Contar total de jogos ativos na categoria
                        $totalCount = $categoryGameIds->count();
                        
                        $result[$category->name] = [
                            'games' => $gamesList,
                            'quantidade' => $totalCount,
                            'pagina' => 1,
                            'UPagina' => $totalCount <= 12 ? 1 : ceil($totalCount / 12),
                            'quantidadeA' => count($gamesList)
                        ];
                    }
                }
            }
            
            return $result;
        });
    
        return response()->json(['games' => $games])
            ->header('Cache-Control', 'public, max-age=1800')
            ->header('ETag', md5(json_encode($games)));
    }
    /**
     * @dev  
     * @return \Illuminate\Http\JsonResponse
     */
    public function featured()
    {
        $featured_games = Cache::remember('api.games.featured', 3600, function () {
            return Game::with(['provider:id,name,code'])
                ->where('is_featured', 1)
                ->where('status', 1)
                ->select('id', 'game_name', 'game_code', 'cover', 'provider_id', 'views', 'is_featured')
                ->orderBy('views', 'desc')
                ->get();
        });
        
        return response()->json(['featured_games' => $featured_games])
            ->header('Cache-Control', 'public, max-age=3600')
            ->header('ETag', md5($featured_games->toJson()));
    }

    /**
     * Source Provider
     *
     * @dev  
     * @param Request $request
     * @param $token
     * @param $action
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function sourceProvider(Request $request, $token, $action)
    {
        $tokenOpen = \Helper::DecToken($token);
        $validEndpoints = ['session', 'icons', 'spin', 'freenum'];

        if (in_array($action, $validEndpoints)) {
            if(isset($tokenOpen['status']) && $tokenOpen['status'])
            {
                $game = Game::whereStatus(1)->where('game_code', $tokenOpen['game'])->first();
                if(!empty($game)) {
                    $controller = \Helper::createController($game->game_code);

                    switch ($action) {
                        case 'session':
                            return $controller->session($token);
                        case 'spin':
                            return $controller->spin($request, $token);
                        case 'freenum':
                            return $controller->freenum($request, $token);
                        case 'icons':
                            return $controller->icons();
                    }
                }
            }
        } else {
            return response()->json([], 500);
        }
    }

    /**
     * @dev  
     * Store a newly created resource in storage.
     */
    public function toggleFavorite($id)
    {
        if(auth('api')->check()) {
            $checkExist = GameFavorite::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if(!empty($checkExist)) {
                if($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            }else{
                $gameFavoriteCreate = GameFavorite::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if($gameFavoriteCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }

    /**
     * @dev  
     * Store a newly created resource in storage.
     */
    public function toggleLike($id)
    {
        if(auth('api')->check()) {
            $checkExist = GameLike::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if(!empty($checkExist)) {
                if($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            }else{
                $gameLikeCreate = GameLike::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if($gameLikeCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }

    /**
     * @dev  
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $game = Game::with(['categories', 'provider'])->whereStatus(1)->find($id);
            
            if(empty($game)) {
                return response()->json([
                    'error' => 'Jogo não encontrado ou inativo',
                    'status' => false
                ], 404);
            }

            if(!Auth::guard("api")->check()) {
                return response()->json([
                    'error' => 'Você precisa estar autenticado para jogar',
                    'status' => false
                ], 401);
            }

            $wallet = Wallet::where('user_id', auth('api')->id())->first();
            
            if(empty($wallet)) {
                return response()->json([
                    'error' => 'Carteira não encontrada. Entre em contato com o suporte.',
                    'status' => false,
                    'action' => 'deposit'
                ], 200);
            }

            if($wallet->total_balance <= 0) {
                return response()->json([
                    'error' => 'Você precisa ter saldo para jogar',
                    'status' => false,
                    'action' => 'deposit'
                ], 200);
            }

            $game->increment('views');

            $token = \Helper::MakeToken([
                'id' => auth('api')->id(),
                'game' => $game->game_code
            ]);

            switch ($game->distribution) {
                case 'play_fiver':
                    try {
                        \Log::info('PlayFiver: Iniciando lançamento do jogo', [
                            'game_id' => $game->id,
                            'game_code' => $game->game_id,
                            'user_id' => auth('api')->id(),
                        ]);
                        
                        $playfiver = self::playFiverLaunch($game->game_id, $game->only_demo);
                        
                        \Log::info('PlayFiver: Resposta recebida', [
                            'response_keys' => array_keys($playfiver ?? []),
                            'has_error' => isset($playfiver['error']),
                            'has_launch_url' => isset($playfiver['launch_url']),
                            'full_response' => $playfiver,
                        ]);
                        
                        // Verificar se retornou erro
                        if(isset($playfiver['error'])) {
                            $errorMsg = $playfiver['error'] ?? 'Erro ao iniciar o jogo';
                            \Log::error('PlayFiver launch error', [
                                'error' => $errorMsg,
                                'full_response' => $playfiver,
                                'game_id' => $game->id,
                                'user_id' => auth('api')->id(),
                            ]);
                            return response()->json([
                                'error' => $errorMsg,
                                'status' => false
                            ], 400);
                        }
                        
                        // Verificar se retornou msg de erro
                        if(isset($playfiver['msg']) && $playfiver['msg'] !== '') {
                            \Log::error('PlayFiver launch message error', [
                                'msg' => $playfiver['msg'],
                                'full_response' => $playfiver,
                                'game_id' => $game->id,
                            ]);
                            return response()->json([
                                'error' => $playfiver['msg'] ?? 'Erro ao iniciar o jogo',
                                'status' => false
                            ], 400);
                        }
                        
                        // Verificar se tem launch_url
                        if(isset($playfiver['launch_url'])) {
                            \Log::info('PlayFiver: Jogo lançado com sucesso', [
                                'game_id' => $game->id,
                                'launch_url' => $playfiver['launch_url'],
                            ]);
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => $playfiver['launch_url'],
                                'token' => $token
                            ]);
                        }
                        
                        // Se chegou aqui, algo está errado
                        \Log::error('PlayFiver launch - resposta inesperada', [
                            'response' => $playfiver,
                            'game_id' => $game->id,
                            'response_type' => gettype($playfiver),
                        ]);
                        return response()->json([
                            'error' => 'Erro ao iniciar o jogo. Resposta inesperada da API.',
                            'status' => false,
                            'debug' => 'Resposta não contém launch_url nem error'
                        ], 400);
                    } catch (\Exception $e) {
                        \Log::error('Error launching play_fiver game - Exception', [
                            'message' => $e->getMessage(),
                            'file' => $e->getFile(),
                            'line' => $e->getLine(),
                            'trace' => $e->getTraceAsString(),
                            'game_id' => $game->id,
                        ]);
                        return response()->json([
                            'error' => 'Erro ao iniciar o jogo. Tente novamente.',
                            'status' => false
                        ], 500);
                    }
                    break;

                default:
                    \Log::warning('Game distribution not supported: ' . ($game->distribution ?? 'null') . ' - Game ID: ' . $game->id);
                    return response()->json([
                        'error' => 'Tipo de distribuição não suportado: ' . ($game->distribution ?? 'não definido'),
                        'status' => false
                    ], 400);
            }
            
        } catch (\Exception $e) {
            \Log::error('Error in show game: ' . $e->getMessage());
            \Log::error('Stack trace: ' . $e->getTraceAsString());
            
            return response()->json([
                'error' => 'Erro ao processar solicitação. Tente novamente.',
                'status' => false
            ], 500);
        }
    }

    /**
     * @dev  
     * Show the form for editing the specified resource.
     */
    public function allGames(Request $request)
    {
        try {
            // Criar chave de cache baseada nos parâmetros da requisição
            $cacheKey = 'api.games.all.' . md5(json_encode([
                'provider' => $request->provider ?? 'all',
                'category' => $request->category ?? 'all',
                'searchTerm' => $request->searchTerm ?? '',
                'page' => $request->page ?? 1
            ]));
            
            $games = Cache::remember($cacheKey, 600, function () use ($request) {
                $query = Game::query();
                $query->with([
                    'provider:id,name,code',
                    'categories:id,name,slug'
                ])->select('id', 'game_name', 'game_code', 'cover', 'provider_id', 'views', 'is_featured', 'status');

                if (!empty($request->provider) && $request->provider != 'all') {
                    $query->where('provider_id', $request->provider);
                }

                if (!empty($request->category) && $request->category != 'all') {
                    $query->whereHas('categories', function ($categoryQuery) use ($request) {
                        $categoryQuery->where('slug', $request->category);
                    });
                }

                if (isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 2) {
                    // Buscar em campos diretos e no relacionamento provider
                    $searchTerm = $request->searchTerm;
                    $query->where(function($q) use ($searchTerm) {
                        $q->where('game_code', 'LIKE', "%{$searchTerm}%")
                          ->orWhere('game_name', 'LIKE', "%{$searchTerm}%")
                          ->orWhere('distribution', 'LIKE', "%{$searchTerm}%")
                          ->orWhereHas('provider', function($providerQuery) use ($searchTerm) {
                              $providerQuery->where('name', 'LIKE', "%{$searchTerm}%");
                          });
                    });
                } else {
                    $query->orderBy('views', 'desc');
                }

                return $query
                    ->where('status', 1)
                    ->orderBy('views', 'desc')
                    ->paginate(12)
                    ->appends(request()->query());
            });

            return response()->json(['games' => $games])
                ->header('Cache-Control', 'public, max-age=600')
                ->header('ETag', md5($games->toJson()));
                
        } catch (\Exception $e) {
            \Log::error('Error in allGames: ' . $e->getMessage());
            \Log::error('Stack trace: ' . $e->getTraceAsString());
            
            // Retornar resposta vazia em caso de erro, mas com status 200 para não quebrar o frontend
            return response()->json([
                'games' => [
                    'data' => [],
                    'current_page' => 1,
                    'last_page' => 1,
                    'total' => 0,
                    'per_page' => 12
                ]
            ], 200);
        }
    }

    
    /**
     * @dev  
     * Source games endpoint
     */
    public function source(Request $request)
    {
        // Este endpoint pode ser usado para buscar jogos de uma fonte específica
        // Por enquanto, retorna todos os jogos ativos
        $games = Game::with(['provider:id,name,code'])
            ->where('status', 1)
            ->select('id', 'game_name', 'game_code', 'cover', 'provider_id', 'views', 'is_featured')
            ->orderBy('views', 'desc')
            ->get();
        
        return response()->json(['games' => $games]);
    }

    /**
     * @dev isaacroque5
     * Integrando com a API do PlayFiver
     */
    public function webhookPlayFiver(Request $request)
    {
        return self::webhookPlayFiverAPI($request);
    }


    /**
     * @dev  
     * Update the specified resource in storage.
     */
    public function webhookMoneyCallbackMethod(Request $request)
    {
       
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

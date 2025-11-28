<?php
namespace App\Traits\Providers;

use App\Models\GamesKey;
use App\Models\Order;
use App\Models\Game;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Request as FacadesRequest;
use App\Helpers\Core as Helper;

trait PlayFiverTrait
{

    /**
     * @var string
     */
    protected static $secretPlayFiver;
    protected static $codePlayFiver;
    protected static $tokenPlayFiver;

    private static function credencialFiverPlay()
    {
        $setting = GamesKey::first();
        self::$secretPlayFiver = $setting->getAttributes()['playfiver_secret'];
        self::$codePlayFiver = $setting->getAttributes()['playfiver_code'];
        self::$tokenPlayFiver = $setting->getAttributes()['playfiver_token'];
    }

    public static function playFiverLaunch($id, $demo)
    {
        self::credencialFiverPlay();

        // Validar credenciais antes de tentar conectar
        if (empty(self::$tokenPlayFiver) || empty(self::$secretPlayFiver) || empty(self::$codePlayFiver)) {
            Log::error('PlayFiver credentials missing', [
                'has_token' => !empty(self::$tokenPlayFiver),
                'has_secret' => !empty(self::$secretPlayFiver),
                'has_code' => !empty(self::$codePlayFiver),
            ]);
            return ["error" => "Credenciais da API PlayFiver não configuradas. Entre em contato com o suporte."];
        }

        $game = Game::where("game_code", $id)->first();
        if (!$game) {
            Log::error('PlayFiver game not found', ['game_code' => $id]);
            return ["error" => "Jogo não encontrado."];
        }

        // Continua com o lançamento do jogo independentemente do sucesso ou falha ao obter o saldo do agente
        $postArray = [
            "agentToken" => self::$tokenPlayFiver,
            "secretKey" => self::$secretPlayFiver,
            "user_code" => Auth::guard("api")->user()->email,
            "game_code" => $id,
            "game_original" => $game->original == 1 ? true : false,
            "user_balance" => self::getBalancePlayFiver(Auth::guard("api")->user()->id),
        ];

        // Múltiplas estratégias para resolver problema SSL "unrecognized name"
        $hostname = 'api.playfiver.com';
        
        // Lista de IPs conhecidos (do DNS)
        $ips = ['13.248.169.48', '76.223.54.146'];
        
        // Estratégias para tentar
        $strategies = [
            // Estratégia 1: IP direto com header Host e sem SNI
            function($ip) use ($hostname, $postArray, $id) {
                $ch = curl_init();
                curl_setopt_array($ch, [
                    CURLOPT_URL => "https://{$ip}/api/v2/game_launch",
                    CURLOPT_POST => true,
                    CURLOPT_POSTFIELDS => json_encode($postArray),
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_HTTPHEADER => [
                        'Content-Type: application/json',
                        'Accept: application/json',
                        "Host: {$hostname}",
                    ],
                    CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_SSL_VERIFYHOST => 0,
                    CURLOPT_SSLVERSION => CURL_SSLVERSION_TLSv1_2,
                    CURLOPT_TIMEOUT => 30,
                    CURLOPT_CONNECTTIMEOUT => 10,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_SSL_OPTIONS => CURLSSLOPT_NO_REVOKE,
                    // Desabilitar SNI completamente
                    CURLOPT_RESOLVE => ["{$hostname}:443:{$ip}"],
                ]);
                return $ch;
            },
            // Estratégia 2: Hostname normal com TLSv1.2
            function() use ($hostname, $postArray) {
                $ch = curl_init();
                curl_setopt_array($ch, [
                    CURLOPT_URL => "https://{$hostname}/api/v2/game_launch",
                    CURLOPT_POST => true,
                    CURLOPT_POSTFIELDS => json_encode($postArray),
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_HTTPHEADER => [
                        'Content-Type: application/json',
                        'Accept: application/json',
                    ],
                    CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_SSL_VERIFYHOST => 0,
                    CURLOPT_SSLVERSION => CURL_SSLVERSION_TLSv1_2,
                    CURLOPT_TIMEOUT => 30,
                    CURLOPT_CONNECTTIMEOUT => 10,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                ]);
                return $ch;
            },
        ];
        
        $lastError = null;
        $responseBody = null;
        $httpCode = null;
        $success = false;
        
        // Tentar cada estratégia
        foreach ($strategies as $strategyIndex => $strategy) {
            try {
                if ($strategyIndex === 0) {
                    // Estratégia 1: tentar com cada IP
                    foreach ($ips as $ip) {
                        Log::info("PlayFiver: Tentando estratégia 1 com IP {$ip}");
                        $ch = $strategy($ip);
                        
                        $responseBody = curl_exec($ch);
                        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                        $curlError = curl_error($ch);
                        $curlErrno = curl_errno($ch);
                        
                        curl_close($ch);
                        
                        if ($curlErrno === 0 && $httpCode >= 200 && $httpCode < 300) {
                            Log::info("PlayFiver: Sucesso com IP {$ip}");
                            $success = true;
                            break 2; // Sair de ambos os loops
                        }
                        
                        if ($curlErrno !== 0) {
                            Log::warning("PlayFiver: IP {$ip} falhou", ['error' => $curlError, 'errno' => $curlErrno]);
                            $lastError = $curlError;
                        }
                    }
                } else {
                    // Outras estratégias
                    Log::info("PlayFiver: Tentando estratégia " . ($strategyIndex + 1));
                    $ch = $strategy();
                    
                    $responseBody = curl_exec($ch);
                    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                    $curlError = curl_error($ch);
                    $curlErrno = curl_errno($ch);
                    
                    curl_close($ch);
                    
                    if ($curlErrno === 0 && $httpCode >= 200 && $httpCode < 300) {
                        Log::info("PlayFiver: Sucesso com estratégia " . ($strategyIndex + 1));
                        $success = true;
                        break;
                    }
                    
                    if ($curlErrno !== 0) {
                        Log::warning("PlayFiver: Estratégia " . ($strategyIndex + 1) . " falhou", ['error' => $curlError]);
                        $lastError = $curlError;
                    }
                }
            } catch (\Exception $e) {
                Log::error("PlayFiver: Exceção na estratégia " . ($strategyIndex + 1), ['error' => $e->getMessage()]);
                $lastError = $e->getMessage();
            }
        }
        
        // Se todas as estratégias falharam
        if (!$success || !$responseBody) {
            Log::error('PlayFiver: Todas as estratégias falharam', [
                'last_error' => $lastError,
                'game_code' => $id,
                'http_code' => $httpCode,
            ]);
            return ["error" => "Erro ao conectar com a API do jogo. Entre em contato com o suporte."];
        }
        
        try {
            
            // Criar resposta simulada para compatibilidade
            $data = json_decode($responseBody, true);
            
            if ($httpCode >= 200 && $httpCode < 300) {
                // Sucesso
                if (isset($data['launch_url'])) {
                    Log::info('PlayFiver: Jogo lançado com sucesso', ['game_code' => $id]);
                    return ["launch_url" => $data['launch_url']];
                } elseif (isset($data['error']) || isset($data['msg'])) {
                    $errorMsg = $data['error'] ?? $data['msg'] ?? 'Erro desconhecido';
                    Log::error('PlayFiver: Erro na resposta', ['error' => $errorMsg, 'data' => $data]);
                    return ["error" => $errorMsg];
                } else {
                    Log::error('PlayFiver: Resposta sem launch_url', ['data' => $data]);
                    return ["error" => "Resposta da API sem URL de lançamento."];
                }
            } else {
                // Erro HTTP
                $errorMsg = $data['message'] ?? $data['error'] ?? $data['msg'] ?? "Erro HTTP {$httpCode}";
                Log::error('PlayFiver: Erro HTTP', [
                    'code' => $httpCode,
                    'error' => $errorMsg,
                    'response' => $data,
                ]);
                return ["error" => $errorMsg, "status_code" => $httpCode];
            }
            
        } catch (\Exception $e) {
            Log::error('PlayFiver: Exceção ao fazer requisição', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'game_code' => $id,
            ]);
            return ["error" => "Erro ao conectar com a API do jogo. Tente novamente mais tarde."];
        }
    }
    
    /**
     * Método fallback usando Http facade do Laravel
     */
    private static function playFiverLaunchFallback($id, $demo, $postArray)
    {
        try {
            Log::info('PlayFiver: Usando fallback com Http facade');
            
            $response = Http::withOptions([
                'curl' => [
                    CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_SSL_VERIFYHOST => 0,
                    CURLOPT_SSLVERSION => CURL_SSLVERSION_TLSv1_2,
                    CURLOPT_TIMEOUT => 30,
                    CURLOPT_CONNECTTIMEOUT => 10,
                ],
            ])->post("https://api.playfiver.com/api/v2/game_launch", $postArray);
            
            if ($response->successful()) {
                $data = $response->json();
                if (isset($data['launch_url'])) {
                    return ["launch_url" => $data['launch_url']];
                }
            }
            
            $errorData = $response->json();
            return ["error" => $errorData['message'] ?? $errorData['error'] ?? 'Erro ao lançar o jogo'];
        } catch (\Exception $e) {
            Log::error('PlayFiver: Fallback também falhou', ['error' => $e->getMessage()]);
            return ["error" => "Erro ao conectar com a API do jogo. Tente novamente mais tarde."];
        }
    }
    public static function webhookPlayFiverAPI(Request $request)
    {
        $tipo = $request->input("type");
        switch ($tipo) {
            case 'Balance':
                return self::getBalancePlayFiverAPI($request);
            case 'WinBet':
                return self::percaOuGanhoPlayFiver($request);
            case 'Refund':
                return self::refundPlayFiverApi($request);
        }
    }
    private static function getBalancePlayFiverAPI($dados)
    {
        $user = User::where("email", $dados->input("user_code"))->first();
        if ($user != null) {
            $saldo = (float)$user->wallet->balance + (float)$user->wallet->balance_bonus + (float) +(float)$user->wallet->balance_withdrawal;
            return response()->json(["msg" => "", "balance" => number_format($saldo, 2, ".", ".")]);
        } else {
            return response()->json(["msg" => "INVALID_USER", "balance" => 0]);
        }
    }
    private static function refundPlayFiverApi($dados)
    {
        $user = User::where("email", $dados->input("user_code"))->first();
        $detalhes = $dados->input($dados->input("game_type"));
        $order = Order::where("round_id", $detalhes["round_id"])->first();
        if ($order == null || $user == null) {
            return response()->json(["msg" => "INVALID_USER", "balance" => 0]);
        }
        $order->update(["refunded" => true]);
        $wallet = $user->wallet;
        $user->wallet->increment("balance_withdrawal", $detalhes['win']);
        $saldo = ((float)$wallet->balance + (float)$wallet->balance_bonus + (float)$wallet->balance_withdrawal) + $detalhes['win'];

        return response()->json(["msg" => "", "balance" => $saldo]);
    }
    private static function percaOuGanhoPlayFiver($dados)
    {
        self::credencialFiverPlay();

        $agentSecret = $dados->input('agent_secret');
        $agentCode = $dados->input('agent_code');
        
        if ($agentSecret !== self::$secretPlayFiver || $agentCode !== self::$codePlayFiver) {
            Log::warning('Tentativa de acesso não autorizado ao webhook da PlayFiver.', [
                'ip' => request()->ip(),
                'agent_code' => $agentCode,
                'agent_secret' => $agentSecret,
                'dados' => $dados->all()
            ]);
            return response()->json(["msg" => "UNAUTHORIZED", "balance" => 0], 401);
        }
        
        $user = User::where("email", $dados->input("user_code"))->first();
        if ($user != null) {
            $wallet = $user->wallet;
            $detalhes = $dados->input($dados->input("game_type"));

            $bet = $detalhes['bet'];
            $win = $detalhes['win'];
            $saldo = $wallet->balance;
            $saldoAnt = (float)$wallet->balance + (float)$wallet->balance_bonus + (float)$wallet->balance_withdrawal;                    
            $saldo = ((float)$wallet->balance + (float)$wallet->balance_bonus + (float)$wallet->balance_withdrawal) - $bet + $win;
            $changeBonus = null;
            if ($saldoAnt >= $bet) {   
                if ($wallet->balance_bonus > $bet) {
                    $wallet->decrement('balance_bonus', $bet);
                    $changeBonus = 'balance_bonus';
                } elseif ($wallet->balance >= $bet) {
                    $wallet->decrement('balance', $bet);
                    $changeBonus = 'balance';
                } elseif ($wallet->balance_withdrawal >= $bet) {
                    $wallet->decrement('balance_withdrawal', $bet);
                    $changeBonus = 'balance_withdrawal';
                } else {
                    $changeBonus = "balance";
                    if ($saldoAnt >= $bet) {
                        $valorPerdido = $bet;
                        $balanceBonus = $wallet->balance_bonus;
                        $balance = $wallet->balance;
                        $balanceWithdrawal = $wallet->balance_withdrawal;

                        if ($balanceBonus >= $valorPerdido) {
                            $balanceBonus -= $valorPerdido;
                            $valorPerdido = 0;
                        } else {
                            $valorPerdido -= $balanceBonus;
                            $balanceBonus = 0;
                        }


                        if ($balance >= $valorPerdido) {
                            $balance -= $valorPerdido;
                            $valorPerdido = 0;
                        } else {
                            $valorPerdido -= $balance;
                            $balance = 0;
                        }


                        if ($balanceWithdrawal >= $valorPerdido) {
                            $balanceWithdrawal -= $valorPerdido;
                            $valorPerdido = 0;
                        } else {
                            $valorPerdido -= $balanceWithdrawal;
                            $balanceWithdrawal = 0;
                        }


                        $wallet->update([
                            "balance_bonus" => $balanceBonus,
                            "balance" => $balance,
                            "balance_withdrawal" => $balanceWithdrawal
                        ]);
                    }
                }
                if ($bet == 0 && $win != 0) {
                    $changeBonus = "balance";
                }
                if ($bet != 0 || $win != 0) {
                    Order::create([
                        "user_id" => $user->id,
                        "session_id" => $detalhes['round_id'],
                        "transaction_id" => $detalhes['txn_id'],
                        "game" => $detalhes['game_code'],
                        "game_uuid" => $detalhes['game_code'],
                        "type" => $win == 0 ? "bet" : "win",
                        "type_money" => $changeBonus,
                        "amount" =>  $win == 0 ? $bet : $win,
                        "providers" => "play_fiver",
                        "refunded" => false,
                        "round_id" => $detalhes['round_id'],
                        "status" => true
                    ]);
                    Helper::generateGameHistory($user->id, $win == 0 ? "bet" : "win", $win, $bet, $changeBonus, $detalhes['txn_id']);
                }

                return response()->json(["msg" => "", "balance" => $saldo]);
            } else {
                return response()->json(["msg" => "INSUFFICIENT_USER_FUNDS"]);
            }
        } else {
            return response()->json(["msg" => "INVALID_USER"]);
        }
    }
    private static function getBalancePlayFiver($id)
    {
        $user = User::where("id", $id)->first();
        if ($user != null) {
            $saldo = (float)$user->wallet->balance + (float)$user->wallet->balance_bonus + (float) +(float)$user->wallet->balance_withdrawal;
            return $saldo;
        } else {
            return 0;
        }
    }
}

<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use JWTAuth;
use Illuminate\Support\Facades\Log;

class JWTMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next): Response
    {
        try {
            Log::info('[JWTMiddleware] Verificando autenticação', [
                'uri' => $request->getPathInfo(),
                'method' => $request->getMethod(),
                'has_token' => $request->bearerToken() ? 'sim' : 'não',
            ]);

            if(auth('api')->check()) {
                Log::info('[JWTMiddleware] Usuário autenticado', [
                    'user_id' => auth('api')->id(),
                ]);
                return $next($request);
            }

            Log::warning('[JWTMiddleware] Usuário não autenticado');
            // Mensagem mais amigável para quando o usuário não está autenticado
            return response()->json(['error' => 'Faça login ou cadastre-se para continuar'], 401);
        } catch (\Exception $e) {
            Log::error('[JWTMiddleware] Erro ao verificar autenticação', [
                'message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString(),
            ]);
            
            // Retornar 401 mesmo em caso de erro (token inválido, etc)
            return response()->json(['error' => 'Token inválido ou expirado'], 401);
        }
    }
}


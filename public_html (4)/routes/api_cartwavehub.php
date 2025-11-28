<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CartwavehubDepositController;
use App\Http\Controllers\Api\CartwavehubWebhookController;

/*
|--------------------------------------------------------------------------
| Rotas API do Cartwavehub
|--------------------------------------------------------------------------
|
| Seguindo o guia oficial:
| - Criar PIX (autenticado)
| - Webhook (público)
| - Listar depósitos (autenticado)
|
*/

// Webhook (público - não precisa autenticação)
Route::post('/cartwavehub/callback', [CartwavehubWebhookController::class, 'callback'])
    ->name('cartwavehub.webhook');

// Rotas autenticadas
Route::middleware(['auth:sanctum'])->group(function () {
    
    // Criar depósito PIX
    Route::post('/cartwavehub/create-pix', [CartwavehubDepositController::class, 'createPix'])
        ->name('cartwavehub.create-pix');
    
    // Listar meus depósitos
    Route::get('/cartwavehub/my-deposits', [CartwavehubDepositController::class, 'myDeposits'])
        ->name('cartwavehub.my-deposits');
});


<?php

use App\Http\Controllers\Api\Wallet\DepositController;
use Illuminate\Support\Facades\Route;

/**
 * Rotas do Gateway Arkama
 */

// Webhook para depósitos (PIX-IN) - público
Route::post('/arkama/webhook', [DepositController::class, 'arkamaWebhook'])
    ->name('arkama.webhook');

// Webhook para saques (PIX-OUT) - público (se necessário)
Route::post('/arkama/webhook-pix-out', [DepositController::class, 'arkamaWebhookPixOut'])
    ->name('arkama.webhook.pix-out');


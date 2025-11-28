<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Wallet\DepositController;

/*
|--------------------------------------------------------------------------
| Rotas API do Arkama
|--------------------------------------------------------------------------
*/

// Webhook (público - não precisa autenticação)
Route::post('/arkama/webhook', [DepositController::class, 'arkamaWebhook'])
    ->name('arkama.webhook');


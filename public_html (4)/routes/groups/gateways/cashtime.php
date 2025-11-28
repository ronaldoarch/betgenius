<?php

use App\Http\Controllers\Gateway\CashtimeController;
use Illuminate\Support\Facades\Route;

/**
 * Rotas do Gateway Cashtime
 */

// Webhook para depósitos (PIX-IN)
Route::post('/cashtime/callback', [CashtimeController::class, 'callbackPayment'])->name('cashtime.callback.payment');

// Webhook para saques (PIX-OUT)
Route::post('/cashtime/callback-withdrawal', [CashtimeController::class, 'callbackWithdrawal'])->name('cashtime.callback.withdrawal');

// Processar saque manualmente (requer autenticação admin)
Route::post('/cashtime/process-withdrawal', [CashtimeController::class, 'processWithdrawal'])
    ->middleware(['auth:sanctum'])
    ->name('cashtime.process.withdrawal');


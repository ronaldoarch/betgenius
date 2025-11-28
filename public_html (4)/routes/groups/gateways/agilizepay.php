<?php

use App\Http\Controllers\Gateway\AgilizepayController;
use Illuminate\Support\Facades\Route;

/**
 * Rotas do Gateway AgilizePay
 */

// Webhook para depósitos (PIX-IN)
Route::post('/agilizepay/callback', [AgilizepayController::class, 'callbackPayment'])->name('agilizepay.callback.payment');

// Webhook para saques (PIX-OUT)
Route::post('/agilizepay/callback-withdrawal', [AgilizepayController::class, 'callbackWithdrawal'])->name('agilizepay.callback.withdrawal');

// Processar saque manualmente (requer autenticação admin)
Route::post('/agilizepay/process-withdrawal', [AgilizepayController::class, 'processWithdrawal'])
    ->middleware(['auth:sanctum'])
    ->name('agilizepay.process.withdrawal');


<?php

use App\Http\Controllers\Gateway\CartwavehubController;
use Illuminate\Support\Facades\Route;

/**
 * Rotas do Gateway Cartwavehub
 */

// Webhook para depósitos (PIX-IN)
Route::post('/cartwavehub/callback', [CartwavehubController::class, 'callbackPayment'])->name('cartwavehub.callback.payment');

// Webhook para saques (PIX-OUT)
Route::post('/cartwavehub/callback-withdrawal', [CartwavehubController::class, 'callbackWithdrawal'])->name('cartwavehub.callback.withdrawal');

// Processar saque manualmente (requer autenticação admin)
Route::post('/cartwavehub/process-withdrawal', [CartwavehubController::class, 'processWithdrawal'])
    ->middleware(['auth:sanctum'])
    ->name('cartwavehub.process.withdrawal');

// Consultar saldo (requer autenticação admin)
Route::get('/cartwavehub/balance', [CartwavehubController::class, 'getBalance'])
    ->middleware(['auth:sanctum'])
    ->name('cartwavehub.balance');

// Listar transações (requer autenticação admin)
Route::get('/cartwavehub/transactions', [CartwavehubController::class, 'listTransactions'])
    ->middleware(['auth:sanctum'])
    ->name('cartwavehub.transactions');



// Rotas Arkama
Route::post('/arkama/webhook', [\App\Http\Controllers\Api\Wallet\DepositController::class, 'arkamaWebhook']);
Route::post('/arkama/webhook-pix-out', [\App\Http\Controllers\Api\Wallet\WithdrawalController::class, 'arkamaWebhookPixOut']);

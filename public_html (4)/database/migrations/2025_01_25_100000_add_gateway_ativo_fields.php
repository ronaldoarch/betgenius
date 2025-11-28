<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            // Adiciona campos para ativar/desativar cada gateway
            $table->boolean('bspay_ativo')->default(false)->after('bspay_secret');
            $table->boolean('suitpay_ativo')->default(false)->after('suitpay_pix');
            $table->boolean('stripe_ativo')->default(false)->after('stripe_production_secret_key');
            $table->boolean('sharkpay_ativo')->default(false)->after('sharkpay_secret_key');
            $table->boolean('agilizepay_ativo')->default(false)->after('agilizepay_secret');
            $table->boolean('cashtime_ativo')->default(false)->after('cashtime_client_secret');
            $table->boolean('cartwavehub_ativo')->default(false)->after('cartwavehub_api_public');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $table->dropColumn([
                'bspay_ativo',
                'suitpay_ativo',
                'stripe_ativo',
                'sharkpay_ativo',
                'agilizepay_ativo',
                'cashtime_ativo',
                'cartwavehub_ativo',
            ]);
        });
    }
};


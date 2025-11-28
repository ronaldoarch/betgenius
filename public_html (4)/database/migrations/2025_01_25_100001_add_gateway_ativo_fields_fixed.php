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
            // SEM usar AFTER para evitar erro de colunas não encontradas
            
            if (!Schema::hasColumn('gateways', 'bspay_ativo')) {
                $table->boolean('bspay_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'suitpay_ativo')) {
                $table->boolean('suitpay_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'stripe_ativo')) {
                $table->boolean('stripe_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'sharkpay_ativo')) {
                $table->boolean('sharkpay_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'agilizepay_ativo')) {
                $table->boolean('agilizepay_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'cashtime_ativo')) {
                $table->boolean('cashtime_ativo')->default(false);
            }
            
            if (!Schema::hasColumn('gateways', 'cartwavehub_ativo')) {
                $table->boolean('cartwavehub_ativo')->default(false);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $columns = [
                'bspay_ativo',
                'suitpay_ativo',
                'stripe_ativo',
                'sharkpay_ativo',
                'agilizepay_ativo',
                'cashtime_ativo',
                'cartwavehub_ativo',
            ];
            
            foreach ($columns as $column) {
                if (Schema::hasColumn('gateways', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};


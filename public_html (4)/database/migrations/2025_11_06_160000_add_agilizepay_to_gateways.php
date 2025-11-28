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
            // AgilizePay
            $table->string('agilizepay_uri')->nullable()->after('bspay_cliente_secret');
            $table->string('agilizepay_client_id')->nullable()->after('agilizepay_uri');
            $table->string('agilizepay_client_secret')->nullable()->after('agilizepay_client_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $table->dropColumn(['agilizepay_uri', 'agilizepay_client_id', 'agilizepay_client_secret']);
        });
    }
};


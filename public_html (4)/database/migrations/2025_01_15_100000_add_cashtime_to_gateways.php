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
            // Cashtime
            $table->string('cashtime_uri')->nullable()->after('agilizepay_client_secret');
            $table->string('cashtime_client_id')->nullable()->after('cashtime_uri');
            $table->string('cashtime_client_secret')->nullable()->after('cashtime_client_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $table->dropColumn(['cashtime_uri', 'cashtime_client_id', 'cashtime_client_secret']);
        });
    }
};


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
            // Cartwavehub
            $table->string('cartwavehub_uri')->nullable()->after('cashtime_client_secret');
            $table->string('cartwavehub_api_secret')->nullable()->after('cartwavehub_uri');
            $table->string('cartwavehub_api_public')->nullable()->after('cartwavehub_api_secret');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('gateways', function (Blueprint $table) {
            $table->dropColumn(['cartwavehub_uri', 'cartwavehub_api_secret', 'cartwavehub_api_public']);
        });
    }
};


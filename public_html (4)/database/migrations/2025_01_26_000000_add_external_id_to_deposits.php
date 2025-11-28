<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('deposits', function (Blueprint $table) {
            // Adiciona coluna external_id para armazenar o ID da transação do Cartwavehub
            if (!Schema::hasColumn('deposits', 'external_id')) {
                $table->string('external_id', 100)->nullable()->unique()->after('id');
            }
            
            // Adiciona índice para melhorar performance nas buscas
            $table->index('external_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('deposits', function (Blueprint $table) {
            $table->dropIndex(['external_id']);
            $table->dropColumn('external_id');
        });
    }
};


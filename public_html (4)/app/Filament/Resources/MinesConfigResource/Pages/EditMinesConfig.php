<?php

namespace App\Filament\Resources\MinesConfigResource\Pages;

use App\Filament\Resources\MinesConfigResource;
use App\Models\GameConfig;
use Filament\Resources\Pages\EditRecord;

class EditMinesConfig extends EditRecord
{
    protected static string $resource = MinesConfigResource::class;

    public function mount($record = null): void
    {
        // Tenta carregar o único registro da configuração
        $found = GameConfig::first();

        // Se não existir, cria um registro com valores padrão
        if (!$found) {
            $found = GameConfig::create([
                'bombs_count'             => 5,          // se este campo for necessário, ou remova se não for usado

            ]);
        }

        // Define o registro a ser editado
        $record = $found->id;

        parent::mount($record);
    }

    protected function getRedirectUrl(): string
    {
        return static::getResource()::getUrl('index');
    }
}

<?php

namespace App\Filament\Resources\GameResource\Pages;

use App\Filament\Resources\GameResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Database\Eloquent\Model;

class EditGame extends EditRecord
{
    protected static string $resource = GameResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function handleRecordUpdate(Model $record, array $data): Model
    {
        if(isset($data['show_home']) && $data['show_home'] == 1) {
            $data['status'] = 1;
        }

        $record->update($data);

        // Limpar cache de jogos após atualização
        GameResource::clearGamesCache();

        return $record;
    }

    protected function afterDelete(): void
    {
        // Limpar cache de jogos após deletar jogo
        GameResource::clearGamesCache();
    }
}

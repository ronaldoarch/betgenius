<?php

namespace App\Filament\Resources\DailyBonusConfigResource\Pages;

use App\Filament\Resources\DailyBonusConfigResource;
use App\Models\DailyBonusConfig;
use Filament\Resources\Pages\EditRecord;
use Filament\Pages\Actions\Action;

class EditDailyBonusConfig extends EditRecord
{
    protected static string $resource = DailyBonusConfigResource::class;

    public function mount($record = null): void
    {
        $found = DailyBonusConfig::first();

        if (!$found) {
            $found = DailyBonusConfig::create([
                'bonus_value' => 10.00,
                'cycle_hours' => 24,
            ]);
        }

        $record = $found->id;

        parent::mount($record);
    }

    protected function getRedirectUrl(): string
    {
        return static::getResource()::getUrl('index');
    }

    // 🔴 Remove todas as ações de formulário
    protected function getFormActions(): array
    {
        return [];
    }

    // 🔴 Remove o botão "Salvar" e outros do rodapé
    protected function getFooterActions(): array
    {
        return [];
    }

    // 🔴 Remove ações no topo, se houver
    protected function getHeaderActions(): array
    {
        return [];
    }
}

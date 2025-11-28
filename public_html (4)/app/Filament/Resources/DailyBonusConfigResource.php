<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DailyBonusConfigResource\Pages;
use App\Models\DailyBonusConfig;
use Filament\Resources\Resource;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Illuminate\Support\HtmlString;

class DailyBonusConfigResource extends Resource
{
    protected static ?string $model = DailyBonusConfig::class;

    protected static ?string $navigationIcon   = 'heroicon-o-ticket';
    protected static ?string $label            = 'Bônus Diário';
    protected static ?string $pluralLabel      = 'Bônus Diário';
    protected static ?string $navigationLabel  = 'Config. Bônus Diário';
    protected static ?string $navigationGroup  = 'Finanças';

    public static function canAccess(): bool
    {
        return auth()->check() && auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
        return $form->schema([
            Section::make('FUNÇÃO DESABILITADA')
                ->description(new HtmlString('
                    <div style="font-weight: 600; color: red; font-size: 16px;">
                        Função desabilitada - Casino Free | Onda Games
                    </div>
                ')),
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\EditDailyBonusConfig::route('/'),
        ];
    }
}

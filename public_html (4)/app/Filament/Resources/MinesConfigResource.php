<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MinesConfigResource\Pages;
use App\Models\GameConfig;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Forms\Components\Section;
use Illuminate\Support\HtmlString;
class MinesConfigResource extends Resource
{
    protected static ?string $model = GameConfig::class;

    protected static ?string $navigationIcon   = 'heroicon-o-ticket';
    protected static ?string $label            = 'Config. Mines';
    protected static ?string $pluralLabel      = 'Config. Mines';
    protected static ?string $navigationLabel  = 'Configuração Mines';
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
            'index' => Pages\EditMinesConfig::route('/'),
        ];
    }
}

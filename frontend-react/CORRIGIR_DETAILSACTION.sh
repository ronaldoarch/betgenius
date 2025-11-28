#!/bin/bash

# ============================================================
# ✅ CORRIGIR ERRO DE CLASSE DUPLICADA - DetailsAction
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ERRO DE CLASSE DUPLICADA - DetailsAction"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do arquivo..."
if [ -f "app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php" ]; then
    cp app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
else
    echo "⚠️  Arquivo não encontrado"
    exit 1
fi
echo ""

echo "2️⃣ Corrigindo namespace e nome da classe..."
cat > app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php << 'EOF'
<?php

namespace App\Filament\Pages\AffiliateHistory\Pages\Actions;

use App\Filament\Pages\AffiliateHistory;
use App\Filament\Pages\DetailsAffiliate;
use App\Filament\Resources\UserResource;
use App\Models\AffiliateLogs;
use Closure;
use Filament\Actions\Concerns\CanCustomizeProcess;
use Filament\Forms\Components\TextInput;
use Filament\Support\Facades\FilamentIcon;
use Filament\Support\View\Components\Modal;
use Filament\Tables\Actions\Action;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;

class DetailsAction extends Action 
{
    use CanCustomizeProcess;

    protected ?Closure $mutateRecordDataUsing = null;

    public static function getDefaultName(): ?string
    {
        return 'Detalhes';
    }
  
    protected function setUp(): void
    {
        parent::setUp();
       

        $this->label(__('Detalhes'));
       
        $this->icon('heroicon-o-chart-bar');
        $this->url(function($record){
            session()->put('providerId', $record->id);

            return route(DetailsAffiliate::getRouteName(), ["provider" => $record->id]);
        });
        $this->openUrlInNewTab();
       
    }
   
   
    
    
   
}
EOF
chmod 644 app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php
echo "✅ Arquivo corrigido"
echo ""

echo "3️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "4️⃣ Regenerando autoload do Composer..."
composer dump-autoload 2>/dev/null || echo "⚠️  Erro ao regenerar autoload"
echo "✅ Autoload regenerado"
echo ""

echo "5️⃣ Otimizando aplicação..."
php artisan config:cache 2>/dev/null || echo "⚠️  Erro ao cachear config"
php artisan route:cache 2>/dev/null || echo "⚠️  Erro ao cachear routes"
php artisan view:cache 2>/dev/null || echo "⚠️  Erro ao cachear views"
echo "✅ Aplicação otimizada"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 Correções aplicadas:"
echo "   ✅ Namespace corrigido: App\Filament\Pages\AffiliateHistory\Pages\Actions"
echo "   ✅ Nome da classe corrigido: DetailsAction (sem typo)"
echo "   ✅ Import da classe Action adicionado"
echo ""
echo "📋 Teste agora:"
echo "   - Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   - Teste as APIs:"
echo "     https://betgeniusbr.com/api/settings/data"
echo "     https://betgeniusbr.com/api/categories"
echo ""
echo "═══════════════════════════════════════════════════════════════"


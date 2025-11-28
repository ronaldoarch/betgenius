<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Gateway extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'gateways';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [

        // Suitpay
        'suitpay_uri',
        'suitpay_cliente_id',
        'suitpay_cliente_secret',
        'suitpay_ativo',

        // Stripe
        'stripe_production',
        'stripe_public_key',
        'stripe_secret_key',
        'stripe_webhook_key',
        'stripe_ativo',
        
        //EzzePay
        'ezze_uri',
        'ezze_client',
        'ezze_secret',
        'ezze_user',
        'ezze_senha',

        //DigitoPay
        'digito_uri',
        'digito_client',
        'digito_secret',

        //BsPay
        'bspay_uri',
        'bspay_cliente_id',
        'bspay_cliente_secret',
        'bspay_ativo',

        //AgilizePay
        'agilizepay_uri',
        'agilizepay_client_id',
        'agilizepay_client_secret',
        'agilizepay_ativo',

        //Cashtime
        'cashtime_uri',
        'cashtime_client_id',
        'cashtime_client_secret',
        'cashtime_ativo',

        //Cartwavehub
        'cartwavehub_uri',
        'cartwavehub_api_secret',
        'cartwavehub_api_public',
        'cartwavehub_ativo',

    ];

    protected $hidden = array('updated_at');

    /**
     * Get the user's first name.
     */
    protected function suitpayClienteId(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function suitpayClienteSecret(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function bspayClienteId(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function bspayClienteSecret(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function stripePublicKey(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Get the user's first name.
     */
    protected function stripeSecretKey(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Protect AgilizePay Client ID
     */
    protected function agilizepayClientId(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Protect AgilizePay Client Secret
     */
    protected function agilizepayClientSecret(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Protect Cartwavehub API Secret
     */
    protected function cartwavehubApiSecret(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }

    /**
     * Protect Cartwavehub API Public
     */
    protected function cartwavehubApiPublic(): Attribute
    {
        return Attribute::make(
            get: fn (?string $value) => env('APP_DEMO') ? '*********************' : $value,
        );
    }
}

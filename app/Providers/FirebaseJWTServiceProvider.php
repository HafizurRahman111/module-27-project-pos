<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class FirebaseJWTServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton('firebase-jwt', function () {
            return new class {
                public function encode(array $payload): string
                {
                    return JWT::encode($payload, config('jwt.secret'), 'HS256');
                }

                public function decode(string $token): object
                {
                    return JWT::decode($token, new Key(config('jwt.secret'), 'HS256'));
                }
            };
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}

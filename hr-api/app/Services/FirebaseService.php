<?php

namespace App\Services;

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use Illuminate\Support\Facades\Log;

class FirebaseService
{
    protected $messaging;

    public function __construct()
    {
        try {
            $this->messaging = (new Factory)
                ->withServiceAccount(base_path(env('FIREBASE_CREDENTIALS')))
                ->createMessaging();

            // dd('Firebase OK');
        } catch (\Throwable $e) {
            // dd($e->getMessage());
            Log::error("Firebase Error: " . $e->getMessage());
        }
    }

    public function sendNotification($token, $title, $body)
{
    Log::info("Masuk ke sendNotification");
    Log::info("FCM TOKEN: ".$token);

    $message = CloudMessage::new()
        ->withNotification(
            Notification::create($title, $body)
        )
        ->toToken($token);

    $this->messaging->send($message);

    Log::info("FCM BERHASIL DIKIRIM");
}
}
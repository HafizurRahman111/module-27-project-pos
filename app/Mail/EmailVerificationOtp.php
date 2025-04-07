<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class EmailVerificationOtp extends Mailable
{
    use Queueable, SerializesModels;

    public $otp, $user;

    public function __construct($otp, $user)
    {
        $this->otp = $otp;
        $this->user = $user;
    }


    public function build()
    {
        return $this->subject('Your Email Verification OTP')
            ->markdown('emails.verify-email-otp')
            ->with([
                'otp' => $this->otp,
                'expiryMinutes' => 30,
                'user' => $this->user
            ]);

    }
}

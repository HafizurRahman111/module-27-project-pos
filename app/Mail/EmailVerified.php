<?php

namespace App\Mail;

use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class EmailVerified extends Mailable
{
    use Queueable, SerializesModels;

    public $user;

    public function __construct(User $user)
    {
        // Pass the user instance to the mailable
        $this->user = $user;
    }


    public function build()
    {
        // Ensure email_verified_at is not null before calling format()
        $verificationDate = $this->user->email_verified_at
            ? $this->user->email_verified_at->format('F j, Y')
            : 'N/A'; // Or any default value

        return $this->subject('Your Email Has Been Verified')
            ->view('emails.email_verified')
            ->with([
                'userName' => $this->user->name,
                'verificationDate' => $verificationDate,
            ]);
    }
}

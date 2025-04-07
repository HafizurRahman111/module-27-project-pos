@component('mail::message')
# 👋 Hi {{ $user->name ?? 'there' }},

### ✅ Email Verification OTP

We received a request to verify your email. Use the OTP below to complete the process:

@component('mail::panel')
## 🔐 OTP: **{{ $otp }}**
@endcomponent

This OTP will expire in **{{ $expiryMinutes }} minutes**.

---

### 🚨 Didn’t request this?

If not, simply ignore this email.

---

Thanks for choosing **{{ config('app.name') }}**!
Need help? Just reply to this email.

Best regards,
**The {{ config('app.name') }} Team**
@endcomponent
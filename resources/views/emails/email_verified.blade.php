<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .content {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .content h2 {
            color: #333;
            font-size: 22px;
            margin-bottom: 15px;
        }

        .content p {
            color: #555;
            line-height: 1.5;
            font-size: 16px;
        }

        .footer {
            text-align: center;
            color: #aaa;
            font-size: 14px;
            margin-top: 30px;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .btn {
            display: inline-block;
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="content">
            <h2>Hello {{ $userName }},</h2>
            <p>Your email address has been successfully verified on our platform.</p>
            <p>Verification Date: <strong>{{ $verificationDate }}</strong></p>
        </div>
        <div class="footer">
            <p>Best regards,<br>**The {{ config('app.name') }} Team**</p>
        </div>
    </div>
</body>

</html>
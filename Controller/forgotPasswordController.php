<?php
session_start();
include('controller.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$dotenvPath = dirname(__DIR__) . '/.env';

if (file_exists($dotenvPath)) {
  $dotenv = parse_ini_file($dotenvPath);

  $DEBUG = $dotenv['DEBUG'];
  $senderEmail = $dotenv['SENDER_EMAIL'];
  $senderPassword = $dotenv['SENDER_PASSWORD'];
}

if ($DEBUG) {
  // For local
  require dirname(__DIR__) . '/mail/PHPMailer.php';
  require dirname(__DIR__) . '/mail/SMTP.php';
  require dirname(__DIR__) . '/mail/Exception.php';
} else {
  // For 000webhost
  require $_SERVER['DOCUMENT_ROOT'] . '/mail/Exception.php';
  require $_SERVER['DOCUMENT_ROOT'] . '/mail/PHPMailer.php';
  require $_SERVER['DOCUMENT_ROOT'] . '/mail/SMTP.php';
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $receiverEmail = $_POST['email'];

  $emailSubStrArray = explode('@', $receiverEmail);

  if (count($emailSubStrArray) == 2 && $emailSubStrArray[1] == 'gmail.com') {
    $_SESSION['receiverEmail'] = $receiverEmail;
    $user = $model->resetPassword();

    if ($user) {
      $loginID = $user['STID'];
      $newPassword = generateRandomPassword();

      $_SESSION['userStid'] = $user['STID'];
      $_SESSION['newPassword'] = $newPassword;

      $model->updatePassword();

      // Create a new PHPMailer instance
      $mail = new PHPMailer(true);

      try {
        // SMTP configuration
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = $senderEmail;
        $mail->Password = $senderPassword;
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        // Sender and recipient details
        $mail->setFrom('emailsender630@gmail.com', 'Course Registration Admin');
        $mail->addAddress($receiverEmail, 'Recipient Name');

        // Email content
        $mail->isHTML(true);
        $mail->Subject = 'Password Reset';
        $mail->Body = "
          <html>
          <head>
            <title>New Password</title>
          </head>
          <body>
            <h2>New Password Details</h2>
            <p>Login ID: $loginID</p>
            <p>New Password: $newPassword</p>
            <p>Please login using your new credentials.</p>
          </body>
          </html>
        ";

        // Send the email
        $mail->send();
        echo "<script type='text/javascript'>
                  window.location='../View/resetSuccess.php';
              </script>";
      } catch (Exception $e) {
        echo "<script type='text/javascript'>
                alert('Failed to send email');
                history.back();
            </script>";
      }
    } else {
      echo "<script type='text/javascript'>
              alert('User not found with this Email');
              history.back();
          </script>";
    }
  } else {
    echo "<script type='text/javascript'>
              alert('Email format is not correct');
              history.back();
          </script>";
  }
}

// Function to generate a random password
function generateRandomPassword($length = 5)
{
  $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  $password = '';

  for ($i = 0; $i < $length; $i++) {
    $password .= $characters[rand(0, strlen($characters) - 1)];
  }

  return $password;
}

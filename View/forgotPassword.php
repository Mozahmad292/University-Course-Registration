<!DOCTYPE html>
<html>

<head>
  <title>Forgot Password</title>
  <div class="container">
    <nav>
      <div class="logo">
        <a href="#"><img class="resize" src="assets/image/Capture.PNG" alt=""></a>
      </div>
    </nav>

    <div class="form-container">
      <div class="form-title">
        <h2>Forgot Password</h2>
      </div>
      <form action="../Controller/forgotPasswordController.php" method="POST" class="form">
        <b>
          <li>
            Email:
            <input type="text" name="email" class="text" autocomplete="off" placeholder="Enter your Email" required>
          </li>
        </b>
        <b>
          <li>
            <input type="submit" name="submit" class="login" value="Reset Password" id="sub">
          </li>
        </b>
        <li>
          Don't need to reset password ? <a href="login.php">Login</a>
        </li>
      </form>
    </div>

  </div>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

</html>
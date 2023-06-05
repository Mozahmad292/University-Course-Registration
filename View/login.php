<!DOCTYPE html>
<html>

<head>
  <title>Login</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
  <div class="container">
    <div class="form-container">
      <div class="form-title">
        <h2>Login</h2>
      </div>
      <form action="../Controller/loginController.php" method="POST" class="form">
        <b>
          <li>
            Username:
            <input type="text" name="username" class="text" autocomplete="off" placeholder="Enter your Username" required>
          </li>
        </b>
        <b>
          <li>
            Password:
            <input type="password" name="password" class="text" placeholder="Enter your Password" required="">
          </li>
        </b>
        <b>
          <li>
            <input type="submit" name="submit" class="login" value="Login" id="sub">
          </li>
        </b>
        <li>
          <a href="forgotPassword.php">Forgotten password ?</a>
        </li>
      </form>
    </div>
  </div>
</body>

</html>
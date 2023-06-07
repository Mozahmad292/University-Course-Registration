<!DOCTYPE html>
<html>

<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
    <div class="container">
        <div class="form-container">
            <div class="form-title">
                <h2>Password Reset</h2>
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
                    Back To <a href="login.php">Login</a>
                </li>
            </form>
        </div>
    </div>
</body>

</html>

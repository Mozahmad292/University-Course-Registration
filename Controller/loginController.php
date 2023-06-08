<?php
  session_start();
  include('controller.php');

  if (isset($_POST['submit'])) {
    $_SESSION['username'] = $_POST['username'];

    $result = $model->login();

    if($result['PASSWORD'] == $_POST['password']){
        $_SESSION['STID'] = $result['STID'];
        echo "<script type='text/javascript'>
                  window.location='../View/unfinished.php';
              </script>";
      exit();
    } else echo '<script type ="text/Javascript">alert("Wrong Username/Password");</script>';
  }


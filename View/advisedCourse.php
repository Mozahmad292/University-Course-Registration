<?php include('../Controller/viewAdvisedCourseController.php') ?>

<html>

<head>
  <title>Advised Course</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<?php include('templates/header.php'); ?>

<body align="center">
  <h1 style="margin-top: 10vh">Advised Courses</h1>
  <div>
    <h2>
      <table align="center">
        <thead>
          <tr>
            <th>COURSE CODE</th>
            <th>SECTION</th>
            <th>FACULTY</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <?php
          foreach ($rows as $row) :
            echo "<tr><td><b>" . $row['COURSE_ID'] . "</b></td><td><b>" . $row['SECTION'] . "</b></td><td><b>" . $row['FACULTY'] . "</b></td><td><b><a href='../Controller/deleteAdvisedCourseController.php?section=" . $row['SECTION'] . "&faculty=" . $row['FACULTY'] . "&course_id=" . $row['COURSE_ID'] . "'>Drop</a></b></td></tr>";
          endforeach;
          ?>
        </tbody>
      </table>
    </h2>
  </div>
  <br>
</body>

</html>

<script>
  handleActive('advised-course')
</script>
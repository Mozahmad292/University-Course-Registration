<?php include('../Controller/viewCourseController.php'); ?>

<html>

<head>
  <title>Courses</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<?php include('templates/header.php'); ?>

<body align="center">
  <h1>Courses</h1>
  <div>
    <table align="center">
      <thead>
        <tr>
          <th>COURSE CODE</th>
          <th>COURSE NAME</th>
        </tr>
      </thead>
      <tbody>

        <?php
        foreach ($rows as $row) :
          echo "<tr><td><a href='#'>" . $row["COURSE_ID"] . "</a></td><td><b>" . $row["COURSE_NAME"] . "</b></td></tr>";
        endforeach;
        ?>
      </tbody>
    </table>
  </div>
  <br>
</body>

</html>

<script>
  handleActive('courses')
</script>
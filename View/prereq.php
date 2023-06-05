<?php include('../Controller/viewPreReqCourseController.php'); ?>

<html>

<head>
  <title>Prerequisite Courses</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<?php include('templates/header.php'); ?>

<body align="center">
  <h1>Prerequisite Courses of CSE Department</h1>
  <div>
    <table align="center">
      <thead>
        <tr>
          <th>COURSE CODE</th>
          <th>PREQUISITE COURSE CODE</th>
          <th>GRADE REQUIREMENT</th>
        </tr>
      </thead>
      <tbody>
        <?php
        foreach ($rows as $row) :
          echo "<tr><td>" . $row["COURSE_ID"] . "</td><td><b>" . $row["PRE_REQ_COURSE_ID"] . "</b></td><td><b>" . $row["PRE_REQ_REQUIREMENT"] . "</b></td></tr>";
        endforeach;
        ?>
      </tbody>
    </table>
  </div>
  <br>
</body>

</html>

<script>
  handleActive('prereq-course')
</script>
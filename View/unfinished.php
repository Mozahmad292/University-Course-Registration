<?php include('../Controller/viewAddCourseController.php'); ?>
<html>

<head>
  <title>Unfinished Courses</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<?php include('templates/header.php'); ?>

<body align="center">
  <div>
    <h2>
      <table align="center" class="mrt-7">
        <thead>
          <tr>
            <th>Courses To Add</th>
          </tr>
        </thead>
        <tbody>
          <?php for ($i = 0; $i < $count; $i++) {
            echo "<tr><td><a href='../Controller/checkPreReqController.php?course_id=" . $rows[$i]['course_id'] . "'>" . $rows[$i]['course_id'] . "</a></td></tr>";
          }
          ?>
        </tbody>
      </table>
    </h2>
  </div>
  <br>
</body>

</html>

<script>
  handleActive('add-course')
</script>
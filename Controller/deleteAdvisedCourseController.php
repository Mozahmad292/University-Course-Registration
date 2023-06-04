<?php
session_start();
include('controller.php');

if (isset($_GET['section']) && isset($_GET['faculty']) && isset($_GET['course_id'])) {
	$_SESSION['section'] = $_GET['section'];
	$_SESSION['faculty'] = $_GET['faculty'];
	$_SESSION['course_id'] = $_GET['course_id'];

	if ($model->deleteAdvisedCourse()) {

		$sql2 = "UPDATE section set seat_remaining= seat_remaining+1 where faculty='" . $_SESSION['faculty'] . "' and section='" . $_SESSION['section'] . "'";
		if ($model->updateSeatStatus()) {
			echo "<script type ='text/Javascript'>
								alert('THE COURSE THAT YOU CHOSE TO DELETE, HAS BEEN REMOVED SUCCESSFULLY.');
								window.location='../View/advisedCourse.php';
							</script>";
		}
	} else {
		echo "<script type ='text/Javascript'>
						alert('Something went wrong.');
						window.location='../View/advisedCourse.php';
					</script>";
	}
}

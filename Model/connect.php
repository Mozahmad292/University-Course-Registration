<?php
$dotenvPath = dirname(__DIR__) . '/.env';

if (file_exists($dotenvPath)) {
	$dotenv = parse_ini_file($dotenvPath);

	$DEBUG = $dotenv['DEBUG'];
	$DB_USER = $dotenv['DB_USER'];
	$DB_PASSWORD = $dotenv['DB_PASSWORD'];
	$DB_NAME = $dotenv['DB_NAME'];
}

if ($DEBUG == 1) {
	$con = new mysqli("localhost", "root", "", "student_management_system");
} else {
	$con = new mysqli("localhost", $DB_USER, $DB_PASSWORD, $DB_NAME);
}

//check connection
if (!$con) {
	die("Connection failed: " . $con->connect_error);
}

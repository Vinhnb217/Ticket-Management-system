<?php
header("Content-type: text/html; charset=utf-8");
$databaseHost = 'localhost';
$databaseName = 'ticket';
$databaseUsername = 'root';
$databasePassword = ''; 
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
mysqli_set_charset($mysqli, 'UTF8');
?>
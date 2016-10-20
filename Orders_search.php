<?php
header('Content-type: text/html; charset=utf-8');
//error_reporting(E_ERROR | E_PARSE);

include_once "dbconn.php";

$mysqli->query("SET NAMES 'utf8'");

$sql = "select * from orderinfo";
$rstorder = $mysqli->query($sql);

while ($orderinfo = mysqli_fetch_assoc($rstorder)) {
  
}
?>

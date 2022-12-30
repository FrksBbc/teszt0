<?php


session_start();

  ini_set("display_errors",1);

  include("includes/config.php");
  include("includes/functions.php");
  global $connection;
  $connection = connection();

  mysqli_query($connection,"update users set email_verified_at = '".date('Y-m-d H:i:s'). "'where verification_token='".$_GET["token"]."'and email_verified_at is null");


  mysqli_affected_rows($connection) > 0 or die('Hiba keletkezett a folyamatban!');

  $_SESSION["success"] = "Sikeres aktiválás!";
  header("location: ".HTTP_ROOT."/login");
  return;

?>
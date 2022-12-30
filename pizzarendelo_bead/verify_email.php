<?php

session_start();

include("includes/config.php");
include("includes/functions.php");
include("includes/template_parts.php");
global $connection ;
$connection = connection();


$user = mysqli_fetch_object(mysqli_query($connection, "select *from users where verification_token='".
$_GET["token"]."' and new_email is not null and new_email != ''"));


isset($user->id) or die('Invalid URL!');


mysqli_query($connection, "update users set
 new_email ='',
 verification_token = '',
 email = '".$user->new_email."',
 email_verified_at='".date('Y-m-d H:i:s')."'
 where id='".$user->id."'");


$_SESSION["user"] = mysqli_fetch_object(mysqli_query($connection, "select *
from users where id='".$user->id."'"));

$_SESSION["success"]='Sikeres módosítás!';

header("location:".public_path('/account'));

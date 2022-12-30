<?php

session_start();
  ini_set("display_errors", 1);
  include("includes/config.php");
  include("includes/functions.php");
  include("includes/template_parts.php");
  global $connection;
  $connection = connection();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
    <title>Admin</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<?php print public_path('/css/materialize.css')?>" type="text/css" rel="stylesheet"
        media="screen,projection" />
    <link href="<?php print public_path('/admin/css/style.css')?>" type="text/css" rel="stylesheet"
        media="screen,projection" />
    <script>
    
    let product_to_cart = {};
    const currency = '<?php print CURRENCY ?>'
    const public_path = '<?php print public_path('/')?>'
    </script>
</head>

<body>


    <nav>
        <div class="nav-wrapper">
            <div class="nav-wrapper container">
                <a href="<?php print public_path('/')?>" class="brand-logo">Logo</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">



                    <?php
                    
          if (isset($_SESSION["user"])) {
              ?>


                    <li><a href="<?php print public_path('/system_admin/users')?>">Felhasználók</a></li>


                    <li><a href="<?php print public_path('/system_admin/orderlist')?>">Rendelések</a></li>


                    <li><a href="<?php print public_path('/logout')?>">Kilépés</a></li>

                    <?php
          }  else {
            ?>

                <li><a href="<?php print public_path('/login')?>">Belépés</a></li>
            <?php
          }
          ?>

                    
                </ul>






            </div>
        </div>
    </nav>
    
    <ul class="sidenav" id="mobile-demo">
        <?php
        
          if (isset($_SESSION["user"])) {
              ?>


        <li><a href="<?php print public_path('/system_admin/users')?>">Felhasználók</a></li>


        <li><a href="<?php print public_path('/system_admin/orderlist')?>">Rendelések</a></li>

        <li><a href="<?php print public_path('/logout')?>">Kilépés</a></li>

        <?php
          }  else {
            ?>

                <li><a href="<?php print public_path('/login')?>">Belépés</a></li>
            <?php
          }
          ?>

   

    </ul>


    <?php
    
    
      $page = $_GET["page"] ?? false;
      
      if (!$page) {
          $page = "login";
      }

      include("admin/$page.php");
    ?>

 


    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="<?php print public_path('/js/materialize.js'); ?>"></script>
    <script src="<?php print public_path('/js/init.js'); ?>"></script>

</body>

</html>
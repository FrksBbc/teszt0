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
<html lang="hu">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
    <title>Farkas Bence Pizza rendelés</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<?php print public_path('/css/materialize.css')?>" type="text/css" rel="stylesheet"
        media="screen,projection" />
    <link href="<?php print public_path('/css/style.css')?>" type="text/css" rel="stylesheet"
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
                <a href="<?php print public_path('/')?>" class="brand-logo">Főoldal</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">



                    <?php

          if (!isset($_SESSION["user"])) {
              ?>


                    <li><a href="<?php print public_path('/registration')?>">Regisztráció</a></li>


                    <li><a href="<?php print public_path('/login')?>">Belépés</a></li>

                    <?php
          } else {
              ?>
                    <li><a href="<?php print public_path('/profile')?>">Profilom</a></li>


                    <li><a href="<?php print public_path('/logout')?>">Kilépés</a></li>
                    <?php
          }
?>

                    <li>
                        <a href="#" id="top-cart-display"><i class=" material-icons">add_shopping_cart</i></a>
                        
                        <div id="ajax-cart"></div>
                    </li>
                </ul>






            </div>
        </div>
    </nav>
    
    <ul class="sidenav" id="mobile-demo">
        <?php

if (!isset($_SESSION["user"])) {
    ?>


        <li><a href="<?php print public_path('/registration')?>">Regisztráció</a></li>


        <li><a href="<?php print public_path('/login')?>">Belépés</a></li>

        <?php
} else {
    ?>
        <li><a href="<?php print public_path('/profile')?>">Profilom</a></li>


        <li><a href="<?php print public_path('/logout')?>">Kilépés</a></li>
        <?php
}
?>

        <li>
            <a href="<?php print public_path('/shopping-cart')?>">Kosár</a>
        </li>

    </ul>


    <?php


      $page = $_GET["page"] ?? false;

if (!$page) {
    $page = "index";
}

include("includes/pages/$page.php");
?>

    <footer class="page-footer orange">
        <div class="container">
            <div class="row">

                <div class="center">
                    <h5 class="white-text">Kapcsolat</h5>
                    <ul>
                        <li>06-1-111-1111</li>
                        <li>pizzarendelo@gmail.com</li>
                        <li>XY utca 1</li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                Made by <a class="orange-text text-lighten-3" href="http://materializecss.com">Materialize</a>
            </div>
        </div>
    </footer>


    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="<?php print public_path('/js/materialize.js'); ?>"></script>
    <script src="<?php print public_path('/js/init.js'); ?>"></script>

</body>

</html>
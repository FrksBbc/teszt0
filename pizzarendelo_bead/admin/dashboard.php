 <?php

 if (isset($_SESSION["user"])) {
     if (!$_SESSION["user"] ->is_admin) {
         exit('Access denied!');
     }
 } else {
     exit;
 }

?>
 <div class="section no-pad-bot" id="index-banner">
     <div class="container alpha-bg" style="width:40%">
         <br><br>
         <h1 class="header center orange-text">Admin kezdőoldal</h1>
         <div class="row">
         </div>


         <!--   Icon Section   -->
         <div class="row text-block">



             <div class="input-field col s12 text-center">
                 <a class="waves-effect waves-light btn profile-btn"
                     href="<?php print public_path('/system_admin/users')?>">Userek </a>

                 <a class="waves-effect waves-light btn profile-btn"
                     href="<?php print public_path('/system_admin/orderlist')?>">Megrendelések </a>

             </div>

         </div>
         <br><br>
     </div>
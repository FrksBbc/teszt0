 <div class="section no-pad-bot" id="index-banner">
     <div class="container alpha-bg small-container">
         <br><br>
         <h1 class="header center orange-text">Belépési adataim</h1>
         <div class="row">



             <?php
            $errors=[];

            if (isset($_POST["password"]) && isset($_POST["password_confirmation"])) {
                if (strlen($_POST["password"]) <6 ||  strlen($_POST["password"]) > 30) {
                    $errors["password"]='Minimum 6, maximum 30 karakter!';
                }

                if ($_POST["password"] != $_POST["password_confirmation"]) {
                    $errors["password_confirmation"]='A két jelszó nem azonos!';
                }

                if (count($errors) == 0) {
                    if (mysqli_query($connection, "update users set password = '".md5($_POST["password"])."' where id ='".$_SESSION["user"]->id."'")) {
                        print '<div class="col s12 text-center">Sikeres módosítás!</div>';
                    }
                }
            }

            if (isset($_POST["new_email"])) {
                if (!filter_var($_POST["new_email"], FILTER_VALIDATE_EMAIL)) {
                    $errors["new_email"]='Nem megfelelő formátum!';
                } elseif (mysqli_num_rows(mysqli_query($connection, "select id from users
                 where email like '".$_POST["new_email"]."'")) >0) {
                    $errors["new_email"]='Foglalt e-mail cím!';
                } else {
                    mysqli_query($connection, "update users set email =
                    '".($_POST["new_email"])."' where id ='".$_SESSION["user"]->id."'");
                    if ($err = mysqli_error($connection)) {
                        exit($err);
                    }


                    $_SESSION["success"] = 'Sikeres módosítás!';

                    header("location: ".$_SERVER["HTTP_REFERER"]);
                    exit;
                }
            }


            ?>


         </div>


         <?php

                        if (isset($_SESSION["success"])) {
                            print '<div class="col justify text-block">'.$_SESSION["success"].'</div>';
                            unset($_SESSION["success"]);
                        }

            $user = mysqli_fetch_object(mysqli_query($connection, "select  * from users
where id  = '".$_SESSION["user"]->id."'"))

            ?>

         <!--   Icon Section   -->
         <div class="row text-block">

             <div class="row">


                 <h5 class="header center orange-text">E-mail megváltoztatás</h5>
                 <form class="col s12" method="POST" id="regform">



                     <div class="input-field col s12 m6">
                         <input id="email" value="<?php print $user ->email?>" name="email" readonly type="email">
                         <span class="red-text errormessage"> <?php print $errors["email"] ??''; ?>
                         </span>
                         <label for="email">Jelenlegi e-mail cím</label>
                     </div>



                     <div class="input-field col s12 m6">
                         <input id="new_email" name="new_email" type="email"
                             value="<?php print $_POST["new_email"]??''?>">
                         <span class="red-text errormessage password">
                             <?php print $errors["new_email"] ??''; ?>
                         </span>
                         <label for="new_email">Új e-mail cím</label>
                     </div>

                     <input type="hidden" name="submitted" value="1">
                     <div class="input-field col s12 text-center">
                         <button class="waves-effect waves-light btn" htef=""><i
                                 class="material-icons right">check</i>Mentés!</button>
                     </div>

             </div>

             </form>



             <h5 class="header center orange-text">Jelszó változtatás</h5>
             <form class="col s12" method="POST" id="regform">



                 <div class="input-field col s12 m6">
                     <input id="password" value="<?php print $password??''?>" name="password" type="password">
                     <span class="red-text errormessage"> <?php print $errors["password"] ??''; ?>
                     </span>
                     <label for="password">Jelszó</label>
                 </div>



                 <div class="input-field col s12 m6">
                     <input id="password_confirmation" name="password_confirmation" type="password">
                     <span class="red-text errormessage password">
                         <?php print $errors["password_confirmation"] ??''; ?>
                     </span>
                     <label for="password_confirmation">Jelszó ismét</label>
                 </div>

                 <input type="hidden" name="submitted" value="1">
                 <div class="input-field col s12 text-center">
                     <button class="waves-effect waves-light btn" htef=""><i
                             class="material-icons right">check</i>Mentés!</button>
                 </div>

         </div>

         </form>

         <div class="row">


             <div class="col s12 m12 text-center">
                 <a class="waves-effect waves-light btn profile-btn" href="<?php print public_path('/orders')?>"><i
                         class="material-icons right">add_shopping_cart</i>Megrendeléseim</a>
             </div>
         </div>
     </div>


 </div>

 </div>

 <script src="<?php print public_path('/js/checkout.js')?>"></script>
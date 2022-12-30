<?php



if (isset($_POST["submitted"])&& !isset($_SESSION["user"])) {
    $first_name = trim($_POST["first_name"]);
    $last_name = trim($_POST["last_name"]);
    $email = trim($_POST["email"]);
    $password = $_POST["password"];
    $password_confirmation = $_POST["password_confirmation"];
    
    $errors=[];
    
    if (strlen($first_name)<2 || strlen($first_name)>30) {
        $errors["first_name"] = 'Minimum 2, maximum 30 karakter!';
    }
    if (strlen($last_name)<2 || strlen($last_name)>30) {
        $errors["last_name"] = 'Minimum 2, maximum 30 karakter!';
    }
    if (strlen($password)<2 || strlen($password)>30) {
        $errors["password"] = 'Minimum 2, maximum 30 karakter!';
    }
    if ($password != $password_confirmation) {
        $errors["password"] = 'A két jelszó nem azonos!';
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors["email"] = 'Nem megfelelő formátum!';
    }
    
    $sql = mysqli_query($connection, "select id from users where email like '".$email."'");
    if (mysqli_num_rows($sql) > 0) {
        $errors["email"] = 'Az email cím már használatban van!';
    }
    
    if (count($errors) == 0) {
        

        $verification_token = md5($email).md5(time()).rand(1111111, 9999999);

        
        $sql = mysqli_query($connection, "insert into users (first_name, last_name, email, email_verified_at, password) values('$first_name','$last_name','$email',  '".date('Y-m-d H:i:s')."','".md5($password)."')");
        
        $new_user_id = mysqli_insert_id($connection);

        
        $sql = mysqli_query($connection, "update orders set user_id ='$new_user_id'   where  email='$email' and  user_id = 0");

        
        $_SESSION["success"] = 'Sikeres regisztráció!';
        
        header("location: ".$_SERVER["HTTP_REFERER"]);
        exit;
    }
}
?>

<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg" style="width:40%">
        <br><br>
        <h1 class="header center orange-text">Regisztráció</h1>
        <div class="row">
        </div>

        <br><br>

        <?php
                    

                    if (isset($_SESSION["success"])) {
                        print '<div class="col justify text-block">'.$_SESSION["success"].'</div>';
                        
                        unset($_SESSION["success"]);
                    }

?>

        <!--   Icon Section   -->
        <div class="row text-block">
            
            <?php if (isset($_SESSION["user"])) {
                print only_guest();
            } else {
                ?>
            <form class="col s12" method="POST" id="regform">
                <div class="row">
                    
                    <div class="input-field col s12 m6">
                        <input id="first_name" value="<?php print $first_name??''?>" name="first_name" type="text"
                            class="validate copyfrom checkout-data">
                        
                        <span class="red-text errormessage first_name"><?php print $errors["first_name"] ??''; ?>
                        </span>
                        
                        <label for="first_name">Vezetéknév</label>
                    </div>

                    <div class="input-field col s12 m6">
                        <input id="last_name" value="<?php print $last_name??''?>" name="last_name" type="text"
                            class="validate copyfrom checkout-data">
                        
                        <span class="red-text errormessage last_name"> <?php print $errors["last_name"] ??''; ?>
                        </span>
                        <label for="last_name">Keresztnév</label>
                    </div>
                </div>


                <div class="input-field col s12">
                    <input id="email" value="<?php print $email??''?>" name="email" type="text"
                        class="validate copyfrom checkout-data">
                    
                    <span class="red-text errormessage email"> <?php print $errors["email"] ??''; ?>
                    </span>
                    <label for="email">E-mail cím</label>
                </div>



                <div class="input-field col s12 m6">
                    <input id="password" name="password" type="password" class="validate copyfrom checkout-data">
                    
                    <span class="red-text errormessage password"> <?php print $errors["password"] ??''; ?>
                    </span>
                    <label for="password">Jelszó</label>
                </div>



                <div class="input-field col s12 m6">
                    <input id="password_confirmation" name="password_confirmation" type="password"
                        class="validate copyfrom checkout-data">
                    
                    <span class="red-text errormessage password_confirmation"></span>
                    <label for="password_confirmation">Jelszó ismét</label>
                </div>
                
                <input type="hidden" name="submitted" value="1">
                <div class="input-field col s12 text-center">
                    <button class="waves-effect waves-light btn" htef=""><i
                            class="material-icons right">check</i>Regisztráció</button>
                </div>
            </form>
            <?php
            }
?>
        </div>

    </div>
    <br><br>
</div>

<script src="<?php print public_path('/js/checkout.js')?>"></script>
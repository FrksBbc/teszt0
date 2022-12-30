<?php

if (isset($_SESSION["user"])) {
    if ($_SESSION["user"] ->is_admin) {
        header("location: "."HTTP_ROOT"."/sytem_admin/dashboard");
    }
}



if (isset($_POST["submitted"])) {
    $email = trim($_POST["email"]);
    $password = $_POST["password"];

    $errors=[];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors["email"] = 'Nem megfelelő email formátum!';
    }
    if (empty($email) || empty($password)) {
        $errors["email"] = 'A mező üres!';
        header("location:".$_SERVER["HTTP_REFERER"]);
    }

    if (count($errors) == 0) {
        $sql = mysqli_query($connection, "select * from users where email = '$email'and password = '".md5($password)."' and is_admin = 1");


        if (mysqli_num_rows($sql)==0) {
            $_SESSION["error"]='Hibás adatok!';
            header("location:".$_SERVER["HTTP_REFERER"]);
            return;
            exit;
        } else {
            $_SESSION["user"] = mysqli_fetch_object($sql);
            header("location: "."HTTP_ROOT"."/sytem_admin/dashboard");
            return;
            exit;
        }
    } else {
        $_SESSION["error"]=$errors["email"];
        return;
        exit;
    }
}

?>

<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg" style="width:40%">
        <br><br>
        <h1 class="header center orange-text">Belépés</h1>
        <div class="row">
        </div>

        <br><br>

        <?php

                    if (isset($_SESSION["success"])) {
                        print '<div class="col justify text-block green-text">'.$_SESSION["success"].'</div>';
                        unset($_SESSION["success"]);
                    } elseif (isset($_SESSION["error"])) {
                        print '<div class="col justify text-block red-text">'.$_SESSION["error"].'</div>';
                        unset($_SESSION["error"]);
                    }


?>


        <div class="row text-block">




            <form class="col s12" method="POST" id="regform">
                <div class="row">


                    <div class="input-field col s12 m6">

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

                    <input type="hidden" name="submitted" value="1">
                    <div class="input-field col s12 text-center">
                        <button class="waves-effect waves-light btn" htef=""><i
                                class="material-icons right">check</i>Belépés</button>
                    </div>

                </div>

            </form>

        </div>
        <br><br>
    </div>


    <script src="<?php print public_path('/js/checkout.js')?>"></script>
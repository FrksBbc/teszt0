<?php

if (isset($_SESSION["user"])) {
    if (!$_SESSION["user"] ->is_admin) {
        exit('Access denied!');
    }
} else {
    exit;
}


$id = (int)$_GET["id"];
$id or die();

$errors = [];
if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    if (isset($_POST["delete"]) && $id != $_SESSION["user"]->id) {
        mysqli_query($connection, "delete from users where id = '$id'");
        header("location: ".public_path('/system_admin/users'));
        exit;
    }

    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $is_admin=$_POST["is_admin"];


    if (!isset($is_admin)) {
        $errors["is_admin"] = 'Hibás adat!';
    }

    if (strlen($first_name) < 2 || strlen($first_name) > 30) {
        $errors["first_name"] = 'Minimum 2, maximum 30 karakter!';
    }
    if (strlen($last_name) < 2 || strlen($last_name) > 30) {
        $errors["last_name"] = 'Minimum 2, maximum 30 karakter!';
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors["email"] = 'Nem megfelelő formátum!';
    }

    $sql = mysqli_query($connection, "select id from users where email like '" . $email . "'   and id != '$id'");
    if (mysqli_num_rows($sql) > 0) {
        $errors["email"] = 'Az email cím már használatban van!';
    }


    if (count($errors)==0) {
        mysqli_query($connection, "update users set 
        is_admin  = '$is_admin',
        first_name = '$first_name', 
        last_name = '$last_name',
        email = '$email'
        where id = '$id'");

        $_SESSION["success"]='Sikeres mentés!';
        header("location: ".$_SERVER["HTTP_REFERER"]);
        exit;

        if ($err = mysqli_error($connection)) {
            exit($err);
        }
    }
}


$sql = mysqli_query($connection, "select * from users where id = $id");
$user = mysqli_fetch_object($sql);

?>
<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg" style="width:40%">
        <br><br>
        <h1 class="header center orange-text">User szerkesztése: <?php print $user->first_name ?>
            <?php print $user->last_name ?> </h1>
        <div class="row">
        </div>


        <?php

        if (isset($_SESSION["success"])) {
            print '<div class="col justify text-block">'.$_SESSION["success"].'</div>';

            unset($_SESSION["success"]);
        }


?>

        <!--   Icon Section   -->
        <div class="row text-block">

            <form class="col s12" method="POST">

                <div class="input-field col s12">

                    <select name="is_admin" type="password">
                        <option value="" disabled>Adminisztrátor</option>
                        <option value="1" <?php print(($user->is_admin ? 'selected' : '')) ?>>Igen</option>
                        <option value="0" <?php print((!$user->is_admin ? 'selected' : '')) ?>>Nem</option>
                    </select>
                    <span class="red-text errormessage"> <?php print $errors["is_admin"] ?? ''; ?>
                    </span>

                </div>


                <div class="input-field col s12 m6">
                    <input id="first_name" value="<?php print $user->first_name ?>" name="first_name" type="text">
                    <span class="red-text errormessage"> <?php print $errors["first_name"] ?? ''; ?>
                    </span>
                    <label for="first_name">Vezetéknév</label>
                </div>



                <div class="input-field col s12 m6">
                    <input id="last_name" value="<?php print $user->last_name ?>" name="last_name" type="text">
                    <span class="red-text errormessage"> <?php print $errors["last_name"] ?? ''; ?>
                    </span>
                    <label for="last_name">Keresztnév</label>
                </div>


                <div class="input-field col s12 ">
                    <input id="email" value="<?php print $user->email ?>" name="email" type="email">
                    <span class="red-text errormessage"> <?php print $errors["email"] ?? ''; ?>
                    </span>
                    <label for="email">E-mail</label>
                </div>

                <?php
            if ($id != $_SESSION["user"]->id) { ?>

                <div class=" col s12 ">

                    <label>
                        <input id="delete" value="1" name="delete" type="checkbox">
                        <span>Törlésre jelöl</span>
                    </label>
                </div>

                <?php } ?>

                <input type="hidden" name="submitted" value="1">
                <div class="input-field col s12 text-center">
                    <button class="waves-effect waves-light btn"><i
                            class="material-icons right">check</i>Mentés!</button>
                </div>

                <div class="input-field col s12 text-center">
                    <a class="waves-effect waves-light btn"
                        href="<?php print public_path('/system_admin/dashboard') ?>"><i
                            class="material-icons right">home</i>Kezdőoldal</a>
                </div>

        </div>

        </form>

        <!-- <div class="input-field col s12 text-center">
                 <a class="waves-effect waves-light btn profile-btn" href="<?php print public_path('/system_admin/users') ?>">Userek </a>

                 <a class="waves-effect waves-light btn profile-btn" href="<?php print public_path('/system_admin/orders') ?>">Megrendelések </a>

             </div> -->

    </div>
    <br><br>
</div>
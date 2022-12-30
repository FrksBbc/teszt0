<?php

if (isset($_SESSION["user"])) {
    if (!$_SESSION["user"] ->is_admin) {
        exit('Access denied!');
    }
} else {
    exit;
}

?><div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg" style="width:40%">
        <br><br>
        <h1 class="header center orange-text">Userek Admin </h1>
        <div class="row">
        </div>


        <!--   Icon Section   -->
        <div class="row text-block">

            <table width="100%">
                <tr>
                    <th>Id</th>
                    <th>Név</th>
                    <th>Admin</th>
                    <th>E-mail</th>
                    <th>Művelet</th>
                </tr>
                <?php

                    $sql=mysqli_query($connection, "select * from users");
while ($adat=mysqli_fetch_object($sql)) {
    ?>
                <tr>
                    <td><?php print $adat->id?></td>
                    <td><?php print $adat->first_name?> <?php print $adat->last_name?></td>
                    <td><?php print $adat->is_admin ? 'Igen' : 'Nem'?></td>
                    <td><?php print $adat->email?></td>
                    <td> <a class="waves-effect waves-light btn"
                            href="<?php print public_path('/system_admin/userdata/'.$adat->id)?>">Adatok </a> </td>
                </tr>
                <?php
}

?>
            </table>

            <div class="input-field col s12 text-center">
                <a class="waves-effect waves-light btn" href="<?php print public_path('/system_admin/dashboard') ?>"><i
                        class="material-icons right">home</i>Kezdőoldal</a>
            </div>

        </div>

    </div>
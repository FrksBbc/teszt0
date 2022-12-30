<?php

if (isset($_SESSION["user"])) {
    if (!$_SESSION["user"] ->is_admin) {
        exit('Access denied!');
    }
} else {
    exit;
}

?><div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg small-container">
        <br><br>
        <h1 class="header center orange-text">Megrendelések</h1>
        <div class="row">
        </div>

        <br><br>

        <div class="row text-block">

            <div class="row">

                <?php

                    $szallmodok = ['kiszallitas' =>'kiszállítás','szemelyes' => 'személyes átvétel'];

$sql = mysqli_query($connection, "select * from orders order by created_at desc");
while ($adat=mysqli_fetch_object($sql)) {
    print '<a title="'.(($adat->is_ready) ? ' Elkészült' : 'Függőben').'" class="order-heading '.(($adat->is_ready) ? ' bg-success' : '').'" href="'.public_path('/system_admin/order-details/'.$adat->id).'">'.
    '<div>'.date('Y.m.d', strtotime($adat->created_at)).' </div> '.
    '<div>'.$szallmodok[$adat->delivery_method].'</div>'.

    '<div>'.amount($adat->total).'</div> </a>';
}
?>



                <div class="input-field col s12 text-center">
                    <a class="waves-effect waves-light btn"
                        href="<?php print public_path('/system_admin/dashboard') ?>"><i
                            class="material-icons right">home</i>Kezdőoldal</a>
                </div>
            </div>

        </div>


    </div>

</div>

<script src="<?php print public_path('/js/checkout.js')?>"></script>
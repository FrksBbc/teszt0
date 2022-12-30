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


if ($_SERVER["REQUEST_METHOD"] === 'POST') {
    if (isset($_POST["ready"])) {
        mysqli_query($connection, "update orders set is_ready = '".((isset($_POST["ready"])) ? '1' : '0')."' where id = '$id'");
    }
}




?>
<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg" style="width:40%">
        <br><br>
        <h1 class="header center orange-text">Megrendelés részletei: #<?php print $id ?> </h1>
        <div class="row">
        </div>


        <?php

        if (isset($_SESSION["success"])) {
            print '<div class="col justify text-block">' . $_SESSION["success"] . '</div>';

            unset($_SESSION["success"]);
        }


?>

        <!--   Icon Section   -->
        <div class="row text-block">
            <form action="" method="post">
                <?php

        $szallmodok = ['kiszallitas' => 'kiszállítás', 'szemelyes' => 'személyes átvétel'];

$sql = mysqli_query($connection, "select * from orders where id='" . $id . "'");
$adat = mysqli_fetch_object($sql);
print '<div class="order-heading" >' .
    '<div>' . date('Y.m.d', strtotime($adat->created_at)) . ' </div> ' .
    '<div>' . $szallmodok[$adat->delivery_method] . '</div>' .

    '<div>' . amount($adat->total) . '</div> </div>';




$ordersql = mysqli_query($connection, "select * from order_pizzas where order_id='" . $id . "'");

while ($pizza = mysqli_fetch_object($ordersql)) {
    print '<div class="order-item">
                            
    <div>' . $pizza->pizza_name . '<br>';

    $toppings = json_decode($pizza->topping_list);
    $toppinglist = '';
    foreach ($toppings as $topping) {
        $toppinglist .=$topping->name . ', ';
    }

    print '<small title="' . trim($toppinglist, ', ') . '">' . trim($toppinglist, ', ') . '</small>';

    print '</div>';

    print '<div>' . $pizza->size . ' </div>';
    print '<div>' . amount($pizza->price) . ' </div>';
    print '<div>' . $pizza->quantity . 'db </div>';

    print '<div>' . amount($pizza->subtotal) . '</div> </div>';
}


$user = json_decode($adat->user_data);

if (isset($user->first_name)) {
    print '
                <br>
                <h6>Szállítási adatok</h6>
                <div class="order-heading" >' .
                '<div class="fw-normal">'.$user->first_name.' '.$user->last_name.'</div> ' .
                '<div  class="fw-normal">'.$user->shipping_zip.' '.$user->shipping_city.'</div>' .

                '<div  class="fw-normal">'.$user->shipping_street.' '.$user->shipping_nr.'</div> </div>';

    print '
            
                <h6>Számlázási adatok</h6>
                <div class="order-heading" >' .
                '<div class="fw-normal">'.$user->billing_name.' '.$user->billing_tax_nr.'</div> ' .
                '<div  class="fw-normal">'.$user->billing_zip.' '.$user->billing_city.'</div>' .

                '<div  class="fw-normal">'.$user->billing_street.' '.$user->billing_nr.'</div> </div>';
}
?>

                <br>
                <div class=" col s12 ">

                    <label>
                        <input id="ready" value="1" name="ready" type="checkbox" <?php
        print(($adat->is_ready) ? 'checked' : '');
?>>
                        <span>Elkészült</span>
                    </label>
                </div>



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

            </form>
        </div>
    </div>
</div>
<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg small-container">
        <br><br>
        <h1 class="header center orange-text">Megrendeléseim</h1>
        <div class="row">
        </div>

        <br><br>
        <!--   Icon Section   -->
        <div class="row text-block">

            <?php if (!isset($_SESSION["user"])) {
                print only_members();
            } else {?>

            <div class="row">

                <?php

                                $szallmodok = ['kiszallitas' =>'kiszállítás','szemelyes' => 'személyes átvétel'];

                $sql = mysqli_query($connection, "select * from orders where user_id='".$_SESSION["user"]->id."'");
                while ($adat=mysqli_fetch_object($sql)) {
                    print '<div class="order-heading">'.
                    '<div>'.date('Y.m.d', strtotime($adat->created_at)).' </div> '.
                    '<div>'.$szallmodok[$adat->delivery_method].'</div>'.

                    '<div>'.amount($adat->total).'</div> </div>';

                    $ordersql = mysqli_query($connection, "select * from order_pizzas where order_id='".$adat->id."'");

                    while ($pizza = mysqli_fetch_object($ordersql)) {
                        print '<div class="order-item">
                            
                            <div>'. $pizza->pizza_name.'<br>';

                        $toppings = json_decode($pizza->topping_list);
                        $toppinglist = '';
                        foreach ($toppings as $topping) {
                            $toppinglist.= $topping->name.', ';
                        }

                        print '<small title="' .trim($toppinglist, ', ').'">' .trim($toppinglist, ', ').'</small>';

                        print '</div>';

                        print '<div>'.$pizza->size.' </div>';
                        print '<div>'.amount($pizza->price).' </div>';
                        print '<div>'.$pizza->quantity.'db </div>';

                        print '<div>'.amount($pizza->subtotal).'</div> </div>';
                    }
                }
                ?>


                <div class="col s12 m12 text-center">
                    <a class="waves-effect waves-light btn profile-btn " href="<?php print public_path('/account')?>"><i
                            class="material-icons right">verified_user</i>Belépési adataim</a>
                </div>
            </div>
            <?php
            }?>
        </div>


    </div>

</div>

<script src="<?php print public_path('/js/checkout.js')?>"></script>
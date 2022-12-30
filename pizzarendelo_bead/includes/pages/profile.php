<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg small-container">
        <br><br>
        <h1 class="header center orange-text">Profilom</h1>
        <div class="row">
        </div>
        <!--   Icon Section   -->
        <div class="row text-block">
            
            <?php if (!isset($_SESSION["user"])) {
    print only_members();
} else {
    ?>
            <div class="row">
                <div class="col s12 l6 text-center">
                    <a class="waves-effect waves-light btn profile-btn" href="<?php print public_path('/orders')?>"><i
                            class="material-icons right">add_shopping_cart</i>Megrendeléseim</a>
                </div>

                <div class="col s12 l6 text-center">
                    <a class="waves-effect waves-light btn profile-btn" href="<?php print public_path('/account')?>"><i
                            class="material-icons right">verified_user</i>Belépési adataim</a>
                </div>
            </div>
        </div>
        <?php
}?>


    </div>

</div>

<script src="<?php print public_path('/js/checkout.js')?>"></script>
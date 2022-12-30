<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg">
        <br><br>
        <h1 class="header center orange-text">A megrendelés véglegesítése!</h1>
        <div class="row">
            <div class="col justify text-block">
                Az alábbi űrlapon adja meg a szállítási adatait, vagy válassza ki az átvétel módját, azután kattintson a
                megrendelés véglegesítése gombra!
            </div>
        </div>

        <br><br>



        <!--   Icon Section   -->
        <div class="row text-block">
            <form class="col s12">
                <div class="row">
                    <div class="col s12">
                        <h5>Szállítási adatok</h5>
                    </div>




                    <div class="input-field col s12 m6">
                        <input id="first_name" type="text" class="validate copyfrom checkout-data">
                        <span class="red-text errormessage first_name">
                        </span>
                        <label for="first_name">Vezetéknév</label>
                    </div>

                    <div class="input-field col s12 m6">
                        <input id="last_name" type="text" class="validate copyfrom checkout-data">
                        <span class="red-text errormessage last_name">
                        </span>
                        <label for="last_name">Keresztnév</label>
                    </div>
                </div>


                <div class="input-field col s12 m4">
                    <input id="shipping_zip" type="text" class="validate copyfrom checkout-data">
                    <span class="red-text errormessage shipping_zip">
                    </span>
                    <label for="shipping_zip">Irányítószám</label>
                </div>



                <div class="input-field col s12 m8">
                    <input id="shipping_city" type="text" class="validate copyfrom checkout-data">
                    <span class="red-text errormessage shipping_city">
                    </span>
                    <label for="shipping_city">Város</label>
                </div>



                <div class="input-field col s12 m10">
                    <input id="shipping_street" type="text" class="validate copyfrom checkout-data">
                    <span class="red-text errormessage shipping_street">
                    </span>
                    <label for="shipping_street">Utca</label>
                </div>



                <div class="input-field col s12 m2">
                    <input id="shipping_nr" type="text" class="validate copyfrom checkout-data">
                    <span class="red-text errormessage shipping_nr">
                    </span>
                    <label for="shipping_nr">Házszám</label>
                </div>



            </form>
        </div>

        <div class="row text-block">
            <form class="col s12">

                <label>
                    <input type="checkbox" class="filled-in checkout-data" id="copy-shipping-billing" />
                    <span>A számlázási adatok megegyeznek a számlázási adatokkal</span>
                </label>



        </div>

        <div class="row text-block">
            <form class="col s12">
                <div class="row">
                    <div class="col s12">
                        <h5>Számlázási adatok</h5>
                    </div>

                    <div class="input-field col s12 m6">
                        <input id="billing_name" type="text" class="validate checkout-data">
                        <span class="red-text errormessage billing_name">
                        </span>
                        <label for="billing_name">Név / Cégnév</label>
                    </div>

                    <div class="input-field col s12 m6">
                        <input id="billing_tax_nr" type="text" class="validate checkout-data">
                        <span class="red-text errormessage billing_tax_nr">
                        </span>
                        <label for="billing_tax_nr">Adószám (cég esetén)</label>
                    </div>
                </div>


                <div class="input-field col s12 m4">
                    <input id="billing_zip" type="text" class="validate checkout-data">
                    <span class="red-text errormessage billing_zip">
                    </span>
                    <label for="billing_zip">Irányítószám</label>
                </div>



                <div class="input-field col s12 m8">
                    <input id="billing_city" type="text" class="validate checkout-data">
                    <span class="red-text errormessage billing_city">
                    </span>
                    <label for="billing_city">Város</label>
                </div>

                <div class="input-field col s12 m10">
                    <input id="billing_street" type="text" class="validate checkout-data">
                    <span class="red-text errormessage billing_street">
                    </span>
                    <label for="billing_street">Utca</label>
                </div>

                <div class="input-field col s12 m2">
                    <input id="billing_nr" type="text" class="validate checkout-data">
                    <label for="billing_nr">Házszám</label>
                </div>
            </form>
        </div>

        <div class="row text-block">
            <div class="row">
                <div class=" col s12">
                    <h5>Account adatok</h5>
                </div>
                <div class="input-field col s12">
                    <input id="email" type="text" class="validate checkout-data">
                    <span class="red-text errormessage email"></span>
                    <label for="billing_street">E-mail</label>
                </div>
            </div>
        </div>


        <div class="row text-block">
            <form class="col s12">
                <div class="row">
                    <div class="col s12">
                        <h5>Az átvétel módja</h5>
                    </div>

                    <div class="input-field col s12">
                        <select class="checkout-data" id="delivery-method">
                            <option value="">Adja meg az átvétel módját</option>
                            <option value="szemelyes">Személyes átvétel</option>
                            <option value="kiszallitas">Kiszállítás</option>
                        </select>
                        <span class="red-text errormessage delivery-method">
                        </span>
                    </div>


                    <div class="col s12 text-right checkoutbtns" style="height: auto;">
                        A kosárban lévő termékek értéke:

                        <span><?php print amount((int)$_SESSION["order"]["fulltotal"]);?></span>
                        <br />

                        <div class="hideable">
                            A szállítás díja: <span id="shipping-price-display"></span>
                            <br />

                            Összesen: <span id="full-price-display"></span>
                            <br />
                        </div>
                        <br />
                        <a class="waves-effect waves-light btn" href="javascript:history.back(-1)">
                            <i class="material-icons left">add_shopping_cart</i> vásárlás folytatása
                        </a>

                        <a class="waves-effect waves-light btn hideable" id="verify-checkout" htef=""><i
                                class="material-icons right">check</i>Megrendelés véglegesítése</a>
                    </div>

                </div>
                <br><br>
        </div>

        <script src="<?php print public_path('/js/checkout.js')?>"></script>
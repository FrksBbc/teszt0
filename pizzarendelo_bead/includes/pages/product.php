<?php

  $product = product_details($_GET["name"], $connection);
?>

<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg">
        <br><br>
        <h1 class="header center orange-text"><?php print $product["pizza"]->name;?></h1>
        <div class="row">
            <div class="col justify text-block">
            </div>
        </div>

        <br><br>

        <div class="row product-details text-block">
            <div class="col l6">
                <img src="<?php print public_path('/images/products/'.$product["pizza"]->image)?>"
                    alt="<?php print $product["pizza"]->name;?>">
            </div>
            <div class="col m6">
                <h5 class="orange-text">Feltétek</h5>
                <ul class="browser-default">
                    <?php
                    
            foreach ($product["toppings"] as $topping) {
                print '<li>'.$topping->name.'</li>';
            }
          ?>
                </ul>
                <h5 class="orange-text">Méret</h5>
                <?php

            foreach (getAllPrice($product["pizza"], $connection) as $price) {
                print '<a 
                    class="waves-effect waves-light btn calc-price '.
                    (($price["size_name"]->default=='1')? 'default' : '').
                     '"  
                    data-size="'.$price["size"]->size_id.'" 
                    data-id="'.$product["pizza"]->id.'">'.
                    $price["size_name"]->name.'</a> ';
            }
          ?>

                <h6 class="orange-text mt3"><span>Ára:</span> <span id="product_display_price"></span>
                </h6>


                <div class="row">
                    <div class="col s3">
                        <input type="number" class="quantity-input" id="quantity" value="1" max="10" min="1">
                    </div>
                    
                    <div class="col s3">
                        <a href="#" onclick="toCart(product_to_cart)"><i
                                class="material-icons shopping-cart">add_shopping_cart</i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </div>
    <script>
    
    window.onload = function() {
        document.getElementsByClassName('default')[0].click();
    }
    </script>
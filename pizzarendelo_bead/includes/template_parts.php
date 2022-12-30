<?php


function list_box($obj, $connection)
{
    return  '<div class="col s12 m6 l3">
        <div class="icon-block">
          <div class="img-holder" data-background="'.$obj->image.'"></div>
          <h5 class="center limited-text">
          <a href="'.public_path('/products/'.($obj->url)).'">'.$obj->name.'</a></h5>
          <div class="row">
          
            <div class="col s6">
              <p class="price">'.amount(getListPrice($obj, $connection)).'</p> 
            </div>

            <div class="col s3">
              <input type="number" class="quantity-input" id="qtty_'.$obj->id.'" value="1" max="10" min="1">
            </div>

            <div class="col s3">
              <a href="#" onclick="toCart({
                id:'.$obj->id.',
                size_id: '.getDefaultSize($connection)->id.',
                quantity: document.getElementById(\'qtty_'.$obj->id.'\').value
              })"><i class="material-icons shopping-cart">add_shopping_cart</i></a>
            </div>

          </div>
        </div>
      </div>';
}

function make_url($str)
{
    $str1=["ű","á","é","ú","ő","ó","ü","ö","í"," " ];
    $str2=["u","a","e","u","o","o","u","o","i","-"];


    $str=mb_strtolower($str, "utf-8");

    return str_replace($str1, $str2, $str);
}

function hot_deals($connection)
{
    $resultstring='';

    $sql_result = mysqli_query($connection, "select * from pizzas where hot_deal = 1 order by rand() limit 4");

    while ($data = mysqli_fetch_object($sql_result)) {
        $resultstring.=list_box($data, $connection);
    }
    return $resultstring;
}

function product_list($connection)
{
    $resultstring='';
    $sql_result = mysqli_query($connection, "select * from pizzas");
    while ($data = mysqli_fetch_object($sql_result)) {
        $resultstring.=list_box($data, $connection);
    }
    return $resultstring;
}


function product_details($url, $connection)
{
    $sql_result = mysqli_query($connection, "select * from pizzas where url ='$url'");
    $result = mysqli_fetch_object($sql_result);


    $tomb["pizza"] = $result;


    $toppings= [];

    $sql_result = mysqli_query($connection, "select toppings.* from pizzas_toppings, toppings where pizzas_toppings.pizza_id ='".$result->id."' and pizzas_toppings.topping_id = toppings.id");
    while ($data = mysqli_fetch_object($sql_result)) {
        $toppings[]=$data;
    }

    $tomb["toppings"] = $toppings;


    $tomb["prices"] = getAllPrice($result, $connection);

    return $tomb;
}

function getProductDetailsById($id, $connection)
{
    $sql_result = mysqli_query($connection, "select * from pizzas where id ='$id'");
    $url = mysqli_fetch_object($sql_result)->url;

    return product_details($url, $connection);
}


function amount($val)
{
    return number_format($val, 0, ' ', ' ').CURRENCY;
}

function only_guest()
{
    return '<div class=" col-12 alert box-alert text-center">

      Ez az oldal csak kilépés után érhető el!
      <p class="text-center">
      <a href="'.public_path('/profile').'" class="waves-effect waves-light btn alert-btn">Profilom</a>

      <a href="'.public_path('/logout').'" class="waves-effect waves-light btn alert-btn">Kilépés</a>
      </p>
      </div>';
}

function only_members()
{
    return '<div class=" col-12 alert box-alert text-center">

      Ez az oldal csak belépés után érhető el!
      <p class="text-center">
      <a href="'.public_path('/registration').'" class="waves-effect waves-light btn alert-btn">Regisztráció</a>

      <a href="'.public_path('/login').'" class="waves-effect waves-light btn alert-btn">Belépés</a>
      </p>
      </div>';
}

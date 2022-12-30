<?php

session_start();

$prices = ['kiszallitas' => [1000,'kiszállítás'],'szemelyes' => [0, 'személyes átvétel']];

ini_set("display_errors", 0);

include("includes/config.php");
include("includes/functions.php");
include("includes/template_parts.php");
global $connection ;

$connection = connection();




switch ($_GET["operation"]) {
    case'select_size':

        $price = amount(getOptionalPrice($_POST["id"], $_POST["size_id"], $connection));

        print json_encode([
            'price'=>$price,
            'size_id'=>$_POST["size_id"],
            'id'=>$_POST["id"]  ]);

        break;


    case 'add_to_cart':

        $_SESSION["cart"][$_POST["id"].'_'.$_POST["size_id"]] = [
            'id' =>   $_POST["id"],
            'size_id' =>   $_POST["size_id"],
            'quantity' =>   $_POST["quantity"]
        ];

        print json_encode($_SESSION["cart"]);

        break;

    case 'read_cart':

        $tomb = [];
        $fulltotal = 0;

        foreach ($_SESSION["cart"] as $elem) {
            $product =getProductDetailsById(
                $elem["id"],
                $connection
            );

            $price = getOptionalPrice(
                $elem["id"],
                $elem["size_id"],
                $connection
            );

            $size_name =  getSizeData(
                $elem["size_id"],
                $connection
            )->name;

            $tomb[]=[
                'id'=>$elem["id"],
                'size_id'=>$elem["size_id"],
                'name'=>$product["pizza"]->name,
                'image'=>$product["pizza"]->image,
                'url'=>$product["pizza"]->url,
                'price'=>$price,
                'formatted_price'=>amount($price),
                'size_name'=>$size_name,
                'quantity'=>$elem["quantity"],
                'total'=>$elem["quantity"] *$price,
                'formatted_total'=> amount($elem["quantity"] * $price)
            ];

            $fulltotal+=$elem["quantity"] * $price;
        }


        $_SESSION["order"]["fulltotal"] = $fulltotal;

        print json_encode([

            'items' => (array) $tomb,
            'fulltotal'=>(int)$fulltotal,
            'formatted_fulltotal' => amount((int)$fulltotal)]);

        break;

    case 'remove_from_cart':

        $remove =json_decode(file_get_contents("php://input"));

        var_dump($remove);

        unset($_SESSION["cart"][$remove->id.'_'.$remove->size_id]);

        break;

    case 'change_quantity':

        $data =json_decode(file_get_contents("php://input"));

        $_SESSION["cart"][$data->id.'_'.$data->size_id] = [
            'id' =>   $data->id,
            'size_id' =>   $data->size_id,
            'quantity' =>   $data->quantity
        ];

        print json_encode(['result'=>'ok']);

        break;


    case 'verify-checkout':

        $checkout_data = json_decode(file_get_contents("php://input"));

        $converted=[];
        foreach ($checkout_data as $data) {
            $converted[$data[0]] = $data[1];
        }

        $errors=[];

        function length($data)
        {
            return strlen(trim($data));
        }

        if (length($converted["first_name"])<2 || length($converted["first_name"]) > 30) {
            $errors["first_name"] = 'Minimum 2 maximum 30 karakter lehet!';
        }


        if (length($converted["last_name"])<2 || length($converted["last_name"]) > 30) {
            $errors["last_name"] = 'Minimum 2 maximum 30 karakter lehet!';
        }

        if (length($converted["shipping_zip"]) != 4) {
            $errors["shipping_zip"] = '4 karakter lehet!';
        }

        if (length($converted["shipping_city"])<2 || length($converted["shipping_city"]) > 30) {
            $errors["shipping_city"] = 'Minimum 2 maximum 30 karakter lehet!';
        }

        if (length($converted["shipping_street"])<2 || length($converted["shipping_street"]) > 30) {
            $errors["shipping_street"] = 'Minimum 2 maximum 30 karakter lehet!';
        }

        if (length($converted["billing_name"])<4 || length($converted["billing_name"]) > 60) {
            $errors["billing_name"] = 'Minimum 4 maximum 60 karakter lehet!';
        }

        if (length($converted["billing_zip"]) != 4) {
            $errors["billing_zip"] = '4 karakter lehet!';
        }

        if (length($converted["billing_city"])<2 || length($converted["billing_city"]) > 30) {
            $errors["billing_city"] = 'Minimum 2 maximum 30 karakter lehet!';
        }

        if (length($converted["billing_street"])<2 || length($converted["billing_street"]) > 30) {
            $errors["billing_street"] = 'Minimum 2 maximum 30 karakter lehet!';
        }

        if (filter_var($converted["email"])==false) {
            $errors["email"] = 'Hibás, vagy hiányos adat!';
        }

        if (length($converted["delivery-method"]) == 0) {
            $errors["delivery-method"] = 'Kötelező!';
        }



        if (count($errors)>0) {
            print json_encode($errors);
            return;
        } else {
            $user_id = isset($_SESSION["user"]->id) ? $_SESSION["user"]->id : 0;






            $tomb = [];
            $fulltotal = 0;

            foreach ($_SESSION["cart"] as $elem) {
                $product =getProductDetailsById(
                    $elem["id"],
                    $connection
                );
                $price = getOptionalPrice(
                    $elem["id"],
                    $elem["size_id"],
                    $connection
                );
                $size_name =  getSizeData(
                    $elem["size_id"],
                    $connection
                )->name;

                $tomb[]=[
                    'id'=>$elem["id"],
                    'size_id'=>$elem["size_id"],
                    'name'=>$product["pizza"]->name,
                    'image'=>$product["pizza"]->image,
                    'url'=>$product["pizza"]->url,
                    'price'=>$price,
                    'formatted_price'=>amount($price),
                    'size_name'=>$size_name,
                    'quantity'=>$elem["quantity"],
                    'total'=>$elem["quantity"] *$price,
                    'formatted_total'=> amount($elem["quantity"] * $price)
                ];
                $fulltotal+=$elem["quantity"] * $price;
            }


            mysqli_query($connection, "insert into orders 
                    (   user_id, 
                        user_data, 
                        email,
                        shipping_price, 
                        delivery_method,
                        total)
                    values (
                        '$user_id', 
                        '". json_encode($converted, JSON_UNESCAPED_UNICODE) ."', 
                        '".$converted["email"]."',
                        '".$_SESSION["order"]["shipping_price"] ."',
                        '".$_SESSION["order"]["delivery_method"] ."',
                        '$fulltotal'
                    )");
            print mysqli_error($connection);

            $order_id = mysqli_insert_id($connection);


            foreach ($tomb as $pizza) {
                mysqli_query($connection, "insert into order_pizzas(
                            pizza_id,
                            order_id,
                            pizza_name,
                            topping_list,
                            size,
                            price,
                            quantity,
                            subtotal)
                            values(
                                '".$pizza['id']."',
                                '$order_id',
                                '".$pizza['name']."',
                                '".json_encode(getProductDetailsById($pizza['id'], $connection)["toppings"], JSON_UNESCAPED_UNICODE)."',
                                '".$pizza["size_name"]."',
                                '".$pizza["price"]."',
                                '".$pizza["quantity"]."',
                                '".$pizza["total"]."'


                        )");
            }




            $_SESSION["order_completed"] = true;
            print json_encode(["success"=>true]);

            unset($_SESSION["cart"], $_SESSION["order"]);
        }


        break;


    case 'calculate-shipping':

        $key = file_get_contents("php://input");

        print json_encode(['price'=>($prices[$key][0]??0), 'full_price'=>($prices[$key][0]??0)+$_SESSION["order"]["fulltotal"]]);
        $_SESSION["order"]["shipping_price"] = ($prices[$key])[0]??0;
        $_SESSION["order"]["delivery_method"] = $key;
        break;
}

<?php


function public_path($url = '')
{
    return DOCUMENT_ROOT.$url;
}


function connection()
{
    $conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_TABLE);

    if ($err = mysqli_error($conn)) {
        exit("Error: ".mysqli_error($conn).", error number: ".mysqli_errno($conn));
    }
    return $conn;
}


function getDefaultSize($connection)
{
    $sql_result = mysqli_query($connection, "select * from sizes
     where `default` = 1");
    return mysqli_fetch_object($sql_result);
}



function getListPrice($item, $connection)
{
    $default_size_id = getDefaultSize($connection)->id;

    $sql_result = mysqli_query($connection, "select * from pizzas_sizes
     where pizza_id = '".$item->id."'and size_id='$default_size_id'");

    return mysqli_fetch_object($sql_result)->price;
}



function getSizeData($id, $connection)
{
    $sql_result = mysqli_query($connection, "select * from sizes where id ='".$id."'");
    return mysqli_fetch_object($sql_result);
}



function getAllPrice($item, $connection)
{
    $sql_result = mysqli_query($connection, "select * from pizzas_sizes
     where pizza_id = '".$item->id."'");
    $tomb =[];
    while ($data=mysqli_fetch_object($sql_result)) {
        $tomb[] =[
            'size'      =>  $data,
            'size_name' => getSizeData($data->size_id, $connection),
            'default'   =>  $data->size_id === getDefaultSize($connection)
            ->id];
    }
    return $tomb;
}



function getOptionalPrice($id, $size_id, $connection)
{
    $sql_result = mysqli_query($connection, "select price from pizzas_sizes where pizza_id ='".$id."'and size_id='".$size_id."'");

    return mysqli_fetch_object($sql_result)->price;
}
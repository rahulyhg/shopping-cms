<?php
header('Content-type: text/html; charset=utf-8');
//error_reporting(E_ERROR | E_PARSE);

include_once "dbconn.php";

$mysqli->query("SET NAMES 'utf8'");

$orderId = $_GET['orderId'];
$productId = $_GET['productId'];
$orderState = $_GET['orderState'];
$productPrice = $_GET['productPrice'];
$shippingCost = $_GET['shippingCost'];
$discountCost = $_GET['discountCost'];
$addressNum = $_GET['addressNum'];
$address = $_GET['address'];
$request = $_GET['request'];
$adminName = $_GET['adminName'];
$postNum = $_GET['postNum'];

for($x = 0; $x < count($orderState); $x++ )
{
  $state = $orderState[$x];
  $id = $productId[$x];

  if($state == ''){
    continue;
  }

  $sql = "update productinfo set productState = '$state' where productSeq ='$id'";
  $rst = $mysqli->query($sql);
}

for($x = 0; $x < count($productPrice); $x++ )
{
  $price = $productPrice[$x];
  $id = $productId[$x];

  if( $price == '' ){
    continue;
  }

  $sql = "update productinfo set price = '$price' where productSeq ='$id'";
  $rst = $mysqli->query($sql);
}

for($x = 0; $x < count($shippingCost); $x++ )
{
  $cost = $shippingCost[$x];
  $id = $productId[$x];

  if( $cost == '' ){
    continue;
  }

  $sql = "update productinfo set shippingcost = '$cost' where productSeq ='$id'";
  $rst = $mysqli->query($sql);
}

for($x = 0; $x < count($discountCost); $x++ )
{
  $discount = $discountCost[$x];
  $id = $productId[$x];

  if( $discount == '' ){
    continue;
  }

  $sql = "update productinfo set discountprice = '$discount' where productSeq ='$id'";
  $rst = $mysqli->query($sql);
}

$sql = "update orderinfo set recipientAddressNum = '$addressNum' where orderSeq ='$orderId'";
$rst = $mysqli->query($sql);

$sql = "update orderinfo set recipientAddress = '$address' where orderSeq ='$orderId'";
$rst = $mysqli->query($sql);

$sql = "update orderinfo set request = '$request' where orderSeq ='$orderId'";
$rst = $mysqli->query($sql);

$sql = "update orderinfo set adminName = '$adminName' where orderSeq ='$orderId'";
$rst = $mysqli->query($sql);

$sql = "update orderinfo set postNum = '$postNum' where orderSeq ='$orderId'";
$rst = $mysqli->query($sql);

?>

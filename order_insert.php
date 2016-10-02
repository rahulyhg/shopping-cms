<?php
header('Content-type: text/html; charset=utf-8');
//error_reporting(E_ERROR | E_PARSE);

include_once "dbconn.php";

$mysqli->query("SET NAMES 'utf8'");


// 주문 insert할시에 반드시 지켜야 할 것
// 1.파라미터 순서를 지켜야함.
// 2.각각의 파라미터 사이엔 ,(comma)로 분리.
//
// ---orderdata---
// "username"
// "paymentMethod"
// "recipientAddress"
// "recipientContact"
// "shippingCost"
// "totalCost"
//
// ---productData---
// "imageURL"
// "name"
// "price"
// "quantity"
//
// --optionData--
// "optionDetail"
//
//
// example)
// order_insert.php?f=order&orderdata=chosungdong,visa...
// order_insert.php?f=product&productData=url,blueshirt...
// order_insert.php?f=option&optionData=XXL

// $orderId = insertOrder("suzy,visa,seoul,1234,1000,20000");
//
// $productId = insertProductById($orderId, "http://img.mapssi.com/newItem/WHAT9/16SSBASIC%EB%A3%A8%EC%A6%88%ED%95%8F%EB%A0%88%EC%9D%B4%EC%96%B4%EB%93%9C%EB%A7%A8%ED%88%AC%EB%A7%A85ColorBLACK/20160824005122side900jpg.jpg,
// 16 F/W BASIC 루즈핏 레이어드 맨투맨 5 Color (BLACK), 39800, 3");
//
// insertOptionById($productId, 'XL');
//
//
// $productId = insertProductById($orderId, "http://img.mapssi.com/newItem/G-SHOCK/%EC%B6%9C%EA%B3%A035%EC%9D%BCGSHOCK%EC%A7%80%EC%83%A5GA1501A%EB%B9%85%ED%8E%98%EC%9D%B4%EC%8A%A4%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%8B%9C%EA%B3%84/20160930023537side117.jpg,
// [출고3-5일]G-SHOCK 지샥 GA-150-1A 빅페이스 스포츠 시계, 168000, 1");
//
// insertOptionById($productId, 'BLACK');


$orderId = "";
$proudctId = "";

if( $_POST['f'] == "order"){
     insertOrder($_POST['orderData']);
}
if( $_POST['f'] == "product"){
     insertProductById($orderId, $_POST['productData']);
}
if( $_POST['f'] == "option"){
     insertOrder($proudctId, $_POST['optionData']);
}


function insertOrder($orderData)
{
  include "dbconn.php";

  if($orderData == ""){
    return 0;
  }

  $orderArr = explode(',', $orderData);

  $dataDict = array(
  "username" => $orderArr[0],
  "paymentMethod" => $orderArr[1],
  "recipientAddress" => $orderArr[2],
  "recipientContact" => $orderArr[3],
  "shippingCost" => $orderArr[4],
  "totalCost" => $orderArr[5]
  );

  $sql = "insert into orderinfo (username, paymentMethod, recipientAddress, recipientContact, shippingCost, totalCost)";
  $sql = $sql."values('$dataDict[username]','$dataDict[paymentMethod]','$dataDict[recipientAddress]','$dataDict[recipientContact]','$dataDict[shippingCost]','$dataDict[totalCost]')";
  $rst = $mysqli->query($sql);
  if(!$rst){
    return 0;
  }

  $sql = "select MAX(orderSeq) from orderinfo";
  $rst = $mysqli->query($sql);
  $orderId = mysqli_fetch_assoc($rst);
  $orderID = $orderId['MAX(orderSeq)'];

  return $orderID;
}

function insertProductById($orderId, $productData)
{
  include "dbconn.php";

  if($productData == ""){
    return 0;
  }

  $productArr = explode(',', $productData);

  $dataDict = array(
  "imageURL" => $productArr[0],
  "name" => $productArr[1],
  "price" => $productArr[2],
  "quantity" => $productArr[3]
  );

  $sql = "insert into productinfo (imageURL, name, price, quantity, orderId)";
  $sql = $sql."values('$dataDict[imageURL]','$dataDict[name]','$dataDict[price]','$dataDict[quantity]','$orderId')";
  $rst = $mysqli->query($sql);
  if(!$rst){
    return 0;
  }

  $sql = "select MAX(productSeq) from productinfo";
  $rst = $mysqli->query($sql);
  $productID = mysqli_fetch_assoc($rst);
  $productID = $productID['MAX(productSeq)'];

  return $productID;
}

function insertOptionById($productId, $optionData)
{
  include "dbconn.php";

  if($optionData == ""){
    return 0;
  }

  $optionArr = explode(',', $optionData);

  $dataDict = array(
  "optionDetail" => $optionArr[0]
  );

  $sql = "insert into productoptioninfo (productId, optionDetail)";
  $sql = $sql."values('$productId','$dataDict[optionDetail]')";
  $rst = $mysqli->query($sql);

  if(!$rst){
    return 0;
  }

  return 1;
}

?>

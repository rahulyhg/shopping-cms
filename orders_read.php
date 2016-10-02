<?php
header('Content-type: text/html; charset=utf-8');
//error_reporting(E_ERROR | E_PARSE);

include_once "dbconn.php";

$mysqli->query("SET NAMES 'utf8'");

$sql = "select * from orderinfo";
$rstorder = $mysqli->query($sql);

$orderSeq = "";
while ($orderinfo = mysqli_fetch_assoc($rstorder)) {
  $orderSeq = $orderinfo['orderSeq'];
  $userName = $orderinfo['username'];
  $paymentMethod = $orderinfo['paymentMethod'];
  $recipientAddress = $orderinfo['recipientAddress'];
  $recipientContact = $orderinfo['recipientContact'];
  $shippingCost = $orderinfo['shippingCost'];
  $totalCost = $orderinfo['totalCost'];

  echo "<tr><td class='resultTableTitleTd'>이름</td><td class='resultTableTd nameData'>".$userName."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>주문번호</td><td class='resultTableTd ordernumData'>".$orderSeq."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>결제수단</td><td class='resultTableTd paymentmetodData'>".$paymentMethod."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>받는주소</td><td class='resultTableTd recipientAddressData'>".$recipientAddress."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>전화번호</td><td class='resultTableTd recipientContactData'>".$recipientContact."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>운송료</td><td class='resultTableTd shippingCostData'>".$shippingCost."</td></tr>
        <tr><td class='resultTableTitleTd LeftTab1'>총액</td><td class='resultTableTd totalCostData'>".$totalCost."</td></tr>
        ";

  $sql = "select * from productinfo where orderId = '$orderSeq'";
  $rstproduct = $mysqli->query($sql);

  while ($productinfo = mysqli_fetch_assoc($rstproduct)) {
    $proudctSeq = $productinfo['productSeq'];
    $imageURL = $productinfo['imageURL'];
    $name = $productinfo['name'];
    $price = $productinfo['price'];
    $quantity = $productinfo['quantity'];

    echo "<tr><td class='resultTableTitleTd' colspan='2'>상품정보</td></tr>
          <tr><td class='resultTableTitleTd LeftTab2'>이미지</td><td class='resultTableTd imageURLData'><img style='max-height:300px;' src=".$imageURL."></td></tr>
          <tr><td class='resultTableTitleTd LeftTab2'>이름</td><td class='resultTableTd productnameData'>".$name."</td></tr>
          <tr><td class='resultTableTitleTd LeftTab2'>가격</td><td class='resultTableTd priceData'>".$price."</td></tr>
          <tr><td class='resultTableTitleTd LeftTab2'>수량</td><td class='resultTableTd quantityData'>".$quantity."</td></tr>
          ";

    $sql = "select * from productoptioninfo where productId = '$proudctSeq'";
    $optionrst = $mysqli->query($sql);

    while ($productoptinfo = mysqli_fetch_assoc($optionrst)) {
      $OptionDetail = $productoptinfo['optionDetail'];

      echo "<tr><td class='resultTableTitleTd LeftTab2'>옵션</td><td class='resultTableTd optionData'>".$OptionDetail."</td></tr>";
    }
  }
  echo "<tr><td style='height:30px;' colspan='2'></td></tr>";
}
?>

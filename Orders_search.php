<?php
header('Content-type: text/html; charset=utf-8');
//error_reporting(E_ERROR | E_PARSE);

include_once "dbconn.php";

$mysqli->query("SET NAMES 'utf8'");

$orderInputStr = $_GET['orderInputStr'];
$productInputStr = $_GET['productInputStr'];
$orderOpt = $_GET['orderOpt'];
$productOpt = $_GET['productOpt'];
$stateOpt = $_GET['stateOpt'];
$orderdateOpt = $_GET['orderdateOpt'];
$dateStart = $_GET['dateStart'];
$dateEnd = $_GET['dateEnd'];
$escroOpt = $_GET['escroOpt'];

$sql = "select * from orderinfo where ";

////////////////////////////////////////주문검색옵션////////////////////////////////////////
if( $orderInputStr != "" ){
  switch ($orderOpt) {
    case "orderTotal":
      $sql .= "(
      username LIKE '%$orderInputStr%' OR
      recipient LIKE '%$orderInputStr%' OR
      purchasename LIKE '%$orderInputStr%' OR
      recipientContact LIKE '%$orderInputStr%' OR
      id LIKE '%$orderInputStr%' OR
      orderNum LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "orderNum":
      $sql .= "(
      orderNum LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "order":
      $sql .= "(
      username LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "reciever":
      $sql .= "(
      recipient LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "buyer":
      $sql .= "(
      purchasename LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "id":
      $sql .= "(
      id LIKE '%$orderInputStr%'
      ) AND ";
      break;

    case "phone":
      $sql .= "(
      recipientContact LIKE '%$orderInputStr%'
      ) AND ";
      break;

    default:
      # code...
      break;
  }
}

////////////////////////////////////////상품검색옵션////////////////////////////////////////
if( $productInputStr != ""){
  switch ($productOpt) {
    case "productname":
      $sql_product = "select * from productinfo where
      name LIKE '%$productInputStr%'";
      $rstproduct = $mysqli->query($sql_product);
      $cnt = 0;
      $cnt_2 = 0;

      $proudcts;
      while($productinfo = mysqli_fetch_assoc($rstproduct)) {
        $proudcts[$cnt] = $productinfo['orderId'];
        $cnt++;
      }
      if(!$cnt){break;}

      $sql .= "(";
      foreach($proudcts as $item) {
        $sql .= "orderSeq = '$item'";
        if( $cnt_2 < $cnt -1 ){
          $sql .= " OR ";
          $cnt_2++;
        }
      }
      $sql .= ") AND ";
      break;

    case "shoppingmall":
      $sql_product = "select * from productinfo where
      shoppingmall LIKE '%$productInputStr%'";
      $rstproduct = $mysqli->query($sql_product);
      $cnt = 0;
      $cnt_2 = 0;

      $proudcts;
      while($productinfo = mysqli_fetch_assoc($rstproduct)) {
        $proudcts[$cnt] = $productinfo['orderId'];
        $cnt++;
      }
      if(!$cnt){break;}

      $sql .= "(";
      $sql = "select * from orderinfo where ";
      foreach($proudcts as $item) {
        $sql .= "orderSeq = '$item'";
        if( $cnt_2 < $cnt -1 ){
          $sql .= " OR ";
          $cnt_2++;
        }
      }
      $sql .= ") AND ";
      break;

      default:break;
  }
}

////////////////////////////////////////체크옵션////////////////////////////////////////

$state;
$cnt = 0;
$startPos = 0;

if( $stateOpt != ""){
  while($charPos = strpos($stateOpt, ".")){
    $stateOpt[$charPos] = " ";
    $state[$cnt] = substr($stateOpt, $startPos, $charPos-$startPos);
    $startPos=$charPos+1;
    $cnt++;
  }

  $cnt = 0;
  $sql .= "(";
  foreach ($state as $item) {
    if( $cnt == 0){
      $sql .= "orderState = '$item'";
    }else{
      $sql .= " OR orderState = '$item'";
    }
    $cnt++;
  }
  $sql .= ") AND ";
}

////////////////////////////////////////처리일자////////////////////////////////////////
switch($orderdateOpt){
    case "주문일":
    if( $dateStart == "#" )
      break;
    $sql .= "(";
    $sql .= "orderDate > '$dateStart' AND orderDate < '$dateEnd'";
    $sql .= ") AND ";
    break;

    case "결제확인일":
    if( $dateStart == "#" )
      break;
    $sql .= "(";
    $sql .= "purchaseDate > '$dateStart' AND purchaseDate < '$dateEnd'";
    $sql .= ") AND ";
    break;

    case "배송일":

    break;

    case "배송완료일":

    break;

    default: break;
}

////////////////////////////////////////에스크로////////////////////////////////////////
switch($escroOpt){
  case "전체":
  $sql .= "(";
  $sql .= "escro = '일반결제' OR escro ='에스크로'";
  $sql .= ")";
  break;

  case "일반결제":
  $sql .= "escro = '일반결제'";
  break;

  case "에스크로":
  $sql .= "escro = '에스크로'";
  break;
}

$rstorder = $mysqli->query($sql);

$cnt = mysqli_num_rows($rstorder);
if(!$cnt){
  echo "<span>검색된 내용이 없습니다.</span>";
}

while ($orderinfo = mysqli_fetch_assoc($rstorder)) {
  $orderNum = substr($orderinfo['orderDate'], 0, 10);

  while($charPos = strpos($orderNum, "-")){
    $orderNum[$charPos] = "";
  }

  $orderNum .= $orderinfo["orderSeq"];

  echo "
  <tr>
    <td class='resultTableTd'>".$cnt."</td>
    <td class='resultTableTd'>".$orderinfo['orderState']."</td>
    <td class='resultTableTd'>".$orderinfo['orderDate']."</td>
    <td class='resultTableTd'>".$orderinfo['purchaseDate']."</td>
    <td class='resultTableTd'>".$orderNum."</td>
    <td class='resultTableTd'>".$orderinfo['username']."</td>
    <td class='resultTableTd'>".$orderinfo['recipient']."</td>
    <td class='resultTableTd'>".$orderinfo['paymentMethod']."</td>
    <td class='resultTableTd'>￦".$orderinfo['couponCost']."</td>
    <td class='resultTableTdLast'>￦".$orderinfo['totalCost']."</td>
  </tr>
  ";
  $cnt--;
}
?>

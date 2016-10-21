<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="./css/normalize.css">
  <link rel="stylesheet" href="./css/framework.css">
  <link rel="stylesheet" href="./css/common.css">
  <script src="https://www.gstatic.com/firebasejs/3.3.2/firebase.js"></script>
  <script src="https://www.gstatic.com/firebasejs/3.3.2/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/3.3.2/firebase-auth.js"></script>
  <script src="https://www.gstatic.com/firebasejs/3.3.2/firebase-database.js"></script>
  <script type="text/javascript" src="./lib/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="./lib/jquery.easing.1.3.js"></script>
  <script type="text/javascript" src="./js/Orders.js"></script>
  <script type="text/javascript" src="./js/common.js"></script>

  <script type="text/javascript">
  // var config = {
  //   apiKey: "AIzaSyC1zZPxdB7zYgZOmY2aOaDmcCkfnhXfZjM",
  //   authDomain: "baguni-192c1.firebaseapp.com",
  //   databaseURL: "https://baguni-192c1.firebaseio.com",
  //   storageBucket: "baguni-192c1.appspot.com",
  //   messagingSenderId: "1094892330797"
  // };
  // firebase.initializeApp(config);
  </script>

</head>
<body onkeydown="if(event.keyCode==13) searchOrders();">
  <div class="MenuContainer">
    <nav>
        <a href="index.html"><span class="Menu">메인</span></a>
        <a href="Orders.php"><span class="Menu selected">주문</span></a>
    </nav>
  </div>
  <div class="container">
    <header>
      <span class="inline fl_left">주문번호 : <font style="padding-left:30px; font-size:20px; font-weightbold;"><?php echo $_GET['id']; ?></font></span>
      <span class="inline fl_right">총 결제금액 : ￦<?php echo $_GET['cost']; ?></span>

      <br/><br/><br/>
      <table class="dataTable">
        <tr>
          <td class="resultTableTd">번호</td>
          <td class="resultTableTd">처리상태</td>
          <td class="resultTableTd">상품명</td>
          <td class="resultTableTd">상품상세정보</td>
          <td class="resultTableTd">쇼핑몰</td>
          <td class="resultTableTd">수량</td>
          <td class="resultTableTd">상품금액</td>
          <td class="resultTableTd">배송비</td>
          <td class="resultTableTd">할인금액</td>
        </tr>
        <?php
          include_once "dbconn.php";
          $mysqli->query("SET NAMES 'utf8'");
          $orderSeq = substr($_GET['id'], 8);

          $sql = "select * from productinfo where orderId ='$orderSeq'";
          $rst = $mysqli->query($sql);
          $cnt = mysqli_num_rows($rst);

          while ($product = mysqli_fetch_assoc($rst)) {
            $productSeq = $product['productSeq'];
            $sql = "select * from productoptioninfo where productId ='$productSeq'";
            $optionrst = $mysqli->query($sql);
            $option = mysqli_fetch_assoc($optionrst);
            echo "
            <tr>
              <td class='resultTableTd'>".$cnt."</td>
              <td class='resultTableTd'>".$product['productState']."</td>
              <td style='text-align:left' class='resultTableTd'><img class='fl_left' style='width:50px; height:50px;' src=".$product['imageURL']."/>
              ".$product['name']."</td>
              <td class='resultTableTd'>".$option['optionDetail']."</td>
              <td class='resultTableTd'><a href=".$product['shoppingmall'].">바로가기</a></td>
              <td class='resultTableTd'>".$product['quantity']."</td>
              <td class='resultTableTd'>".$product['price']."</td>
              <td class='resultTableTd'>".$product['shippingcost']."</td>
              <td class='resultTableTd'>".$product['discountprice']."</td>
            </tr>
            <tr>
              <td style='color:red; font-size:20px;' class='resultTableTd'>▶</td>
              <td class='resultTableTd'>
              <select class='inline'>
                <option value='입금확인'>입금확인</option>
                <option value='배송준비중'>배송준비중</option>
                <option value='배송완료'>배송완료</option>
                <option value='환불'>환불</option>
                <option value='반품'>반품</option>
                <option value='교환'>교환</option>
                <option value='주문취소'>주문취소</option>
              </select>
              </td>
              <td class='resultTableTd'></td>
              <td class='resultTableTd'></td>
              <td class='resultTableTd'></td>
              <td class='resultTableTd'></td>
              <td class='resultTableTd'><input class='inline orderDetailTableInput'/></td>
              <td class='resultTableTd'><input class='inline orderDetailTableInput'/></td>
              <td class='resultTableTd'><input class='inline orderDetailTableInput'/></td>
            </tr>
            ";
            $cnt--;
          }
        ?>
      </table>
    </header>
  </div>
  <div class="container">
    <article>

    </article>
    <footer>
    </footer>
  </div>
</body>
</html>

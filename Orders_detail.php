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
<body onkeydown="if(event.keyCode==13) modifyOrders();">
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

          $sql = "select * from orderinfo where orderSeq ='$orderSeq'";
          $rst = $mysqli->query($sql);
          $order = mysqli_fetch_assoc($rst);

          $sql = "select * from productinfo where orderId ='$orderSeq'";
          $rst = $mysqli->query($sql);
          $cnt = mysqli_num_rows($rst);
          echo "<input type='hidden' id='orderId' value='".$orderSeq."'>";
          while ($product = mysqli_fetch_assoc($rst)) {
            $productSeq = $product['productSeq'];
            $sql = "select * from productoptioninfo where productId ='$productSeq'";
            $optionrst = $mysqli->query($sql);
            $option = mysqli_fetch_assoc($optionrst);
            echo "
            <input type='hidden' class='productId' value='".$productSeq."'>
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
              <select class='orderState inline'>
                <option value=''></option>
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
              <td class='resultTableTd'><input class='productPrice inline orderDetailTableInput'/></td>
              <td class='resultTableTd'><input class='shippingCost inline orderDetailTableInput'/></td>
              <td class='resultTableTd'><input class='discountCost inline orderDetailTableInput'/></td>
            </tr>
            ";
            $cnt--;
          }
        ?>
      </table>

    </header>
  </div>
    <article class="container">
      <br/><br/>
      <hr style="color:#cccccc;">
      <table class="inline">
        <tr>
          <td class="TableTitleTdPad1"style="height:70px;">
            주문자정보
          </td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">이름/ID</td>
          <td>김도영</td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">이메일</td>
          <td>josungdong@gmail.com</td>
        </tr>
          <td class="TableTitleTdPad1">연락처</td>
          <td>010-3482-3161</td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">주문일</td>
          <td>2016-10-22 22:58:43</td>
        </tr>
      </table>
      <table class="inline fl_right">
        <tr>
          <td class="TableTitleTdPad1" style="height:70px;">
            수령자정보
          </td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">수령자</td>
          <td>김도영</td>
        </tr>
          <td class="TableTitleTdPad1">연락처</td>
          <td>010-3482-3161</td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">주소</td>
          <td><input id="addressNum" class="inline" style="width:100px;" value='<?php echo "$order[recipientAddressNum]"; ?>'></td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1"></td><td class=""><textarea id="address" class="inline" style="width:350px; height:50px;"><?php echo "$order[recipientAddress]"; ?></textarea></td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">요청사항</td>
          <td><textarea id="requestText" class="inline" style="width:350px; height:100px;"><?php echo "$order[request]"; ?></textarea></td>
        </tr>
      </table>
      <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    </article>
    <footer class="container">
      <hr style="color:#cccccc;">
      <br/><br/>
      <table class="inline">
        <tr>
          <td class="TableTitleTdPad1">관리자 결제금액:</td><td>￦120,000</td>
          <td class="TableTitleTdPad1">남는 배송비:</td><td>￦3,000</td>
          <td class="TableTitleTdPad1">할인금액:</td>
          <td>
            <?php=?>
          </td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">관리자(주문자):</td><td colspan='4'><input id="adminName" class="inline" maxlength="11" style="width:100px;" value='<?php echo "$order[adminName]"; ?>'></td>
        </tr>
        <tr>
          <td class="TableTitleTdPad1">송장번호입력:</td><td colspan='4'><input id="postNum" class="inline" maxlength="21" style="width:350px;" value='<?php echo "$order[postNum]"; ?>'></td>
        </tr>
      </table>
      <br/><br/>
      <span id="searchText" style="padding-right:80px;" class="textLink" onclick="modifyOrders();">수정</span>
      <span id="cancelText" class="textLink">취소</span>
      <br/><br/><br/>
    </footer>
</body>
</html>

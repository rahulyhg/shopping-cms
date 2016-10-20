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
  <script type="text/javascript" src="./js/orders.js"></script>
  <script type="text/javascript" src="./js/common.js"></script>

  <script type="text/javascript">
  var config = {
    apiKey: "AIzaSyC1zZPxdB7zYgZOmY2aOaDmcCkfnhXfZjM",
    authDomain: "baguni-192c1.firebaseapp.com",
    databaseURL: "https://baguni-192c1.firebaseio.com",
    storageBucket: "baguni-192c1.appspot.com",
    messagingSenderId: "1094892330797"
  };
  firebase.initializeApp(config);
  </script>

</head>
<body>
  <div class="MenuContainer">
    <nav>
        <a href="index.html"><span class="Menu">메인</span></a>
        <a href="Orders.php"><span class="Menu selected">주문</span></a>
    </nav>
  </div>
  <div class="container">
    <header>
      <table class="inline searchTable">
        <tr>
          <td class="searchTableTitleTd">
            주문검색
          </td>
          <td>
            <select class="inline" id="orderSearchOpt">
              <option value='orderTotal'>통합검색</option>
              <option value='orderNum'>주문번호</option>
              <option value='order'>주문자명</option>
              <option value='reciever'>수령자명</option>
              <option value='buyer'>입금자명</option>
              <option value='id'>아이디</option>
              <option value='phone'>전화번호</option>
            </select>
            <input class="inline serarchTableInput" id="orderSearchInput"/>
          </td>
          <td class="searchTableTitleTd">
            상품검색
          </td>
          <td>
            <select class="inline" id="productSearchOpt">
              <option value='productname'>상품명</option>
              <option value='shoppingmall'>쇼핑몰</option>
            </select>
            <input class="inline serarchTableInput" id="productSearchInput"/>
          </td>
        </tr>
        <tr>
          <td class="searchTableTitleTd">
          </td>
          <td colspan="4">
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="주문접수">주문접수
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="입금확인">입금확인
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="배송준비">배송준비
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="배송완료">배송완료
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="주문취소">주문취소
            </span>
          </td>
        </tr>
        <tr>
          <td class="searchTableTitleTd">
          </td>
          <td colspan="4">
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="환불관련">환불관련
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="반품관련">반품관련
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="교환완료">교환완료
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="결제시도">결제시도
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="결제실패">결제실패
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="재주문">재주문
            </span>
            <span class="searchTableCheck">
              <input class="ordercheckbox inline" type="checkbox" value="PG확인요망">PG확인요망
            </span>
          </td>
        </tr>
      </table>
      <br/>
      <table class="inline searchTable">
        <tr>
          <td class="searchTableTitleTd">
            처리일자
          </td>
          <td>
            <span class="searchTableRadio">
              <input class="orderradio inline" name="chk_orderdate" type="radio" value="주문일">주문일
            </span>
            <span class="searchTableRadio">
              <input class="orderradio inline" name="chk_orderdate" type="radio" value="결제확인일">결제확인일
            </span>
            <span class="searchTableRadio">
              <input class="orderradio inline" name="chk_orderdate" type="radio" value="배송일">배송일
            </span>
            <span>
              <input class="orderradio inline" name="chk_orderdate" type="radio" value="배송완료일">배송완료일
            </span>
          </td>
        </tr>
        <tr>
          <td class="searchTableTitleTd">
          </td>
          <td>
            <input class="inline serarchTableInput" id="startDateInput"/>
            <select class="inline" id="startDataInputHour">
              <option value='0'>00시</option>
              <option value='1'>01시</option>
              <option value='2'>02시</option>
              <option value='3'>03시</option>
              <option value='4'>04시</option>
              <option value='5'>05시</option>
              <option value='6'>06시</option>
              <option value='7'>07시</option>
              <option value='8'>08시</option>
              <option value='9'>09시</option>
              <option value='10'>10시</option>
              <option value='11'>11시</option>
              <option value='12'>12시</option>
              <option value='13'>13시</option>
              <option value='14'>14시</option>
              <option value='15'>15시</option>
              <option value='16'>16시</option>
              <option value='17'>17시</option>
              <option value='18'>18시</option>
              <option value='19'>19시</option>
              <option value='20'>20시</option>
              <option value='21'>21시</option>
              <option value='22'>22시</option>
              <option value='23'>23시</option>
            </select>
            <input class="inline serarchTableInput" id="endDateInput"/>
            <select class="inline" id="endDataInputHour">
              <option value='0'>00시</option>
              <option value='1'>01시</option>
              <option value='2'>02시</option>
              <option value='3'>03시</option>
              <option value='4'>04시</option>
              <option value='5'>05시</option>
              <option value='6'>06시</option>
              <option value='7'>07시</option>
              <option value='8'>08시</option>
              <option value='9'>09시</option>
              <option value='10'>10시</option>
              <option value='11'>11시</option>
              <option value='12'>12시</option>
              <option value='13'>13시</option>
              <option value='14'>14시</option>
              <option value='15'>15시</option>
              <option value='16'>16시</option>
              <option value='17'>17시</option>
              <option value='18'>18시</option>
              <option value='19'>19시</option>
              <option value='20'>20시</option>
              <option value='21'>21시</option>
              <option value='22'>22시</option>
              <option value='23'>23시</option>
            </select>
          </td>
          <td>
            <button class="dateBtn inline" type="button">오늘</button>
            <button class="dateBtn inline" type="button">일주일</button>
            <button class="dateBtn inline" type="button">15일</button>
            <button class="dateBtn inline" type="button">한달</button>
            <button class="dateBtn inline" type="button">두달</button>
            <button class="dateBtn inline" type="button">전체</button>
          </td>
        </tr>
        <tr>
          <td class="searchTableTitleTd">
            에스크로
          </td>
          <td>
            <span class="searchTableRadio">
              <input class="escroradio inline" type="radio" name="chk_escro" value="전체">전체
            </span>
            <span class="searchTableRadio">
              <input class="escroradio inline" type="radio" name="chk_escro" value="일반결제">일반결제
            </span>
            <span class="searchTableRadio">
              <input class="escroradio inline" type="radio" name="chk_escro" value="에스크로">에스크로
            </span>
          </td>
        </tr>
      </table>
      <br/><br/>
      <span id="searchText" class="textLink">검색</span>
      <br/><br/><br/>
    </header>
  </div>
  <hr style="color:#cccccc;">
  <div class="container">
    <br/>
    <article>
      <table class="dataTable">
        <tr>
          <td class="resultTableTd">번호</td>
          <td class="resultTableTd">상태</td>
          <td class="resultTableTd">주문일시</td>
          <td class="resultTableTd">결제일시</td>
          <td class="resultTableTd">주문번호</td>
          <td class="resultTableTd">주문자</td>
          <td class="resultTableTd">받는분</td>
          <td class="resultTableTd">결제종류</td>
          <td class="resultTableTd">쿠폰사용액</td>
          <td class="resultTableTdLast">결제금액</td>
        </tr>
        <?php
          include_once "dbconn.php";
          $mysqli->query("SET NAMES 'utf8'");

          $sql = "select * from orderinfo order by orderSeq desc";
          $rst = $mysqli->query($sql);
          $cnt = mysqli_num_rows($rst);
          if(!$cnt){
            echo "<span>검색된 내용이 없습니다.</span>";
          }

          while ($order = mysqli_fetch_assoc($rst)) {
            $orderNum = substr($order['orderDate'], 0, 10);

            while($charPos = strpos($orderNum, "-")){
              $orderNum[$charPos] = "";
            }

            $orderNum .= $order["orderSeq"];

            echo "
            <tr>
              <td class='resultTableTd'>".$cnt."</td>
              <td class='resultTableTd'>".$order['orderState']."</td>
              <td class='resultTableTd'>".$order['orderDate']."</td>
              <td class='resultTableTd'>".$order['purchaseDate']."</td>
              <td class='resultTableTd'>".$orderNum."</td>
              <td class='resultTableTd'>".$order['username']."</td>
              <td class='resultTableTd'>".$order['recipient']."</td>
              <td class='resultTableTd'>".$order['paymentMethod']."</td>
              <td class='resultTableTd'>￦".$order['couponCost']."</td>
              <td class='resultTableTdLast'>￦".$order['totalCost']."</td>
            </tr>
            ";
            $cnt--;
          }
        ?>
      </table>
    </article>
    <footer>

    </footer>
  </div>
</body>
</html>

function InitOrders(){
  $(".orderradio").eq(0).attr("checked", true);
  $(".escroradio").eq(0).attr("checked", true);

  setDatefromBtn("전체");

  $(".dateBtn").click(function(event) {
    setDatefromBtn($(this).text());
  });

  $("#startDataInputHour").change(function() {
    setTimeInterval($(this).val(), $("#startDateInput"));
  });

  $("#endDataInputHour").change(function() {
    setTimeInterval($(this).val(), $("#endDateInput"));
  });

  $(".searchTableCheck").change(function() {
    searchOrders();
  });
}

function setDateInterval(month, day, hour, min, second){
  var Now = new Date();
  var LastDay = (new Date(Now.getFullYear(),Now.getMonth()+1,0)).getDate();
  var resYear = Now.getFullYear();
  var resMonth = (Now.getMonth() + 1 + month);
  var resDay = Now.getDate() + day;

  if( resMonth > 12 ){
    resMonth -= 12;
    resYear++;
  }

  if( LastDay < resDay ){
    resMonth++;
    if(resDay - LastDay < 10){
      resDay = '0' + (resDay - LastDay);
    }else{
      resDay = (resDay - LastDay);
    }
  }

  NowTime = resYear;
  NowTime += '-' + resMonth;
  NowTime += '-' + resDay;
  NowTime += ' ' + hour;
  NowTime += ':' + min;
  NowTime += ':' + second;

  return NowTime;
}

function setTimeInterval(hour, input){
  var result = "";
  var str = input.val();
  var first = str.substr(0, 11);
  result += first;
  result += parseInt(hour / 10, 10);
  result += hour - parseInt(hour/10, 10)*10;
  var end = str.substr(13, 19);
  result += end;
  input.val(result);
}

function setDatefromBtn(str){
  switch(str){
    case "오늘":
      $("#startDateInput").val(setDateInterval(0, 0, "00", "00", "00"));
      $("#endDateInput").val(setDateInterval(0, 1, "00", "00", "00"));
      break;

    case "일주일":
      $("#startDateInput").val(setDateInterval(0, 0, "00", "00", "00"));
      $("#endDateInput").val(setDateInterval(0, 7, "00", "00", "00"));
      break;
    case "15일":
      $("#startDateInput").val(setDateInterval(0, 0, "00", "00", "00"));
      $("#endDateInput").val(setDateInterval(0, 15, "00", "00", "00"));
      break;
    case "한달":
      $("#startDateInput").val(setDateInterval(0, 0, "00", "00", "00"));
      $("#endDateInput").val(setDateInterval(1, 0, "00", "00", "00"));
      break;
    case "두달":
      $("#startDateInput").val(setDateInterval(0, 0, "00", "00", "00"));
      $("#endDateInput").val(setDateInterval(2, 0, "00", "00", "00"));
      break;
    case "전체":
      $("#startDateInput").val("#");
      $("#endDateInput").val("#");
      break;

    default:
      break;
  }
}

function searchOrders(){
  $(".dataTable").empty();
  $(".dataTable").append("<tr><td class='resultTableTd'>번호</td><td class='resultTableTd'>상태</td><td class='resultTableTd'>주문일시</td><td class='resultTableTd'>결제일시</td><td class='resultTableTd'>주문번호</td><td class='resultTableTd'>주문자</td><td class='resultTableTd'>받는분</td><td class='resultTableTd'>결제종류</td><td class='resultTableTd'>쿠폰사용액</td><td class='resultTableTdLast'>결제금액</td></tr>");

  //주문검색옵션
  var orderOpt = $("#orderSearchOpt").val();

  //상품검색옵션
  var productOpt = $("#productSearchOpt").val();
  var stateOpt = "";

  //주문상태체크박스
  for(var i=0; i<$(".ordercheckbox").length; i++){
    if($(".ordercheckbox").eq(i).is(":checked")){
      stateOpt += $(".ordercheckbox").eq(i).val();
      stateOpt += ".";
    }
  }

  //처리일자라디오버튼
  var orderdateOpt = "";
  for(var i=0; i<$(".orderradio").length; i++){
    if($(".orderradio").eq(i).is(":checked")){
      orderdateOpt = $(".orderradio").eq(i).val();
      break;
    }
  }

  //처리일자
  var dateStart = $("#startDateInput").val();
  var dateEnd = $("#endDateInput").val();

  //에스크로라디오버튼
  var escroOpt = "";
  for(var i=0; i<$(".escroradio").length; i++){
    if($(".escroradio").eq(i).is(":checked")){
      escroOpt = $(".escroradio").eq(i).val();
      break;
    }
  }

  var orderInputStr = $("#orderSearchInput").val();
  var productInputStr= $("#productSearchInput").val();

  $.ajax({
    url:'./Orders_search.php',
    data:({'orderInputStr':orderInputStr, 'productInputStr':productInputStr,
          'orderOpt':orderOpt, 'productOpt':productOpt, 'stateOpt':stateOpt,
          'orderdateOpt':orderdateOpt, 'dateStart':dateStart, 'dateEnd':dateEnd,
          'escroOpt':escroOpt}),
    async: true,
    success:function(data){
      $(".dataTable").empty();
      $(".dataTable").append("<tr><td class='resultTableTd'>번호</td><td class='resultTableTd'>상태</td><td class='resultTableTd'>주문일시</td><td class='resultTableTd'>결제일시</td><td class='resultTableTd'>주문번호</td><td class='resultTableTd'>주문자</td><td class='resultTableTd'>받는분</td><td class='resultTableTd'>결제종류</td><td class='resultTableTd'>쿠폰사용액</td><td class='resultTableTdLast'>결제금액</td></tr>");
      $('.dataTable').append(data);
    },
  })
}

function modifyOrders(){
  var orderId = $("#orderId").val();

  var productId = new Array();
  for(var i=0; i<$(".productId").length; i++){
    productId[i] = $(".productId").eq(i).val();
  }

  var orderState = new Array();
  for(var i=0; i<$(".orderState").length; i++){
    orderState[i] = $(".orderState").eq(i).val();
  }

  var productPrice = new Array();
  for(var i=0; i<$(".productPrice").length; i++){
    productPrice[i] = $(".productPrice").eq(i).val();
  }

  var shippingCost = new Array();
  for(var i=0; i<$(".shippingCost").length; i++){
    shippingCost[i] = $(".shippingCost").eq(i).val();
  }

  var discountCost = new Array();
  for(var i=0; i<$(".discountCost").length; i++){
    discountCost[i] = $(".discountCost").eq(i).val();
  }

  var addressNum = $("#addressNum").val();
  var address = $("#address").val();
  var request = $("#requestText").val();
  var adminName = $("#adminName").val();
  var postNum = $("#postNum").val();

  $.ajax({
    url:'./Orders_modify.php',
    data:({'productId':productId, 'orderId':orderId, 'orderState':orderState,
    'productPrice':productPrice, 'shippingCost':shippingCost,
     'discountCost':discountCost, 'addressNum':addressNum, 'address':address,
      'request':request, 'adminName':adminName, 'postNum':postNum}),
    async: true,
    success:function(data){
      location.href = location.href;
      //$(".dataTable").empty();
      //$(".dataTable").append("<tr><td class='resultTableTd'>번호</td><td class='resultTableTd'>상태</td><td class='resultTableTd'>주문일시</td><td class='resultTableTd'>결제일시</td><td class='resultTableTd'>주문번호</td><td class='resultTableTd'>주문자</td><td class='resultTableTd'>받는분</td><td class='resultTableTd'>결제종류</td><td class='resultTableTd'>쿠폰사용액</td><td class='resultTableTdLast'>결제금액</td></tr>");
      //$('.dataTable').append(data);

    },
  })
}

function commonCheck(obj){
  if( obj.value == '' || obj.value == null ){
    alert( '입력해주세요.' );
    obj.value = '';
    obj.focus();
    return false;
  }
  var blank_pattern = /^\s+|\s+$/g;
  if( obj.value.replace( blank_pattern, '' ) == "" ){
    alert('공백만 입력되었습니다.');
    obj.value = '';
    obj.focus();
    return false;
  }

  //공백 금지
  //var blank_pattern = /^\s+|\s+$/g;(/\s/g
  var blank_pattern = /[\s]/g;
  if( blank_pattern.test(obj.value) == true){
    alert(' 공백은 사용할 수 없습니다. ');
    obj.value = '';
    obj.focus();
    return false;
  }
  var special_pattern = /[<>`~!@#$%^&*|\\\'\";:\/?]/gi;
  if( special_pattern.test(obj.value) == true ){
    alert('특수문자는 사용할 수 없습니다.');
    obj.value = '';
    obj.focus();
    return false;
  }

  return true;
}

function hangeulCheck(obj){
  for (i = 0; i < obj.value.length; i++) {
    var retCode = obj.value.charCodeAt(i);
    var retChar = obj.value.substr(i,1).toUpperCase();
    retCode = parseInt(retCode);

    //입력받은 값중에 한글이 있으면 에러
    if ( (retChar < "0" || retChar > "9") && (retChar < "A" || retChar > "Z") && ((retCode > 255) || (retCode < 0)) ) {
      intErr = -1;
      alert('한글 또는 특수문자는 입력할 수 없습니다.');
      obj.value = '';
      obj.focus();
      return false;
    }
  }
}
/*firebase

function readOrders(){

  var sReadData = "";
  var sUid = "";
  var sOid = "";
  var sIid = "";
  var rst = "";

  firebase.database().ref('/orders/').once('value', function(snapshot) {
    sReadData = snapshot.val();
    console.log(sReadData);

    sUid = Object.keys(sReadData);

    for(var i=0; i<sUid.length; i++){ // 사용자 카운트
      var childval = snapshot.child(sUid[i]);
      var childvalres = childval.val();
      sOid = Object.keys(childvalres);

      $("#LoadingText").css('display', 'none');

      $("#dataTable").append("<tr><td class='resultTableTitleTd'>이름</td><td class='resultTableTd nameData'></td>");
      var sName = sUid[i];
      $(".nameData").eq(i).html(sName);


      for(var j=0; j<sOid.length; j++){ // 사용자/주문정보 카운트 (상품들 + 결제정보)
        childval = childval.child(sOid[j]);
        childvalres = childval.val();


        $("#dataTable").append("<tr><td class='resultTableTitleTd LeftTab1'>주문번호</td><td class='resultTableTd ordernumData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>결제수단</td><td class='resultTableTd paymentmetodData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>받는주소</td><td class='resultTableTd recipientAddressData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>전화번호</td><td class='resultTableTd recipientContactData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>운송료</td><td class='resultTableTd shippingCostData'></td></tr>tr><td class='resultTableTitleTd LeftTab1'>총 금액</td><td class='resultTableTd totalCostData'></td></tr>");
        var sOrdernum = sOid[j];
        var sPaymentMethod = childvalres.paymentMethod;
        var sRecipientAddress = childvalres.recipientAddress;
        var sRecipientContact = childvalres.recipientContact;
        var sShippingCost = childvalres.shippingCost;
        var sTotalCost = childvalres.totalCost;

        $(".ordernumData").eq(j).html(sOrdernum);
        $(".paymentmetodData").eq(j).html(sPaymentMethod);
        $(".recipientAddressData").eq(j).html(sRecipientAddress);
        $(".recipientContactData").eq(j).html(sRecipientContact);
        $(".shippingCostData").eq(j).html(sShippingCost);
        $(".totalCostData").eq(j).html(sTotalCost);

        childval = childval.child("items");
        childvalres = childval.val();
        sIid = Object.keys(childvalres);

        for(var k=0; k<sIid.length; k++){ // 사용자/주문정보/상품 카운트
          childval = childval.child(sIid[k]);
          childvalres = childval.val();

          $("#dataTable").append("<tr><td class='resultTableTitleTd LeftTab2'>이미지</td><td class='resultTableTd imageData'></tr><tr><td class='resultTableTitleTd LeftTab2'>상품명</td><td class='resultTableTd productnameData'></tr><tr><td class='resultTableTitleTd LeftTab2'>가격</td><td class='resultTableTd priceData'></tr><tr><td class='resultTableTitleTd LeftTab2'>수량</td><td class='resultTableTd quantityData'></tr><tr><td class='resultTableTitleTd LeftTab2'>사이트이름</td><td class='resultTableTd sitenameData'></tr>");
          var sProductName = childvalres.name;
          var sPrice = childvalres.price;
          var sQuantity = childvalres.quantity;
          var sSiteName = childvalres.siteName;

          $(".imageData").eq(k).html("<img src="+childvalres.imageURL+">");
          $(".productnameData").eq(k).html(sProductName);
          $(".priceData").eq(k).html(sPrice);
          $(".quantityData").eq(k).html(sQuantity);
          $(".sitenameData").eq(k).html(sSiteName);


          childval = childval.child("options"); //사용자/주문정보/옵션
          childvalres = childval.val();
          sOptid = Object.keys(childvalres);

          for(var z=0; z<sOptid.length; z++){
            childval = childval.child(sOptid[k]);
            childvalres = childval.val();

            $("#dataTable").append("<tr><td class='resultTableTitleTd LeftTab2'>옵션</td><td class='resultTableTd optionData'></tr>");
            var sOption = childvalres;

            $(".optionData").eq(z).html(sOption);

          }


          rst += "사용자/주문정보/상품/상품정보/옵션 <br/>" + JSON.stringify(childvalres) + "<br/><br/>";

          //console.log(childvalres);
          //$("#DB_MESSAGE").text(JSON.stringify(childvalres));
        }
      }
    }
    //$("#DB_MESSAGE").html(rst);
  });
}
*/

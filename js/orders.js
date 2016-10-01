$(document).ready(function(){
  showOrders();
});

function showOrders(){
  $("#dataTable").empty();
  $("#LoadingText").css('display', 'none');
  // $("#dataTable").append("<tr><td class='resultTableTitleTd'>이름</td><td class='resultTableTd nameData'></td><tr><td class='resultTableTitleTd LeftTab1'>주문번호</td><td class='resultTableTd ordernumData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>결제수단</td><td class='resultTableTd paymentmetodData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>받는주소</td><td class='resultTableTd recipientAddressData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>전화번호</td><td class='resultTableTd recipientContactData'></td></tr><tr><td class='resultTableTitleTd LeftTab1'>운송료</td><td class='resultTableTd shippingCostData'></td></tr>tr><td class='resultTableTitleTd LeftTab1'>총 금액</td><td class='resultTableTd totalCostData'></td></tr><tr><td class='resultTableTitleTd LeftTab2'>이미지</td><td class='resultTableTd imageData'></tr><tr><td class='resultTableTitleTd LeftTab2'>상품명</td><td class='resultTableTd productnameData'></tr><tr><td class='resultTableTitleTd LeftTab2'>가격</td><td class='resultTableTd priceData'></tr><tr><td class='resultTableTitleTd LeftTab2'>수량</td><td class='resultTableTd quantityData'></tr><tr><td class='resultTableTitleTd LeftTab2'>사이트이름</td><td class='resultTableTd sitenameData'></tr><tr><td class='resultTableTitleTd LeftTab2'>옵션</td><td class='resultTableTd optionData'></tr>");

  $.ajax({
    url:'./orders_read.php',
    data:({}),
    async: true,
    success:function(data){
      $('#dataTable').append(data);
    },
  })
}


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

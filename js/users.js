//firebase
// function readUsers(){
//   // Initialize Firebase
//
//   var sReadData = "";
//   var sUid = "";
//   var sUserInfo = "";
//   var rst = "";
//
//
//   firebase.database().ref('/users/').once('value', function(snapshot) {
//     sReadData = snapshot.val();
//     sUid = Object.keys(sReadData);
//
//     for(var i=0; i<sUid.length; i++){ // 사용자 카운트
//       var childval = snapshot.child(sUid[i]);
//       var childvalres = childval.val();
//
//       var sEmail = childvalres.email;
//       var sFirstName = childvalres.firstName;
//       var sLastName = childvalres.lastName;
//       var sName = sFirstName + " " + sLastName;
//       var sPhone = childvalres.phone;
//
//       $("#dataTable").append("<tr><td class='resultTableTitleTd'>이메일</td><td class='resultTableTd emailData'></td></tr><tr></tr><tr><td class='resultTableTitleTd'>이름</td><td class='resultTableTd nameData'></td></tr><tr><td class='resultTableTitleTd'>핸드폰</td><td class='resultTableTd phoneData'></td></tr><tr><td><br/></td></tr>");
//       $(".emailData").eq(i).html(sEmail);
//       $(".nameData").eq(i).html(sName);
//       $(".phoneData").eq(i).html(sPhone);
//       $("#LoadingText").css('display', 'none');
//     }
//   });
// }
//
// function SearchUsers(){
//
//   var searchText = $("#searchnameValue").val();
//   var searchOpt = $("#searchOpt").val();
//   if( searchText == ""){
//     $("#dataTable").empty();
//     readUsers();
//     return;
//   }
//
//   firebase.database().ref('/users/').orderByChild(searchOpt).startAt(searchText).endAt(searchText+"\uf8ff").on("child_added", function(snapshot) {
//     var sReadData = snapshot.val();
//     sUid = Object.keys(sReadData);
//
//     $("#dataTable").empty();
//
//     var sEmail = snapshot.val().email;
//     var sFirstName = snapshot.val().firstName;
//     var sLastName = snapshot.val().lastName;
//     var sName = sFirstName + " " + sLastName;
//     var sPhone = snapshot.val().phone;
//
//     $("#dataTable").append("<tr><td class='resultTableTitleTd'>이메일</td><td class='resultTableTd emailData'></td></tr><tr></tr><tr><td class='resultTableTitleTd'>이름</td><td class='resultTableTd nameData'></td></tr><tr><td class='resultTableTitleTd'>핸드폰</td><td class='resultTableTd phoneData'></td></tr><tr><td><br/></td></tr>");
//     $(".emailData").html(sEmail);
//     $(".nameData").html(sName);
//     $(".phoneData").html(sPhone);
//     $("#LoadingText").css('display', 'none');
//   });
//
//   // var ref = new Firebase("https://dinosaur-facts.firebaseio.com/dinosaurs");
//   // ref.orderByChild("height").equalTo(25).on("child_added", function(snapshot) {
//   //console.log(snapshot.key());
// }

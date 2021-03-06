<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Wannaone Goods</title>
<link rel="shortcut icon" type="image/icon" href="resources/img/icon2.png">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/join.css" rel="stylesheet" type="text/css" media="all">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

   //주소입력
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
    
</script>
<script type="text/javascript">
$(document).ready(function(){
	var emailText = "";
	var finEmail = "";
	var email;
	var pw;
	var name;
	var phone;
	var addr1;
	var addr2;
	var addr3;
	
	$("#email").attr("pattern", "[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	$("#btn1").off().on("click", function(){
		email = $("#email").val();
		pw = $("#pwd").val();
		name=$("#name").val();
		phone=$("#phone").val();
		addr1=$("#sample6_postcode").val();
		addr2=$("#sample6_address").val();
		addr3=$("#sample6_address2").val();
		finEmail = $("#email").val();
		var checkid = $("#checkid").text();
		console.log(addr1);
		

         if(email == "" || pw == "" || name == "" || phone == "" || addr1 == "" ||  addr2 == "" || addr3 == ""){               
            alert("모든 정보를 입력하세요.");
            return false;
         }else if(checkid=="중복확인"){
            alert("중복확인을 해주세요.");
         }else if(regex.test(email) == false){
        	 alert("잘못된 이메일 형식입니다.ex)1234@naver.com");
	         return false;
         }else if(finEmail != emailText){
            alert("email를 다시 확인하세요.");
            $("#email").val(emailText);
         }else if(pw.length > 15){
            alert("비밀번호를 15자 이하로 입력해주세요.");
         }else{
        	 $.ajax({
 				type:"POST",
 				url:"UserJoin",
 				data:{"email":email, "pw":pw, "name":name, "phone":phone, "addr1":addr1, "addr2":addr2, "addr3":addr3}
 			}).done(function(result){
 					alert("회원가입이 완료되었습니다.");
 					location.href="/login";
 				console.log("성공");
 			});
         }
	});
	
	$("#checkid").off().on("click", function(){
		email =$("#email").val(); 
		emailText = $("#email").val();
		
		if(email == ""){
			alert("이메일을 입력해주세요.");
		}else if(email.length > 30){
			alert("이메일을 다시 입력해주세요.")
		}else{
			$.ajax({
				type:"post",
                url:"CheckId",
                data:{"email":email},
               datatype: "json"
			}).done(function(result){
				
				if(result.checkid == null){
					$("#checkid").text("완료");
					alert("사용가능한 이메일입니다.");
				}else{
					$("#checkid").text("중복확인");
					 $("#email").val("");
                     alert("사용중인 이메일입니다.");
				}
				 console.log(result);
			});
		}
	});
});	


</script>


</head>
 <!--body-->   
<body id="top">
    <!--헤더부터 푸터까지 담는 전체 틀-->
    <!--로고와 네비바 틀-->  
    <header id="header" class="navbar-fixed-top"> 
      
       <nav class="navbar">
          <div class="container-fluid ">
            <div class="navbar-header">
              <a class="navbar-brand" href="/" style="font-size: 25px">Wannaone's Goods</a>
            </div>
            <ul class="nav navbar-nav">
              <li class="active"><a href="/">Home</a></li>
              <li class="dropdown" onclick="location.href='/category'"><a class="dropdown-toggle" data-toggle="dropdown" href="/category">카테고리 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="/living">리빙</a></li>
                  <li><a href="/figure">피규어</a></li>
                  <li><a href="/accesory">악세사리</a></li>
                  <li><a href="/clothes">의류</a></li>
                  <li><a href="etc">기타</a></li>
                </ul>
              </li>
                <!--<li><a href="#">Story</a></li>-->
              <li><a href="/mypage">MyPage</a></li>
                <!--<li><a href="#">고객센터</a></li>-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="/login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
              <!--<li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>-->
            </ul>
          </div>
      </nav>   
    </header>
  <div id="bigcontainer">
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height="400"> 
      
    

         <!--리빙상품-->
      <div id="join">
            <h1 id="h1">Wannaone's Goods 회원가입 페이지</h1>
         
          <hr>
          
          <div id="profile">
           <form>
                <div class="form-group">
               
                  <label for="email">Email</label>
                       <button id= "checkid" type="button">중복확인</button>
                  <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요.ex) abc@naver.com" maxLength="30">
                  
                </div>
               <div class="form-group">
                  <label for="name">Name</label>
                  <input type="text" class="form-control" id="name" placeholder="이름을  입력해주세요." maxLength="10">
                </div>
                <div class="form-group">
                  <label for="pwd">Password</label>
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password =>  비밀번호는 15이하로 입력해주세요." maxLength="15">
                </div>
                <div class="form-group">
	                <label for="address">Address</label><br>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소">
					<input type="text" id="sample6_address2" placeholder="상세주소">               
                 </div>
               <div class="form-group">
                  <label for="phone">Phone</label>
                  <input type="text" class="form-control" id="phone" placeholder="Enter phone => '-' 없이 번호를 입력해주세요." maxLength="20">
                </div>
                <br>
              <button type="submit" class="btn btn-default" id="btn1">확인</button>
               <a href="/login"><button type="button" class="btn btn-default" id="btn2">취소</button></a>
         </form>
         </div>
          
          
      </div>
     
  </div><!--콘텐츠끝나는 부분-->
    
<footer>
    <div id=footer_up>
        
      <div class="alert alert-info alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>※상담☞</strong>
          카카오톡 id: @sjy  &nbsp; 시간: 1시부터 5시까지
      </div>
        
    </div>
    
    <div id=footer_down>
        <h6>copyrightⓒWannaone's Goods</h6>
        <h7>Name: 송지연</h7>
        <h7>Tel: 010-1004-1004</h7>
        <h7>Addr: 경기도........</h7>
    </div>
    
</footer>


</body>
</html>
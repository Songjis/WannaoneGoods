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
<link href="resources/cart.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript">

$(document).ready(function(){
	 
	 var user = {};
	 var data = [];
	 var k= 0;
	 var delivery = 2500;
	$.ajax({
	   	url : "checkLogin"        	
	    }).done(function(d){
	    	console.log(d);
	   	user = JSON.parse(d);
	   	console.log("id:",user.email);
	   	console.log("no:",user.no);
	   	console.log(user);
	    //var email=user.email;
	    		$("#login").hide();
	    		$("#user").text(user.name+"님 반갑습니다.").css({ "font-size": "1.8rem", "margin-top": "6%"});
	    		var tag ="<a href=''><span class='glyphicon glyphicon-log-out'></span> Logout</a>"
	    		$("#logout").html(tag);
	    		//pagereload();
	        
	    		
	    		
	    		$.ajax({
	    			url: "selectCart",
	    			type:"POST",
	    			data:{"email":user.email}
	    	    	}).done(function(d){
	    			
	    			var result = JSON.parse(d);
	    			console.log(result);
	    			data = result.selectCart;
	    			
	    	
	    			
	    			$.each(result.selectCart, function(key, value){
	    				var tag="";
	    				
	    				tag += '<tr><td class="gnogno">'+ value.gno +'</td><td class="namename">'+ value.gname+'</td><td class="pickpick">'+ value.memberpick +'</td><td class="eaea">'+ value.ea +'</td><td class="priceprice">'+ value.price +'</td></tr>';
	    				$("table tbody").append(tag);
	    				 
	    			     k += parseInt(value.price);
	    			});
	    			console.log(user.email);
	    			
	    		
	    			$("#ttcart span").text(k + delivery);
	    			
	    		});
	    		
	        
	    		
	    });
	
	$("#logout").click(function(){
		$.ajax({
			url:"logout"
		}).done(function(d){
			 location.href="/"; 
		})
	});
	
	console.log(user.email);
	
	
	
	
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
              <li id="mypage_nav"><a href="/mypage">MyPage</a></li>
                <!--<li><a href="#">고객센터</a></li>-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
             <li id="login"><a href="/login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
              <li id="user"></li>
              <li id="logout"></li>
               <!-- <span class="glyphicon glyphicon-log-out"></span> Logout -->
              <!--<li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>-->
          </ul>
          </div>
      </nav>   
    </header>
  <div id="bigcontainer">
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height="400"> 
      
    

         <!--리빙상품-->
      <div id="cartpage">
            <h1 id="h1">장바구니페이지</h1>
         
          <hr>
          <h2>☆장바구니 리스트☆</h2>
          
          <div id="cartlist">
          
          
          <table class="table"  style="width : 80%; margin:3% 10%; font-size:2rem;">
          		<thead>
          			<tr>
          			    <th>상품no
          				</th>
          			
          				<th>상품명
          				</th>
          				
          				<th>멤버 pick
          				</th>
          				
          				<th>수량
          				</th>
          				
          				<th>가격 합계
          				</th>
          				
          			</tr>
          			
          		</thead>
          		<tbody>
          			
          			
          			
          			
          		</tbody>
          	</table>
          	
         </div>
         
          <div id="ttcart">
              <h3>☆총 합계: (배송비 :2500원 포함)&nbsp;&nbsp;<span> </span>원</h3>
          
          </div>
          
      </div>
      <!--상품끝-->
      
     
    
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
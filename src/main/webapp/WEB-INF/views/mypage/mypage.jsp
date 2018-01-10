<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Wannaone Goods</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/mypage/mypage.css" rel="stylesheet" type="text/css" media="all">
   
</head>
 <!--body-->   
<body id="top">
    <!--헤더부터 푸터까지 담는 전체 틀-->
    <!--로고와 네비바 틀-->  
    <header id="header" class="navbar-fixed-top"> 
      
       <nav class="navbar">
          <div class="container-fluid ">
            <div class="navbar-header">
              <a class="navbar-brand" href="#" style="font-size: 25px">Wannaone's Goods</a>
            </div>
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">카테고리 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">리빙</a></li>
                  <li><a href="#">피규어</a></li>
                  <li><a href="#">악세사리</a></li>
                  <li><a href="#">의류</a></li>
                  <li><a href="#">문구</a></li>
                </ul>
              </li>
                <!--<li><a href="#">Story</a></li>-->
              <li><a href="#">MyPage</a></li>
                <!--<li><a href="#">고객센터</a></li>-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Login</a></li>
              <!--<li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>-->
            </ul>
          </div>
      </nav>   
    </header>
  <div id="bigcontainer">
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height="400"> 
      
    

         <!--리빙상품-->
      <div id="mypage">
            <h1 id="h1">마이페이지</h1>
         
          <hr>
          <h2>회원정보</h2>
          <div id="profile">
           <form>
                <div class="form-group">
                  <label for="email">Email:</label>
                  <input type="email" class="form-control" id="email" placeholder="Enter email">
                </div>
               <div class="form-group">
                  <label for="name">Name:</label>
                  <input type="text" class="form-control" id="name" placeholder="Enter name">
                </div>
                <div class="form-group">
                  <label for="pwd">Password:</label>
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password">
                </div>
                <div class="form-group">
                  <label for="address">Address:</label>
                  <input type="text" class="form-control" id="address" placeholder="Enter address">
                </div>
               <div class="form-group">
                  <label for="phone">phone:</label>
                  <input type="number" class="form-control" id="phone" placeholder="Enter phone">
                </div>
                <button type="submit" class="btn btn-default" id="btn1">수정</button>
               <button type="submit" class="btn btn-default" id="btn2">탈퇴</button>
         </form>
         </div>
          <div id="point">
              <h2>적립포인트</h2>
              <input type="number" class="form-control" id="number"><h3>point</h3>
          </div>
          
          
          
      </div>
      <!--상품끝-->
      
      <div id="buylist">
          <h4>주문내역</h4>
          <div id="buylist_img"><img src="" alt="img" width="10" height="10"></div>
          <div id="buylist_c">
          <a href="">제목~~~~~~~~~~~~~~~~~~~</a>
          </div>
          
          <hr>
          
          <div id="buylist_img"><img src="" alt="img" width="10" height="10"></div>
          <div id="buylist_c">
          <a href="">제목~~~~~~~~~~~~~~~~~~~</a>
          </div>
          
          <hr>
          
          <div id="buylist_img"><img src="" alt="img" width="10" height="10"></div>
          <div id="buylist_c">
          <a href="">제목~~~~~~~~~~~~~~~~~~~</a>
          </div>
          
          <hr>
          
          <div id="buylist_img"><img src="" alt="img" width="10" height="10"></div>
          <div id="buylist_c">
          <a href="">제목~~~~~~~~~~~~~~~~~~~</a>
          </div>
          
          <hr>
         
          
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
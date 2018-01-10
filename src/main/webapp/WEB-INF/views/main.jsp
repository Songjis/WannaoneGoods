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
<link href="resources/main.css" rel="stylesheet" type="text/css" media="all">
   
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
    
      
      <!--이미지슬라이드-->
      <div id="imgslide">
      
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
              <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

              <div class="item active">
                <img src="resources/img/img_chania.jpg" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>img1</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
              </div>

              <div class="item">
                <img src="resources/img/img_chania2.jpg" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                  <h3>img2</h3>
                  <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                </div>
              </div>

              <div class="item">
                <img src="resources/img/img_flower.jpg" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>img3</h3>
                  <p>Beautiful flowers in Kolymbari, Crete.</p>
                </div>
              </div>

              <div class="item">
                <img src="resources/img/img_flower2.jpg" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                  <h3>img4</h3>
                  <p>Beautiful flowers in Kolymbari, Crete.</p>
                </div>
              </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
      
      </div>
<!--이미지슬라이드끝-->
      <div id="alert">   
         <div class="alert_l"><img src="resources/img/alert.png" style="width: 100%; height: 100%">   
         </div>
          <div class="alert_r"><h4>[공지]~~~~~~~~~~~~~~</h4></div>
      </div>
         <!--인기상품-->
      <div class="pop">
            <h1>인기상품</h1>
          
            <div class="pop_c1">
                <div class="pop_p1"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default" onclick="location.href = 'detail';">보러가기</button>
                </div>
          </div>
            <div class="pop_c2">
                <div class="pop_p2"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
            <div class="pop_c3">
                <div class="pop_p3"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
          
          <div class="pop_c4">
                <div class="pop_p4"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
            <div class="pop_c5">
                <div class="pop_p5"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
            <div class="pop_c6">
                <div class="pop_p6"></div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
              
              
      </div>
      <!--인기상품끝-->
      <!--한정판-->
      <div class="limited">
          <!--글틀-->
          <div class="limit_f">
              <h2>Limited Edition</h2>
              <h3>품 절 임 박 !</h3>
              <h5>===============설명==============</h5>
              <button type="button" class="btn_limited btn-link">워너원 한정판 손난로 보러가기>></button>
          </div>
          <!--사진-->
          <img src="resources/img/limited.PNG" class="limit_p">

      </div>
      
      <!--신상품-->
      <div id="new">
            <h1>신상품</h1>
          
            <div id="new_c1">
                <div class="new_p1">
                <img src="resources/img/cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%">
                </div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
            <div id="new_c2">
                <div class="new_p2">
               <img src="resources/img/cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%">
                </div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
            <div id="new_c3">
                <div class="new_p3">
               <img src="resources/img/cinqueterre.jpg" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%">                
                </div>
                <div class="pop_btn">
                <button type="button" class="btn btn-default">보러가기</button>
                </div>
          </div>
      </div>
    
  </div><!--콘텐츠끝나는 부분-->
    
<footer>
    <div id=footer_up>
        
      <div class="alert alert-info alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>※상담☞</strong>
          <p>카카오톡 id: @sjy  &nbsp; 시간: 1시부터 5시까지</p>
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
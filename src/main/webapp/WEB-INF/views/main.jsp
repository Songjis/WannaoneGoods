<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Wannaone Goods</title>
<link rel="shortcut icon" type="image/icon" href="resources/img/icon1.png">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/main.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript">
$(document).ready(function(){
	var data = [];
	var data1 = [];
	$.get("mainlist").done(function(d){
		var result = JSON.parse(d);
		console.log(result);
		data = result.poplist;
		data1 = result.newlist;
		//for문 간단 사용법 ->  http://api.jquery.com/jquery.each/
		$.each( result.poplist, function( key, value ) {
// 			console.log("poplist", key, value );
			var tag="";
			tag += '<div class="pop_c2">';
			tag += '  <div class="pop_p2"> <img src="' + value.gimg + '" class="popimg"></div>';
			tag += '  <div class="pop_btn">';
			tag += '    <button type="button" class="btn btn-default">보러가기</button>';
			tag += '  </div>';
			tag += '</div>';
	        $(".pop").append(tag);
		});
		
		$.each( result.newlist, function( key, value ) {
// 			console.log("newlist", key, value );
			var tag = "";
			tag += '<div id="new_c1">';
			tag += '  <div class="new_p1"><img src="' + value.gimg + '" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%">';
			tag += '  </div>';
			tag += '  <div class="pop_btn">';
			tag += '    <button type="button" class="btn btn-default">보러가기</button>';
			tag += '  </div>';
			tag += '</div>';
            $("#new").append(tag);
		});
		
		
		
		//보러가기 클릭했을 때 
		$(".pop_btn").off();
		$(".pop_btn").on("click",function(){console.log("dddd");
			console.log(data);

			var index = $(".pop_btn").index(this);
			console.log("index : ", index);
			
			if(index <6){
				var dNo = data[index].gno;
				location.href = "detail?dNo=" + dNo;
				console.log(dNo);
			}else{
				var dNo = data1[index-6].gno;
				location.href = "detail?dNo=" + dNo;
				console.log(dNo);
			}
		});
		
		
		$(".btn_limited").off();
		$(".btn_limited").on("click",function(){
			location.href="figure";
			
		})
		
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
      		
          
            
              
              
      </div>
      <!--인기상품끝-->
      <!--한정판-->
      <div class="limited">
          <!--글틀-->
          <div class="limit_f">
              <h2>Limited Edition</h2>
              <h3>품 절 임 박 !</h3>
              <h5>2월달까지만 판매되는 상품입니다.</h5>
              <button type="button" class="btn_limited btn-link">워너원 한정판 피규어 보러가기>></button>
          </div>
          <!--사진-->
          <img src="resources/img/f1.jpg" class="limit_p">

      </div>
      
      <!--신상품-->
      <div id="new">
            <h1>신상품</h1>
          
            
          
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
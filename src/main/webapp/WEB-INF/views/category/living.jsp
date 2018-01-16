<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Category" data-ng-controller="livingCtrl">
<head>
<title>Wannaone Goods</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="resources/category/living.css" rel="stylesheet" type="text/css" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <script src="resources/category/category.js"></script>
   
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
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height="400"> 
      
    

         <!--리빙상품-->
      <div id="living">
            <h1 id="h1">리빙</h1>
         
          
          
          
          
          <!--드랍다운-->
            <select name="select" id="menu1" data-ng-model="selectOrder">
			    <option value="-hit">인기순</option>
			    <option value="gprice">낮은가격</option>
			    <option value="-gprice">높은가격</option>
			</select>
          
          
          <!-- 탭-->
          
         
            <button type="button" class="btn btn-default" id="tab1">손거울</button>

            <button type="button" class="btn btn-default" id="tab1">손난로</button>
         
          
          
          
          <hr>
          
          <!--상품1-->
          <div id="catedata">
          	<div id="pop_c1" data-ng-repeat="rows in data | orderBy: selectOrder | limitTo : viewRow : start">
				<div class="pop_p1">
	        		<div id="pic">
	        			<img data-ng-src="{{rows.gimg}}" class="cateimg">
	        		</div>
	        		<div id="title"><h3>{{rows.gname}}</h3></div>
            		<div id="price"><h4>{{rows.gprice}}</h4></div>
            	</div>
            	<div class="pop_btn">
            		<button type="button" class="btn btn-default" data-ng-click="more(rows)">보러가기</button>
            	</div>
            </div>
          </div>
		  
		  <div class="page">
          	<a data-ng-href="" data-ng-repeat="rows in pageArry" data-ng-click="pagingEvent($index)" data-ng-class="{pageBg : pageNum == (rows.no + 1)}">{{rows.no + 1}}</a>
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
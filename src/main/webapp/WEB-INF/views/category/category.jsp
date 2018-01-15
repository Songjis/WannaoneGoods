<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Category" data-ng-controller="categoryCtrl">
<head>
<title>Wannaone Goods</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="resources/category/category.css" rel="stylesheet" type="text/css" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  
<script type ="text/javascript">

var category = angular.module("Category", []);
category.controller("categoryCtrl", function($scope, $http) {
	var data =[];
	var viewRow = 9;
	var tag = "";
	var tag1 = "";
	var page = 1;
	var totCnt = 0;
	$scope.pageArry = [];
	
	$scope.init = function() {
	    var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
	    if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
	       page = hash.substr(1, hash.length);
	    }      
	    var end = (viewRow * page); // 9 * 1 = 9 
	    var start = (end - viewRow); // 9 - 9 = 0
    	
    	$http.post("categorylist","",
    			   { params : {
    				   	"start":start, 
    				    "viewRow":viewRow}
		}).then(function(result) {
	        $scope.data = result.data.categorylist;
	        $scope.totCnt = result.data.tot.tot;
	        $scope.page = $scope.totCnt / viewRow;
	        for(var i = 0; i < $scope.page; i++){
	        	$scope.pageArry.push(i);
	        }
    	});
    }
	
	$scope.more = function(row){
		console.log(row);
	}
    
    $scope.init();
});


$(document).ready(function(){
// 	var data =[];
// 	var viewRow = 9;
// 	var tag = "";
// 	var tag1 = "";
// 	var page = 1;
// 	var totCnt = 0;
		
// 	function createHtml(data){
// 		$("#catedata").empty();
// 		$.each( data, function( key, value ) {
// 			var tag="";
// 			tag += '<div id="pop_c1">';
// 			tag +=  '  <div class="pop_p1">';
// 	                <!--상품이미지-->
// 	        tag +=  '     <div id="pic">';
// 	        tag +=  '      <img src="'+ value.gimg + '" class="cateimg">';
// 	        tag +=  '    </div>';
// 	                <!--상품제목-->
// 	        tag +=  '    <div id="title"><h3>'+ value.gname + '</h3></div>';
// 	                <!--상품가격-->
//             tag +=  '    <div id="price"><h4>'+ value.gprice + '</h4></div>';
//             tag +=  '  </div>';
//             tag +=  ' <div class="pop_btn">';
//             tag +=  '  	<button type="button" class="btn btn-default">보러가기</button>';
//             tag +=  '  </div>';
//             tag += '</div>';   
// 	        $("#catedata").append(tag);
// 		});
// 	}
		
// 		function createPaging(){
// 		      var paging = totCnt / viewRow;
// 		      // 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
// 		      $(".page").empty(); // div 태그 속에 a 태그를 초기화 한다.
// 		      for(var i = 0; i < paging; i++){
// 		         $(".page").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>")
// 		      }      
// 		      $(".page a").eq(page - 1).addClass("bg"); 
// 		      $(".page a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
// 		    	 initData();
// 		     });
// 		}
		     
// 		function initData(){ // 디비에서 데이터 가져오기 위한 함수
// 		      var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
// 		      if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
// 		         page = hash.substr(1, hash.length);
// 		      }      
// 		      var end = (viewRow * page); // 9 * 1 = 9 
// 		      var start = (end - viewRow); // 9 - 9 = 0
// 		      var timestamp =+ new Date();
// 		      $.ajax({
// 		            type:"post", 
// 		            url:"categorylist?tm=" + timestamp, // Spring에서 만든 URL 호출
// 		            data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
// 		      }).done(function(d){ // 비동기식 데이터 가져오기
// 		         var result = JSON.parse(d);
// 		         data = result.categorylist;
// 		         totCnt = result.tot.tot;
// 		         createHtml(data); // 화면에 표현하기 위하여 함수 호출
// 		         createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
// 		      });
// 		}

// 		initData();
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
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height="400"> 
      
    

         <!--카테고리상품-->
      <div id="category">
            <h1 id="h1">카테고리</h1>
          
          
          
          <!--드랍다운-->
            <select name="select" id="menu1">
			    <option value="1">인기순</option>
			    <option value="2">낮은가격</option>
			    <option value="3">높은가격</option>
			  </select>
          
          
          
          <hr>
          <!--상품1-->
          <div id="catedata">
          	<div id="pop_c1" data-ng-repeat="rows in data">
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
          	<a href="#{{$index + 1}}" data-ng-repeat="rows in pageArry">{{$index + 1}}</a>
          </div>
      </div>
      <!--인기상품끝-->
      
    
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
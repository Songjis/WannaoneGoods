<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Wannaone Goods</title>
<link rel="shortcut icon" type="image/icon" href="resources/img/icon1.png">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/write.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript">
$(document).ready(function(){
	
	var user = {};
	
	$.ajax({
	   	url : "checkLogin"        	
	    }).done(function(d){	
	    	console.log(d);
	   	user = JSON.parse(d);
	   	console.log(user);
	   	if(user.state == 0){
	    		$("#login").show();
	    		$("#write_btn").hide();
	    		$("#mypage_nav").hide(); 
	    		$("#cart").hide();
	    		
	    	}else{
	    		
	    		$("#login").hide();
	    		$("#user").text(user.name+"님 반갑습니다.").css({ "font-size": "1.8rem", "margin-top": "6%"});
	    		var tag ="<a href=''><span class='glyphicon glyphicon-log-out'></span> Logout</a>"
	    		$("#logout").html(tag);
	    		//pagereload();
	    	}
	    });

	$("#logout").click(function(){
		$.ajax({
			url:"logout"
		}).done(function(d){
			 location.href="/"; 
		})
	});
	
	$("form").on("submit", function(event){
	  	event.preventDefault();
	  	 var form = document.forms[0];
  	      var formData = new FormData(form);
  		  
         $.ajax({
             type:"post",
             url:"inwriting",
             enctype: 'multipart/form-data',
             processData: false,
             contentType: false,
             cache: false,
             data: formData
          }).done(function(result){
        	  var data = JSON.parse(result);
        	  if(data.status == 1){
        		  alert("상품 등록이 되었습니다.");
             	  location.href = "category";
        	  } else {
        		  alert("상품 등록이 실패하였습니다.");
        		  location.href = "write";
        	  }
          });
         
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
              <li id="login"><a href="/login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
              <li id="user"></li>
              <li id="logout"></li>
              <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            </ul>
          </div>
      </nav>   
    </header>
  <div id="bigcontainer">
    <div class="img">
         <img src="resources/img/write2.jpg">
    </div>
     
     
     <div class="write">
        <h1>상품 등록 페이지</h1>
        <h2>관리자만 들어올 수 있는 페이지입니다. </h2>
        <form action="inwriting" method="post" enctype="multipart/form-data">
        
         <div class="upload1">
            <label for="fileName">메인 이미지  파일 :</label>
         	<input type="file" name="mimg" id="gimg" value="메인사진">
         </div>
         
         <div class="form1"> 
           <div class="gname">
            <span>제품이름 : </span>
            <input type="text" placeholder="입력하세요." name="gname" id="gname">
           </div>
           <div class="gprice">
            <span>제품가격 : </span>
            <input type="number" placeholder="입력하세요." name="gprice" id="gprice">
           </div>
           <div class="stock">
            <span>제품재고 : </span>
            <input type="number" placeholder="입력하세요." name="stock" id="stock">
           </div>
           <div class="date">
            <span>날짜: </span>
            <input type="date" placeholder="선택하세요" name="date" id="date"> 
           </div> 
           <div class="type">
            <h4>*상품 타입(type)=> 11 : 손거울 / 12 : 손난로 / 21 : 피규어 / 31: 팔찌  / 32 : 키링 / 33 : 에코백 / 41 : 의류 / 51 : 기타 </h4> 
            <select name="type" id="type">
				    <option value="11">11</option>
				    <option value="12">12</option>
				    <option value="21">21</option>
				    <option value="31">31</option>
				    <option value="32">32</option>
				    <option value="33">33</option>
				    <option value="41">41</option>
				    <option value="51">51</option>
				</select>
		  </div>
         </div>
                
         <div class="form2">
             <h3>※줄바꿈을 하고 싶으면 br 태그를 넣어주세요.</h3>
             <textarea name="content" id="content" placeholder="앞내용을 입력하세요."></textarea>
             <textarea name="content1" id="content1" placeholder="뒷내용을 입력하세요."></textarea>
         </div>
         
         <div class="upload2">
                <div class="filelabel">
                	<label for="fileName">이미지 내용 파일 :</label>
                </div>
                <div class="mfile">
	                <input type="file" name="simg" id="file1" value="파일" multiple ="multiple">
	                
                </div>
                
<!--          <input type="file" name="picture" id="file" value="사진"> -->
         </div>
         
         <div class="Button">
	         <button type="button" class="btn1 btn-info" onclick="location.href='category'">취소</button>
	         <button type="submit" class="btn2 btn-info">저장</button>
	         <!-- <button type="button" class="btn1">수정</button> -->
         </div>
         
      </form>
      
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
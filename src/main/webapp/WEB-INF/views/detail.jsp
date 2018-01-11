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
<link href="resources/detail.css" rel="stylesheet" type="text/css" media="all">
   
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
      
    <img src="resources/img/banner.jpg" id="banner" class="img-responsive" alt="banner" width="100%" height=""> 
      
    

         <!--상품detail-->
      <div id="detail">
            <h1 id="h1">워너원 피규어</h1>
            <h2 id="h2">가격 : 15000원</h2>
          
          <div id="select">
            <h3>멤버 pick(필수!):</h3>
            
          <!--드랍다운-->
            
              <select name="select" id="menu1">
			    <option value="1">강다니엘</option>
			    <option value="2">황민현</option>
			    <option value="3">옹성우</option>
			    <option value="5">박지훈</option>
			    <option value="6">라이관린</option>
			    <option value="7">배진영</option>
			    <option value="8">윤지성</option>
			    <option value="9">이대휘</option>
			    <option value="10">김재환</option>
			    <option value="11">하성운</option>
			    <option value="12">박우진</option>
			  </select>
          
        </div>
          
          <div id="count">
            <h3>수량:</h3>
            <input type="number" id="count_n" name="quantity" min="1" max="100" value="1">
          </div>
          
          <!-- 탭-->
          
         <div id="btndouble">
            <button type="button" class="btn btn-default" id="btncart">장 바 구 니</button>
          <button type="button" class="btn btn-default" id="btnbuy">바 로 구 매</button>
         </div>

          <hr>
          
          <div class="container">
           <img src="resources/img/banner.jpg" id="img" class="img-thumbnail">
              
           <img src="resources/img/banner.jpg" id="img" class="img-thumbnail">
          <img src="resources/img/banner.jpg" id="img" class="img-thumbnail">
          </div>
          
          <div id="delivery">
              <pre style="white-space: pre-wrap;"> ※ 주의사항
배송
· 배송사: CJ대한통운
· 배송비: 국내 2,500원 (3만 원 이상 구매 시 무료배송)
· 배송기간: 오후 3시 이전 주문 당일 출고 (영업일 기준)
  단, 상품의 재고 상황, 배송량, 배송 지역에 따라 배송기일이 추가로 소요될 수 있는 점 양해 부탁드립니다.

취소/교환/반품
· 교환 및 반품은 배송완료 후 7일 이내만 가능합니다.
· 다음의 경우 교환 및 반품이 불가합니다.
  - 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우
  - 포장이 훼손되어 상품가치가 상실된 경우 (예: 택과 라벨이 훼손된 경우 등)
  - 이용자의 사용 또는 일부 소비에 의해 재화 등의 가치가 현저히 감소한 경우
  - 복제가 가능한 재화 등의 포장을 훼손한 경우
  - 시간 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우
  - 고객의 주문에 따라 개별 생산되는 상품의 경우
· 고객님의 단순변심에 의한 교환/반품일 경우에는 교환/반품 배송비를 고객님께서 직접 부담하셔야 합니다.

환불
· 주문취소 및 반품 시 환불은 주문 시 이용하신 결제수단으로 2~7 영업일 이내 환불됩니다. 

기타 문의
· 기타 교환 및 반품에 대한 문의는 1:1 문의하기 또는 1577-6263으로 문의해주세요.
              
           
              </pre>
          
          
          </div>
          
          
          
      </div>
      <!--detail끝-->
      
    
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
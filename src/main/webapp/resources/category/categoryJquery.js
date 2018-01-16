$(document).ready(function(){
	var data =[];
	var viewRow = 9;
	var tag = "";
	var tag1 = "";
	var page = 1;
	var totCnt = 0;
		
	function createHtml(data){
		$("#catedata").empty();
		$.each( data, function( key, value ) {
			var tag="";
			tag += '<div id="pop_c1">';
			tag +=  '  <div class="pop_p1">';
	                <!--상품이미지-->
	        tag +=  '     <div id="pic">';
	        tag +=  '      <img src="'+ value.gimg + '" class="cateimg">';
	        tag +=  '    </div>';
	                <!--상품제목-->
	        tag +=  '    <div id="title"><h3>'+ value.gname + '</h3></div>';
	                <!--상품가격-->
            tag +=  '    <div id="price"><h4>'+ value.gprice + '</h4></div>';
            tag +=  '  </div>';
            tag +=  ' <div class="pop_btn">';
            tag +=  '  	<button type="button" class="btn btn-default">보러가기</button>';
            tag +=  '  </div>';
            tag += '</div>';   
	        $("#catedata").append(tag);
		});
	}
		
		function createPaging(){
		      var paging = totCnt / viewRow;
		      // 전체의 행의 수에서 보여줄 행을 나누면 페이지의 갯수를 알 수 있다.
		      $(".page").empty(); // div 태그 속에 a 태그를 초기화 한다.
		      for(var i = 0; i < paging; i++){
		         $(".page").append("<a href='#" + (i + 1) + "'>" + (i + 1) + "</a>")
		      }      
		      $(".page a").eq(page - 1).addClass("bg"); 
		      $(".page a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
		    	 initData();
		     });
		}
		     
		function initData(){ // 디비에서 데이터 가져오기 위한 함수
		      var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
		      if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
		         page = hash.substr(1, hash.length);
		      }      
		      var end = (viewRow * page); // 9 * 1 = 9 
		      var start = (end - viewRow); // 9 - 9 = 0
		      var timestamp =+ new Date();
		      $.ajax({
		            type:"post", 
		            url:"categorylist?tm=" + timestamp, // Spring에서 만든 URL 호출
		            data:{"start":start, "viewRow":viewRow} // 파라메터로 사용할 변수 값 객체 넣기
		      }).done(function(d){ // 비동기식 데이터 가져오기
		         var result = JSON.parse(d);
		         data = result.categorylist;
		         totCnt = result.tot.tot;
		         createHtml(data); // 화면에 표현하기 위하여 함수 호출
		         createPaging(); // 페이지 링크 표현하기 우하여 함수 호출
		      });
		}

		initData();
});
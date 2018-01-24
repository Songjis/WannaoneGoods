<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Wannaone Goods</title>
<link rel="shortcut icon" type="image/icon" href="resources/img/icon2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <style>
  .modal-header {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
     
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  .login{
      width:70%;
      margin:2% 15%;
      height:100%;
  }
  .modal-body{
      height: 500px;
      
  }
  .form-group{
      margin: 5% 0 ;
  }
  .btn{
      font-size: 2.5rem;
  }  
  
  button{
      width:30%;
      float:left;
      margin: 0 10%;
  }
  label{
      font-size: 2rem;
  
  }
 
  p{
      font-size: 2rem;
      font-weight:bold;
  }
  
  .form-control{
      height:50px;
      font-size: 2rem;
     
  }
 
  </style>
  
  <script type="text/javascript">
     $(document).ready(function(){
    	var email = "";
    	var pw = "";
    	
    	
    	$("#email").attr("pattern", "[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
    	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	
    	
    	$(".btn-success").off();
    	$(".btn-success").on("click", function(){
    		email = $("#email").val();
    		pw=$("#pwd").val();
    		if(email.length>0 && pw.length>0){
    			$.ajax({
    				type :"POST",
    				url:"loginData",
    				data:{"email":email, "pw":pw}
    				
    			}).done(function(result){
    				var data = JSON.parse(result);
    				console.log("결과: " +data.stat);
    				if(data.stat == 1){
    					/* alert("성공"); */
    					location.href = "/";
    				}else{
    					alert("입력하신 정보는 잘못되었습니다.");
    				}
    			})
    		}else{
    			if($("#email").val()=="" || $("#pw").val()==""){
    				alert("이메일 또는 비밀번호를 입력하세요.");
    			}else if(regex.test(email) == false){
    				alert("잘못된 이메일 형식입니다. ex)1234@naver.com");
    				return false;
    			}else{
    				/* alert("비밀번호를 입력하세요.") */
    			}
    		}
    		
    	});
    	
    	
     });
  
  
  
  
  
  
  
  </script>
  
  
</head>
<body>

<div class="login">
 

    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
        
          <h1><span class="glyphicon glyphicon-lock"></span> Login</h1>
         
         
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Email</label>
              <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." maxLength="30">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요." maxLength="15">
            </div>
            
              <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-off"></span> 로그인</button>
              <button type="button" class="btn btn-warning" onclick="location.href='/'"><span class="glyphicon glyphicon-remove"></span>취소</button>
          </form>
        </div>
        <div class="modal-footer">
          
          <p>아직 회원이 아닌가요? <a href="join">회원가입</a></p>
         <!--  <p>비밀번호를 잊어버리셨나요? <a href="#">비밀번호 찾기</a></p> -->
        </div>
      </div>
      
    </div>

 
</body>
</html>

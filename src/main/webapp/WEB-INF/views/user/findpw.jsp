<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


<script type="text/javascript">
//이메일 작성
let code = "";     //이메일 인증 저장위한 코드
function sendEmail() {
	let emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞추어 작성하세요");
	} else {
		let email = $("#email").val();  //입력한 이메일
		
		$.ajax({
			url: "mailSender.do",
			type: "get",
			data: {'m_email':email},
			success: function(rnum) {
				//alert("s");
				alert("기입하신 이메일로 인증번호를 전송했습니다.");
				
				$("#codeInput").attr("disabled", false); //입력칸 활성화
				code = rnum;
			},
			error: function () {
				alert("f");
			}
		});
	}
}
// $(document).ready(function() {
// 	  $(".next").click(function(event) {
// 		  console.log("작동됨")
// 	    // 폼 제출 기본 동작을 막습니다.
// 	    event.preventDefault();

// 	    // 슬라이드 아웃을 시작하기 전에 필요한 유효성 검사 등을 수행합니다.

// 	    // 슬라이드 아웃 효과를 시작하려면 slide-out 클래스를 추가합니다.
// 	    $("form").addClass("slide-out");

// 	    // setTimeout을 사용하여 리디렉션이나 기타 작업을 지연시킬 수 있습니다.
// 	    setTimeout(function() {
// 	      // 다음 페이지로 리디렉션하거나 다른 작업을 수행합니다.
// 	      // 예: window.location.href = "다음-페이지.html";
// 	    }, 500); // 트랜지션 기간에 맞게 지연 시간을 조정하세요.
// 	  });
// 	});

</script>
<style type="text/css">
html {
/* 	background-color: #ff533f; */
 	background-size : cover; 
	background-image: url('../resources/img/3.jpg') ;  
}
form {
     width: 450px; 
     padding: 20px;
     transform: translate(-50%,-50%)
  
}
#needit{
	color: white; 
	background-color: #ff533f;
	border-color: #ff533f;
}
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
.logo{
    position: absolute;
    top: -45px;
    left: 80px;
    transform: translate(-50%,-365%);
    z-index: 6;
}
.find{
	text-align: center;
	font-weight: bold;
}
.code{
	position: absolute;
    right: 0px;
    top: 12px;
}

.slide-out {
  transform: translate(-400%,-50%);
  transition: transform 1s ease-out;
}

</style>
</head>
<body>


<img class="logo top-50 start-50" src="/resources/img/needit01.png" width="300" height="60" >
<form action="./findpw" method="post"  class="card shadow-lg position-absolute top-50 start-50 form-signin" inputmode="text">
<fieldset style="width: 150;">
<legend class="find">아이디 찾기</legend>

<div class="form-floating">
	<div class="row">
  		<div class="col">
  			<label >아이디</label>
    		<input type="text" class="form-control form-control mb-3" id="id" name="id" placeholder="아이디를 입력해주세요" required="required">
    		<div class="position-relative">
    		<label >이메일</label>  
    		</div>
   	 		<input type="text" class="form-control form-control mb-3" name="email" id="email" placeholder="이메일을 입력해주세요" required="required">
   	 		<div class="position-relative">
  			<label >인증번호</label>
  			<span class="position-absolute top-50 end-0 translate-middle-y" id="codecheck_blank" style="font-size: 15px;"><input id="needit" class="code btn btn-danger" type="button" value="인증코드 발송" onclick="sendEmail()"></span>
    		</div>
			<input  type="text" class="form-control form-control mb-3" id="codeInput" placeholder="인증번호 입력"  required="required" disabled="disabled" required="required">
			<button id="needit"class="next btn btn-danger float-end" >다음</button>
		</div>
	</div>
</div>
</fieldset>
</form>

</body>
</html>
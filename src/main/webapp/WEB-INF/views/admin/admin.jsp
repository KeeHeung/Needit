<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<style type="text/css">

/* 로고 크기 */
#AdminImg{
	float: left;
 	position: relative;
	z-index: 1;
	width: 300px;
	height: 105px;
	margin-top: 5px;
}

/* 로그아웃 버튼 */
#AdminBtn{
	float: right;
	z-index:2;
	margin-right:17px;
	margin-top:30px;
	border: 0px solid;
	border-radius: 5px;
	width: 82px;
	height: 37px;
}

/* 목록 글씨체 */
#AdminUl li{
	list-style: none;
	color: white;
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 15px;
	margin-left: -6px;
}
/* 목록 클릭시 */
li:hover{
	background-color: #ff8200;
	cursor: pointer;
}

/* 위쪽 배경 */
#AdminTop{
	border: 0px solid rgb(255,83,63);
	width: 1620px;
	height: 100px;
	background: rgb(255,83,63);
	position: absolute;
	margin-left: 300px;
	z-index: 3;
}

/* 왼쪽 배경 */
#AdminLeft{
	float: left;
	position: absolute;
	border: 0px solid rgb(255,83,63);
	width: 300px;
	height: 923px;
	background: rgb(255,83,63);
}

/* 목록 전체 div */
#AdminList{
	float: left;
	position: absolute;
	z-index:1;
	margin-top: 110px;
	margin-left: -28px;
}

/* 안쪽 내용 중간 배치 */
#AdminContent {
    float: left;
    position: fixed;
	width: 1620px;
    margin-left: 300px;
    margin-top: 128px;
}

/* 목록 링크 링크색 제거 */
#AdminList li a{
	text-decoration: none;
	color: white;
}

/* 로고와 목록 띄우기 */
#AdminDayVisit{
	margin-top: 8px;
}

</style>

</head>
<body>
	

<!-- 니딧 로고 -->
<a href="./admin"><img alt="니딧로고" src="/resources/img/needitAdmin_white.png" id="AdminImg"></a>

<!-- 위쪽 배경 -->
<div id="AdminTop">
<!-- 로그아웃 버튼 -->
<form action="/main/main" method="post">
<button id="AdminBtn">로그아웃</button>
</form>
</div>

<!-- 왼쪽 배경 -->
<div id="AdminLeft"></div>


<!-- 목록 -->
<div id="AdminList">
<ul id="AdminUl">
<li id="AdminDayVisit"><a href="./dayVisit">방문자수 조회</a></li>
<li id="AdminChat"><a href="./chat">1:1 채팅문의 목록</a></li>
<li id="AdminReport"><a href="./reportList">신고접수 목록</a></li>
<li id="AdminBusiness"><a href="./businessReq">업체요청 목록</a></li>

<li id="AdminBanner"><a href="./bannerUpdate?boardNo=0">메인배너 수정</a></li>
<li id="AdminNotice"><a href="./noticeUpdate">공지등록</a></li>
<li id="AdminEmail"><a href="./emailSend">회원 이메일 발송</a></li>
</ul>
</div>



</body>
</html>
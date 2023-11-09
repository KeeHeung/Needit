<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#AdminChat{
	background-color: #ff8108;
	width: 302px;
}

.wrap {
    padding: 40px 0;
    background-color: #A8C0D6;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .other .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

/* 상대방 채팅 화살표 */
.wrap .other .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
}

.wrap .mine {
    flex-direction: row-reverse;
}

.wrap .mine .textbox {
    margin-right: 20px;
    background-color: rgb(255,83,63);
    color: white;
}

/* 나의 채팅 화살표 */
.wrap .mine .textbox::before {
    right: -15px;
    content: "▶";
    color: rgb(255,83,63);
}

.wrap{
	border: 3px solid rgb(255,93,63);
	width: 90%;
	height: 100%;
	margin: auto;
	background-color: white;
	
}

</style>
</head>
<body>

<h1>1:1 채팅문의 아직 덜함 수정해야됨</h1>
<hr>

<div class="wrap">
    <div class="chat other">
        <div class="icon"><i class="fa-solid fa-user"></i></div>
        <div class="textbox">안녕하세요. 반갑습니다.</div>
    </div>
    <div class="chat mine">
        <div class="icon"><i class="fa-solid fa-user"></i></div>
        <div class="textbox">안녕하세요. 그동안 잘 지내셨어요?</div>
    </div>
    <div class="chat other">
        <div class="icon"><i class="fa-solid fa-user"></i></div>
        <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
    </div>
    <div class="chat mine">
        <div class="icon"><i class="fa-solid fa-user"></i></div>
        <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
    </div>
</div>

</body>
</html>
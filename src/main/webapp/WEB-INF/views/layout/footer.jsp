<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
/* footer 이용약관들 밑줄제거 글씨 까만색 */
#footer-text{
	text-decoration: none;
	color: black;
	font-size: 13px;
	text-align: center;
}
/* footer 1:1문의 버튼 */
#footer-report-button{
	margin-left: 5px;
	width: 80px;
	height: 30px;
	border-radius: 5px;
	background-color: rgb(255,83,63);
	border: 0;
	color: white;
}
</style>


<div style="margin-top: 5%;"></div>
<!-- <div style="margin-left: 15%; margin-right: 15%;"> -->
<div id="fooeterStart">
<hr style="margin-bottom: 1em;">

<span style="font-size: 20px; margin-left: 40px; margin-right: 70px;"><strong>고객센터 1111-2222</strong></span>

<span style="margin-left: 100px;">
<span style=" margin-right: 90px;"><a href="/opening" id="footer-text">소개 페이지</a></span>
<span style=" margin-right: 90px;"><a href="/terms/term" id="footer-text">이용 약관</a></span>
<span style=" margin-right: 90px;"><a href="/terms/privacyPolicy" id="footer-text">개인정보처리방침</a></span>
<span style=" margin-right: 90px;"><a href="/terms/locationPolicy" id="footer-text">위치기반서비스 이용약관</a></span>

<span><a href="/admin/customerService" id="footer-text">고객센터</a></span><br><br>
</span>

<div style="margin-left: 40px;">
<div style="font-size: 20px; margin-bottom: 5px;"><strong>상담 시간</strong></div>
<div style="font-size: 12px;">평일 09:00 - 18:00</div>
<div style="font-size: 12px; margin-bottom: 12px;">주말, 공휴일 휴뮤</div>
<div style="clear: both;"><form action="/admin/chat" method="get"><button id="footer-report-button">1:1 문의</button></form></div>
</div>

<span style="float: right; font-size: 10px; color: #ccc; margin-top: -20px; margin-right: 660px;">Copyright ⓒNeedit</span>
</div><!-- .fooeterStart -->


</body>
</html>
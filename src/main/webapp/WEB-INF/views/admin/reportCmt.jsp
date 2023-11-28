<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	
	$('.reportBtn').click(function() {
		$('.reportBtn').css('outline', 'none');
		  
		$(this).css('outline', '2px solid #E8133D');
	});	
	
	
	$("#cmtReportBtn").click(function(event){
	    console.log("댓글 신고버튼 작동!");
	    
	    var button = $(event.relatedTarget); 
	    var cmtNo = button.data("cmtNo");
	    var reportType = $(this).val(); // 수정: $(this)를 사용하는 부분

	    console.log("신고된 댓글번호 :", cmtNo);

	    $.ajax({
	        type: "post",
	        url: "/cmtReport",
	        data: {
	            boardNo: "${param.boardNo}",
	            reportId: "${id}",
	            reportType: reportType,
	            cmtNo: cmtNo
	        },
	        dataType: "json",
	        success: function(res) {
	        	alert("신고가 정상적으로 접수되었습니다.")
	            console.log("AJAX 성공");
	        },
	        error: function() {
	        	alert("신고접수에 실패했습니다.")
	            console.log("AJAX 실패");
	        }
	    });
	});
})

</script>

<style type="text/css">
/* 버튼 크기 */
:root {
  --button-width: 400px;
  --button-height:50px;
}
/* 바깥 div */
#report{
	margin: 0 auto;
	border: 3px solid rgb(255,83,63);
	width: calc(var(--button-width) + 13px);
	height: calc(var(--button-height)*5 + 55px);
	border-radius: 5px; 
}
/* 안쪽 div */
#reportIn{
	margin: 0 3px;
	margin-top: 8px;
}

/* 버튼 스타일 */
#reportBtn1, #reportBtn2{
	border-radius: 5px;
	width: var(--button-width);
	height: var(--button-height);
	border: 0;
	font-size: 25px;
	margin-bottom: 8px;
}
/* 버튼 2번 색깔 */
#reportBtn2{
	background-color: rgb(255,83,63);
	color: white;
}


</style>

</head>
<body>

<div id="report">
	<div id="reportIn">
		<div>
		<input class="reportBtn" id="reportBtn1" type="button" value="광고성" name="reportType">
		</div>
		
		<div>
		<input class="reportBtn" id="reportBtn2" type="button" value="음란물" name="reportType">
		</div>
		
		<div>
		<input class="reportBtn" id="reportBtn1" type="button" value="욕설" name="reportType">
		</div>
		
		<div>
		<input class="reportBtn" id="reportBtn2" type="button" value="불법 정보" name="reportType">
		</div>
		
		<div>
		<input class="reportBtn" id="reportBtn1" type="button" value="개인정보 노출" name="reportType">
		</div>
		
	</div><!-- .reportIn -->
</div><!-- .report -->

</body>
</html>
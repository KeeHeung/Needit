<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
    


    
<script type="text/javascript">
$(() => {
	$("#title").focus()
	$('#content').summernote('fontName', '바탕체');
	$('#content').summernote('fontSize', 16);
	
	$("#content").summernote({
		height: 300,
		toolbar: [
		    // [groupName, [list of button]]
		    // 썸머노트lite로 바꿔야됨~
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['color', ['color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link']],
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	})
	
	
	
})

//썸네일 미리보기
function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function (event) {
        var thumbnailContainer = document.querySelector("#thumbnail_container");
        thumbnailContainer.style.backgroundImage = "url('" + event.target.result + "')";
    };

    reader.readAsDataURL(event.target.files[0]);
}// .setThumbnail() End

//가격란에 문자,높은 금액, 0원 입력 방지
$(document).ready(function() {
    $("#price").on("keyup", function() {
        var checkType = $("#price").val();

        if (isNaN(checkType)) {
            alert("숫자만 입력 가능합니다");
            $("#price").val("");
            $("#price").focus();
        }

        if ( checkType > 999999999) {
            alert("가격은 999,999,999원 보다 높을 수 없습니다.");
            $("#price").val("");
            $("#price").focus();
        }
    
        if ( checkType == 0 ) {
            alert("가격은 0원 보다 높아야 합니다.");
            $("#price").val("");
            $("#price").focus();
        }

    });
});

</script>






<style type="text/css">
	
#thumbnail_container{
    border: 1px solid #ccc;
    width: 200px;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    
}

.note-editor .dropdown-toggle::after { all: unset; }

.note-editor .note-toolbar .note-dropdown-menu, .note-popover .popover-content .note-dropdown-menu {
    font-size: 16px;
    text-align: left;
    min-width: 160px;
}

</style>


<div class="container">



<h1>글 작성</h1>
<hr>

<div class="col-10 mx-auto">
<form action="./write" method="post" enctype="multipart/form-data">

<div class="form-group mb-3">
	<label class="form-label">게시판</label>
	<input type="text" class="form-control" name="menu" id="menu" readonly="readonly" value="${param.menu }">
	<label class="form-label">카테고리</label>
	<input type="text" class="form-control" name="cate" id="cate" readonly="readonly" value="${param.cate }">
	
</div>

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" value="${nick }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="location">지역</label>
	<input type="text" class="form-control" name="location" id="location" value="${addr1 }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="price">가격</label>
	<input type="text" class="form-control" name="price" id="price">
</div>

<div class="form-group mb-3">
   <label class="form-label" for="thumbnailFile">썸네일</label>
   <input type="file" class="form-control form-control-user" name="file" id="thumbnailFile" onchange="setThumbnail(event);"><br>
   <div id="thumbnail_container"></div>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content"></textarea>
</div>


<div class="form-group mb-3">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<button type="reset" class="btn btn-danger" id="btnCancel">취소</button>
</div>

</form>
</div>

</div><!-- .container -->


<c:import url="/WEB-INF/views/layout/footer.jsp" />
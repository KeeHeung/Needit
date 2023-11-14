<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
    
    
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    
<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$("#content").summernote({
		height: 300
	})
})

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function (event) {
        var thumbnailContainer = document.querySelector("#thumnail_container");
        thumbnailContainer.style.backgroundImage = "url('" + event.target.result + "')";
    };

    reader.readAsDataURL(event.target.files[0]);
}



</script>

<style type="text/css">
	
#thumnail_container{
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

</style>


<div class="container">



<h1>글 작성</h1>
<hr>

<div class="col-10 mx-auto">
<form action="./write" method="post" enctype="multipart/form-data">

<div class="form-group mb-3">
	<label class="form-label">게시판</label>
	<input type="text" class="form-control" name="menu" id="menu" readonly="readonly" value="${param.menu }">
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
	<input type="text" class="form-control" name="location" id="location">
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
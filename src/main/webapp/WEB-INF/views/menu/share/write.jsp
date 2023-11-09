<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

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
</script>

</head>
<body>

<h1>글쓰기</h1>
<hr>

<form action="/menu/share/write" method="post" enctype="multipart/form-data">
	
	<label>작성자<input type="hidden" name="writerId" id="writerId" value="">${id}</label><br>
    <label>제목<input type="text" name="title" id="title"></label><br>
    <label>가격<input type="text" name="price" id="price"></label><br>
    <label>파일 첨부<input type="file" name="file" id="file" multiple="multiple"></label><br>
    <label>내용<textarea name="content" id="content"></textarea></label><br><br>
    <input type="hidden" name="menu" id="menu" value="${param.menu }">

    <button type="submit">글 작성</button>
</form>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
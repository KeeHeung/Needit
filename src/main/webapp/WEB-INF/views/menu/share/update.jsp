<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>글 수정 페이지</h1>
<hr>

<form action="/menu/share/update" method="post">
<label>제목<input type="text" name="title" id="title"></label><br>
<label>가격<input type="text" name="price" id="price"></label><br>
<label>파일 첨부<input type="file" name="file" id="file" multiple="multiple"></label><br>
<label>내용<textarea name="content" id="content"></textarea></label><br><br>
<input type="hidden" name="price" id="price">
<input type="hidden" name="price" id="price">

</form>


</body>
</html>
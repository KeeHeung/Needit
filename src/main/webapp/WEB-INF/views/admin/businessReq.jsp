<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/admin/admin.jsp" />

<style>
#AdminBusiness{
	background-color: #ff8108;
	width: 302px;
}
</style>

<!-- 안쪽 내용 -->
<div id="AdminContent">


<table class="table table-striped table-hover table-sm">

<colgroup>
	<col style="width: 10%;">
	<col style="width: 40%;">
	
	<col style="width: 15%;">
	<col style="width: 10%;">
	<col style="width: 20%;">
</colgroup>

<thead>
	<tr class="table-danger">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach var="board" items="${list }">
	<tr>
		<td><input type="checkbox" name="checkRow" value="${board.boardNo }" /></td>
		<td>${board.boardNo }</td>
		<td>
			<a href="./view?boardNo=${board.boardNo }">${board.title }</a>
		</td>
		<td>${board.writerId }</td>
		<td>${board.hit }</td>
		<td>
			<fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd HH:mm:ss"/>		
		</td>
	</tr>
</c:forEach>
</tbody>
</table>

</div><!-- .AdminContent -->


</body>
</html>
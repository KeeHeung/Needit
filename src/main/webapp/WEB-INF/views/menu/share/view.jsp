<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

</head>
<body>

<table class="table table-boardered">

<colgroup>
	<col style="width: 15%;">
	<col style="width: 35%;">
	<col style="width: 15%;">
	<col style="width: 35%;">
</colgroup>

<tr>
	<td class="table-info">글번호</td><td colspan="3">${view.boardNo }</td>
</tr>

<tr>
	<td class="table-info">아이디</td><td>${view.writerId }</td>
</tr>
<tr>
	<td class="table-info">조회수</td><td>${view.hit }</td>
	<td class="table-info">작성일</td><td><fmt:formatDate value="${view.writeDate}" pattern="yyyy-MM-dd" />
</tr>

<tr>
	<td class="table-info">제목</td><td>${view.title }</td>
	<td class="table-info">파일</td>
<tr>
	<td class="table-info">가격</td><td>${view.price}</td>
</tr>
<tr>
	<c:forEach var="file" items="${file }">
	<td><a href="../upload/${file.storedName}" download="${file.originName }">${file.originName }</a></td>
	</c:forEach>
</tr>
<tr>
	<td class="table-info">추천수</td><td id="recommendCount">${recommend}</td>
	<td><c:if test="${isReco eq true }"><div><button id="reco"> 추천하기</button> </div></c:if>
		<c:if test="${isReco eq false }"><div><button id="reco">추천취소</button></div></c:if></td>
</tr>
<tr>
	<td class="table-info" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<div class="content">
			${view.content }
		</div>
	</td>
</tr>
</table>
<a href="/menu/share/update"><button class="btn btn-success mt-2" id="btnUpdate">글 수정</button></a>
<a href="./list" class="btn btn-secondary">목록으로</a>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>

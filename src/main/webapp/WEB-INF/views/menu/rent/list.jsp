<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<c:forEach  var="list" items="${list }" begin="0" end="0">
	<c:if test="${list.menu eq 'm1c1' }">
		<h1>대여게시판 물품</h1>	
	</c:if>
	<c:if test="${list.menu eq 'm1c2' }">
		<h1>대여게시판 인력</h1>	
	</c:if>
	<c:if test="${list.menu eq 'm1c3' }">
		<h1>대여게시판 주현</h1>	
	</c:if>
</c:forEach>
<hr>

<div>
	<table class="table table-striped table-hover table-sm">
	
	<colgroup>
		<col style="width:7%;">
		<col style="width:30%;">
		<col style="width:10%;">
		<col style="width:5%;">
		<col style="width:10%;">
		<col style="width:5%;">
		<col style="width:10%;">
	</colgroup>
	
	<thead>
		<tr class="table-danger">
			<th>글번호</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>조회</th>
			<th>작성일</th>
			<th>가격</th>
			<th>지역</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.boardNo }</td>
			<td>
				<a href="./view?boardNo=${list.boardNo }">${list.title }</a>
			</td>
			<td>${list.writerNick }</td>
			<td>${list.hit}</td>
			<td>
			<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" />
			<fmt:formatDate var="writeDate" value="${list.writeDate }" pattern="yyyyMMdd" />
			<c:choose>
				<c:when test="${writeDate lt curDate }">
					<fmt:formatDate value="${list.writeDate }" pattern="yyyy-MM-dd" />
				</c:when>
				<c:otherwise>
					<fmt:formatDate value="${list.writeDate }" pattern="HH:mm" />
				</c:otherwise>
			</c:choose>				
			</td>
			<td>${list.price }</td>
			<td>${list.location }</td>
		</tr>
	</c:forEach>
	</tbody>
	
	</table>
</div>

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

</div> <!-- .container -->

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />
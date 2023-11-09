<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- HEADER -->
<c:import url="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<h1>상세조회</h1>
<hr>

<div>
${board }
</div>

</div> <!-- .container -->

<!-- FOOTER -->
<c:import url="/WEB-INF/views/layout/footer.jsp" />




<%-- 	<fmt:formatDate var="curDate" value="<%=new Date() %>" pattern="yyyyMMdd" /> --%>
<%-- 	<fmt:formatDate var="writeDate" value="${board.writeDate }" pattern="yyyyMMdd" /> --%>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${writeDate lt curDate }"> --%>
<%-- 			<fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd" /> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 			<fmt:formatDate value="${board.writeDate }" pattern="HH:mm" /> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose>		 --%>
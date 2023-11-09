<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />
    
<style type="text/css">
table, th {
   text-align: center;
}

/* 게시글 제목 */
td:nth-child(2) {
   text-align: left;
}
</style>

<script type="text/javascript">
$(() => {
   $("#btnWrite").click(() => {
      
      location.href = "./write"
      
//       $(location).attr("href", "./write")
      
   })
})
</script>


<div class="container">
<h1>해주세요</h1>
<h1>JOOHYUNLOVE</h1>
<hr>

<table class="table table-striped table-hover table-sm">

<colgroup>
   <col style="width: 10%;">
   <col style="width: 45%;">
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




    <c:set var="menu" value="${item}" />
    <a href="./write?menu=${item.menu}">
        <button id="btnWrite" class="btn btn-primary float-start">글쓰기</button>
    </a>




<small class="float-end mb-3">total : ${paging.totalCount }</small>
<div class="clearfix"></div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/pagination.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
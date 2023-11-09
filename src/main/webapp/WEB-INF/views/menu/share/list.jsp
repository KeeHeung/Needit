<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<style type="text/css">

 .write-container {
    border: 1px solid #ccc;
    border-right: 1px solid #ccc;
}

.write-container select {
    width: 320px;
    height: 30px;
}

.row {
	text-align: center;
}

.write-container {
    height: 380px;
    width: 350px;
    margin: 1em auto; 
    text-align: center; 
}

.col-md-4 {
    margin-right: 30px;
}

</style>

<script type="text/javascript">
$(function(){
  $.ajax({
        type: "get"
        , url: "/menu/share/thumbnail"
        , data: {
		
        }
        , dataType: "json"
        , success: function( res ) {
           console.log("AJAX 성공")
           if (res.fileData.length > 0) {
                var imagePath = res.fileData[0].storedName;
                $("#preview").attr("src", "../upload/" + imagePath);
            }
		
        }
        , error: function() {
           console.log("AJAX 실패")

        }
     })
	
})
</script>


</head>
<body>

<c:forEach items="${list }" var="list" begin="0" end="0">
<c:if test="${ list.menu eq 'm2c1' }">
<h1>나눔 게시판 물품</h1>
</c:if>

<c:if test="${ list.menu eq 'm2c2' }">
<h1>나눔 게시판 인력</h1>
</c:if>

<c:if test="${ list.menu eq 'm2c3' }">
<h1>나눔 게시판 공간</h1>
</c:if>
</c:forEach>
<hr>


<c:forEach items="${list}" var="list" varStatus="loop">
  <c:if test="${loop.index % 3 == 0}">
    <div class="row">
  </c:if>
 	 <div class="write-container col-md-4" >
  		<select>
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  		</select>
  		<div id="preview">
			<img src="../upload/${fileData.storedName }"/>
  		</div>
   		 <a href="/menu/share/view?boardNo=${list.boardNo }">${list.title }</a>
    	<p>${list.writerId }</p>
    	<p>${list.price} ${list.hit}</p>
  </div>
  <c:if test="${loop.index % 3 == 2 || loop.index + 1 == yourList.size()}">
  </div>
  </c:if>
  <br>
</c:forEach>



<c:forEach var="menuData" items="${list}" begin="0" end="0">
<a href="/menu/share/write?menu=${menuData.menu}"><button>글쓰기</button></a>
</c:forEach>

<small class="float-end mb-3">total : ${paging.totalCount }</small>



<c:import url="/WEB-INF/views/layout/pagination.jsp"/>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>

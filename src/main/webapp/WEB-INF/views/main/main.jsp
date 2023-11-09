<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 
crossorigin="anonymous"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
/* 썸네일 */
#MainBannerimg{
	margin: 0 auto;
	border: 1px solid #ccc;
	width: 500px;
	height: 300px;
}

/* 검색 */
#MainSearchDiv{
	text-align: center;
	margin-top: 1em;
}
/* 검색input */
#MainSearch{
	width: 1000px;
	height: 30px;
	border: 1px solid #ccc;
	border-radius: 3px; 
}
/* 검색버튼 */
#MainBtnSearch{
	background-color: inherit;
	border: 0;
}

/* 나눔,대여,업체 div */
#MainRent, #MainShare, #MainBusiness{
	border: 1px solid #ccc;
	width: 1200px;
	height: 300px
}

/* 추천게시글 */
#MainLike{
	border: 1px solid #ccc;
	width: 700px;
	height: 300px;
	float: left;
}

/* 지도 */
#MainMap{
	border: 1px solid #ccc;
	width: 500px;
	height: 300px;
	float: right;
}

</style>

<script type="text/javascript">


</script>


<div id="container">

<!-- 썸네일 -->
<!-- 이미지 불러오기 -->
<%-- <img alt="asd" src="/resources/banner/${모델값(컨트롤러가 보내줌) }"> --%>
<img alt="1" src="/resources/banner/cat1.jpeg143f681e3fb5">
<%-- <img alt="1" src="/resources/banner/${file.storedName }"> --%>

<!-- 저장 경로를 img폴더로 지정, src에 storedname EL문으로 불러오기 -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner" id="MainBannerimg">
    <div class="carousel-item active">
      <img src="/resources/banner/cat1.jpeg143f681e3fb5 }" class="d-block w-500 h-300 m-auto" alt="썸네일1">
    </div>
    <div class="carousel-item">
      <img src="/resources/banner/cat2.jpeg" class="d-block w-500 h-300 m-auto" alt="썸네일2">
    </div>
    <div class="carousel-item">
      <img src="/resources/banner/cat3.jpeg" class="d-block w-500 h-300 m-auto" alt="썸네일3">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div><!-- 썸네일 끝 -->

<!-- 검색 -->
<div id="MainSearchDiv">
	<input type="text" id="MainSearch" value="${param.search }" />
	<button id="MainBtnSearch">🔍</button>
</div><!-- 검색끝 -->
<hr>

<!-- 대여해요 게시글 -->
<div id="MainRent" >
대여해요
</div>
<hr>

<!-- 나눔해요 게시글 -->
<div id="MainShare">
나눔해요
</div>
<hr>

<!-- 니딧 인증 업체 -->
<div id="MainBusiness">
업체
</div>
<hr>

<!-- 인기 게시글(추천수) -->
<div id="MainLike">
게시글
</div>

<!-- 주변 지도 -->
<div id="MainMap">
주변지도
</div>

</div><!-- .container -->
<div style="clear: both;"></div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

/* 전체 박스를 감싸는 DIV 오버레이 설정 */
.wrapMap {
	position: absolute;
	left: 0;bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

/* 전체 박스를 감싸는 DIV의 전체 설정 */
.wrapMap * {
	padding: 0;
	margin: 0;
}

/* 전체 박스 DIV 오버레이 설정 */
.wrapMap .info {
	width: 300px;
	height: 121px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow-x: hidden;
    overflow-y: scroll;
	background: #fff;
    scrollbar-width: thin;
    scrollbar-color: transparent transparent;
   }

/* Webkit 브라우저를 위한 스타일 */
.wrapMap .info::-webkit-scrollbar { width: 12px; }
.wrapMap .info::-webkit-scrollbar-thumb { background-color: transparent; }

/* 박스의 그림자 설정 */
.wrapMap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

/* 주소 부분 오버레이 설정 */
.info .address {
	padding: 2px 0 0 5px;
	height: 30px;
	color: white;
    background: rgb(255 83 63);
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
	overflow: hidden;
  	white-space: nowrap;
  	text-overflow: ellipsis;
  	word-break: break-all;
}

/* 'X'표시 오버레이 설정 */
.info .close {
	position: absolute; 
	z-index: 1; 
	top: 7px;
	right: 7px;
	width: 17px;
	height: 17px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

/* 'X'표시에 마우스를 올렸을 때 설정 */
.info .close:hover { cursor: pointer; }

/* 이미지, desc 를 포함하는 DIV 오버레이 설정 */
.info .body {
	position: relative;
	overflow: hidden;
}

/* 제목, 가격, 링크 부분을 감싸는 desc DIV 스타일 설정 */
.info .desc {
	position: relative; 
	margin: -55px 0 0 90px; 
	height: 75px;
}

/* 제목 스타일 설정 */
.desc .title {
	height: 40px;
    width: 190px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: initial;
}

/* 가격 스타일 설정 */
.desc .price {
	font-size: 12px;
	color: #888;
	margin-top: 0px;
}

/* 썸네일 부분 오버레이 설정 */
.info .img {
	position: relative; 
	top: 6px; 
	left: 5px;
	width: 73px; 
	height: 71px; 
	border: 1px solid #ddd; 
	color: #888; 
	overflow: hidden;
}

/* 썸네일 부분 오버레이 설정 */
.info .img img {
	position: relative; 
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

/* 제목, 가격, 링크 부분 오버레이 설정 */
.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

/* 하이퍼링크 스타일 설정 */
.info .link {color: #5085BB;}

.floating{
	display: none;
}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5f231240cb73d46a6f0aa5b0d4c5e1&libraries=services"></script>
<script>

var map;
var geocoder = new kakao.maps.services.Geocoder();

$(function () {
		
	var mapContainer = $('#map')[0]; // 지도를 표시할 div
	
	// 기본 맵 세팅 --------------------------------------------------------------------------
	if (navigator.geolocation) { // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
		
		navigator.geolocation.getCurrentPosition(function(position) {	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			
			var lat = position.coords.latitude; // 위도
			var lon = position.coords.longitude; // 아래도 는 아니고 경도
			var content = '<div style="padding:5px;">현재 내 위치</div>'; // 인포윈도우에 표시될 내용입니다
			
			// 현재 내 위치로 설정
			var mapOption = { center: new kakao.maps.LatLng(lat, lon), level: 3 }; // 맵 기본 옵션 설정 [center : 중심 좌표 설정, level : 확대 레벨 ]
			
			initMap( $('#map')[0], mapOption )
		}); // function(position) 끝
		
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		
		// 기본 주소 => 학원 좌표
		var mapOption = { center: new kakao.maps.LatLng(37.499181, 127.032789), level: 3 };
		alert('현재 위치가 아닙니다!!!')
		
		initMap( $('#map')[0], mapOption )
		
	}// if (navigator.geolocation) 끝
	
	// ajax로 DB에서 객체(Json) 불러오기
	$(document).ready(function(){
		$.ajax({
			type: "get" // 보내는 데이터가 없기 때문에 get으로 불러오기만 해도됨
			, url: "/map/list" // 맵에 띄울 정보 받아올 mapping
			, data: {}  // 한번에 다 받아 오는거라 데이터 필요없음
			, dataType: "json"
			, async: "false" // 비동기식 호출 => 응답이 모두 완료 된 후 로직 실행
			, success: function( res ){
				console.log("AJAX 성공")
				console.log("받아온 객체 : ", res)
				
				//제이쿼리 배열 관리 메소드 - each()
				// each() 메서드는 매개 변수로 받은 것을 사용해 for in 반복문과 같이 배열이나 객체의 요소를 검사할 수 있는 메서드
 				// $.each(object, function(index, item){});
				$.each(res.board, (idx, val) => {
					console.log(idx, val)
	
					geocoder.addressSearch( val[0].location, ( result, status ) => { // 주소-좌표 변환 객체
						
						// 정상적으로 검색이 완료됐으면
						if (status === kakao.maps.services.Status.OK) {
							var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x) // 마커 생성 위치
								
							var marker = new kakao.maps.Marker({ // KAKAO 마커 생성 객체
								map: map,
								position: markerPosition
							}) // 마커 생성 끝
							
							// 오버레이 DIV 설정
							var $wrap = $('<div class="wrapMap">')
							
							// 모든 정보를 감싸는 DIV
							var $info = $('<div class="info">')
							
							// 마커의 위치가 들어갈 부분
							var $address = $('<div class="address">').text(val[0].location)
							
							// 'X' 닫기 버튼 들어갈 부분 + click fucntion 들어감
							var $close = $('<div class="close" title="닫기" />').click(closeOverlay)
							
							// .img와 .desc를 감싸는 DIV
							var $body = $('<div class="body">')
						
							$wrap.append($info);
							$info.append($address).append($body);
							$address.append($close);
							
						    $info.on('mouseover', function() { // 오버레이에 마우스를 올렸을 때
						    	map.setZoomable(false); // 맵 확대-축소 기능 끄기
								$(this).on('wheel', function (e) {  // 오버레이에서 스크롤 할 때
					                e.preventDefault(); // 기본 스크롤 이벤트 제거
					                var delta = e.originalEvent.deltaY || e.originalEvent.wheelDelta;
					                var direction = delta > 0 ? 1 : -1;
					                var scrollTop = $(this).scrollTop(); // 스크롤 이벤트에 따라 스크롤 위치 변경
					                $(this).scrollTop(scrollTop + direction * 30); // 몰라잉
					            }); // 'wheel' 끝
						    }); // 'mouseover' 끝
						    
					        // info 클래스를 가진 div에 마우스 아웃 이벤트 추가
					        $info.on('mouseout', function () {
					        	map.setZoomable(true);
					            $(this).off('wheel');
					        });
						
							
					$.each(val, (i, v) => { // 같은 주소를 가지는 데이터들의 반복문
						
							var number = Number(v.price); // 가격 저장 변수
							var formattedNumber = number.toLocaleString(); // 가격 format 변수
							
							var link = "https://www.kakaocorp.com/main"
						
							var $content = $('<div class="content"><hr>'); // 제목을 제외한 컨텐츠 들어가는 부분
							var $img = $('<div class="img">'); // 썸네일 들어가는 DIV 부분
							
							// content에 클릭 이벤트를 추가
							$content.on('click', function() {
							    // 링크 이동
							    window.open(link, '_blank');
							});
							
							// 이미지 넣는 부분
							var $imgContent = $('<img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">')
							var $desc = $('<div class="desc">'); // 글제목, 가격, 링크 들어가는 부분을 감싸는 DIV 
							var $title = $('<div class="title">').text(v.title); // 글 제목이 들어갈 부분
							var $price = $('<div class="price">').text(formattedNumber); // 가격이 들어갈 부분
							
							// 글 링크 추가 부분
// 							var $homelink = $('<div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">바로가기</a></div>')
							
							$body.append($content)
							$content.append($img).append($desc)
							$img.append($imgContent)
							$desc.append($title).append($price)
// 							$desc.append($title).append($price).append($homelink)
	
					});// veach펑션 끝
					
							var overlay = new kakao.maps.CustomOverlay({ // KAKAO 커스텀 오버레이 생성 객체
								content: $wrap[0], 
								map: map,
								position: marker.getPosition()
							}); // overlay 생성 끝
							overlay.setMap(null) // 지도에 오버레이 안뜨게 설정
							
							function closeOverlay(content) { // 지도를 닫는 펑션
								console.log('Closing overlay for content:', content);
								overlay.setMap(null); 
					        	map.setZoomable(true);
							} // closeOverlay 끝
							
							kakao.maps.event.addListener(marker, 'click', function(e) { // 마커를 눌렀을 때 지도가 뜨는 펑션
								overlay.setMap(map) 
							}) // click 이벤트 끝
						} // 검색 if문 끝
					}) // geocoder 끝
				})// $.each() 끝

			}// success 끝
			, error: function(){
				console.log("AJAX 실패")
			}
		})
		
	    // Add mousewheel event handler for the overlay content
	    $('.info').on('mousewheel', function (event) {
	        // Calculate the new scroll position
	        var scrollTop = $(this).scrollTop() - (event.deltaY * 30);

	        // Set the new scroll position
	        $(this).scrollTop(scrollTop);

	        // Prevent the default scrolling behavior
	        event.preventDefault();
	    });
		
		
	})// ajax끝
	
	$("#myLoc").on( 'click', function() { moveCenter() }); // #mtLoc 클릭 이벤트 - 내 위치로 이동 펑션
	
}); // jQuery펑션 끝

function initMap( mapContainer, mapOption ) { // map 생성 함수
	map = new kakao.maps.Map( mapContainer, mapOption ); // 지도 생성
	
	var zoomControl = new kakao.maps.ZoomControl(); // 줌컨트롤 객체 생성
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 줌컨트롤 추가 및 배치 위치 설정
} // initMap() 끝

function moveCenter(){ // 현재 내 위치로 이동합니다
	if (navigator.geolocation) { // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		navigator.geolocation.getCurrentPosition(function(position) {	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			
		lat = position.coords.latitude; 
		lon = position.coords.longitude; 
							
		center = new kakao.maps.LatLng(lat, lon)
		
		map.setCenter( center )
		
		}); // function(position) 끝
		
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		// 기본 주소 => 학원 좌표
		center = new kakao.maps.LatLng(37.499181, 127.032789)
		map.setCenter( center )
	
	}// if (navigator.geolocation) 끝
} // moveCenter() 끝

</script>	

<!-- 지도를 담을 DIV  -->
<div id="mapArea" style="position: relative;">
	<div id="map" style="width:100%;height:350px;"></div>
	<img id="myLoc" src="/resources/img/myLocation.png" alt="내위치" style="width: 25px; height:25px; z-index:1; position: absolute; right: 12.5px; bottom: 12.5px">
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />

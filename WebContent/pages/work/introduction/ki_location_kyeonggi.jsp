			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1">찾아오시는 <mark class="cm">길</mark></h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/introduction/ki_intro.do">협회 소개</a></li>
							<li><a href="/introduction/ki_intro.do">대한영양사협회 소개</a></li>
							<li><a href="/introduction/ki_location.do" class="cm">찾아오시는 길</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="tab div5">
						<ul>
							<li><a href="/work/introduction/ki_location.do">중앙회</a></li>
							<li><a href="/work/introduction/ki_location_seoul.do">서울</a></li>
							<li><a href="/work/introduction/ki_location_busan.do">부산</a></li>
							<li><a href="/work/introduction/ki_location_incheon.do" >인천</a></li>
							<li><a href="/work/introduction/ki_location_kyeonggi.do" class="on">경기</a></li>
							<li><a href="/work/introduction/ki_location_kangwon.do">강원특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_chungbuk.do">충청북도</a></li>
							<li><a href="/work/introduction/ki_location_chungnam.do">대전·충남·세종</a></li>
							<li><a href="/work/introduction/ki_location_jeonbuk.do">전북특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_jeonnam.do">광주·전남</a></li>
							<li><a href="/work/introduction/ki_location_kyeongbuk.do">대구·경북</a></li>
							<li><a href="/work/introduction/ki_location_kyeongnam.do">경상남도</a></li>
							<li><a href="/work/introduction/ki_location_ulsan.do">울산</a></li>
							<li><a href="/work/introduction/ki_location_jeju.do">제주특별자치도</a></li>
						</ul>
					</div>
					<div class="area mt30">
						<h4 class="title bold t2 cm s1 i_b_t2">경기</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739870802836" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" title bold s1 t3 i_b_t3 mt40">연락처</h5>
						<ul class="text s1 mt10 ml10">
							<li class="i_box_t1">경기 안양시 만안구 문예로52번길 9, 201호(안양동, 태광빌딩) (우)14035</li>
							<li class="i_box_t1 mt5">TEL : 031-468-9417</li>
							<li class="i_box_t1 mt5">FAX : 031-448-9890 </li>
						</ul>
					</div>
				</div>
			</div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1739870802836",
		"key" : "2n3uj",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '37.3858991';
var g_lng = '126.9335643';
var geocoder;
var map;
var marker,makerMe,flightPath;
var reqAddress = ''
var reqLatLng = '';
function initialize(){ //초기화
	geocoder = new google.maps.Geocoder();
	var mapOptions = {
		zoom: 16,
		center: new google.maps.LatLng(g_lat, g_lng),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map_canvas'),mapOptions);
	marker = new google.maps.Marker({
			position: map.getCenter(),
			'map': map,
			title:"오더애드",
	});

}
initialize();
</script> -->
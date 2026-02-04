			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1">찾아오시는 <mark class="cm">길</mark></h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
							<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
							<li><a href="/work/introduction/ki_location.do" class="cm">찾아오시는 길</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="tab_2 div5">

						<ul>
							<li><a href="/work/introduction/ki_location.do">중앙회</a></li>
							<li><a href="/work/introduction/ki_location_seoul.do">서울</a></li>
							<li><a href="/work/introduction/ki_location_busan.do">부산</a></li>
							<li><a href="/work/introduction/ki_location_incheon.do" >인천</a></li>
							<li><a href="/work/introduction/ki_location_kyeonggi.do">경기</a></li>
							<li><a href="/work/introduction/ki_location_kangwon.do">강원특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_chungbuk.do">충청북도</a></li>
							<li><a href="/work/introduction/ki_location_chungnam.do">대전·충남·세종</a></li>
							<li><a href="/work/introduction/ki_location_jeonbuk.do">전북특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_jeonnam.do" class="on">광주·전남</a></li>
							<li><a href="/work/introduction/ki_location_kyeongbuk.do">대구·경북</a></li>
							<li><a href="/work/introduction/ki_location_kyeongnam.do">경상남도</a></li>
							<li><a href="/work/introduction/ki_location_ulsan.do">울산</a></li>
							<li><a href="/work/introduction/ki_location_jeju.do">제주특별자치도</a></li>
						</ul>
					</div>
					<div class="area mt30">
						<h4 class="title bold t2 cm s1 i_b_t2">광주·전남</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739871191988" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">연락처</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">광주광역시 서구 대남대로 420번길 3, 2층 (우)61931</li>
							<li class="i_box_t1 mt5">TEL : 062-364-6773</li>
							<li class="i_box_t1 mt5">FAX : 062-364-6772 </li>
						</ul>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">본협회에 찾아오시는 방법</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">지하철 이용시 : 1 호선 → 농성역 1 번 출구 → 하차후 도보로 10 분 소요 </li>
							<li class="i_box_t1 mt5">시내버스 이용시 
									</li>
									<li class="i_b_t7">건강협회 하차 : 지원25, 송암73, 수완12, 지원56</li>
									<li class="i_b_t7">농성파출소 하차 : 금남59, 풍암61, 매월61, 송암74(하차후 도보로 5분 소요)</li>
									<li class="i_b_t7">서구청 하차 : 송정19, 송암68, 금호36, 봉선37, 문흥39, 송암72, 나주160(하차후 도보로 5분 소요)</li>
							
							<li class="i_box_t1 mt5">공항 이용시
									</li><li class="i_b_t7">택시 : 약 20~30 분 소요</li>
									<li class="i_b_t7">시내버스 : 5, 6, 60, 160, 555 ( 공항입구에서 승차 → 서구청에서 하차 )</li>
							
							<li class="i_box_t1 mt5">기차 이용시
									</li><li class="i_b_t7">택시 : 약 20 분 소요</li>
									<li class="i_b_t7">시내버스 : 32 ( 서구청에서 하차 ) 29 ( 상공회의소에서 하차후 도보로 10 분 소요 )</li>
							
							<li class="i_box_t1 mt5">고속버스터미널 이용시
									</li><li class="i_b_t7">택시 : 약 5~10 분 소요</li>
									<li class="i_b_t7">시내버스 : 20, 28, 385 ( 서구청에서 하차 )</li>
							
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
		"timestamp" : "1739871191988",
		"key" : "2n3uq",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '35.148424';
var g_lng = '126.888825';
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
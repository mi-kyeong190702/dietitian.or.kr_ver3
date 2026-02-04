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
							<li><a href="/work/introduction/ki_location_incheon.do"  class="on">인천</a></li>
							<li><a href="/work/introduction/ki_location_kyeonggi.do">경기</a></li>
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
						<h4 class="title bold t2 cm s1 i_b_t2">인천</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739870739172" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">연락처</h5>
						<ul class="text small s1 mt10 ml10">
							<li class="i_box_t1">인천시 남동구 정각로 18, 504호(구월동, 뉴센타빌딩) (우)21557</li>
							<li class="i_box_t1 mt5">TEL : 032-435-5990</li>
							<li class="i_box_t1 mt5">FAX : 032-432-5199 </li>
						</ul>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">본 협회에 찾아오시는 방법</h5>
						<ul class="text small s1 mt10 ml10">
							<li class="i_box_t1">지하철 이용 (도보 3분 소요) : 경인선 부평역(환승역)에서 인천지하철 동막행으로 환승하여 인천시청역에서 하차 5번 출구</li>
							<li class="i_box_t1 mt5">버스 이용시 (도보 5분 소요) : 시청 앞에서 하차 하여 41, 45, 77 </li>
							<li class="i_box_t1 mt5">승용차 이용시</li>
									<li class="i_b_t7"><mark class="bold cm">경인고속도로</mark> : 도화IC → 주안역 → 시민공원 → 석바위 → 인천시청과 교육청 맞은편 스테이크하우스 건물 3층</li>
									<li class="i_b_t7"><mark class="bold cm">제2경인고속도로</mark> : 남동IC에서 남동경찰서 경유 → 인천시청과 교육청 맞은편 스테이크하우스 건물 3층</li>
									<li class="i_b_t7"><mark class="bold cm">서울외곽순환고속도로</mark> : 안현분기점 → 제2경인고속도로 → 남동IC → 인천시청과 교육청 맞은편 스테이크하우스 건물 3층</li>
									<li class="i_b_t7"><mark class="bold cm">서해안고속도로</mark> : 서창IC → 제2경인고속도로 → 남동IC → 인천시청과 교육청 맞은편 스테이크하우스 건물 3층</li>
							
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
		"timestamp" : "1739870739172",
		"key" : "2n3ug",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '37.4547436';
var g_lng = '126.7038321';
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
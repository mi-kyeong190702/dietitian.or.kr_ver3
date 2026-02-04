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
							<li><a href="/work/introduction/ki_location_jeonbuk.do" class="on">전북특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_jeonnam.do">광주·전남</a></li>
							<li><a href="/work/introduction/ki_location_kyeongbuk.do">대구·경북</a></li>
							<li><a href="/work/introduction/ki_location_kyeongnam.do">경상남도</a></li>
							<li><a href="/work/introduction/ki_location_ulsan.do">울산</a></li>
							<li><a href="/work/introduction/ki_location_jeju.do">제주특별자치도</a></li>
						</ul>
					</div>
					<div class="area mt30">
						<h4 class="title bold t2 cm s1 i_b_t2">전북특별자치도</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739871124238" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">연락처</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">전북특별자치도 전주시 완산구 효자로 194, 312호(효자동 3가, 로자벨시티) (우)54969</li>
							<li class="i_box_t1 mt5">TEL : 063-272-0175</li>
							<li class="i_box_t1 mt5">FAX : 063-255-1811</li>
						</ul>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">본협회에 찾아오시는 방법</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">도청 정문 바로 맞은편 사거리 롯데마트(전주점) 방면에서 도보로 7분 거리</li>
							<li class="i_box_t1">시내버스 이용시 :  전주대학교 경유 버스 하차 61(홍산로 전북도청) 6, 72, 165, 385(효자로 전북도청) </li>
							<li class="i_box_t1 mt5">기차 이용 시 : 홈플러스→ 전북대학교→ 덕진소방서→ 전주 종합경기장→ 롯데백화점→ 한일고등학교→우미린, 호반베르움아파트<br/><span class="ml70"></span>
								→ 전라북도 지방경찰청→ KBS전주 방송총국 직진→ 로자벨시티3층
							</li>
							<li class="i_box_t1 mt5">고속버스, 시외버스터미널 이용시 : 택시(4km) 로 터미널에서 10분 정도 소요</li>
							<li class="i_box_t1 mt5">자가용 이용시 : 전주 톨게이트→ 반월교차로에서 월드컵경기장→ 덕진경찰서→ 서곡방향(썬플라워)→ 기전여자 중,고등학교<br/><span class="ml80"></span>→ 
								전라북도 지방경찰청→ KBS전주 방송총국 직진→ 로자벨시티3층
							</li>
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
		"timestamp" : "1739871124238",
		"key" : "2n3up",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '35.1516601';
var g_lng = '126.8889401';
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
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
							<li><a href="/work/introduction/ki_location_incheon.do">인천</a></li>
							<li><a href="/work/introduction/ki_location_kyeonggi.do">경기</a></li>
							<li><a href="/work/introduction/ki_location_kangwon.do">강원특별자치도</a></li>
							<li><a href="/work/introduction/ki_location_chungbuk.do" class="on">충청북도</a></li>
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
						<h4 class="title bold t2 cm s1 i_b_t2">충청북도</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739870977694" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">연락처</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">충청북도 청주시 청원구 공항로 8, 2층(내덕동177-1)(우)28494</li>
							<li class="i_box_t1 mt5">TEL : 043-268-4798</li>
							<li class="i_box_t1 mt5">FAX : 043-266-0166</li>
						</ul>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">본 협회에 찾아오시는 방법</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1 mt5">시내버스 이용시
								<ol class="small  s1 m5 mb20 liststyle in decimal">
									<li>밤고개 정류장(신화아파트방면) 하차 후 도보 3분: 407,713,711,211,712,715,719,720,914</li>
									<li>문화제조창.시청임시청사 정류장(밤고개방면) 하차 후 도보 6분:747,109,407,813,713,711,111</li>
								</ol>
							</li>
							
							<li class="i_box_t1 mt5">고속/시외버스터미널 이용시
								<ol class="small  s1 m5 mb20 liststyle in decimal">
									<li>청주시외/고속버스터미널(가경동) 하차
										<ul class="ml25">
											<li class="i_b_t7">택시 이용 시: 내덕7거리 오창방면 SK방고개주유소 앞에서 하차(32분 소요)</li>
											<li class="i_b_t7">버스 이용 시: 시외버스터미널(가경세원3차아파트 방면) 정류장에서 급행버스(747,109) 승차→ 문화제조창.시청임시청사 하차(38분 소요)</li>
										</ul>
									</li>
									<li>청주여객북부정류소(청주대정류소) 하차
										<ul class="ml25">
											<li class="i_b_t7">버스 이용 시: 청원구청(문화제조창방면) 정류장에서 813번 승차 → 문화제조창.시청임시청사 하차(10분 소요)</li>
										</ul>	
									</li>
								</ol>
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
		"timestamp" : "1739870977694",
		"key" : "2n3un",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '36.651322'; //'36.6437261';  
var g_lng = '127.489128'; //'127.4901265';
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
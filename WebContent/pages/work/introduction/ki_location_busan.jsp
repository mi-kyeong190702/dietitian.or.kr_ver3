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
							<li><a href="/work/introduction/ki_location_busan.do" class="on">부산</a></li>
							<li><a href="/work/introduction/ki_location_incheon.do">인천</a></li>
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
						<h4 class="title bold t2 cm s1 i_b_t2">부산</h4>
						<div class="box t2 mt10 p10">
							<div class="box p10">
								<!-- <div id="map_canvas" class="h350"></div> -->
								<div id="daumRoughmapContainer1739870656350" class="root_daum_roughmap root_daum_roughmap_landing"></div>
							</div>
						</div>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">연락처</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">부산광역시 동래구 명륜로 69 경보이리스힐 상가 9층 (우)47818</li>
							<li class="i_box_t1 mt5">TEL : 051-634-7640</li>
							<li class="i_box_t1 mt5">FAX : 051-631-6136</li>
						</ul>
						<h5 class=" text middle bold cg_1 t3 i_b_t2_2 mt30">본 협회에 찾아오시는 방법</h5>
						<ul class="text s1 small mt10 ml10">
							<li class="i_box_t1">도시철도 4호선 수안역 4번출구에서 전방 70m 위치</li>
							<li class="i_box_t1 mt5">버스이용 : '동래시장' 혹은 '동래메가마트'에 하차하는 버스를 타시면 됩니다.(버스하차 후 '동래경찰서'를 찾으세요)</li>
							<li class="i_box_t1 mt5">부산역
								
									</li><li class="i_b_t7">지하철 타고 오실 때 :<br> 도시철도 1호선 노포동방면을 타고 동래역에서 4호선 안평방면으로 환승하여 수안역에서 하차, <br>4번출구에서 전방 70m 정도 오면 부산은행 옆 새건물이 경보이리스힐(1층 커피숍 "거기"가 있는 건물)<br>(소요시간 : 40-50분 예상, 걷는 시간 때문에 1시간 소요될 수도 있음)
									</li>
									<li class="i_b_t7">택시 타고 오실 때 :<br>목적지는 동래경찰서 정문 건너편 경보이리스힐아파트상가라고 말하면 됩니다.<br>(택시요금 : 10,000원 정도 예상)</li>
							
							
							<li class="i_box_t1 mt5">노포동 시외버스터미널 : 도시철도 1호선 서면방면을 타시고 동래역에서 4호선 안평방면으로 환승하여 수안역에서 내리세요.<br>(4번출구에서 전방 70m에 위치, 소요시간 : 40분 예상)</li>
							<li class="i_box_t1 mt5">김해공항 : 대중교통이 복잡하므로 택시를 타시고 동래경찰서 정문 건너편 경보이리스힐상가로 가자고 하세요.</li>
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
		"timestamp" : "1739870656350",
		"key" : "2n3uf",
		"mapWidth" : "700",
		"mapHeight" : "360"
	}).render();
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=true"></script>
<script>
var g_lat = '35.2002437';
var g_lng = '129.0838878';
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
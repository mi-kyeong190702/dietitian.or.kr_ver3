<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var defaultClass = "";
	
	$(document).ready(function(){
		
	
		$('.btn_map').bind('mouseover',function(e){
			$('#mk_on').removeClass();
			$('#mk_on').addClass($(this).attr('alt'));
		});
		$('.btn_map').bind('mouseout',function(e){
			$('#mk_on').removeClass();
			$('#mk_on').addClass(defaultClass);
		});
		
		$('#sh_1').on('change',function(e){
			
			var param = 'mode=train';
			var val = $(this).val();
			$.ajax({
				type:"POST",
				url:"/bbs/ajax_train.php",
				dataType:"json",
				data:param + '&val='+val,
				success: function(res){
					switch(res.res){
						case "1" :
							$('#sh_2').html(res.html);
							break;
						case "err" : alert(res.msg); break;
					}
				}
			});
		});
		
	});

	function go_sd_popup1() {
			$('#sd_popup1').bPopup();
	};
	function go_sd_popup2() {
			$('#sd_popup2').bPopup();
	};
	function go_sd_popup3() {
			$('#sd_popup3').bPopup();
	};
	function go_sd_popup4() {
			$('#sd_popup4').bPopup();
	};
	function go_sd_popup5() {
			$('#sd_popup5').bPopup();
	};
	function go_sd_popup6() {
			$('#sd_popup6').bPopup();
	};
	function go_sd_popup7() {
			$('#sd_popup7').bPopup();
	};
	function go_sd_popup8() {
			$('#sd_popup8').bPopup();
	};
	function go_sd_popup9() {
			$('#sd_popup9').bPopup();
	};
	function go_sd_popup10() {
			$('#sd_popup10').bPopup();
	};
	function go_sd_popup11() {
			$('#sd_popup11').bPopup();
	};
	function go_sd_popup12() {
			$('#sd_popup12').bPopup();
	};
	function go_sd_popup13() {
			$('#sd_popup13').bPopup();
	};
</script>

<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">시도</mark>영양사회</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
							<li><a href="/work/news/kn_area_main.do" class="cm">시도영양사회</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t2 mb10 p20">
						<div class="area mt5 text small">
							지도를 <mark class="cm">클릭</mark>하시면 해당지역의 상세정보를 보실 수 있습니다.
						</div>
					</div>
					<div class="text s1">
						<div class="km_area mt50 mr200">
							<div class="mk_link">
								<img src="/images/sub/km_link.png" width="310" height="440" usemap="#Map" border="0" />
								<map name="Map" id="Map">
									<area shape="poly" coords="64,44,72,41,77,38,81,38,84,41,86,44,88,47,92,48,96,48,98,51,100,54,103,58,104,58,108,61,113,63,115,65,118,68,119,72,116,77,115,81,115,89,116,91,118,94,124,97,132,105,133,110,133,116,131,123,130,130,125,137,119,144,113,147,108,149,102,155,94,159,88,158,83,156,78,159,71,161,65,160,60,157,58,154,57,148,51,141,46,135,43,134,38,133,35,128,38,124,43,121,44,121,48,124,53,121,57,116,59,114,63,116,66,115,70,114,75,117,78,118,81,116,85,114,86,110,91,105,91,103,90,100,89,99,85,101,83,101,82,98,83,94,81,92,79,91,76,89,74,91,72,94,69,93,66,97,65,101,62,103,59,103,52,97,48,96,45,97,43,99,39,97,31,93,27,88,28,84,32,79,35,78,38,80,42,82,45,84,51,80,55,76,55,72,53,69,51,67,54,64,59,63,63,60,66,56,64,53,61,49,63,44" onclick="go_sd_popup1()" href="#" class="btn_map" alt="km_a_kyeongi" />
									<area shape="poly" coords="60,105,60,112,62,115,65,116,70,115,71,115,75,117,78,119,81,115,84,112,85,110,87,109,90,106,92,102,89,99,86,99,82,100,82,96,82,94,80,91,76,89,74,90,71,95,67,98,64,100,61,103" onclick="go_sd_popup2()" href="#" class="btn_map" alt="km_a_seoul" />
									<area shape="poly" coords="43,99,48,97,51,97,53,99,56,102,58,105,60,109,59,112,58,114,55,117,53,121,49,123,47,121,44,120,46,114,47,110,46,105,43,100" onclick="go_sd_popup3()" href="#" class="btn_map" alt="km_a_incheon" />
									<area shape="poly" coords="82,36,89,32,95,32,102,30,113,30,131,31,143,31,152,31,158,28,162,25,165,21,167,17,168,13,171,8,175,5,191,45,199,58,215,78,226,93,230,97,234,108,239,120,243,128,246,134,248,136,242,138,238,141,236,143,230,143,221,142,211,142,201,145,194,144,191,143,185,142,179,140,173,136,164,131,156,130,151,130,145,131,142,135,135,137,129,134,132,125,133,113,133,107,129,101,126,98,121,95,116,91,115,83,116,76,119,71,118,67,113,62,108,61,105,58,103,58,101,53,95,48,92,48,88,46" onclick="go_sd_popup4()" href="#" class="btn_map" alt="km_a_kangwon" />
									<area shape="poly" coords="128,135,123,139,120,143,116,145,112,148,108,150,104,154,97,158,93,160,95,165,99,170,100,172,98,178,98,184,99,193,104,202,110,205,112,205,113,206,116,210,116,212,114,219,113,221,117,226,121,231,123,236,129,241,136,241,143,238,147,233,150,228,151,226,143,220,140,213,139,205,140,193,139,184,140,180,147,174,154,170,166,165,171,166,175,168,180,167,181,165,181,162,181,159,183,155,189,154,193,149,197,147,197,145,187,143,179,141,175,138,168,134,162,130,152,130,145,132,141,135,137,137" onclick="go_sd_popup5()" href="#" class="btn_map" alt="km_a_chungbuk" />
									<area shape="poly" coords="249,137,242,139,240,143,239,145,231,144,222,144,209,144,201,145,193,150,191,155,184,156,182,160,181,165,176,167,171,167,163,166,148,174,141,180,139,185,140,190,140,199,139,207,140,213,144,218,148,223,149,225,149,232,148,235,145,239,143,240,143,250,142,257,145,259,151,261,155,265,158,270,166,277,170,279,179,280,186,280,194,280,201,278,210,278,216,276,221,276,226,279,231,275,237,274,241,274,250,275,255,274,260,274,261,274,261,262,262,257,264,248,266,241,267,236,268,232,265,233,262,236,259,238,254,238,252,235,255,221,257,192,255,167,249,138" onclick="go_sd_popup6()" href="#" class="btn_map" alt="km_a_daegu" />
									<area shape="poly" coords="43,246,44,250,48,254,53,256,53,259,53,262,50,265,46,267,43,269,40,272,38,277,36,280,41,280,43,282,43,284,42,287,39,290,36,292,33,296,33,297,37,301,41,302,44,302,51,299,56,295,60,294,69,293,75,295,80,298,86,302,95,306,101,307,105,305,108,303,115,305,118,306,124,305,127,298,126,288,124,280,126,273,128,265,133,260,140,256,141,251,142,245,142,240,141,238,135,241,130,241,126,240,123,235,121,232,121,238,118,243,113,245,107,246,102,244,96,240,92,238,85,237,82,237,76,235,73,233,68,233,66,237,62,241,55,244,50,245,47,245" onclick="go_sd_popup7()" href="#" class="btn_map" alt="km_a_jeonbuk" />
									<area shape="poly" coords="141,254,137,258,133,261,129,265,127,269,125,274,125,280,124,283,125,285,126,289,126,294,126,297,125,303,122,306,119,307,120,314,124,322,124,327,126,330,133,338,139,339,145,336,147,334,152,334,154,335,156,338,157,342,161,342,167,341,172,343,179,342,181,339,182,332,184,329,190,326,194,325,195,328,198,326,198,324,197,320,200,318,204,320,208,324,211,326,213,323,210,319,212,315,218,312,224,308,229,305,232,302,237,298,239,295,234,290,232,289,227,288,223,287,223,285,225,281,226,278,224,276,221,274,217,274,214,275,211,277,207,277,204,279,203,279,194,279,187,279,169,278,164,276,161,271,159,268,156,265,154,262,148,261,145,259,142,256" onclick="go_sd_popup8()" href="#" class="btn_map" alt="km_a_kyeongnam" />
									<area shape="poly" coords="260,273,259,285,256,291,251,296,247,299,241,296,236,292,232,288,227,288,223,287,223,284,225,282,226,279,226,277,228,275,232,274,237,273,239,272,244,275,248,276,250,274,254,274" onclick="go_sd_popup9()" href="#" class="btn_map" alt="km_a_ulsan" />
									<area shape="poly" coords="211,315,211,320,212,322,214,323,214,326,218,325,220,324,222,323,224,321,226,322,230,322,232,321,234,319,235,317,238,314,239,312,244,310,245,308,246,303,246,300,240,297,234,300,232,304,226,307,218,311,217,312" onclick="go_sd_popup10()" href="#" class="btn_map" alt="km_a_busan" />
									<area shape="poly" coords="71,405,63,406,56,407,52,409,47,414,41,417,39,421,37,425,40,429,43,433,52,434,63,432,78,427,85,424,91,418,93,412,92,406,89,404,79,402,71,406" onclick="go_sd_popup11()" href="#" class="btn_map" alt="km_a_jeju" />
									<area shape="poly" coords="69,162,62,160,58,155,51,153,47,150,40,148,35,148,32,150,29,153,28,155,26,158,28,161,29,163,28,165,25,166,21,169,19,169,13,169,9,172,8,176,10,179,14,181,20,183,25,185,31,189,34,192,34,195,36,205,37,209,39,211,41,214,41,219,41,222,40,228,41,232,43,234,44,236,45,238,47,241,47,242,45,245,52,245,57,243,63,240,67,237,70,234,75,233,78,236,88,239,93,239,96,241,100,244,106,246,117,244,118,242,121,238,121,233,120,228,116,222,116,216,116,212,115,207,108,203,103,200,99,191,98,181,101,173,97,167,94,163,93,159,89,158,85,156,82,156,78,159" onclick="go_sd_popup12()" href="#" class="btn_map" alt="km_a_chungnam" />
									<area shape="poly" coords="33,298,26,310,24,317,26,319,28,322,28,323,29,326,29,328,29,332,28,335,26,341,26,344,25,349,25,354,26,356,26,359,24,361,21,363,22,366,24,369,25,372,26,376,32,378,34,381,35,382,35,386,36,392,40,395,43,394,45,391,49,387,54,384,56,379,58,375,62,375,62,382,63,385,66,383,73,377,75,371,78,367,84,363,92,361,95,360,99,363,97,366,93,366,91,369,88,373,85,375,85,379,91,380,94,381,97,383,98,384,102,382,105,379,106,374,110,372,111,370,108,365,104,361,104,357,104,353,107,352,112,350,115,350,118,355,119,358,117,363,119,367,122,364,125,359,128,358,132,358,132,352,132,349,127,348,123,348,123,345,126,341,130,340,133,339,125,329,124,323,120,316,119,308,118,306,111,304,109,304,103,307,100,307,91,304,81,301,78,298,70,293,63,293,56,296,49,299,44,302,39,302" onclick="go_sd_popup13()" href="#" class="btn_map" alt="km_a_jeonnam" />
								</map>
							</div>
							<div id="mk_on" class=""></div>
							<div class="mk_img"><img src="/images/sub/km_area.png" width="310" height="440" border="0" /></div>
						</div>
					</div>
				</div>
			</div>

			<!--지역별 정보 레이어팝업-->
			<div id="sd_popup2" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">서울특별시영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 김우정</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과, 6개 분회</li>
								<li><mark class="bold cb">주 소</mark>  : 서울특별시 영등포구 도영로7길 15, 106동 806호<br/><span class="ml30"></span>(도림동, 쌍용플래티넘시티1단지) (우)07372</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 02)3289-7200 / 팩스 02)3289-7201</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdas29@hanmail.net">kdas29@hanmail.net</a></li>
								<!-- <li><mark class="bold cb">홈페이지</mark>  : <a href="http://www.seoulkda.or.kr" target="_blank">www.seoulkda.or.kr</a></li> -->
							</ul>
							<div class="btn_wrap mt20">
								<ul>
									<li><a href="/work/news/kn_area_notice.do?bbs_board_code=69" class="btn t1 big wide">공지사항 바로가기</a></li>
									<li><a href="/work/news/kn_area_board.do?bbs_board_code=36" class="btn t2 big wide">게시판 바로가기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup10" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">부산광역시영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 최미옥</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 부산광역시 동래구 명륜로 69, 9층<br/><span class="ml30"></span>(수안동, 경보이리스힐 상가) (우)47818</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 051)634-7640 / 팩스 051)631-6136</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdabs333@hanmail.net">kdabs333@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=70" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=37" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup3" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">인천광역시영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 이옥주</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 인천시 남동구 정각로 18, 504호(구월동, 뉴센타빌딩) (우)21557</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 032)435-5990 / 팩스 032)432-5199</li>
								<!-- 2022.04.18 인천지부 메일계정 변경 -->
								<!-- <li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:incho599@unitel.co.kr">incho599@unitel.co.kr</a></li> -->
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdaic@naver.com">kdaic@naver.com</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=71" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=38" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup1" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">경기도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 임은주</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과, 9개 분회</li>
								<li><mark class="bold cb">주 소</mark>  : 경기 안양시 만안구 문예로52번길 9, 201호 (안양동, 태광빌딩)<br /> <span class="ml30"></span>(우)14035</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 031)468-9417 / 팩스 031)448-9890, 031) 468-9417</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdakg@hanmail.net">kdakg@hanmail.net</a></li>
							</ul>
							<div class="btn_wrap mt20">
								<ul>
									<li><a href="/work/news/kn_area_notice.do?bbs_board_code=72" class="btn t1 big wide">공지사항 바로가기</a></li>
									<li><a href="/work/news/kn_area_board.do?bbs_board_code=39" class="btn t2 big wide">게시판 바로가기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup4" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">강원특별자치도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 박란희</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 강원특별자치도 춘천시 경춘로 2357, 2층(온의동, 새마을금고연합회) <br/><span class="ml30"></span>(우)24435</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 033)251-7576 / 팩스 033) 251-7579</li>
								<!-- 2022.04.13 강원지부 메일계정 변경 -->
								<!-- <li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kda123@unitel.co.kr">kda123@unitel.co.kr</a></li> -->
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:gwd-kda@naver.com">gwd-kda@naver.com</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=73" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=40" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup5" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">충청북도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 이정숙</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과, 1개 분회</li>
								<li><mark class="bold cb">주 소</mark>  : 충청북도 청주시 청원구 공항로 8, 2층(내덕동 177-1)<br/><span class="ml30"></span>(우)28505</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 043)268-4798 / 팩스 043)266-0166</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:cbdietitian@naver.com">cbdietitian@naver.com</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=74" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=41" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup12" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">대전·충남·세종영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 강하이</li>
								<li><mark class="bold cb">조 직</mark>  : 7개 분과, 1개 분회</li>
								<li><mark class="bold cb">주 소</mark>  : 대전시 중구 대종로 471, 416호(대흥동, 대전가톨릭문화사무실) <br/><span class="ml30"></span>(우)34915</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 042)252-4346 / 팩스 042)252-9110</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdatj22@daum.net">kdatj22@daum.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=75" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=42" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup7" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">전북특별자치도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 배정숙</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 전북특별자치도 전주시 완산구 효자로 194, 312호 <br/><span class="ml30"></span>(효자동 3가, 로자벨시티) (우)54969</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 063)272-0175 / 팩스 063)255-1811</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdajb@hanmail.net">kdajb@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=76" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=43" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup13" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">광주·전남영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 황미리</li>
								<li><mark class="bold cb">조 직</mark>  : 7개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 광주광역시 서구 대남대로 420번길 3, 2층 (우)61931</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 062)364-6773 / 팩스 062)364-6772</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdakj@hanmail.net">kdakj@hanmail.net</a></li>
								<li><mark class="bold cb">홈페이지</mark>  : <a href="http://www.kdakj.net">http://www.kdakj.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=77" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=44" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup6" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">대구·경북영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 권미경</li>
								<li><mark class="bold cb">조 직</mark>  : 7개 분과, 4개 분회</li>
								<li><mark class="bold cb">주 소</mark>  : 대구광역시 중구 대봉로 260, 108동 1901호<br/><span class="ml30"></span>(대봉동, 센트로팰리스아파트) (우)41950</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 053)563-6066 / 팩스 053)563-6466</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdadk@hanmail.net">kdadk@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=78" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=45" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup8" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">경상남도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 김영숙</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 경상남도 창원시 성산구 중앙대로 111, 709호<br/><span class="ml30"></span>(중앙동, 평화오피스텔) (우)51515</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 055)268-6846 / 팩스 055)268-6847</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:kdakn@hanmail.net">kdakn@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=79" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=46" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup9" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">울산광역시영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 정미경</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 울산광역시 남구 거마로5, 3층(옥동) (우)44648</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 052)258-6069 / 팩스 052)275-2823</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:ukda@hanmail.net">ukda@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=80" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=47" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sd_popup11" class="popup_box">
				<span class="popup_btn">X</span>
				<div class="popup_wrap_1 center">
					<div class="area text s1 left mb20">
						<h1 class="title t4 bold i_b_t6">제주특별자치도영양사회</h1>
						<div class="box t3 ssmall ca mt20 line bt p10 cm">
							<ul>
								<li><mark class="bold cb">회 장</mark> : 오순자</li>
								<li><mark class="bold cb">조 직</mark>  : 5개 분과</li>
								<li><mark class="bold cb">주 소</mark>  : 제주특별자치도 제주시 선덕로 23, 제주웰컴센터 지하1층 <br/><span class="ml30"></span>(우)63122</li>
								<li><mark class="bold cb">연 락 처</mark>  : 전화 064)721-9062 / 팩스 064)711-9063</li>
								<li><mark class="bold cb">이 메 일</mark>  : <a href="mailto:2jejukda@hanmail.net">2jejukda@hanmail.net</a></li>
							</ul>
								<div class="btn_wrap mt20">
									<ul>
										<li><a href="/work/news/kn_area_notice.do?bbs_board_code=81" class="btn t1 big wide">공지사항 바로가기</a></li>
										<li><a href="/work/news/kn_area_board.do?bbs_board_code=48" class="btn t2 big wide">게시판 바로가기</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>

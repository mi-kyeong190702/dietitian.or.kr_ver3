	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
		<meta name="robots" content="index,follow">
		<title>영양사 실태신고센터</title>	
		<link rel="stylesheet" href="/css/research_common.css">
		<link rel="stylesheet" href="/css/research_layout.css">
		<link rel="stylesheet" href="/css/jquery.simplyscroll.css" media="all" type="text/css">
		
		<link rel="shortcut icon" href="/css/favicon.ico" />	
	    
	    <script src="/js/jquery-1.11.2.min.js"></script>
		<script src="/js/html5.js"></script>
		<script src="/js/dietitan.js"></script>
		<script src="/js/jquery.bpopup.min.js"></script>
		<script src="/js/placeholders.min.js"></script>
		
		<script type="text/javascript">
	
		
		function change(form)
		{
		if (form.url.selectedIndex !=0)
		parent.location = form.url.options[form.url.selectedIndex].value
		}
		function setCookie( name, value, expiredays )
		{
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		function getCookie( name )
		{
		var nameOfCookie = name + "=";
		var x = 0;
		while ( x <= document.cookie.length )
		{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
		if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
		endOfCookie = document.cookie.length;
		return unescape( document.cookie.substring( y, endOfCookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
		break;
		}
		return "";
		} 
						if ( getCookie( "Notice" ) != "done" )
						{
						//notice1Window = window.open('/assets/ver2/popup/popup_20190201.html','notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=580px,height=490px,top=180px,left=600px');
							
						noticeWindow = window.open('/assets/ver2/popup/popup_20190114.html','notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=510px,height=550px,top=180px,left=1000px');
						notice1Window = window.open('/assets/ver2/popup/popup_20190117.html','notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=620px,height=502px,top=180px,left=100px');

						//noticeWindow = window.open('/assets/ver2/popup/popup_20180724.html','notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=500px,height=520px,top=180px,left=500px');
						//noticeWindow = window.open('/assets/ver2/popup/popup_20180920.html','notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=500px,height=520px,top=180px,left=500px');
						//notice1Window = window.open('/assets/ver2/popup/popup_20160602.html','notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=836px,height=652px,top=130px,left=100px');
						//notice1Window = window.open('/assets/ver2/popup/popup_20171228.html','notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=836px,height=652px,top=130px,left=400px');
						//notice1Window = window.open('/assets/ver2/popup/popup_20181227.html','notice1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=no,width=830px,height=630px,top=180px,left=500px');
						//winddow.open의 ()의 것은 한줄에 계속 붙여써야 오류가 안남, 줄바뀌면 오류남
						
						
						notice1Window.opener = self;
						noticeWindow.opener = self;
	
						}
		
	
		function fAlert(){ 
			
			//if (
			//getCookie( 'popup20140117' )!='off'){ //오늘하루 열지 않겠습니다 체크 일경우 24시간동안 막음
				//window.open('popup/popup_20140117.html','_blank','scrollbars=no,status=no,menubar=no,width=230px,,height=230px,top=180px,left=600px'); //보수교육 팝업창
				//window.open('/assets/ver2/popup/popup_20140117.html','_blank','scrollbars=no,status=no,menubar=no,width=425px,,height=300px,top=180px,left=600px');
				//window.open('popup/popup_20140117.html','_blank','scrollbars=no,status=no,menubar=no,width=220px,,height=200px,top=180px,left=600px');
			//}
			
			//window.open('popup/popup_20131104.html','_blank','scrollbars=no,status=no,menubar=no,width=420px,,height=240px,top=200px,left=600px');
		}
	
		
		
			$(document).ready(function()
			{
				// -- 공지사항 리스트
	            $.ajax ( {
	                  type		: "GET"
					, url		: "/mainBoard.do"
					, dataType  : "html"
					, cache		: false
					, success	: handleGetBoardHtml
					, error		: handleGetBoardHtmlError				
				});
				
				//180402 추가
				$("#main_lic_no").keyup(function(event){
	    			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	    		});
	    		$("#main_lic_no").focusout(function(event){
	    			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
	    		});
	    		
				/**/
	           /*  $(".v_navi ul li").click(function(){
	            	$(".v_navi ul li").removeClass("on");
	            	$(".main").hide();
	            	var idx = $(".v_navi ul li").index(this);
					$("#main"+idx).show();
					$(this).addClass("on");
				});
	            $("#docu_btn").click(function(){
					$("#docu_view").toggle();
				});
	            $("#docu_btn2").click(function(){
					$("#docu_view2").toggle();
				}); */
	            /**/
				
			});
			
			function handleGetBoardHtml(data){		
				$("#cb_body").html(data);		
			}
			
			function handleGetBoardHtmlError(data){}
			
			function doClickTab(v)
			{
				$("li[id^='tab']").attr("class", "");
				$("#tab"+v).attr("class", "on");
				
				$("ul[id^='list']").hide();
				$("#list"+v).show();
				
				var addr = "";
				if(v==1){
					addr = "/work/research/community/kr_notice.do?bbs_cd=001";				
				}else if(v==2){
					addr = "/work/research/community/kr_faq.do?bbs_cd=002";
				}else if(v==3){
					addr = "/work/research/community/kr_inquiry.do?bbs_cd=003";
				}
							
				$("#plusBbs").attr("href", addr);
			}
			
			function doClickBoard(atc_sno, bbs_cd)
			{	
				var param = "?board_form=view&board_page=1&board_search=0&board_keyword=&bbs_cd=" + bbs_cd + "&atc_sno=" + atc_sno;
	
				if 		( bbs_cd == '001' ){
					document.location.href = "/work/research/community/kr_notice.do" + param;
				}else if ( bbs_cd == '002' ){
					document.location.href = "/work/research/community/kr_faq.do" + param;
				}else if ( bbs_cd == '003' ){
					if ( confirm("비밀글입니다.문의하기 게시판으로 이동하시겠습니까?")) {
						document.location.href = "/work/research/community/kr_inquiry.do?bbs_cd=003";
					}
				}
			}
			
			function login(){
				var main_pers_name= $("#main_pers_name").val();
				var main_lic_no= $("#main_lic_no").val();
				if(main_pers_name==""){
					alert("성명을 입력해 주세요");
					return;
				}
				if(main_lic_no==""){
					alert("면허번호를 입력해 주세요");
					return;
				}
				
				var f = document.forms["main_report"];	
				f.method="post";
				f.action="/work/research/report/kr_report.do";
				f.submit();
			}
	
			function loginday(){
					var todayDate = new Date();
	//				curDate = todayDate.setDate(todayDate.getDate());
					curDate = todayDate.getDate();
	//alert("5월23일 이후 6월1일까지 실태신고가 잠정 중단됩니다."+curDate);
					if ( curDate == '23' )
					{			var f = document.forms["main_report"];	
								f.method="post";
								f.action="/work/research/report/kr_report.do";
								f.submit();
					}else{
								
						alert("5월24일부터 31일까지 실태신고가 잠정 중단됩니다.");
						return;
							}
			}
			
			
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
	
		</script>
	</head>
		
	<body >
	<div id="wrap">
	
		<%@ include file ="/pages/work/research/research_header.jsp"%>
		
		<!-- Contents S-->
		<div id="contents">
			<div class="visual">
				<h2 class="ti">비주얼 영역</h2>
				<div class="v_img img01">
					<div class="wrap">
						<div class="v_navi">
							<ul>
								<li class="start"><a onclick="go_sd_popup1()">영양사 실태신고 방법</a></li>
								<li><a onclick="go_sd_popup2()">2017년도 보수교육 <br />미이수자의 실태신고 방법</a></li>
								<li><a onclick="go_sd_popup3()">2017년도 임신, 출산, 질병 등<br />보수교육 면제대상자의 실태신고 방법</a></li>
								<li><a style="height: 62px;" onclick="go_sd_popup4()">2017년도 다른 분야 근무, 대학원<br />진학, 미취업 등 보수교육 대상자가 아닌<br />경우 실태신고 방법</a></li>
							</ul>
						</div>
						<div class="v_info" style="letter-spacing: 0;">
	<!--						<ol class="liststyle in decimal">-->
							<ol>
							<!-- 
								<li><font size = "2">- 대상 : <font style="font-weight: 900;">1. 2016년 영양사 실태신고자(3년 경과 재신고)</font></font></li>
								<li><font size = "2" style="font-weight: 900;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 2016년 영양사 면허 취득자</font></li>
								<li><font size = "2" style="font-weight: 900;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(면허번호 제143020호 ~ 제146934호)</font></li>
								<li><font size = "2">- 실태신고 전 필수 항목 :  </font> <font color = "red" size = "2">2017년도 </font>보수교육 이수여부</li>
								<li><font size = "2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								확인 후 실태신고 가능</font></li>
								<li><font size = "2" style="font-weight: 900;">- 기간 : 2019년 1월 1일 ~ 2019년 12월 31일</font></li>
								 -->
								
	
	<!--							<li>일괄신고 서류 
									<span>처음 신고 시(영양사 면허증 사본 필수)
										 <ul>
											<li class="i_b_t7">2015년 신고자 : 2013년 보수교육 이수, 면제, 미대상 확인</li>
											<li class="i_b_t7">2016년 신고자 : 2013, 2015년 보수교육 이수, 면제, 미대상 확인</li>
										 </ul>
									</span>
								</li>
	-->
							
							<!-- 
							<li><br /></li>
							<li><font size = "2" style="font-weight: 900;">* 면허번호가 제1호~제 142476호 중 아직 실태신고를 하지 않은 경우</font></li>
							<li><font size = "2" style="font-weight: 900;">&nbsp;&nbsp;&nbsp;현재 추가신고 중임으로 서두르시기 바랍니다.! </font></li>
							 -->
							<!-- 
							<li><font size = "2">■ 면허번호 <mark class="cm">제142477호 </mark>부터는 면허증을 발급 받은 해를 기준으로</font> </li>
							<li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size = "2"><mark class="cm">3년 후의 1월 1일부터 12월 31일</mark>까지 내에 최초신고</font></li>
							 -->
							 <!-- 190108 이미지텍스트로추가 -->
                            <li><img src="images/research/common/visual_txt01.png"></li>
                            <!-- -->
							</ol>
						</div>
						<div class="v_btn">
						<a href="/work/research/report/kr_report.do"><span class="ti">실태신고 바로가기</span></a>
						</div>
					</div>
					<div class="ti">
						<strong>KDA Education</strong>
						<h2>전문인으로서의 능력향상을 위한 교육</h2>
						<p>&quot;영양사는 건강 증진 및 질병치료를 목적으로 연구개발하고 전문적인 영양서비스를 제공하는 영양 전문인입니다.&quot;</p>
					</div>
					
					<div id="sd_popup1" class="popup_box">
						<span class="popup_btn">X</span>
						<div class="popup_wrap center">
							<div class="area left">
								<h3 class="title bold t2 cm s1 i_b_t2">영양사 실태신고 방법</h3>
								<p class="text middle cb mt30">
									2019년 영양사 실태신고는 2017년의 보수교육 이수 여부를 확인합니다.<br/>
									(최초신고자의 경우 2013, 2015, 2017년도 보수교육 이수 여부를 확인합니다.)<br/>
									대한영양사협회 홈페이지(<a href="http://www.dietitian.or.kr" target="_blank" class="link">http://www.dietitian.or.kr</a>)의 실태신고센터에서 이름, 면허번호를 입력하고, 실태신고 절차에 따라 온라인으로 신고
								</p>
							</div>
							<div class="area mt30">
								<div class="fl w450">
									<div class="box t2 p20" style="height: 272px;">
										<h4 class="title bold t3 cm s1 mb10" style="height: 60px;">2017년도 보수교육 이수 또는 면제 받은 경우</h4>
										<div class="box p30"  style="height: 140px;">
											<p class="text normal cb">실태신고센터에서 실태신고절차에 따라 신고</p>
											<a href="/work/research/report/kr_report.do" class="btn bbig t1 mt20">실태신고 바로가기</a>
										</div>
									</div>
								</div>
								<div class="fr w450">
									<div class="box t2 p20" style="height: 272px;">
										<h4 class="title bold t3 cm s1 mb10" style="height: 60px;">보수교육 대상 근무처에서 근무하였으나 <br/>2017년 보수교육을 이수하지 않은 경우</h4>
										<div class="box p30" style="height: 140px;">
											<p class="text normal cb">영양사 보수교육센터에서 추가보수교육을 이수한 후<br/> 실태신고센터에서 신고</p>
											<a href="http://www.kdaedu.or.kr/" target="_blank" class="btn bbig t1 mt20" title="새창으로 열기">보수교육센터 바로가기</a>
										</div>
									</div>
								</div>
							</div>
							<div class="area mt30">
								<div class="fl w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">군복무, 출산·육아휴직, 질병휴직, 장기해외출장 등으로 보수교육  </p> 면제대상자인데 2017년 보수교육 면제 신청을 하지 않은 경우</h4>
										<div class="box p20 pt30 pb30">
											<p class="text normal cb">영양사 보수교육센터에서 면제신청서를 작성하고, <br />관련 증빙서류를 제출한 후 승인 완료 후  <br />실태신고센터에서 신고</p>
											<a href="http://www.kdaedu.or.kr/" target="_blank" class="btn bbig t1 mt20" title="새창으로 열기">보수교육센터 바로가기</a>
										</div>
									</div>
								</div>
								<div class="fr w450">
									<div class="box t2 p20" style="height: 272px;">
										<h4 class="title bold t3 cm s1 mb10" style="height: 60px;">영양사 외 다른 분야 근무, 미취업, 학생 등으로</p> 2017년 보수교육 대상자가 아닌 경우</h4>
										<div class="box p20 pt30 pb30" style="height: 140px;">
											<p class="text normal s1 cb">실태신고센터에서 보수교육 미대상자 신청을 하고, <br /> 승인 완료 후 실태신고절차에 따라 신고</p>
											<a href="https://www.dietitian.or.kr/work/research/recipient/recipient.do" class="btn bbig t1 mt20">보수교육 미대상자 신청 바로가기</a>
										</div>
									</div>
								</div>
							</div>
	<!--
							<div class="area mt30">
								<div class="fl w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">2013년도 타직종 근무, 미취업 등으로  </p>보수교육 대상자가 아닌 경우</h4>
										<div class="box p30">
											<p class="text normal cb">실태신고센터에서 보수교육미대상 신청을 하고,  <br />승인 완료 후 실태신고절차에 따라 신고</p>
											<a href="/work/research/recipient/recipient.do" class="btn bbig t1 mt20">보수교육 미대상자 신청 바로가기</a>
										</div>
									</div>
								</div>
							</div>
							-->
						</div>
					</div>
					
					<div id="sd_popup2" class="popup_box">
						<span class="popup_btn">X</span>
						<div class="popup_wrap center">
							<div class="area left">
								<h3 class="title bold t2 cm s1 i_b_t2">보수교육 미이수자의 실태신고 방법</h3>
								<p class="text middle cb mt30">
									영양사 보수교육센터(<a href="http://www.kdaedu.or.kr" target="_blank" class="link">http://www.kdaedu.or.kr</a>)에서 신고년도를 제외한 이전 최근 3년간의 보수교육에 대하여 소급하여 이수할 수 있도록 개설된 미이수자 추가교육을 이수한 후 실태신고센터에서 신고
								</p>
								<br />
								<br />
							</div>
							<div class="area left">
								<p class="text middle cb mt30">
									- 2017년 보수교육 미이수자 : 2017년 보수교육 미이수자 추가교육 이수<br />
									* 최초 신고자 경우<br />
									 &nbsp;&nbsp;2013년, 2015년, 2017년 보수교육 이수 확인필요<br />
								</p>
							</div>
							<!-- 
							<div class="area mt30">
								<p class="text bold cp mt15 left mb15">
									※ 2016년도 실태 신고 시
								</p>
								<div class="fl w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">2013 또는 2015년도에 보수교육을 미이수한 경우</h4>
										<div class="box p30">
											<p class="text cb s1">영양사 보수교육센터에서 <br/>보수교육을 소급해서 받은 후 실태신고</p>
											<p class="text small cp mt15">2013년 미이수자 : 2013년 추가보수교육 이수</p>
											<p class="text small cp mt15">2015년 미이수자 : 2015년 추가보수교육 이수</p>
											<p class="text small cp mt15">2013, 2015년 미이수자 : 2013, 2015년 추가보수교육 이수</p>
											<a href="http://www.kdaedu.or.kr/" target="_blank" class="btn bbig t1 mt20" title="새창으로 열기">보수교육센터 바로가기</a>
										</div>
									</div>
								</div>
								<div class="fr w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">2013 또는 2015년도에 보수교육 미대상자인 경우</h4>
										<div class="box p30">
											<p class="text cb">영양사 실태신고센터에서 보수교육 미대상자 신청을 하고 실태신고</p>
											<p class="text small cp mt15">2013년 보수교육 미대상 : 2013년 보수교육 미대상 신청</p>
											<p class="text small cp mt15">2015년 보수교육 미대상 : 2015년 보수교육 미대상 신청</p>
											<p class="text small cp mt15">2013, 2015년 보수교육 미대상 : 2013, 2015년 보수교육 미대상 신청</p>
											<a href="https://www.dietitian.or.kr/work/research/recipient/recipient.do" class="btn bbig t1 mt20">보수교육 미대상자 신청 바로가기</a>
										</div>
									</div>
								</div>
							</div>
							-->
								<div class="mt30">
									<a href="http://www.kdaedu.or.kr/"  target="_blank" class="btn bbig t1 mt20" title="새창으로 열기">보수교육센터 바로가기</a>
								</div>
						</div>
					</div>
					
					<div id="sd_popup3" class="popup_box">
						<span class="popup_btn">X</span>
						<div class="popup_wrap center">
							<div class="area left">
								<h3 class="title bold t2 cm s1 i_b_t2">임신, 출산, 질병 등 보수교육 면제대상자의 실태신고 방법</h3>
								<p class="text middle cb mt30">
									<!-- 2013,2015년도 보수교육 면제 대상자는 보수교육 개설 당해연도에 <mark class="bold">군복무</mark> 중이거나 본인의 질병 또는 그 밖의 불가피한 사유로 보수교육을 받기 어렵다고 보건복지부 장관이 인정하는 사람(<mark class="bold">출산, 육아휴직, 질병, 장기해외 출장 등</mark>) 입니다. -->
									2017년도에 군복무 중이거나 본인의 질병 또는 그 밖의 불가피한 사유로 보수교육을 받기 어렵다고 보건복지부 장관이 인정하는 사람은 영양사 보수교육 면제 대상자이므로 해당연도에 대한 영양사 보수교육 면제 신청서와 증빙서류를 제출하신 후 승인 받고 실태신고<br />
									(예 : 영양사 근무 중 출산, 육아휴직, 질병, 장기해외 출장 등)
								</p>
							</div>
							<!-- 
							<div class="area mt30">
								<div class="fl w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">2013,2015년도 보수교육 면제신청을 한 경우</h4>
										<div class="box p20">
											<p class="text cb normal s1">영양사 보수교육이 있는 해에 보수교육 면제 신청을 하셨다면<br/> 영양사 실태신고센터에서 실태신고절차에 따라 신고</p>
											<a href="/work/research/report/kr_report.do" class="btn bbig t1 mt20">실태신고 바로가기</a>
										</div>
									</div>
								</div>
								<div class="fr w450">
									<div class="box t2 p20">
										<h4 class="title bold t3 cm s1 mb10">2013,2015년도 보수교육 면제신청을 하지 않을 경우</h4>
										<div class="box p20">
											<p class="text cb normal s1">영양사 보수교육센터에서 면제신청서를 작성하고, 관련 <br/>증빙서류를 제출한 후 승인이 되면 실태신고센터에서 신고</p>
											<a href="http://www.kdaedu.or.kr/"  target="_blank" title="새창으로 열기" class="btn bbig t1 mt20">보수교육센터 바로가기</a>
										</div>
									</div>
								</div>
							</div>
							
							<div class="mt30 mb40">
								<a href="#docu_view1" class="btn t2 bbig" id="docu_btn">보수교육 면제대상자 증빙서류 보기</a>
							</div>
							 -->
							<div class="left" id="docu_view1">
								<h3 class="title bold t2 cm s1 i_b_t2 mt20">보수교육 면제대상자 및 증빙서류</h3>
								<div class="area">
								<!-- 
									<h5 class=" title bold t3 s1 i_b_t3 mt50">면제사유</h5>
									<div class="text s1 mt10 ml10">
										국민영양관리법 시행규칙 제18조(보수교육의 시기&middot;대상&middot;비용&middot;방법 등)
									</div>
									<div class="box mt20 p20">
										<p class="text small cb left">
											④ 제3항에 따른 보수교육 대상자 중 다음 각 호의 어느 하나에 해당하는 사람은 보수교육을 면제한다. 이 경우 보수교육이 면제되는 사람은 해당 보수<br/><span class="ml15"></span>교육이 실시되기 전에 별지 제5호서식의 보수교육 면제신청서에 면제 대상자임을 인정할 수 있는 서류를 첨부하여 협회의 장에게 제출하여야 한다.<br />
											1. 군복무 중인 사람<br />
											2. 본인의 질병 또는 그 밖의 불가피한 사유로 보수교육을 받기 어렵다고 보건복지부장관이 인정한 사람
										</p>
									</div>
								 -->	
									<div class="area">
										<table class="table t2 text small s1 cb center mt20">
											<colgroup>
												<col width="60" />
												<col width="*" />
												<col width="300" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="col" class="bgs">구분</th>
													<th scope="col" class="bgs">면제신청 대상자</th>
													<th scope="col" class="bgs">증빙서류</th>
												</tr>
												<tr>
													<td>1</td>
													<td class="left">군복무 중인 사람</td>
													<td class="left">입영 날짜가 기입된 병적증명서</td>
												</tr>
												<tr>
													<td>2</td>
													<td class="left">본인의 질병 또는 그 밖의 불가피한 사유로 보수교육을 받기 어렵다고 보건복지부 장관이 인정하는 사람<br />
													- 출산, 육아 휴직 등<br />
													- 질병<br />
													- 기타 (장기해외 출장 시)</td>
													<td class="left"><br />
													휴직계 또는 재직증명서(휴직기간명시)<br />
													진단서(기간명시)<br />
													출장 확인서 또는 출입국 사실 확인서</td>
												</tr>
											</tbody>
										</table>
									</div>
									<ul class="text small mt20 ml10">
										<li class="i_box_t1">증빙서류는 <strong class="bold">기관장 직인을 포함</strong>하고 있어야 하며, 반드시 <strong class="bold">기간이 명시</strong>되어 있어야 승인됩니다.</li>
										<li class="i_box_t1 mt5">보수교육 면제 확인은 당해 년도에 한하므로, 동일한 사유에 해당하더라도 <strong class="bold">보수교육 실태신고가 있는 해에 신고해야 하는 보수교육 마다 면제 신청</strong>을 해야 합니다.</li>
										<li class="i_box_t1 mt5">보수교육 면제대상자는 보수교육 면제대상자임을 증명할 수 있는 서류를 첨부하여 보수교육 면제신청을 한 후 <strong class="bold">&quot;접수완료&quot;가 확인된 후 실태신고</strong>를 하시면 됩니다.</li>
									</ul>
								</div>
							</div>
							
							<div class="mt30 mb40">
								<a href="http://www.kdaedu.or.kr/"  target="_blank" title="새창으로 열기" class="btn t2 bbig" id="docu_btn">보수교육센터 바로가기</a>
							</div>
						</div>
					</div>
					
					<div id="sd_popup4" class="popup_box">
						<span class="popup_btn">X</span>
						<div class="popup_wrap center">
							<div class="area left">
								<h3 class="title bold t2 cm s1 i_b_t2">다른 분야 근무, 대학원 진학, 미취업 등 보수교육 미대상자의 실태신고 방법</h3>
								<p class="text middle cb mt30">
									2017년도에 <strong class="bold"> 미취업</strong> 상태이거나 <strong class="bold">영양사 보수교육 대상 근무처 외에 종사하는 영양사</strong>는 영양사 보수교육 미대상자이므로 해당연도에 대한 영양사 보수교육 미대상 신청서와 증빙서류 제출하신 후 승인 받고 실태신고<br/>
	(예 : 공무원, 교수, 일반음식점, 조리사 등 타분야근무,  대학원 진학, 미취업, 면허 미취득,  해외체류 등)
								</p>
							</div>
							<div class="left" id="docu_view2">
								<h3 class="title bold t2 cm s1 i_b_t2 mt20">보수교육 미대상자 사유 및 증빙서류</h3>
								<div class="area">
									<table class="table t2 text small s1 cb center mt20">
										<colgroup>
											<col width="60" />
											<col width="*" />
											<col width="200" />
											<col width="250" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="col" class="bgs">구분</th>
												<th scope="col" class="bgs">미대상 사유</th>
												<th scope="col" class="bgs">첨부서류</th>
												<th scope="col" class="bgs">비고</th>
											</tr>
											<tr>
												<td>1</td>
												<td class="left">2017년도에 국민영양관리법에 의한 영양사 보수교육 대상 근무처 외에 근무하고 있음.(공무원, 교수, 일반음식점, 조리사 등 타분야근무)<br />
												영양사 보수교육 대상 근무처 : 보건소, 보건지소, 의료기관, 집단급식소, 육아지원종합센터, 어린이급식지원센  터, 건강기능식품판매업소
	
												<td class="center">2017년도<br /> 재직증명서 또는 경력증명서</td>
												<td class="center">국민연금가입자 가입증명서는</br> 경력증명서로 인정되지 않음.</td>
											</tr>
											<tr>
												<td>2</td>
												<td class="left">2017년도에 대학원 진학 등 학업 계속 상태로 미취업 상태임.</td>
												<td rowspan="2" class="center">2017년도<br /> 건강보험 자격득실확인서</td>
												<td rowspan="2" class="center">건강보험자격득실확인서는 <br />해당년도 기간이 모두 포함되어야하고,<br />기관장 직인이 보이게 첨부되어야 승인됨.</td>
											</tr>
											<tr>
												<td>3</td>
												<td class="left">2017년도에 미취업, 대학재학중, 면허미취득, 중도 퇴사, 취업경험 없음 등.</td>
											</tr>
											<tr>
												<td>4</td>
												<td class="left">기타(2017년도에 해외체류 등.)</td>
												<td  class="center">출입국 사실 증명서 등<br/>(사유에 따른 해당서류)</td>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>
								<ul class="text small mt20 ml10">
									<li class="i_box_t1">증빙서류는 <strong class="bold">기관장 직인을 포함</strong>하고 있어야 하며, 반드시 <strong class="bold">기간이 명시</strong>되어 있어야 승인됩니다.</li>
									<li class="i_box_t1 mt5">보수교육 미대상자 확인은 당해 연도에 한하므로, 동일한 사유에 해당하더라도 <strong class="bold">실태신고가 있는 해에 신고해야 하는 보수교육마다 미대상자 신청</strong>을 해야 합니다.</li>
									<li class="i_box_t1 mt5">보수교육 미대상자는 보수교육 미대상자를 신청하고 <strong class="bold">&quot;완료메일&quot;을 받은 후 초기화면으로 가서 실태신고 하시면 됩니다.</strong></li>
								</ul>
							</div>
							
							<div class="mt30 mb40 btn_wrap">
								<ul>
									<li><a href="https://www.dietitian.or.kr/work/research/recipient/recipient.do" class="btn t2 bbig">보수교육 미대상자 신청 바로가기</a></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<hr />
			<div class="wrap main">
				<div class="c_box latest">
					<h2 class="ti">최근게시물</h2>
					<div class="cb_head">
						<ul>
							<li id="tab1" class="on"><a href="javascript:doClickTab('1');"><strong>공지사항</strong></a></li>
							<li id="tab2" ><a href="javascript:doClickTab('2')">FAQ</a></li>
							<li id="tab3" ><a href="javascript:doClickTab('3')">문의하기</a></li>
							<li class="plus"><a href="/work/research/community/kr_notice.do?bbs_cd=001" id="plusBbs"><span class=""></span></a></li>
						</ul>
					</div>
					<div class="cb_body" id="cb_body"></div>
				</div>
				<div class="c_box m_login">
					<div class="cb_head"> 
						<h2 class="">&nbsp;&nbsp;&nbsp;&nbsp;실태신고센터</h2>
						<span>실태신고 신청하기</span>
					</div>
					<div class="cb_body">
					<c:choose>
						<c:when test="${null eq loginVo}">
						<div class="area text small left">
							※ 실태신고 방법 및 절차를 확인하시고<br />
							<span class="ml15"></span> 신고해 주십시오.
						</div>
						<div class="mt10">
							<form name="main_report">
								<fieldset>
									<legend><span class="ti">LOGIN</span></legend>
									<div class="area">
										<ul class="ac w250">
											<li class=""><label for="kda_user_id"><span class="ti">성명</span></label><input type="text" class="input login_m" id="main_pers_name" name="main_pers_name" placeholder="성명" /></li>
											<li class="mt5"><label for="kda_user_licence"><span class="ti">면허번호</span></label><input type="text" class="input login_m" id="main_lic_no" name="main_lic_no" placeholder="면허번호(숫자만 입력)" /></li>
										</ul>
										<div class="center">
											<button type="button" class="btn t1 login3 login1" onclick="login();">확인</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						</c:when>
						<c:otherwise>
						<div class="area text center mt60">
							'<strong>${loginVo.pers_name}</strong>님 좋은 하루 되십시오.'
							<button type="button" class="btn t1 login3 login1" onclick="return;">실태신고 신청하기</button>
						</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div class="c_box educenter">
					<h2 class="ti">관련사이트 및 안내</h2>
					<div class="cb_body">
					<!-- 
						<ul>
							<li><a href="/" target="_black"><span class="logo_m m01"></span>대한영양사협회</a></li>
							<li><a href="http://www.kdaedu.or.kr" target="_black"><span class="logo_m m02"></span>KDA 보수교육센터</a></li>
							<li><a href="http://lic.mohw.go.kr/login/login.do" target="_black"><span class="logo_m m03"></span>보건복지부 면허조회</a></li>
							<li class="inquiry text">
								<div><a href="/work/research/community/kr_inquiry.do?bbs_cd=003"><span class="icon i_inquiry"></span><span>문의하기<br /><mark class="ssmall">INQUIRY</mark></span></a></div>
								<div class="end"><a href="/work/research/community/kr_faq.do?bbs_cd=002"><span class="icon i_faq"></span><span>자주하는 질문<br /><mark class="ssmall">FAQ</mark></span></a></div>
							</li>
						</ul>
					-->
						<ul>
							<li><a href="http://kdaedu1.or.kr/FreeCourse.cmd?cmd=userFreeCourseList" target="_black"><img src="images/research/common/banner01.png" width="290" height="50" alt="영양사 무료온라인교육" border="0"></a></li>
							<li><img src="images/research/common/banner02.png" alt="" width="290" height="49" usemap="#Map" border="0"/>
		                         <map name="Map">
		                           <area shape="rect" coords="5,3,135,50"  href="https://www.dietitian.or.kr/index.do" target="_black" alt="대한영양사협회">
		                           <area shape="rect" coords="146,3,289,50" href="http://www.kdaedu.or.kr" target="_black" alt="KDA보수교육센타">
		                         </map>
							</li>
							<li><a href="http://lic.mohw.go.kr/login/login.do" target="_black"><span class="logo_m m03"></span>보건복지부 면허조회</a></li>
							<li class="inquiry text">
								<div><a href="/work/research/community/kr_inquiry.do?bbs_cd=003"><span class="icon i_inquiry"></span><span>문의하기<br /><mark class="ssmall">INQUIRY</mark></span></a></div>
								<div class="end"><a href="/work/research/community/kr_faq.do?bbs_cd=002"><span class="icon i_faq"></span><span>자주하는 질문<br /><mark class="ssmall">FAQ</mark></span></a></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Contents E-->
		
		<%@ include file ="/pages/work/research/research_footer.jsp"%>
		
	</div>	
	</body>	
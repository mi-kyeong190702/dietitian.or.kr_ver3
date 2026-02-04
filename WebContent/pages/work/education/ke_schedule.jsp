<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../common.jsp"%>

<script src="/js/dietitan_calendar.js"></script>
<script type="text/javascript">

	var calendarControl = new CalendarControl();	
	var schedules = new Array();
	var schedules_info = new Object();
	var yy = ${requestScope.ilyear};
	var mm = ${requestScope.ilmonth};
	
	$(document).ready(function(){
		calendarControl.show(yy, mm);		
		var first_dd = -1;
		
		if ( schedules.length > 0 )			
			first_dd = schedules[0];
		
		for ( var i = 0; i < schedules.length; i++) {
			var dd = parseInt(schedules[i]);
			$("td[name='dd_" + dd + "']").html ( "<a href='javascript:selectedDD(" + dd + ")' class='exbold ca'>" + dd + "</a>" );
		} 

		$("[name=schedule_detail]").hide();
	});

	function selectedDD(dd) {
		$("[name=schedule]").show();		
	}
	
	
	function handleChangedMonth(change) {	
		mm = parseInt(mm) + change;
		
		if(mm > 12) {
			mm = 1;
			yy++;
		} else if(mm < 1) {
			mm = 12;
			yy--;
		}
		
		if ( mm < 10 )
			mm = "0" + mm;
		
		var f = document.forms["form"];		
		f.yy.value = yy;
		f.mm.value = mm;
		f.submit();
	}
	


	function showDetail(yy, mm, seq) {
		var f = document.forms["form"];
		f.yy.value = yy;
		f.mm.value = mm;
		f.ilindex.value = seq;
		f.action = "/work/education/ke_schedule_detail.do";
		f.method = "post";
		f.submit();
	}
	
	function doDelete(ilindex) {
		if( confirm("정말 삭제하시겠습니까?") ) {
			location.href="ke_schedule_form_action.do?method=" + ilindex;	
		}
	}
	
</script>

<form name="form">
	<input type="hidden" name="yy" value="">
	<input type="hidden" name="mm" value="">
	<input type="hidden" name="ilindex" value="">
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">평점인정</mark> 교육일정</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
					<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
					<li><a href="/work/education/ke_schedule.do" class="cm">평점인정 교육일정</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">				
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">평점인정교육안내</h4>
			<div class="box t2 mt20 p20 text s1">
				<p class="text bold">전문영양사 전문연수교육 평점 인정 방법 안내</p>
				<p class="ssmall mt10">홈페이지(www.dietitian.or.kr)→<span class="box0 bgs2 bold cw ml5 mr5 pl5 pr5 pb2">KDA 교육</span>→<span class="box0 bgs2 bold cw ml5 mr5 pl5 pr5 pb2">전문영양사코너</span>
					→<span class="box0 bgs2 bold cw ml5 mr5 pl5 pr5 pb2">관련서식 다운로드</span> 에서 <mark class="bold cm">'전문영양사(노인, 스포츠, 신장, 급식경영, 산업보건) 전문연수교육 평점 인정 신청서'</mark>를 다운받아
					해당사항을 작성하시어 <a href="mailto:kdasys@hanmail.net">kdasys@hanmail.net</a> 으로 '신청서'와 '참가확인서 또는 영수증 사본'을 보내주시길 바랍니다.
				</p>
				<p class="small bold ca mt20">(사)대한영양사협회 교육국 02)823-5680(내선 514)</p>
			</div>
			<div class="area">
				<c:if test="${g_user_level == 1}">
					<div class="btn_wrap mt20">
						<ul class="fl">
							<li><a href="/work/education/ke_schedule_form.do" class="btn big t2">등록</a></li>
						</ul>
					</div>
				</c:if>
				<div class="w300 mt50 mr20 fl">
					<div id='CalendarControl'></div>
				</div>
				<div class="w380 mt70 mr20 fl">
				<c:choose>
					<c:when test="${requestScope.list.size() > 0 }">
						<c:forEach var="i" begin="0" end="${requestScope.list.size()-1 }">
							<c:set var="tmp_yy" scope="session" />
							<c:set var="tmp_mm" scope="session" />
							<c:set var="tmp_dd" scope="session" />

							<div name="schedule" id="${requestScope.list[i].ilyear}${requestScope.list[i].ilmonth}${requestScope.list[i].ilday}">
							
								<c:if test="${tmp_yy != requestScope.list[i].ilyear ||
											  tmp_mm != requestScope.list[i].ilmonth ||
											  tmp_dd != requestScope.list[i].ilday }">
									<c:set var="tmp_yy" value="${requestScope.list[i].ilyear}"/>
									<c:set var="tmp_mm" value="${requestScope.list[i].ilmonth}"/>
									<c:set var="tmp_dd" value="${requestScope.list[i].ilday}"/>							
									<h4 name="schedule" id="${requestScope.list[i].ilyear}${requestScope.list[i].ilmonth}${requestScope.list[i].ilday}" class="title bold i_b_t6 ml20">${requestScope.list[i].ilyear}년 ${requestScope.list[i].ilmonth}월  ${requestScope.list[i].ilday}일</h4>
									<script>
										schedules.push("${tmp_dd}");
										schedules_info["${tmp_yy}${tmp_mm}${tmp_dd}"] = "${requestScope.list[i]}";
									</script>
								</c:if>
								<div class="area">
									
									<table class="table t3 text small s1 ca center mt20 mb20 ml20">
										<colgroup>
											<col width="80">
											<col width="*">
											<col width="80">
										</colgroup>
										<tbody>
											<tr>
												<td scope="row" class="bgs bold">일시</td>
												<td class="left">${requestScope.list[i].ilyear}.${requestScope.list[i].ilmonth}.${requestScope.list[i].ilday}</td>
											</tr>
											<tr>
												<td scope="row" class="bgs bold">제목</td>
												<td class="left">${requestScope.list[i].ilsubject}</td>
											</tr> 
											<tr>
												<td scope="row" class="bgs bold">주최</td>
												<td class="left">${requestScope.list[i].ilsponsor}</td>
											</tr>
											<tr>
												<td scope="row" class="bgs bold">교육명</td>
												<td class="left">${requestScope.list[i].ileduname}</td>
											</tr>
											<tr>
												<td colspan="2" class=""><a href="javascript:showDetail(${tmp_yy},${tmp_mm},${requestScope.list[i].ilindex})" class="btn t2 small">자세히보기</a>
												<c:if test="${g_user_level == 1}">
													<a href="./ke_schedule_form.do?ilindex=${requestScope.list[i].ilindex}" class="btn t2 small">수정</a>
													<a href="javascript:doDelete(${requestScope.list[i].ilindex})" class="btn t2 small">삭제</a>
												</c:if>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>				
						</c:forEach>
					</c:when>
				</c:choose> 
				</div>
				
				</div>
			</div>
		</div>
</form>
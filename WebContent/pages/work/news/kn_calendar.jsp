<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<script src="/js/dietitan_calendar.js"></script>
<script type="text/javascript">

	var calendarControl = new CalendarControl();	
	var schedules = new Array();
	
	var yy = ${requestScope.YY};
	var mm = ${requestScope.MM};
	
	$(document).ready(function()
	{
		calendarControl.show(yy, mm);
		
		var first_dd = -1;		
		if ( schedules.length > 0 )			
			first_dd = schedules[0];
		
		$("[name=schedule]").hide();		
		for ( var i = 0; i < schedules.length; i++) 
		{
			var dd = parseInt(schedules[i]);
			$("td[name='dd_" + dd + "']").html ( "<a href='javascript:selectedDD(" + dd + ")' class='exbold ca'>" + dd + "</a>" );
		}
		
		if ( first_dd != -1 ) {
			if ( mm < 10 ) mm = "0" + mm;
			$("[id=" + yy + mm + first_dd + "]").show();
		}
		
		selectedDD(${DD});
	});

	function selectedDD(dd){
		if ( dd < 10 ) dd = "0" + dd;	
		$("[name=schedule]").hide();
		
		if(  !$("[id=" + yy + mm + dd + "]").html() ) {
			$("#no_data_day").html( yy + "년" + mm + "월" + dd +"일");
			$("#no_data_day").show();
			$("#no_data_txt").show();
		} else {
			$("#no_data_day").hide();
			$("#no_data_txt").hide();
			
			$("[id=" + yy + mm + dd + "]").show();	
		}
	}
	
	
	function handleChangedMonth(change) 
	{	
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
</script>

<form name="form">
<input type="hidden" name="yy" value="">
<input type="hidden" name="mm" value="">

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">이달</mark>의 일정</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="/work/news/kn_calendar.do" class="cm">이달의 일정</a></li>
			</ul>
		</div>
	</div>
	<hr/>
	<div class="sp_body">
		<div class="sp_body">
		
			<c:choose>
				<c:when test="${g_userid == ''}">
					<div class="w600 ac">
						<div class="box t2 p20 mt20">
							<div class="box p50 text big s1 center">
								<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
								<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="box t2 h100 kn_calendar_bg">
						<p class="text bold s1 ml250 pt40"><mark class="cs">대한영양사협회</mark> 일정을 보실 수 있습니다.</p>
					</div>
					<div class="area">
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
									
									<c:if test="${tmp_yy != requestScope.list[i].yy ||
												  tmp_mm != requestScope.list[i].mm ||
												  tmp_dd != requestScope.list[i].dd }">
										<c:set var="tmp_yy" value="${requestScope.list[i].yy}"/>
										<c:set var="tmp_mm" value="${requestScope.list[i].mm}"/>
										<c:set var="tmp_dd" value="${requestScope.list[i].dd}"/>							
										<h4 name="schedule" id="${requestScope.list[i].yy}${requestScope.list[i].mm}${requestScope.list[i].dd}" class="title bold i_b_t6 ml20">${requestScope.list[i].yy}년 ${requestScope.list[i].mm}월  ${requestScope.list[i].dd}일</h4>
										<script>schedules.push("${tmp_dd}");</script>
									</c:if>
									
									<div name="schedule" id="${requestScope.list[i].yy}${requestScope.list[i].mm}${requestScope.list[i].dd}" class="area wn">
										<table class="table t3 text small s1 ca center mt20 mb20 ml20">
											<colgroup>
												<col width="80">
												<col width="*">
											</colgroup>
											<tbody>
												<tr>
													<td scope="row" class="bgs">제목</td>
													<td class="left">${requestScope.list[i].title}</td>
												</tr>
												<tr>
													<td scope="row" class="bgs">시간</td>
													<td class="left">${requestScope.list[i].s_time}</td>
												</tr>
												<tr>
													<td scope="row" class="bgs">장소</td>
													<td class="left">${requestScope.list[i].s_where}</td>
												</tr>
												<tr>
													<td scope="row" class="bgs">연락처</td>
													<td class="left">${requestScope.list[i].s_tel}</td>
												</tr>
												<tr>
													<td scope="row" class="bgs">내용</td>
													<td class="left">${requestScope.list[i].content}</td>
												</tr>
											</tbody>
										</table>
									</div>
									
								</c:forEach>
							</c:when>
						</c:choose>	
								<h4 id="no_data_day" class="title bold i_b_t6 ml20">
									${requestScope.list[i].yy}년 ${requestScope.list[i].mm}월  ${requestScope.list[i].dd}일
								</h4>
								<div id="no_data_txt" class="area wn">
									<table class="table t3 text small s1 ca center mt20 mb20 ml20">
									<colgroup>
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<td scope="row"> 일정이 없습니다.</td>
										</tr>
									</tbody>
								</table>
								</div>				
						</div>
					</div>
										
					
				</c:otherwise>
			</c:choose>
		
		</div>
		
	</div>
</div>
</form>
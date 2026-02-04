<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<table border="0" width="1000" cellspacing="0" cellpadding="0">
	<tr>
		<td height="85" colspan="2">
			<form name="topForm" method="post" >
			<input type="hidden" name="strID" value="" />
			<input type="hidden" name="strPWD" value="" />
			<div id="wrap">
			<div id="header">
					
			    	<h1><a href="/djemals/main.do"><img src="/djemals/back/images/logo.gif" alt="대한영양사협회" /></a></h1>
					<ul class="lnb">
					  	<li style="margin-right:50px;"><a href="/djemalds/logout.do" ><img src="/djemals/back/images/m_logout.gif" alt="로그아웃" /></a></li>
				    </ul>

					<div class="gnb">
						<ul>
							<li><a href="/djemals/main/bannerList.do">배너관리</a></li>
							<li><a href="/djemals/board/board.do">게시판 관리</a></li>
							<li><a href="/djemals/contents/list.do">콘텐츠 관리</a></li>
							<li><a href="/djemals/schedule/schedule.do">메인일정 관리</a></li>
							<li><a href="/djemals/survey/list.do">설문 관리</a></li>
							<li onmouseover="showMenu('menu3')" onmouseout="hideMenu('menu3')"><a href="/djemals/edu/cert.do">교육부분</a></li>
							<li onmouseover="showMenu('menu4')" onmouseout="hideMenu('menu4')"><a href="/djemals/purchase/purchase.do">기타관리</a></li>
							<li onmouseover="showMenu('menu5')" onmouseout="hideMenu('menu5')"><a href="/djemals/stat/site.do">접속통계</a></li>
							<c:if test="${fn:contains( homepage_admin.progid, '906' ) }">
							<li><a href="/djemals/payment/confirm.do" target="_blank">결제관리</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			  </div>
			  </form>
			  
			  	<div id="menu3" class="side_1" style="position:absolute;top:112px !important;left:530px !important;display: none; z-index:999" onmouseover="showMenu('menu3')" onmouseout="hideMenu('menu3')">
					<ul>
						<li class="aa" style="border-top:1px solid gray;"><a href="/djemals/edu/certList.do">온라인교육센터 회원연동</a></li>
						<li class="aa"><a href="/djemals/edu/est.do">개설요청신청 리스트</a></li>
						<li class="aa"><a href="/djemals/edu/greenList.do">논문초록신청 리스트</a></li>
						<li class="aa"><a href="/djemals/edu/logList.do">이수확인서 출력 리스트</a></li>
					</ul>
				</div>
				
				<div id="menu4" class="side_1" style="position:absolute;top:112px !important;left:635px !important;display: none; z-index:999" onmouseover="showMenu('menu4')" onmouseout="hideMenu('menu4')">
				<ul>
					<li class="aa" style="border-top:1px solid gray;"><a href="/djemals/purchase/purchase.do">구매관리</a></li>
					<li class="aa"><a href="/djemals/consult/consult.do">Q&A 게시판상담원 관리</a></li>
					<li class="aa"><a href="/djemals/monitor/monitor.do">국민영양 모니터 관리</a></li>
					<li class="aa"><a href="/djemals/contest/contest.do">전국영양사 학술대회</a></li>
					<li class="aa"><a href="/djemals/contest/contestCancel.do">학술대회 취소 신청</a></li>
					<li class="aa"><a href="/djemals/job/job.do">취업설명회 예약신청</a></li>
					<li class="aa"><a href="/djemals/point/pointTop.do">포인트 적립현황 상위 50인</a></li>
					<li class="aa"><a href="/djemals/point/point.do">회원 포인트 관리</a></li>
					<li class="aa"><a href="/djemals/event/plusOne.do">회원가입 1+1 이벤트 관리</a></li>
					<li class="aa"><a href="/djemals/event/sns.do">SNS 영양사 홍보 이벤트 관리</a></li>
					<li class="aa"><a href="/djemals/campaign/handon.do">한돈 릴레이 캠페인 댓글 관리</a></li>
					<li class="aa"><a href="/djemals/hunt/offerList.do">구인 정보 관리</a></li>
				</ul>
				</div>
				
				<div id="menu5" class="side_1" style="position:absolute;top:112px !important;left:740px !important;display: none; z-index:999" onmouseover="showMenu('menu5')" onmouseout="hideMenu('menu5')">
				<ul>
					<li class="aa" style="border-top:1px solid gray;"><a href="/djemals/stat/site.do">사이트 접속통계</a></li>
					<li class="aa"><a href="/djemals/stat/member.do">개인별 접속통계</a></li>
					<li class="aa"><a href="/djemals/stat/banner.do">배너 클릭통계</a></li>
					<li class="aa"><a href="/djemals/stat/sinmungo.do">신문고 클릭통계</a></li>
				</ul>
				</div>
		</td>
	</tr>

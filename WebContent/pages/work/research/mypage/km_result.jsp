<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

String msg ="";
if(request.getAttribute("message")!=null){
	msg=request.getAttribute("message").toString();
}

%>
<script type="text/javascript">

var msg="<%=msg%>";


if(msg!=null && msg!=""){
	alert(msg);
	
}
</script>

			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">면허신고</mark> 수정</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/mypage/km_report.do">마이페이지</a></li>
							<li><a href="/work/research/mypage/km_update.do" class="cm">면허신고 수정</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">

				<c:choose>
					<c:when test="${finish_yn=='null' }">
						<div class="box t2 p60 pt40 pb40 center">
							<!--  
							<div class="area">
								<p class="text bbig"><mark class="mark">면허신고</mark>가 등록되지 않았습니다.</p>
								<p class="mt30 text middle">『면허신고 신청』 에서 면허신고가 가능합니다.</p>
							</div>
							-->
							<div class="area">
								<p class="text bbig"><mark class="mark">면허신고 수정</mark>이 <strong class="bold cm">불가능</strong>합니다.</p>
								<p class="mt30 text middle">수정은 임시저장 또는 제출 후 회송 시에만 가능합니다.</p>
							</div>
						</div>
					</c:when>
					<c:when test="${finish_yn=='0' }">
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고 신청</mark>이 <strong class="bold cm">저장</strong>되었습니다.</p>
							<p class="mt30 text middle">작성중인 면허신고서는 『마이페이지』 면허신고현황에서 수정 및 확인 가능합니다.</p>
						</div>
					</div>
				</c:when>
				<c:when test="${finish_yn=='1' }">	
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고 접수</mark>가 <strong class="bold cm">완료</strong>되어 수정이 불가능합니다.</p>
							<p class="mt30 text middle">신고서 검토에는 7일이 소요되며, 신고결과는 반드시 『마이페이지』 면허신고현황에서<br />
						확인하셔야 합니다.</p>
						</div>
					</div>
				</c:when>
				<c:when test="${finish_yn=='2' }">	
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고 접수</mark>가 <strong class="bold cm">완료</strong>되어 수정이 불가능합니다.</p>
							<p class="mt30 text middle">신고서 검토에는 7일이 소요되며, 신고결과는 반드시 『마이페이지』 면허신고현황에서<br />
						확인하셔야 합니다.</p>
						</div>
					</div>
				</c:when>
				<c:when test="${finish_yn=='9' }">
				<div class="box t2 p60 pt40 pb40 center">
					<div class="area">
						<p class="text bbig"><mark class="mark">면허신고 신청</mark>이 <strong class="bold cm">취소</strong>되었습니다.</p>
						<p class="mt30 text middle">처음부터 다시 시작하셔야 합니다.</p>
					</div>
				</div>
				</c:when>
				<c:when test="${procReturn=='3' }">
				<div class="box t2 p60 pt40 pb40 center">
					<div class="area">
						<p class="text bbig"><mark class="mark">면허신고 수정</mark>이 <strong class="bold cm">불가능</strong>합니다.</p>
						<p class="mt30 text middle">수정은 임시저장 또는 제출 후 회송 시에만 가능합니다.</p>
					</div>
				</div>
				</c:when>
		</c:choose>
				
					
					
				</div>
			</div>
			

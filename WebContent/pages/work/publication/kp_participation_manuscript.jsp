<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양 </mark>참여</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
				<li><a href="/work/publication/kp_participation.do" class="cm">국민영양 참여</a></li>
			</ul>
		</div>
	</div>
	<hr />
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
				<div class="tab t2 div2 mb30">
					<ul>
						<li><a href="/work/publication/kp_participation.do">표지모델 신청</a></li>
						<li><a href="/work/publication/kp_participation_manuscript.do" class="on">원고 공모</a></li>
						<!-- <li><a href="/work/publication/kp_participation_mornitor.do">모니터 참여</a></li> -->
					</ul>
				</div>
				
				<div class="text s1">
					<h4 class="title bold cm t2 s1 i_b_t2 mt30">국민영양 나만의 이야기</h4>
					<p class="text cb s1 mt30">
						<mark class="bold cm mr10">「국민영양」 </mark>에 영양사 여러분들의 목소리를 담고자 합니다.<br />
						영양사로 재직하면서 얻은 소중한 경험과 지식을 국민영양을 통해 공유해주세요.<br />
						회원 여러분들의 많은 관심과 참여를 부탁드립니다.
					</p>
					<ul class="text s1 mt40">
						<li><mark class="i_b_t3 bold">원고 주제</mark> : 업무 에피소드, 영양사 동아리 or 그룹 활동 소개, 테마 및 재료에 따른 나만의 레시피 소개 등<li>
						<li class="mt20"><mark class="i_b_t3 bold">응모 기간</mark> : 상시모집<li>
						<li class="mt20"><mark class="i_b_t3 bold">원고 분량</mark> : A4용지 3~4매(그림 및 도표 포함)
						      <ul class="text small ca mt10 ml80">
                                <li>※ 서식: 맑은고딕, 10pt, 줄 간격 160%, 여백 보통 기준</li>
                            </ul>
						<li>
						<li class="mt20"><mark class="i_b_t3 bold">제출 서류</mark> : ①원고 ②저작물전송허락동의서
						      <span><a href="/assets/ver2/download/publ/1. 국민영양 원고 공모 서식.hwp" class="btn t3 middle">원고 서식 다운로드</a></span>
						      <span><a href="/assets/ver2/download/publ/2. 저작물전송허락동의서 서식.hwp" class="btn t3 middle">동의서 서식 다운로드</a></span>
						<li>
						<li class="mt20"><mark class="i_b_t3 bold">보내실 곳</mark> : kdabook@kdiet.or.kr<li>
						<li class="mt20">* 원고가 「국민영양」 지면에 게재되는 분들께는 소정의 원고료를 드립니다.<br>
						      * 이름, 근무처, 연락처를 반드시 기재해주시고, 분량은 조금 넘치거나 부족해도 괜찮습니다.<br>
						      * 접수된 원고는 반환하지 않으며, 원고의 저작물전송권은 ㈔대한영양사협회에 귀속됩니다.<br>
						      * 「국민영양」 지면 및 SNS에 게재될 수 있으며, 편집 방향에 따라 윤문할 수 있습니다.
						<li>
					</ul>	
				</div>
		
				<!-- <div class="box p20 text s1 mt30">
					<h4 class="title bold cm t2 s1 i_b_t2">쉿! 나만 아는 비밀 레시피를 공유해주세요!</h4>
					<p class="text cb s1 mt30">
						항상 똑같은 메뉴와 레시피로 고민 많으시죠?<br />
						즐거운 급식을 만들어가고 있는 나만이 알고 있는 기발하고 특별한 비밀 레시피를 공유해주세요.<br />
						<mark class="bold cm">「국민영양」</mark> <mark class="ml5 mr5">'나만의 레시피'</mark>  칼럼의 원고 공모를 받고 있사오니, 
						자세한 내용은 하단을 참고하시기 바랍니다. 회원 여러분들의 많은 관심과 참여를 부탁드립니다.
					</p>
					<ul class="text s1 mt40">
						<li><mark class="i_b_t3 bold">신청 기간</mark> : 상시 신청<li>
						<li class="mt20"><mark class="i_b_t3 bold">원고구성 및 내용</mark> : 4~5개 메뉴의 레시피와 사진 및 설명<li>
						<li class="mt20"><mark class="i_b_t3 bold">원고 접수</mark> : 원고는 대한영양사협회 교육팀 메일(<a href="mailto:kdabook@kdiet.or.kr" title="메일쓰기" class="link cm">kdabook@kdiet.or.kr</a>)로 송부
							<ul class="text small ca mt10 ml80">
								<li>※ 원고에 이름, 근무처, 직급, 연락처를 반드시 기재하여야 합니다.</li>
								<li>※ 접수된 원고는 반환하지 않으며, 원고의 저작물전송권은 ㈔대한영양사협회에 귀속됩니다.</li>
								<li>※ 채택된 원고는&nbsp;&nbsp;「국민영양」&nbsp;&nbsp;게재 시 개별적으로 통보하며, 소정의 원고료가 지급됩니다</li>
							</ul>
						<li>
					</ul>
				</div> -->
			</c:otherwise>
		</c:choose>

	</div>
</div>

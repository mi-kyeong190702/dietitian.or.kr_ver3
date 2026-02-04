<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<c:choose>
	<c:when test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.back();
		</script>
	</c:when>
	<c:otherwise>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격증</mark> 신청</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
				<li><a href="/work/education/ke_exam_situation.do" class="cm">자격증 신청(신규&middot;갱신)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab t2 div3 mb30">
			<ul>
				<li><a href="/work/education/ke_license.do">자격증 발급안내</a></li>
				<li><a href="/work/education/ke_application.do" class="on">자격증 신청하기</a></li>
				<li><a href="/work/education/ke_verification.do">자격증 신청확인</a></li>
			</ul>
		</div>									
		<h4 class="title bold t2 cm s1 i_b_t2 mt30">자격증 신청하기</h4>
		<div class="area text s1 pl30 pt40">
			<div class="bw0 fl mr30">
				<a href="ke_certifi_code.do?classifyCode=1"><span class="bold cw w290 mb5 p15 ke_application">01. 신규 발급 신청하기</span></a>
				<ul class="box w300 h100 r5 small ca p9 ke_application01">
					<li class="i_box_t1">정규시험 합격자</li>
					<li class="i_box_t1">재시험 합격자</li>
					<li class="i_box_t1">자격시험 합격자<br /><span class="ssmall cm">(석사이상/말소자)</span></li>
				</ul>
			</div>
			<div class="bw0 fl mr30">
				<a href="ke_certifi_code.do?classifyCode=2"><span class="bold cw w290 mb5 p15 ke_application_g">02. 갱신 발급 신청하기</span></a>
				<ul class="box w300 h100 r5 small ca p9 ke_application01">
					<li class="i_box_t1">자격증 유효기간 내에 전문연수교육 이수,&nbsp;&nbsp;회원자격 유지한 갱신대상자</li>
				</ul>
			</div>
			<!-- <div class="bw0 fl">
				<a href="ke_certifi_code.do?classifyCode=3"><span class="bold cw w180 mb5 p15 ke_application_a">03. 재발급 신청하기</span></a>
				<ul class="box w190 h100 r5 small ca p9 ke_application01">
					<li class="i_box_t1">분실한 경우</li>
					<li class="i_box_t1">정보 등의 수정을 요청하는 경우</li>
					<li class="i_box_t1">기타 인정되는 이유로 재발급을 요청하는 경우</li>
				</ul>
			</div> -->
		</div>
		<div class="area mt50">
			<h5 class="title bold t3 s1 i_b_t3 mt30">자격증 신규 발급 제출서류 및 입금안내</h5><br />
			<ul class="text s1 mt10 ml10">
				<li class="i_box_t1">경력증명서 또는 재직증명서 파일(1년이상 영양사 경력 기재, 직무 또는 직책에 '영양사' 기재시 인정)</li>
				<li class="i_box_t1 mt5">반명함판 사진 파일</li>
				<li class="i_box_t1 mt5">영양사면허증 파일</li>
				<li class="i_box_t1 mt5">전문영양사 회비 30,000원 / 비만인정(전문임상)영양사 회비 50,000원(신한은행 140-006-953960 (사)대한영양사협회)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;(※ 파일 첨부 시 압축 폴더로 첨부해야 함.)</li>
			</ul>
			
			<h5 class="title bold t3 s1 i_b_t3 mt30">자격증 갱신 신청서류 및 입금안내</h5><br />
			<ul class="text s1 mt10 ml10">
				<li class="i_box_t1">자격증 신청하기 → 갱신 발급 신청하기</li>
				<li class="i_box_t1 mt5">전문영양사 회비 30,000원 / 비만인정(전문임상)영양사 회비 50,000원 (신한은행 100-026-174963 (사)대한영양사협회)</li>
			</ul>
			
			<h5 class="title bold t3 s1 i_b_t3 mt30">자격증 재발급 신청서류 및 입금안내</h5><br />
			<ul class="text s1 mt10 ml10">
				<li class="i_box_t1">전문영양사코너 → 관련서식 다운로드 → 전문영양사 자격증 재발급 서류 작성 → 대한영양사협회 교육국 메일(kdasys@hanmail.net)로 발송 </li>
				<li class="i_box_t1 mt5">재발급비 10,000원 (신한은행 100-026-174963 (사)대한영양사협회)</li>
			</ul>
			
			<h5 class="title bold t3 s1 i_b_t6 mt30">문의처</h5><br />
			<ul class="text small s1 mt10 ml10">
				<li class="i_b_t7">(사)대한영양사협회 교육국</li>
				<li class="i_b_t7">Tel. 02-823-5680(교환 514)</li>
				<li class="i_b_t7">Fax. 02-823-5990</li>
				<li class="i_b_t7">E-mail. kdasys@hanmail.net</li>
				<li class="i_b_t7">주 소 : 서울특별시 영등포구63로40,202호(우편번호 07345)</li>
			</ul>
		</div>
	</div>
</div>
	</c:otherwise>
</c:choose>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>

<%@include file="/pages/common.jsp"%>
<script type="text/javascript">

function showPopup(bbsIdx) {  	
		$("#bbs_idx").val(bbsIdx);
		$('#popup_pwd').bPopup();  		
}

function f_pwdSubmit() {
	if( $("#passwd").val() == "" ) {
		alert("비밀번호를 입력해 주세요");
		return;
	}
	document.frmPwd.submit();
}

function f_SearchIt() {
	if( $("#srchWord").val() == "" ) {
		alert("검색어를 입력하여 주십시요");
		$("#srchWord").focus();
		return;
	}
	location.href="?srchKind=" + $("#srchKind").val() + "&srchWord=" + $("#srchWord").val();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양</mark>상담실</h3>
		</div>
					
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_counsel_board.do" class="cm">영양상담실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height: 800px;">
		<div class="box p20">
			<div class="form">
				<div class="f_wrap">
					<div class="f_field div1">
						<div class="title s1 i_b_t6">
							먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있습니다.
						</div>
						<div class="ff_wrap mt10">
							<div class="area">
								
								<select class="select t2 fl w150" id="srchKind" name="srchKind">
									<option value="1" <c:if test="${param.srchKind == '1' }">selected</c:if>>제목</option>
									<option value="2" <c:if test="${param.srchKind == '2' }">selected</c:if>>내용</option>
									<option value="3" <c:if test="${param.srchKind == '3' }">selected</c:if>>작성자</option>
								</select>
								<input type="text" class="input t1 fl w200 ml5" id="srchWord" name="srchWord" value="${param.srchWord}"/>
								<a href="javascript:f_SearchIt()" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="box bga text ssmall mt5 p10">
			* 본 게시판은 <mark class="cm">일반인을 위한 영양상담 코너</mark>입니다. 영양사님들은 회원게시판을 이용해 주시기 바랍니다.
		</div>
		<table class="table t1 text s1 ca center mt20">
			<colgroup>
				<col width="70" />
				<col width="*" />
				<col width="90" />
				<col width="110" />
				<col width="70" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col" class="bold cm">번호</th>
				<th scope="col" class="bold cm">제목</th>
				<th scope="col" class="bold cm">공개여부</th>
				<th scope="col" class="bold cm">등록일</th>
				<th scope="col" class="bold cm">조회</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${listHelper.list}" var="qna">
			<tr>
				<td>${qna.bbs_idx}</td>
				<td class="left link">
				
					<c:if test="${qna.bbs_pub == '1' }"><a href="./${kind}_view.do?curPage=${param.curPage}&bbs_idx=${qna.bbs_idx}&srchKind=${param.srchKind}&srchWord=${param.srchWord}">${qna.bbs_subject}</a></c:if>
					<c:if test="${qna.bbs_pub == '0' }">
						<c:choose>
							<c:when test="${ g_user_level <= 2 }">
									<a href="./${kind}_view.do?curPage=${param.curPage}&bbs_idx=${qna.bbs_idx}&srchKind=${param.srchKind}&srchWord=${param.srchWord}">${qna.bbs_subject}</a>
							</c:when>
							<c:otherwise>
									<a href="javascript:showPopup(${qna.bbs_idx})">${qna.bbs_subject}</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${qna.k_isreply == '1' }">[답변완료]</c:if>
				</td>
				<td>
					<c:if test="${ qna.bbs_pub == '1'}">공개</c:if>
					<c:if test="${ qna.bbs_pub == '0'}">비공개</c:if>
				</td>
				<td>${qna.bbs_date}</td>
				<td>${qna.bbs_view}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="btn_wrap mt20">
			<ul class="fr">
				<li><a href="./${kind}_form.do" class="btn big t1">글쓰기</a></li>
			</ul>
		</div>
		
	 	<kda:paging listHelper="${listHelper}"/>	
	 <!-- // Contents End -->
	</div>
</div>

<div id="popup_pwd" class="p_style"	style="width: 600px; height: 270px">
	<div id="popup">
		<div class="p_head" style="width: 570px;">
			<h2 class="title t3 cw bold s1 i_b_t6">비밀번호 확인</h2>
		</div>
		<div class="p_body text ca small center">
			<div class="p30">
				<form name="frmPwd" method="post" action="./${kind}_view.do?curPage=${param.curPage}&srchKind=${param.srchKind}&srchWord=${param.srchWord}" >
				<input type="hidden" name="bbs_idx" id="bbs_idx" value="" /> 
				<div class="area">비밀번호를 입력하여 주십시요.</div>
				<div class="area mt20">
					<input type="password" class="input t1 w200" id="passwd" name="passwd"  onKeyPress="if(event.keyCode==13){ f_pwdSubmit()}"/> 
					<a href="javascript:f_pwdSubmit();" class="btn form p5 t1">확인</a> 
				</div>
				</form>
			</div>
		</div>
		<div class="p_foot line bt">
			<div class="btn_wrap mt20">
				<ul>
					<li><a href="#" class="bClose">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>   


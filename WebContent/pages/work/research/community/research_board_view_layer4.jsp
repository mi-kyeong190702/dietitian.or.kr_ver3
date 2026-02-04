<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	
</script>
	
<div class="box t3 text ssmall">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${boardRow.atc_sbj}</h4>
			</div>
		</li>
		<li class="bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">작성자</strong>
				<span>${boardRow.atc_wrtr_nm}</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">답변통지구분</strong>
				<span>이메일</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">답변상태</strong>
				<span>
					<c:if test="${boardRow.atc_ans_stt_se == 'AN'}">답변중</c:if>
					<c:if test="${boardRow.atc_ans_stt_se == 'AD'}">완료</c:if>
				</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">면허번호</strong>
				<span>${boardRow.lic_no}</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">면허발급년월일</strong>
				<span>${boardRow.lic_print_dt}</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">공개여부</strong>
				<span>
					<c:if test="${boardRow.atc_scratc_yn == 'Y'}">비공개</c:if>
					<c:if test="${boardRow.atc_scratc_yn == 'N'}">공개</c:if>
				</span>
			</div>
		</li>
		<li class="fl w50p bgw line">
			<div class="p10 pl15">
				<strong class="ib w100 bold cm">첨부파일</strong>
				<span>
					<c:if test="${null ne boardRow.bbs_file_name && boardRow.bbs_file_name != ''}">
					<c:set var="str" value="${boardRow.bbs_file_type}" />	
					<c:if test="${str == 'xlsx' }"><c:set var="str" value="xls"/> </c:if>
						<span class="i_file ${str} mr10"></span>
						<a href="javascript:doFileDownLoad('${boardRow.atc_sno}')">
						<fmt:parseNumber var="size1" integerOnly="true" type="number" value="${boardRow.bbs_file_size/1024}" />
						${boardRow.bbs_file_name} (<c:out value="${size1}" />KByte)</a>
					</c:if>
				</span>
			</div>
		</li>
	</ul>
</div>
<div class="line bb p30 text">
	<h4 class="ti">본문</h4>
		<iframe name="bbs_contents" width="682" scrolling="no" src="/research_board_view_contents.do?bbs_cd=004&atc_sno=${requestScope.boardRow.atc_sno}" onload="javascript:setIFrameHeight(this)"></iframe>
	<br>
</div>
<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
	</ul>
	<ul class="fr">
		<c:if test="${boardRow.ar_state!='1' && boardRow.ar_state!='2' }">
		<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>		
		<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
		</c:if>
	</ul>
</div>

	<c:choose>
			<c:when test="${replyRow.size() > 0 }">
			<!-- 답변 있을때 S -->
			<c:forEach var="i" begin="0" end="${replyRow.size()-1 }">
			<div class="box t3 mt30 text ssmall">
				<ul class="area">
					<li class="line bb bgs">
						<div class="p10 pl15">
							<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${replyRow[i].atc_sbj}</h4>
						</div>
					</li>
					<li class="fl w50p bgw line">
						<div class="p10 pl15">
							<strong class="ib w100 bold cm">담당부서</strong>
							<span>${replyRow[i].atc_wrtr_dpt_nm}</span>
						</div>
					</li>
					<li class="fl w50p bgw line">
						<div class="p10 pl15">
							<strong class="ib w100 bold cm">담당자</strong>
							<span>${replyRow[i].atc_wrtr_nm}</span>
						</div>
					</li>
					<li class="fl w50p bgw line">
						<div class="p10 pl15">
							<strong class="ib w100 bold cm">답변통지구분</strong>
							<span>이메일</span>
						</div>
					</li>
					<li class="fl w50p bgw line">
						<div class="p10 pl15">
							<strong class="ib w100 bold cm">답변상태</strong>
							<span>완료</span>
						</div>
					</li>
				</ul>
			</div>
			<div class="line bb p30 text">
				<h4 class="ti">본문</h4>
				${replyRow[i].atc_cn}
			</div>
			<div class="line bt mt10 text ssmall">
				<h4 class="ti">첨부파일</h4>
				<ul>
					<li>
						<div class="pr p15 line bb">
							<strong class="pa l15 t15 bold cm">첨부</strong>
							<span class="link ml100">				
							<c:choose>								
									<c:when test="${null ne replyRow[i].bbs_file_name && replyRow[i].bbs_file_name != ''}">
										<c:set var="str2" value="${replyRow[i].bbs_file_type}" />	
										<c:if test="${str2 == 'xlsx' }"><c:set var="str2" value="xls"/> </c:if>
											<span class="i_file ${str2} mr10"></span>
											<a href="javascript:doFileDownLoad('${replyRow[i].atc_sno}')">
											<fmt:parseNumber var="size2" integerOnly="true" type="number" value="${replyRow[i].bbs_file_size/1024}" />
											${replyRow[i].bbs_file_name} (<c:out value="${size2}" />KByte)</a>
									</c:when>
							
									<c:otherwise>
											첨부파일이 없습니다.
									</c:otherwise>
							</c:choose>
							</span>				
						</div>
					</li>
				</ul>
			</div>
			</c:forEach>
			<!-- 답변 있을때 E -->
			</c:when>
			<c:otherwise>

			<!-- 답변 없을때 S -->
			<div class="box t3 mt30 text ssmall">
				<ul class="area">
					<li class="bgs">
						<div class="p10 pl15">
							<h4 class="title i_b_t6"><strong class="ti">제목 </strong>등록된 답변이 없습니다.</h4>
						</div>
					</li>
				</ul>
			</div>
			<!-- 답변 없을때 E -->
			
			</c:otherwise>
	</c:choose>

<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
	</ul>
	
	<c:if test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
	<c:choose>
		<c:when test="${replyRow.size() > 0 }">
			<ul class="fr">
				<li><a href="javascript:reModify(${replyRow[0].atc_sno});" class="btn big t4">수정</a></li>
				<li><a href="javascript:reDelete(${replyRow[0].atc_sno});" class="btn big t4">삭제</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="fr">
				<li><a href="javascript:doReply();" class="btn big t1">등록</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
	</c:if>
	
</div>

<div class="secret_box">
	<form onsubmit="return false;">
		<fieldset>
			<legend><span class="ti">비밀번호 입력</span></legend>
			<div class="area">
				<label for="kda_user_id"><span class="ti">비밀번호</span></label>
				<input type="password" class="fl input t2 w150" id="pass" placeholder="비밀번호" />
				<input type="hidden" id="atcsno" />
				<input type="hidden" id="btncd" />
				<button type="button" class="fl ml5 btn t1 form" onclick="authCheck();">확인</button>
				<a href="javascript:doSecretClose();" class="fl ml5 btn" title="닫기">X</a>
			</div>
		</fieldset>
	</form>
</div>

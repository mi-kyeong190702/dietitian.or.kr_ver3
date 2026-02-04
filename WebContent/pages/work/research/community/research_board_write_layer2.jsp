<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	var state = "<c:out value="${loginVo.pers_state}" />";
	
	if(state!='00'&&state!='01'){
		alert("권한이 없습니다");
		location.href="/research_index.jsp";
	}
	
</script>

<div class="form line bt bcm bw2">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>질문</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1" id="atc_sbj" name="atc_sbj" value="${boardRow.atc_sbj}"  maxlength="50"/>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid2" class="ff_title i_b"><strong>작성자</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<c:if test="${board_form=='modify' }">
					<input type="text" class="input t1 w200" id="atc_wrtr_nm" name="atc_wrtr_nm" value="${boardRow.atc_wrtr_nm}" maxlength="8" />
					</c:if>
					<c:if test="${board_form!='modify' }">
					<input type="text" class="input t1 w200" id="atc_wrtr_nm" name="atc_wrtr_nm" value="관리자" maxlength="8" />
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title i_b"><strong>게시여부</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<input type="radio" class="mr5" name="radio1" id="radio1_1" value="Y"  <c:if test="${boardRow.atc_pst_yn == 'Y'}"><c:out value="checked"/></c:if> />
					<label for="radio1_1" class="mr20">게시</label>
					<input type="radio" class="mr5" name="radio1" id="radio1_2" value="N"  <c:if test="${boardRow.atc_pst_yn == 'N'}"><c:out value="checked"/></c:if> />
					<label for="radio1_2" class="mr20">미게시</label>
				</div>
				<input type="hidden" id="atc_pst_yn" name="atc_pst_yn" value="" />
			</div>
		</div>
	</div>
	<!-- <div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title i_b"><strong>옵션</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<input type="checkbox" class="mr5" name="checkbox1" id="checkbox1_1" />
					<label for="checkbox1_1" class="mr20">HTML</label>
				</div>
			</div>
		</div>
	</div> -->
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid18" class="ff_title i_b"><strong>답변</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid19" class="ti">기본주소</label>
					<textarea class="textarea t1 h350" id="atc_cn" name="atc_cn" />${boardRow.atc_cn}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid11" class="ff_title"><strong>첨부파일</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="file" class="file t1" id="bbs_file1" name="bbs_file1" />
				</div>
				<div class="area text mt5">
					<c:if test="${board_form=='modify' }">
						파일명 ( ${boardRow.bbs_file_name} <input type="checkbox" name="filecheck" id="filecheck" /> <label for="filecheck">삭제</label> )
						<input type="hidden" name="bbs_file_url" id="bbs_file_url" value="${boardRow.bbs_file_url}" />
						<input type="hidden" name="file_yn" id="file_yn" value="" />
					</c:if>										
				</div>
			</div>
		</div>
	</div>
</div>



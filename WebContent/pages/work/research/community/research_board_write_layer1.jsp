<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>

<script type="text/javascript">
	var state = "<c:out value="${loginVo.pers_state}" />";
	
	if(state!='00'&&state!='01'){
		alert("권한이 없습니다");
		location.href="/research_index.jsp";
	}
	
	$(function() {
		
		$("#atc_impatc_bgn_dttm").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#atc_impatc_end_dttm").datepicker({
			dateFormat: "yy-mm-dd"
		});
		
		
		$('#atc_impatc_bgn_dttm').datepicker("option", "maxDate", $("#atc_impatc_end_dttm").val());
	    $('#atc_impatc_bgn_dttm').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#atc_impatc_end_dttm").datepicker( "option", "minDate", selectedDate );
	    });
	    
	    $('#atc_impatc_end_dttm').datepicker("option", "minDate", $("#atc_impatc_bgn_dttm").val());
	    $('#atc_impatc_end_dttm').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#atc_impatc_bgn_dttm").datepicker( "option", "maxDate", selectedDate );
	    });
	    
	});
	
	function pick(id){
		$("#"+id).focus();
	}
</script>



<div class="form line bt bcm bw2">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>제목</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1" id="atc_sbj" name="atc_sbj" value="${boardRow.atc_sbj}" maxlength="50"/>
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
	<!-- 
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid3" class="ff_title"><strong>연락처</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select class="select t2 fl w100" id="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					<label for="inputid4" class="fl text ml10 mr10">-</label>
					<input type="text" class="input t1 fl w100" id="tel2" />
					<label for="inputid5" class="fl text ml10 mr10">-</label>
					<input type="text" class="input t1 fl w100" id="tel3" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid6" class="ff_title"><strong>이메일</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 fl w200" id="mail1" />
					<label for="inputid7" class="fl text ml10 mr10">@</label>
					<input type="text" class="input t1 fl w150" id="mail2" />
					<label for="inputid8" class="ti">이메일 입력</label>
					<select class="select t2 fl w150 ml5" id="inputid8"  onchange="selectMail(this.value);">
						<option value="">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
						<option value="hanmail.net">다음</option>
						<option value="yahoo.co.kr">야후</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	 -->
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title"><strong>게시여부</strong></div>
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
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title"><strong>중요공지기간</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<label for="inputid9" class="ti">시작일</label>
					<input type="text" class="input t1 fl w150" id="atc_impatc_bgn_dttm" name="atc_impatc_bgn_dttm" readonly="readonly" onclick="this.value='';" value="${boardRow.atc_impatc_bgn_dttm }"/>
					<a href="#" onclick="pick('atc_impatc_bgn_dttm');return false;" class="btn form t1 fl ml5 p0" id="pick1">달력</a>
					<span class="fl text ml10 mr10">~</span>
					<label for="inputid10" class="ti">종료일</label>
					<input type="text" class="input t1 fl w150" id="atc_impatc_end_dttm" name="atc_impatc_end_dttm" readonly="readonly" onclick="this.value='';" value="${boardRow.atc_impatc_end_dttm }"/>
					<a href="#" onclick="pick('atc_impatc_end_dttm');return false;" class="btn form t1 fl ml5 p0" id="pick2">달력</a>
				</div>
				<input type="hidden" id="atc_impatc_yn" name="atc_impatc_yn" value="" />
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="textarea1" class="ff_title i_b"><strong>내용</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
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
	<!-- <div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid12" class="ff_title i_b"><strong>비밀번호</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="password" class="input t1 w200" id="atc_pwd" name="atc_pwd" />
				</div>
			</div>
		</div>
	</div> -->
</div>



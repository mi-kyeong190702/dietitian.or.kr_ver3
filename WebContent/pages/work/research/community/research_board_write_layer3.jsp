<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="form line bt bcm bw2">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>제목</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
				<c:choose>
					<c:when test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
						<c:if test="${board_form=='modify' }">
						<input type="text" class="input t1" id="atc_sbj" name="atc_sbj" value="${boardRow.atc_sbj}"  maxlength="50"/>
						</c:if>
						<c:if test="${board_form!='modify' }">
						<input type="text" class="input t1" id="atc_sbj" name="atc_sbj" value="답변입니다."  maxlength="50"/>
						</c:if>						
					</c:when>
					<c:otherwise>
					<input type="text" class="input t1" id="atc_sbj" name="atc_sbj" value="${boardRow.atc_sbj}"  maxlength="50"/>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid2" class="ff_title i_b"><strong>작성자</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
				<c:choose>
						<c:when test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
							<c:if test="${board_form=='modify' }">
							<input type="text" class="input t1 w200" id="atc_wrtr_nm" name="atc_wrtr_nm" value="${boardRow.atc_wrtr_nm}" maxlength="8" />
							</c:if>
							<c:if test="${board_form!='modify' }">
							<input type="text" class="input t1 w200" id="atc_wrtr_nm" name="atc_wrtr_nm" value="관리자" maxlength="8" />
							</c:if>						
						</c:when>
						<c:otherwise>
						<input type="text" class="input t1 w200" id="atc_wrtr_nm" name="atc_wrtr_nm" value="${boardRow.atc_wrtr_nm}" maxlength="8" />	
						</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
	<c:if test="${act=='reply' || act=='modify'}"><!-- 관리자일때 조건 추가 -->
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid2" class="ff_title i_b"><strong>담당부서</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<c:if test="${board_form=='modify' }">
					<input type="text" class="input t1 w200" id="atc_wrtr_dpt_nm" name="atc_wrtr_dpt_nm" value="${boardRow.atc_wrtr_dpt_nm}" />
					</c:if>
					<c:if test="${board_form!='modify' }">
					<input type="text" class="input t1 w200" id="atc_wrtr_dpt_nm" name="atc_wrtr_dpt_nm" value="면허신고센터" />
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	</c:if>
	<c:if test="${act=='modify' || act=='write' }"> <!-- 관리자는 연락처, 이메일 입력 제외 -->
	<c:set var="tel" value="${fn:split(boardRow.atc_wrtr_cttno,'-') }"/>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid3" class="ff_title i_b"><strong>연락처</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select class="select t2 fl w100" id="tel1" name="tel1">
						<option value="010" <c:if test="${tel[0] == '010'}"><c:out value="selected"/></c:if> >010</option>
						<option value="011" <c:if test="${tel[0] == '011'}"><c:out value="selected"/></c:if> >011</option>
						<option value="016" <c:if test="${tel[0] == '016'}"><c:out value="selected"/></c:if> >016</option>
						<option value="017" <c:if test="${tel[0] == '017'}"><c:out value="selected"/></c:if> >017</option>
						<option value="019" <c:if test="${tel[0] == '019'}"><c:out value="selected"/></c:if> >019</option>
					</select>
					<label for="inputid4" class="fl text ml10 mr10">-</label>
					<input type="text" class="input t1 fl w100" id="tel2" name="tel2" value="${tel[1] }" maxlength="4" />
					<label for="inputid5" class="fl text ml10 mr10">-</label>
					<input type="text" class="input t1 fl w100" id="tel3" name="tel3" value="${tel[2] }" maxlength="4" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid6" class="ff_title i_b"><strong>이메일</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" class="input t1 fl w200" id="mail1" name="mail1" value="${boardRow.atc_wrtr_eml }" maxlength="15" />
					<label for="inputid7" class="fl text ml10 mr10">@</label>
					<input type="text" class="input t1 fl w150" id="mail2" name="mail2" value="${boardRow.atc_wrtr_eml2 }" maxlength="20" />
					<label for="inputid8" class="ti">이메일 입력</label>
					<select class="select t2 fl w150 ml5" id="inputid8" onchange="selectMail(this.value);">
						<option value="" >직접입력</option>
						<c:forEach var="result" items="${getEmail}" varStatus="status">
						<option value="<c:out value="${result.detcodename}"/>" <c:if test="${result.detcodename==boardRow.atc_wrtr_eml2}"> selected="selected"</c:if>  ><c:out value="${result.detcodename}"/></option>														
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${act!='reply'}">
		<div class="f_wrap line bb p8">
			<div class="f_field div2">
				<div class="ff_title i_b"><strong>면허번호</strong></div>
				<div class="ff_wrap ml120">
					<div class="area text">
						<input type="text" class="input t1 fl w130" name="lic_no" id="lic_no" maxlength="6" value="${boardRow.lic_no}" />
					</div>
				</div>
			</div>
			<div class="f_field div2">
				<div class="ff_title i_b"><strong>면허발급년월일</strong></div>
				<div class="ff_wrap ml120">
					<div class="area text">
						<input type="text" class="input t1 fl w150" name="lic_print_dt" id="lic_print_dt" maxlength="8" value="${boardRow.lic_print_dt}"/>
						<p class="fl text cp s1 ml10">예) 20150101</p> 
					</div>
				</div>
			</div>
		</div>
	</c:if>
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
					<input type="file" class="file t1" id="bbs_file1" name="bbs_file1"  />
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
	
	<c:if test="${act=='write' || act=='reply'}">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid12" class="ff_title i_b"><strong>비밀번호</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="password" class="input t1 w200" id="atc_passwd" name="atc_passwd" maxlength="6"/>
					<span class="ssmall">( <span> 비밀번호 6자리까지 가능합니다.</span> )</span>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<input type="hidden" name="atc_scratc_yn" id="atc_scratc_yn"/>
	<input type="hidden" name="atc_ans_eml_ntc_yn" id="atc_ans_eml_ntc_yn"/>
	<input type="hidden" name="atc_pst_yn" id="atc_pst_yn"/>
	
</div>
					
					

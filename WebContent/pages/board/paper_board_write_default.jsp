<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="kda.SessionInfo"%>

<div class="f_wrap line bb p8">
	<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>제목</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_subject" id="bbs_subject" class="input t1" value="${requestScope.boardRow.bbs_subject}" />
				</div>
			</div>
		</div>
	</div>
	

	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>이름</strong></label>
			<div class="ff_wrap ml120">
				
			<c:choose>
				<c:when test="${param.bbs_board_code == '88' }">
				<div class="p10 pl10">
					<input type="hidden" name="bbs_name" id="bbs_name" value="관리자" />
					<span>관리자</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="area">
					<c:if test="${requestScope.boardRow.bbs_name != ''}"><input type="text" name="bbs_name" class="input t1 w200" id="bbs_name"	 value="${requestScope.boardRow.bbs_name}"></c:if> 
					<c:if test="${requestScope.boardRow.bbs_name == ''}"><input type="text" name="bbs_name" class="input t1 w200" id="bbs_name"	 value="${g_pers_name}"></c:if>
				</div>	
			</c:otherwise>
		</c:choose>
				
			</div>
		</div>
	</div>
	<c:if test="${param.bbs_board_code == '66' }">
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>카테고리</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select  class="select t2 w150" name='bbs_category' id='bbs_category'>
						<option value='ADA' <c:if test="${requestScope.boardRow.bbs_category == 'ADA'}">selected</c:if>>ADA</option>
						<option value='영양일본' <c:if test="${requestScope.boardRow.bbs_category == '영양일본'}">selected</c:if>>영양일본</option>
						<option value='임상영양' <c:if test="${requestScope.boardRow.bbs_category == '임상영양'}">selected</c:if>>임상영양</option>
						<option value='학교급식' <c:if test="${requestScope.boardRow.bbs_category == '학교급식'}">selected</c:if>>학교급식</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${param.bbs_board_code != '88' }">
	<!-- 
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>이메일</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_email" class="input t1 w200" id="bbs_email" value="${requestScope.boardRow.bbs_email}" />
				</div>
			</div>
		</div>
	</div>
	 -->
	</c:if>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title i_b"><strong>옵션</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<input type="checkbox" class="mr5" name="bbs_html" id="bbs_html" <c:if test="${requestScope.boardRow.bbs_html == 'on'}"><c:out value="checked"/></c:if> />
					<label for="bbs_html" class="mr20">HTML</label>				
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title i_b"><strong>게시물 공개 선택</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<input type="radio" class="mr5" id="bbs_visible_y" name="bbs_visible_yn" value="Y" <c:if test="${requestScope.boardRow.bbs_visible_yn == 'Y'}"><c:out value="checked"/></c:if> />
					공개
					&nbsp;&nbsp;<input type='radio' class="mr5" id="bbs_visible_n" name='bbs_visible_yn' value="N" <c:if test="${requestScope.boardRow.bbs_visible_yn == 'N'}"><c:out value="checked"/></c:if> />
					비공개  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight:bold;">게시글 비공개 설정 시 작성자 본인에게만 제목과 내용이 노출됩니다.</span>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid18" class="ff_title i_b"><strong>내용</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid19" class="ti">기본주소</label>
					<textarea id="bbs_contents" name="bbs_contents" class="textarea t1 h350" />${requestScope.boardRow.bbs_contents}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid5" class="ff_title"><strong>첨부파일1</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid5" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url" value="${requestScope.boardRow.bbs_file_url}" />					
					<input type="file" name="bbs_file1" class="file t1" id="inputid5" />					
					<!-- File1 -->
					<c:if test="${requestScope.boardRow.bbs_file_name != ''}">
						<li class="p10 pl15 link bold line dot bb">			
							<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>				
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
								<fmt:parseNumber var="size" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
								${requestScope.boardRow.bbs_file_name} (<c:out value="${size}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk"/>
							</a>
						</li>
					</c:if>					
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid6" class="ff_title"><strong>첨부파일2</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid6" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url2" value="${requestScope.boardRow.bbs_file_url2}" />
					<input type="file" name="bbs_file2" class="file t1" id="inputid6" />					
					<!-- File2 -->
					<c:if test="${requestScope.boardRow.bbs_file_name2 != ''}">
						<li class="p10 pl15 link bold line dot bb">			
							<span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>				
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',0)">
								<fmt:parseNumber var="size2" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size2/1024}" />
								${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk2" id="file_del_chk2"/> 
							</a>
						</li>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid7" class="ff_title"><strong>첨부파일3</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid7" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url3" value="${requestScope.boardRow.bbs_file_url3}" />
					<input type="file" name="bbs_file3" class="file t1" id="inputid7" />					
					<!-- File3 -->
					<c:if test="${requestScope.boardRow.bbs_file_name3 != ''}">
						<li class="p10 pl15 link bold line dot bb">			
							<span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>				
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',0)">
								<fmt:parseNumber var="size3" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size3/1024}" />
								${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk3" id="file_del_chk3"/> 
							</a>
						</li>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
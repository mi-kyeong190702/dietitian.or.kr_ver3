<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<label for="inputid2" class="ff_title i_b"><strong>분류</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select class="select t2 fl w100" id="bbs_category" name="bbs_category">
						<option value="일반" <c:if test="${requestScope.boardRow.bbs_category == '일반' }">selected</c:if> >일반</option>
						<option value="교육" <c:if test="${requestScope.boardRow.bbs_category == '교육' }">selected</c:if> >교육</option>
						<option value="행사" <c:if test="${requestScope.boardRow.bbs_category == '행사' }">selected</c:if> >행사</option>
						<option value="정책" <c:if test="${requestScope.boardRow.bbs_category == '정책' }">selected</c:if> >정책</option>
						<option value="보도" <c:if test="${requestScope.boardRow.bbs_category == '보도' }">selected</c:if> >보도</option>
						<option value="기타" <c:if test="${requestScope.boardRow.bbs_category == '기타' }">selected</c:if> >기타</option>
					</select>
				</div>
			</div>
		</div>
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>연락처</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_tel" class="input t1 w200" id="bbs_tel" value="${requestScope.boardRow.bbs_tel}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8"> 
		<div class="f_field div1">
		
			<label for="inputid4" class="ff_title i_b"><strong>담당자</strong></label>			
			<div class="ff_wrap ml120">
				<div class="area">
					<c:if test="${requestScope.boardRow.bbs_name != ''}"><input type="text" name="bbs_name" class="input t1 w200" id="bbs_name"	 value="${requestScope.boardRow.bbs_name}"></c:if> 
					<c:if test="${requestScope.boardRow.bbs_name == ''}"><input type="text" name="bbs_name" class="input t1 w200" id="bbs_name"	 value="${g_pers_name}"></c:if>
				</div>
			</div>
		</div>
	</div>
	
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
					비공개
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
					<c:if test="${requestScope.boardRow.bbs_file_name != '' }">
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
					<c:if test="${requestScope.boardRow.bbs_file_name2 != '' }">
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
					<c:if test="${requestScope.boardRow.bbs_file_name3 != '' }">						
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
	
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid8" class="ff_title"><strong>첨부파일4</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid8" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url4" value="${requestScope.boardRow.bbs_file_url4}" />
					<input type="file" name="bbs_file4" class="file t1" id="inputid8" />
					
					<!-- File4 -->
					<c:if test="${requestScope.boardRow.bbs_file_name4 != '' }">
						<li class="p10 pl15 link bold line dot bb">					
							<span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',0)">
								<fmt:parseNumber var="size4" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size4/1024}" />
									${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk4" id="file_del_chk4"/>
							</a>
						</li>
					</c:if>						
				</div>
			</div>
		</div>
	</div>
	
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid9" class="ff_title"><strong>첨부파일5</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid9" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url5" value="${requestScope.boardRow.bbs_file_url5}" />
					<input type="file" name="bbs_file5" class="file t1" id="inputid9" />
										
					<!-- File5 -->
					<c:if test="${requestScope.boardRow.bbs_file_name5 != '' }">
						<li class="p10 pl15 link bold line dot bb">					
							<span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',3)">
								<fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
									${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk5" id="file_del_chk5"/> 
							</a>
						</li>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
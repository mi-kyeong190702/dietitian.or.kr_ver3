<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
	<c:when test="${requestScope.bbs_board_code == 69 || requestScope.bbs_board_code == 157}"><input type="hidden" name="bbs_category" value="서울" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 70 || requestScope.bbs_board_code == 158}"><input type="hidden" name="bbs_category" value="부산" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 71 || requestScope.bbs_board_code == 159}"><input type="hidden" name="bbs_category" value="인천" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 72 || requestScope.bbs_board_code == 160}"><input type="hidden" name="bbs_category" value="경기" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 73 || requestScope.bbs_board_code == 161}"><input type="hidden" name="bbs_category" value="강원" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 74 || requestScope.bbs_board_code == 162}"><input type="hidden" name="bbs_category" value="충북" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 75 || requestScope.bbs_board_code == 163}"><input type="hidden" name="bbs_category" value="대전충남세종" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 76 || requestScope.bbs_board_code == 164}"><input type="hidden" name="bbs_category" value="전북" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 77 || requestScope.bbs_board_code == 165}"><input type="hidden" name="bbs_category" value="광주전남" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 78 || requestScope.bbs_board_code == 166}"><input type="hidden" name="bbs_category" value="대구경북" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 79 || requestScope.bbs_board_code == 167}"><input type="hidden" name="bbs_category" value="경남" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 80 || requestScope.bbs_board_code == 168}"><input type="hidden" name="bbs_category" value="울산" /></c:when>
	<c:when test="${requestScope.bbs_board_code == 81 || requestScope.bbs_board_code == 169}"><input type="hidden" name="bbs_category" value="제주" /></c:when>
	<c:otherwise><input type="hidden" name="bbs_category" value="" /></c:otherwise>
</c:choose>

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
	
<%-- 	<c:if test="${requestScope.boardRow.bbs_file_name != ''  --%>
<%-- 				|| requestScope.boardRow.bbs_file_name2 != '' --%>
<%-- 				|| requestScope.boardRow.bbs_file_name3 != '' --%>
<%-- 				|| requestScope.boardRow.bbs_file_name4 != '' --%>
<%-- 				|| requestScope.boardRow.bbs_file_name5 != ''}"> --%>
<!-- 	<div class=" line bb bw2 text small"> -->
<!-- 		<div class="pr"> -->
<!-- 			<h4 class="pa l15 t10 bold cm">파일삭제</h4> -->
<!-- 			<ul class="ml100"> -->
<!-- 			<!-- File1 -->
<%-- 				<c:if test="${requestScope.boardRow.bbs_file_name != ''}"> --%>
<%-- 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.bbs_file_name} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="checkbox1" id="checkbox2_1"/></li> --%>
<%-- 				</c:if> --%>
<!-- 			<!-- File2 -->
<%-- 				<c:if test="${requestScope.boardRow.bbs_file_name2 != ''}"> --%>
<%-- 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.bbs_file_name2} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="checkbox2" id="checkbox2_2"/></li> --%>
<%-- 				</c:if> --%>
<!-- 			<!-- File3 -->
<%-- 				<c:if test="${requestScope.boardRow.bbs_file_name3 != ''}"> --%>
<%-- 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.bbs_file_name3} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="checkbox3" id="checkbox2_3"/></li> --%>
<%-- 				</c:if> --%>
<!-- 			<!-- File4 -->
<%-- 				<c:if test="${requestScope.boardRow.bbs_file_name4 != ''}"> --%>
<%-- 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.bbs_file_name4} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="checkbox4" id="checkbox2_4"/></li> --%>
<%-- 				</c:if> --%>
<!-- 			<!-- File5 -->
<%-- 				<c:if test="${requestScope.boardRow.bbs_file_name5 != ''}"> --%>
<%-- 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.bbs_file_name5} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="checkbox5" id="checkbox2_5"/></li> --%>
<%-- 				</c:if> --%>
<%-- 				파일 첨부가 있을경우 기존파일은 <font color="red">삭제</font>됩니다.  --%>
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</div> -->
<%-- 	</c:if> --%>

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
						<c:choose>
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type) >-1}">
								<li class="p10 pl15 link bold">${requestScope.boardRow.bbs_file_name}</li>
							</c:when>
							<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type) >-1}">
								<embed src="${requestScope.boardRow.bbs_file_url}" 
									   loop="true" 
									   menu="false" 
									   quality="high" 
									   bgcolor="#FFFFFF" 
									   name="file" 
									   type="application/x-shockwave-flash" 
									   pluginspage="http://www.macromedia.com/go/getflashplayer">
								</embed>
							</c:when>				
							<c:otherwise>		
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
											${requestScope.boardRow.bbs_file_name} (${requestScope.boardRow.bbs_file_size / 1024}) KByte 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk" value="N"/>
										</a>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>				
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
									${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk2" id="file_del_chk2" value="N"/>
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
									${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk3" id="file_del_chk3" value="N"/>
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
									${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk4" id="file_del_chk4" value="N"/>
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
							<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
								<fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
									${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk5" id="file_del_chk5" value="N"/>
							</a>
						</li>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function toggleTopOrder() {
    var checkbox = document.getElementById('bbs_notice_str');
    var selectBox = document.getElementById('bbs_notice_order');
    selectBox.style.display = checkbox.checked ? 'inline' : 'none';
}

// 페이지 로드시 상태 반영
window.onload = function() {
    toggleTopOrder();
};
</script>

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
	
		<c:if test="${requestScope.boardSettings.bs_Category != '' &&  requestScope.boardSettings.bs_Category == 1}">
		<div class="f_wrap line bb p8">
			<c:if test="${f:length(requestScope.boardSettings.bs_CategoryType) > 0}">
				<c:set var="str" value="${requestScope.boardSettings.bs_CategoryType}"/>
				<c:if test="${spt != ''}">
					<c:set var="doneLoop" value="false"/>
					<div class="f_field div2">
						<label for="inputid2" class="ff_title i_b"><strong>자료분류</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<select class="select t2 fl w100" id="bbs_category" name="bbs_category">
									<c:forEach var="spt" items="${f:split(str, ',')}"  varStatus="status">
										<option value="${spt}" <c:if test="${requestScope.boardRow.bbs_category == spt }">selected</c:if> >${spt}</option>
										<c:set var="doneLoop" value="true"/>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
		</c:if>
		<c:set var="chkIsTel" value="false"></c:set>
		<c:if test=" ${ chkIsTel  } ">
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>연락처</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_tel" class="input t1 w200" id="bbs_tel" value="${requestScope.boardRow.bbs_tel}" />
				</div>
			</div>
		</div>
		
		</c:if>
	
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
					
					<!-- TOP 체크박스 -->
					<input type="checkbox" class="mr5" name="bbs_notice_str" id="bbs_notice_str" value="1"
					    <c:if test="${requestScope.boardRow.bbs_notice_str == '1'}">checked</c:if>
					    onclick="toggleTopOrder()" />
					<label for="bbs_notice_str" class="mr20">TOP</label>
					<select name="bbs_notice_order" id="bbs_notice_order" style="display:none;">
					    <c:forEach var="i" begin="1" end="10">
					        <option value="${i}" <c:if test="${requestScope.boardRow.bbs_notice_order == i}">selected</c:if>>${i}</option>
					    </c:forEach>
					</select>	
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
					<textarea id="bbs_contents" name="bbs_contents" >${requestScope.boardRow.bbs_contents}</textarea>
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
						<c:choose>
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
								<c:if test="${f:indexOf('pdf,hwp,xls,zip,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type) >-1 }">
									<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>				
									<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
										<fmt:parseNumber var="size1" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
										${requestScope.boardRow.bbs_file_name} (<c:out value="${size1}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk"/>
									</a>
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
						<c:choose>
							<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type2) >-1}">
								<embed src="${requestScope.boardRow.bbs_file_url2}" 
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
								<c:if test="${f:indexOf('pdf,hwp,xls,zip,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type2) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>				
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',0)">
											<fmt:parseNumber var="size2" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size2/1024}" />
											${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk2" id="file_del_chk2"/> 
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
			<label for="inputid7" class="ff_title"><strong>첨부파일3</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid7" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url3" value="${requestScope.boardRow.bbs_file_url3}" />
					<input type="file" name="bbs_file3" class="file t1" id="inputid7" />
					
					<!-- File3 -->
					<c:if test="${requestScope.boardRow.bbs_file_name3 != '' }">
						<c:choose>							
							<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type3) >-1}">
								<embed src="${requestScope.boardRow.bbs_file_url3}" 
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
								<c:if test="${f:indexOf('pdf,hwp,xls,zip,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type3) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>				
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',0)">
											<fmt:parseNumber var="size3" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size3/1024}" />
											${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk3" id="file_del_chk3"/>
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
			<label for="inputid8" class="ff_title"><strong>첨부파일4</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid8" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url4" value="${requestScope.boardRow.bbs_file_url4}" />
					<input type="file" name="bbs_file4" class="file t1" id="inputid8" />
					
					<!-- File4 -->
					<c:if test="${requestScope.boardRow.bbs_file_name4 != '' }">
						<c:choose>							
							<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type4) >-1}">
								<embed src="${requestScope.boardRow.bbs_file_url4}" 
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
								<c:if test="${f:indexOf('pdf,hwp,xls,zip,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type4) >-1 }">
									<li class="p10 pl15 link bold line dot bb">			
										<span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>		
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',0)">
											<fmt:parseNumber var="size4" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size4/1024}" />
											${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk4" id="file_del_chk4"/>
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
			<label for="inputid9" class="ff_title"><strong>첨부파일5</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid9" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url5" value="${requestScope.boardRow.bbs_file_url5}" />
					<input type="file" name="bbs_file5" class="file t1" id="inputid9" />
										
					<!-- File5 -->
					<c:if test="${requestScope.boardRow.bbs_file_name5 != '' }">
						<c:choose>
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type5) >-1}">						
								<img src="${requestScope.boardRow.bbs_file_url5}" 
									 alt="${requestScope.boardRow.bbs_file_name5}">
							</c:when>
							<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type5) >-1}">
								<embed src="${requestScope.boardRow.bbs_file_url5}" 
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
								<c:if test="${f:indexOf('pdf,hwp,xls,zip', requestScope.boardRow.bbs_file_type5) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
											<fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
											${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk5" id="file_del_chk5"/>
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
</div>
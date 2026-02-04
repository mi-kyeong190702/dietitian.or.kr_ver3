<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	strong, b {font-weight:bold;}
</style>

<div class="box t3 text small">
	<ul class="area">
		<li class="line bb bgs">
			<div class="p10 pl15">
				<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${requestScope.boardRow.bbs_subject}</h4>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm ">작성자</strong>
				<span>${requestScope.boardRow.bbs_name}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">등록일</strong>
				<span>${f:substring(requestScope.boardRow.bbs_reg_date_dt, 0, 10)}</span>
			</div>
		</li>
		<li class="fl w33p bgw">
			<div class="p10 pl15">
				<strong class="ib w70 bold cm">조회</strong>
				<span>${requestScope.boardRow.bbs_view}</span>
			</div>
		</li>
	</ul>
</div>
<div id="print_contents" class="line bb p30 text">
	<h4 class="ti"></h4>	
		<iframe name="bbs_contents" width="682" scrolling="no" src="/paper_board_view_contents.do?bbs_idx=${requestScope.boardRow.bbs_idx}" onload="javascript:setIFrameHeight(this)"></iframe>
	<br/>
</div>
<c:if  test="${requestScope.boardRow.bbs_file_name  != ''
			|| requestScope.boardRow.bbs_file_name2 != '' 
			|| requestScope.boardRow.bbs_file_name3 != ''
			|| requestScope.boardRow.bbs_file_name4 != ''
			|| requestScope.boardRow.bbs_file_name5 != ''}">
<div class=" line bb bw2 text small">
	<div class="pr">
		<h4 class="pa l15 t10 bold cm">첨부파일</h4>
		<ul class="ml100">			
		<!-- 아이콘 추가 필요 doc,txt,ppt, png, bmp, gif, exe, zip, 삭제 아이콘-->		
		
		<!-- File1 -->
		<c:if test="${requestScope.boardRow.bbs_file_name != ''}">
			<li class="p10 pl15 link bold line dot bb">		
				<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>				
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
					<fmt:parseNumber var="size1" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
					${requestScope.boardRow.bbs_file_name} (<c:out value="${size1}" />KByte) 
				</a>
			</li>
		</c:if>
		
		<!-- File2 -->
		<c:if test="${requestScope.boardRow.bbs_file_name2 != '' }">
			<li class="p10 pl15 link bold line dot bb">							
				<span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',2)">
					<fmt:parseNumber var="size2" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size2/1024}" />
					${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 
				</a>
			</li>
		</c:if>
			
		<!-- File3 -->
		<c:if test="${requestScope.boardRow.bbs_file_name3 != '' }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',3)">
					<fmt:parseNumber var="size3" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size3/1024}" />
					${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 
				</a>
			</li>
		</c:if>
		
		<!-- File4 -->
		<c:if test="${requestScope.boardRow.bbs_file_name4 != '' }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',4)">
					<fmt:parseNumber var="size4" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size4/1024}" />
					${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 
				</a>
			</li>
		</c:if>
		
		<!-- File5 -->
		<c:if test="${requestScope.boardRow.bbs_file_name5 != '' }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',5)">
					<fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
					${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 
				</a>					
			</li>
		</c:if>
											
		</ul>
	</div>
</div>
</c:if>
<c:if test="${requestScope.boardSettings.bs_Comments == 1 }">
	<div class="line bb bw2 text small">
		<div class="p10 pl15 pr15">
			<label for="textarea1" class="bold cm"><h4>의견쓰기</h4></label>
			<div class="area pr mt10">
				<div class="mr95">
					<textarea id="bbc_contents" name="bbc_contents" class="textarea t1 text ssmall"></textarea>
				</div>
				<button class="pa r0 t0 btn comment" onclick="javascript:doWriteComments();" >등록</button>
			</div>
			<div class="mt5 ssmall ca">(100자 이내로 작성해주세요.)</div>
		</div>
	 	
		<div class="line bt">
			<ul>
				<c:choose>
					<c:when test="${requestScope.boardComments.size() > 0 }">
						<c:forEach var="i" begin="0" end="${requestScope.boardComments.size()-1 }">
							<li>
								<div class="pr p15 line dot bb">
									<strong class="pa l15 t15 bold">${requestScope.boardComments[i].bbc_name}</strong>
									<span class="ml100 mr90 ssmall ca">${ f:replace(requestScope.boardComments[i].bbc_contents, lf, "<br/>")}</span>
									<span class="pa r15 t15">
										${requestScope.boardComments[i].bbc_date}									
										<c:if test="${(g_userid != '' && requestScope.boardComments[i].bbc_user_id == g_userid) || g_user_level <= 2}">
											<a href="javascript:doDeleteComments(${requestScope.boardComments[i].bbs_idx}, ${requestScope.boardComments[i].bbc_idx})">[삭제]</a>
										</c:if>
									</span>								
								</div>
							</li>
						</c:forEach>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</c:if>
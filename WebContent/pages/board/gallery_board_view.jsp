<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common.jsp"%>
	
<script type="text/javascript">
	
	var board;
	var download;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")
		download = document.forms["download"];
	});
	
	function doPrint()
	{
		$("#print_contents").printElement({
			printMode: 'popup',
			pageTitle:'본문',		
			leaveOpen:false		
		});
	}
	
	function doCancel()
	{
		board.board_form.value="list";
		board.submit();
	}
	
	function doModify()
	{
		board.board_form.value="modify";
		board.submit();		
	}
	
	function doDelete()
	{
		if ( confirm("게시글을 삭제 하시겠습니까?")) {
			board.board_form.value="delete";
			board.submit();			
		}

	}
	
	function doWrite()
	{
		board.board_form.value="write";
		board.submit();		
	}
		
	function doSelect(bbs_idx) {
		board.board_form.value = "view";
		board.bbs_idx.value	 = bbs_idx;
		board.submit();
	}
	
	function doFileDownLoad(bbs_file_name, bbs_file_url, num)
	{
		download.bbs_board_code.value = board.bbs_board_code.value;
		download.bbs_idx.value = board.bbs_idx.value;
		download.bbs_file_name.value = bbs_file_name;
		download.bbs_file_url.value = bbs_file_url;
		download.num.value = num;
		
		download.method = "post";
		download.action = "/board_file_download.do"
		download.target = "work";
		download.submit();
	}
	
	function doWriteComments()
	{
		var bbc_contents = $("#bbc_contents").val();
		var bbs_idx = board.bbs_idx.value;
		
		var param = "bbc_contents=" + bbc_contents + "&bbs_idx=" + bbs_idx;
		$.ajax ( {
            type		: "POST"
			, url		: "/paper_board_comments_insert.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleWriteCommentComplete							
		});
	}
	
	function handleWriteCommentComplete()
	{
		board.board_form.value = "view";
		board.submit();
	}
	
	function doDeleteComments(bbc_idx)
	{
		var param = "bbc_idx=" + bbc_idx;
		$.ajax ( {
            type		: "POST"
			, url		: "/paper_board_comments_delete.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleWriteCommentComplete							
		});
	}
	
	function handleWriteCommentComplete()
	{
		board.board_form.value = "view";
		board.submit();
	}
</script>

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
	<!-- 이미지 File1 -->
	
	<c:if test="${requestScope.boardRow.bbs_file_name != ''}">
		<c:choose>
			<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type) > -1}">						
				<img src="${requestScope.boardRow.bbs_file_url}" 
					 alt="${requestScope.boardRow.bbs_file_name}">
			</c:when>
			<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type) >-1}">
				<embed src="${requestScope.boardRow.bbs_file_url}" 
					   loop="true" 
					   menu="false" 
					   quality="high" 
					   bgcolor="#FFFFFF" 
					   name="file" 
					   type="application/x-shockwave-flash"
					   width="100%" 
					   height="100%" 
					   scale="default"								    
					   pluginspage="http://www.macromedia.com/go/getflashplayer">
				</embed>
			</c:when>
		</c:choose>				
	</c:if>
	
	<!-- 이미지 File2 -->
	<c:if test="${requestScope.boardRow.bbs_file_name2 != ''}">
		<c:choose>
			<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type2) > -1}">						
				<img src="${requestScope.boardRow.bbs_file_url2}" 
					 alt="${requestScope.boardRow.bbs_file_name2}">
			</c:when>
			<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type2) >-1}">
				<embed src="${requestScope.boardRow.bbs_file_url2}" 
					   loop="true" 
					   menu="false" 
					   quality="high" 
					   bgcolor="#FFFFFF" 
					   name="file" 
					   type="application/x-shockwave-flash" 
					   width="100%" 
					   height="100%" 
					   scale="default"								   
					   pluginspage="http://www.macromedia.com/go/getflashplayer">
				</embed>
			</c:when>
		</c:choose>				
	</c:if>
	
	<!-- 이미지 File3 -->
	<c:if test="${requestScope.boardRow.bbs_file_name3 != ''}">					
		<c:choose>
			<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type3) > -1}">						
				<img src="${requestScope.boardRow.bbs_file_url3}" 
					 alt="${requestScope.boardRow.bbs_file_name3}">
			</c:when>
			<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type3) >-1}">
				<embed src="${requestScope.boardRow.bbs_file_url3}" 
					   loop="true" 
					   menu="false" 
					   quality="high" 
					   bgcolor="#FFFFFF" 
					   name="file" 
					   type="application/x-shockwave-flash"
					   width="100%" 
					   height="100%" 
					   scale="default"		
					   pluginspage="http://www.macromedia.com/go/getflashplayer">
				</embed>
			</c:when>
		</c:choose>				
	</c:if>	
	
	<!-- 이미지 File4 -->
	<c:if test="${requestScope.boardRow.bbs_file_name4 != '' }">
		<c:choose>
			<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type4) > -1}">						
				<img src="${requestScope.boardRow.bbs_file_url4}" 
					 alt="${requestScope.boardRow.bbs_file_name4}">
			</c:when>
			<c:when test="${f:indexOf('swf', requestScope.boardRow.bbs_file_type4) >-1}">
				<embed src="${requestScope.boardRow.bbs_file_url4}" 
					   loop="true" 
					   menu="false" 
					   quality="high" 
					   bgcolor="#FFFFFF" 
					   name="file" 
					   type="application/x-shockwave-flash" 
					   width="100%" 
					   height="100%" 
					   scale="default"						   
					   pluginspage="http://www.macromedia.com/go/getflashplayer">
				</embed>
			</c:when>
		</c:choose>				
	</c:if>	
	
	<!-- 이미지 File5 -->
	<c:if test="${requestScope.boardRow.bbs_file_name5 != ''}">
		<c:choose>
			<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type5) > -1}">						
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
					   width="100%" 
					   height="100%" 
					   scale="default"								   
					   pluginspage="http://www.macromedia.com/go/getflashplayer">
				</embed>
			</c:when>
		</c:choose>				
	</c:if>
	<br>
	<h4 class="ti">본문</h4>
	${requestScope.boardRow.bbs_contents}
</div>

<c:if  test="${requestScope.boardRow.bbs_file_name  != ''
			&& requestScope.boardRow.bbs_file_name2 != '' 
			&& requestScope.boardRow.bbs_file_name3 != ''
			&& requestScope.boardRow.bbs_file_name4 != ''
			&& requestScope.boardRow.bbs_file_name5 != ''}">
<div class=" line bb bw2 text small">
	<div class="pr">
		<h4 class="pa l15 t10 bold cm">첨부파일</h4>
		<ul class="ml100">			
		
		<!-- File1 -->
		<c:if test="${requestScope.boardRow.bbs_file_name != '' && f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type) >-1 }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
				${requestScope.boardRow.bbs_file_name} (${requestScope.boardRow.bbs_file_size / 1024}) KByte
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
					${requestScope.boardRow.bbs_file_name} (${requestScope.boardRow.bbs_file_size / 1024}) KByte
				</a>
			</li>
		</c:if>
		
		<!-- File2 -->
		<c:if test="${requestScope.boardRow.bbs_file_name2 != '' && f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type2) >-1 }">
			<li class="p10 pl15 link bold line dot bb">							
				<span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>
				${requestScope.boardRow.bbs_file_name2} (${requestScope.boardRow.bbs_file_size2 / 1024}) KByte
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',2)">
					${requestScope.boardRow.bbs_file_name2} (${requestScope.boardRow.bbs_file_size2 / 1024}) KByte
				</a>
			</li>
		</c:if>
			
		<!-- File3 -->
		<c:if test="${requestScope.boardRow.bbs_file_name3 != '' && f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type3) >-1 }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',3)">
					${requestScope.boardRow.bbs_file_name3} (${requestScope.boardRow.bbs_file_size3 / 1024}) KByte
				</a>
			</li>
		</c:if>
		
		<!-- File4 -->
		<c:if test="${requestScope.boardRow.bbs_file_name4 != '' && f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type4) >-1 }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',4)">
					${requestScope.boardRow.bbs_file_name4} (${requestScope.boardRow.bbs_file_size4 / 1024}) KByte
				</a>
			</li>
		</c:if>
		
		<!-- File5 -->
		<c:if test="${requestScope.boardRow.bbs_file_name5 != '' && f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type5) >-1 }">
			<li class="p10 pl15 link bold line dot bb">					
				<span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
				${requestScope.boardRow.bbs_file_name5} (${requestScope.boardRow.bbs_file_size5 / 1024}) KByte
				<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
					${requestScope.boardRow.bbs_file_name5} (${requestScope.boardRow.bbs_file_size5 / 1024}) KByte
				</a>					
			</li>
		</c:if>									
		</ul>
	</div>
</div>
</c:if>


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
									<c:if test="${requestScope.boardComments[i].bbc_user_id == g_userid}">
										<a href="javascript:doDeleteComments(${requestScope.boardComments[i].bbc_idx})">[삭제]</a>
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


<div class="line bt mt40 text small">
	<h4 class="ti">편의버튼</h4>
	<ul>
		
		<c:if test="${requestScope.boardRowPrev != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">이전글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowPrev.bbs_idx})">${requestScope.boardRowPrev.bbs_subject}</a></span>
				<span class="pa r15 t15">2015-02-04</span>
			</div>
		</li>
		</c:if>
		
		<c:if test="${requestScope.boardRowNext != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">다음글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowNext.bbs_idx})">${requestScope.boardRowNext.bbs_subject}</a></span>
				<span class="pa r15 t15">2015-02-04</span>
			</div>
		</li>
		</c:if>
	</ul>
</div>

<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="javascript:doCancel();" class="btn big">목록</a></li>
		<li><a href="javascript:doPrint();" class="btn big t2">프린트</a></li>
	</ul>
	
	<% if ( g_isLogin ) { %>
	<ul class="fr">
		<c:if test="${ g_user_level == 1}"> 
			<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
			<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
			<li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
		</c:if>
	</ul>
	<% } %>
</div>

<form name="download">
	<input type="hidden" name="bbs_board_code">
	<input type="hidden" name="bbs_idx">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
	<input type="hidden" name="num">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
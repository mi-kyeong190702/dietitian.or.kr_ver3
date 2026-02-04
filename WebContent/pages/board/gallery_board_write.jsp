<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> 

<script type="text/javascript">
	
	var board;
	var write;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")
		write = document.forms["write"];		
	});
	
	function doWrite() 
	{
		if($("#bbs_name").val() == "" ) {
			alert("이름을 꼭 써주셔야 합니다.");
			$("#bbs_name").focus();
			return;
		}

		if($("#bbs_subject").val() == "") {
			alert("제목을 꼭 써주셔야 합니다.");
			$("#bbs_subject").focus();
			return;
		}

		if($("#bbs_contents").val() == "") {
			alert("내용을 꼭 써주셔야 합니다.");
			$("#bbs_contents").focus();
			return;
		}
		
		write.bbs_board_code.value = board.bbs_board_code.value;		
		write.target = "work";
		
		if ( board.board_form.value == "write" ) {
			write.bbs_idx.value = "0";
			write.action = "/paper_board_insert.do";
		}
		else {
			write.bbs_idx.value = board.bbs_idx.value;
			write.action = "/paper_board_update.do";
		}
		
		write.submit();
	} 
	
	function doCancel()
	{
		board.board_form.value="list";
		board.submit();
	}
	
	function doComplete()
	{
		board.board_form.value="list";
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
	
</script>

<form name="write" enctype="multipart/form-data" method="post">
<input type="hidden" name="bbs_board_code" value="">
<input type="hidden" name="bbs_idx" value="">
<div class="form line bt bcm bw2">
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
			<label for="inputid4" class="ff_title i_b"><strong>이름</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_name" class="input t1 w200" id="inputid4" value="${requestScope.boardRow.bbs_name}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid4" class="ff_title i_b"><strong>이메일</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_email" class="input t1 w200" id="inputid4" value="${requestScope.boardRow.bbs_email}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<div class="ff_title i_b"><strong>옵션</strong></div>
			<div class="ff_wrap ml120 text">
				<div class="area">
					<input type="checkbox" class="mr5" name="checkbox1" id="checkbox1_1"/>
					<label for="checkbox1_1" class="mr20">HTML</label>
					<input type="checkbox" class="mr5" name="bbs_notice_str" id="bbs_notice_str" value="1" <c:if test="${requestScope.boardRow.bbs_notice_str == '1'}"><c:out value="checked"/></c:if> />
                    <label for="bbs_notice" class="mr20">Top으로</label>
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
						<c:choose>
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type) >-1}">						
								<li class="p10 pl15 link bold line dot bb">                   
                                    <span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
                                        <fmt:parseNumber var="size" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
                                        ${requestScope.boardRow.bbs_file_name} (<c:out value="${size}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk" value="Y"/>
                                    </a>
                                </li>
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
									   pluginspage="http://www.macromedia.com/go/getflashplayer">
								</embed>
							</c:when>				
							<c:otherwise>		
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type) >-1 }">
									<%-- <li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
										${requestScope.boardRow.bbs_file_name} (${requestScope.boardRow.bbs_file_size / 1024}) KByte
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
											${requestScope.boardRow.bbs_file_name} (${requestScope.boardRow.bbs_file_size / 1024}) KByte
										</a>
									</li> --%>
									<li class="p10 pl15 link bold line dot bb">                   
	                                    <span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
	                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
	                                        <fmt:parseNumber var="size" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
	                                        ${requestScope.boardRow.bbs_file_name} (<c:out value="${size}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk" value="Y"/>
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
						<c:choose>
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type2) >-1}">
							    <li class="p10 pl15 link bold line dot bb">                   
                                    <span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>
                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',0)">
                                        <fmt:parseNumber var="size2" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size2/1024}" />
                                        ${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk2" id="file_del_chk2" value="Y" />
                                    </a>
                                </li>						
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
									   pluginspage="http://www.macromedia.com/go/getflashplayer">
								</embed>
							</c:when>				
							<c:otherwise>		
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type2) >-1 }">
									<%-- <li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>
										${requestScope.boardRow.bbs_file_name2} (${requestScope.boardRow.bbs_file_size2 / 1024}) KByte
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',0)">
											${requestScope.boardRow.bbs_file_name2} (${requestScope.boardRow.bbs_file_size2 / 1024}) KByte
										</a>
									</li> --%>
									<li class="p10 pl15 link bold line dot bb">                   
	                                    <span class="i_file ${requestScope.boardRow.bbs_file_type2} mr10"></span>
	                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name2}','${requestScope.boardRow.bbs_file_url2}',0)">
	                                        <fmt:parseNumber var="size2" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size2/1024}" />
	                                        ${requestScope.boardRow.bbs_file_name2} (<c:out value="${size2}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk2" id="file_del_chk2" value="Y"/>
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
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type3) >-1}">
							    <li class="p10 pl15 link bold line dot bb">                   
                                    <span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>
                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',0)">
                                        <fmt:parseNumber var="size3" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size3/1024}" />
                                        ${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk3" id="file_del_chk3" value="Y"/>
                                    </a>
                                </li>						
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
									   pluginspage="http://www.macromedia.com/go/getflashplayer">
								</embed>
							</c:when>				
							<c:otherwise>		
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type3) >-1 }">
									<%-- <li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>
										${requestScope.boardRow.bbs_file_name3} (${requestScope.boardRow.bbs_file_size3 / 1024}) KByte
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',0)">
											${requestScope.boardRow.bbs_file_name3} (${requestScope.boardRow.bbs_file_size3 / 1024}) KByte
										</a>
									</li> --%>
									<li class="p10 pl15 link bold line dot bb">                   
	                                    <span class="i_file ${requestScope.boardRow.bbs_file_type3} mr10"></span>
	                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name3}','${requestScope.boardRow.bbs_file_url3}',0)">
	                                        <fmt:parseNumber var="size3" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size3/1024}" />
	                                        ${requestScope.boardRow.bbs_file_name3} (<c:out value="${size3}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk3" id="file_del_chk3" value="Y"/>
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
							<c:when test="${f:indexOf('jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type4) >-1}">
							    <li class="p10 pl15 link bold line dot bb">                   
                                    <span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',0)">
                                        <fmt:parseNumber var="size4" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size4/1024}" />
                                        ${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk4" id="file_del_chk4" value="Y"/>
                                    </a>
                                </li>						
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
									   pluginspage="http://www.macromedia.com/go/getflashplayer">
								</embed>
							</c:when>				
							<c:otherwise>		
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type4) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<%-- <span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
										${requestScope.boardRow.bbs_file_name4} (${requestScope.boardRow.bbs_file_size4 / 1024}) KByte
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',0)">
											${requestScope.boardRow.bbs_file_name4} (${requestScope.boardRow.bbs_file_size4 / 1024}) KByte
										</a> --%>
										<li class="p10 pl15 link bold line dot bb">                   
		                                    <span class="i_file ${requestScope.boardRow.bbs_file_type4} mr10"></span>
		                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name4}','${requestScope.boardRow.bbs_file_url4}',0)">
		                                        <fmt:parseNumber var="size4" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size4/1024}" />
		                                        ${requestScope.boardRow.bbs_file_name4} (<c:out value="${size4}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk4" id="file_del_chk4" value="Y"/>
		                                    </a>
		                                </li>
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
							    <li class="p10 pl15 link bold line dot bb">                   
                                    <span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
                                        <fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
                                        ${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk5" id="file_del_chk5" value="Y"/>
                                    </a>
                                </li>						
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
								<c:if test="${f:indexOf('pdf,hwp,xls', requestScope.boardRow.bbs_file_type5) >-1 }">
									<%-- <li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
										${requestScope.boardRow.bbs_file_name5} (${requestScope.boardRow.bbs_file_size5 / 1024}) KByte
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
											${requestScope.boardRow.bbs_file_name5} (${requestScope.boardRow.bbs_file_size5 / 1024}) KByte
										</a>
									</li> --%>
									<li class="p10 pl15 link bold line dot bb">                   
	                                    <span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
	                                    <a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name5}','${requestScope.boardRow.bbs_file_url5}',0)">
	                                        <fmt:parseNumber var="size5" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size5/1024}" />
	                                        ${requestScope.boardRow.bbs_file_name5} (<c:out value="${size5}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk5" id="file_del_chk5" value="Y"/>
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

<div class="btn_wrap mt40">
	<ul>
		<li><a href="javascript:doWrite();" class="btn big t1">완료</a></li>
		<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
	</ul>
</div>
</form>

<form name="download">
	<input type="hidden" name="bbs_board_code">
	<input type="hidden" name="bbs_idx">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
	<input type="hidden" name="num">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
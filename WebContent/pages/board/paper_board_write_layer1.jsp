<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style  type="text/css">
.board_03 {
	font-family:  "돋움", "돋움체";
	font-size: 12px;
	color: #767676;
	padding-left: 10px;
	padding-top: 5px;
}
.board_05 {
	font-family:  "돋움", "돋움체";
	font-size: 12px;
	color: #004E9E;
	text-align: center;
	padding-top: 5px;
			}
</style>

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
	<c:if test='${requestScope.bbs_board_code != "0"}'>	
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid2" class="ff_title i_b"><strong>부서</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="bbs_category" class="input t1 w200" id="bbs_category" value="${requestScope.boardRow.bbs_category}"/>
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
					<input type="checkbox" class="mr5" name="bbs_notice_str" id="bbs_notice_str" value="1" <c:if test="${requestScope.boardRow.bbs_notice_str == '1'}"><c:out value="checked"/></c:if> />
<!--					<input type="checkbox" class="mr5" name="bbs_notice" id="bbs_notice" value="${requestScope.boardRow.bbs_notice}"
					<c:if test="${requestScope.boardRow.bbs_notice == true}">checked</c:if>>-->
					<label for="bbs_notice" class="mr20">Top으로</label>
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
					<textarea id="bbs_contents" name="bbs_contents">${requestScope.boardRow.bbs_contents}</textarea>
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
								<c:if test="${f:indexOf('pdf,hwp,xls,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type} mr10"></span>
										<a href="javascript:doFileDownLoad('${requestScope.boardRow.bbs_file_name}','${requestScope.boardRow.bbs_file_url}',0)">
										<fmt:parseNumber var="size1" integerOnly="true" type="number" value="${requestScope.boardRow.bbs_file_size/1024}" />
											${requestScope.boardRow.bbs_file_name} (<c:out value="${size1}" />KByte) 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk"/>
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
								<c:if test="${f:indexOf('pdf,hwp,xls,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type2) >-1 }">
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
								<c:if test="${f:indexOf('pdf,hwp,xls,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type3) >-1 }">
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
								<c:if test="${f:indexOf('pdf,hwp,xls,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type4) >-1 }">
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
								<c:if test="${f:indexOf('pdf,hwp,xls,jpg,jpeg,gif,bmp,png,tiff,tif', requestScope.boardRow.bbs_file_type5) >-1 }">
									<li class="p10 pl15 link bold line dot bb">					
										<span class="i_file ${requestScope.boardRow.bbs_file_type5} mr10"></span>
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
<script language="JScript">
//** 에디터 파일이 있는 경로 맨 뒤에 / 포함
var Editor_Root_Dir = "/wysiwyg/";

var EditorName;

//**********************************************************************************
//* 브라우저 타입 및 버전에 따라 처리
//**********************************************************************************
//*
//* 1. 익스플로어 5.5보다 높은 버전일 경우
//* 에디터 js 파일 불러오기
//* 2. 네스케이프 및 오페라 등 익스플로어가 아닐경우는 teaxtarea로 불러오기
//*
//**********************************************************************************

var appName = navigator.appName; //** 브라우저명
var appVersion = parseFloat(navigator.appVersion.split("MSIE")[1]); //** 브라우저 버전
var bitUseEditor //** 에디터 사용 유무

if(appName != "Microsoft Internet Explorer" || appVersion < 5.5){
	bitUseEditor = false; //** 익스플로어가 아니고 버전이 5.5보다 작을때는 "사용 안함"
}else{
	bitUseEditor = true; //** 에디터 사용함
}

if(bitUseEditor){
	bitUseEditor = true;
	document.write('<scrip'+'t language="JScript" src="'+Editor_Root_Dir+'Editor.js"></scrip'+'t>');
}
</script>
<script language="JSCript">
	//** 사용할 Textarea의 이름을 삽입
	/*if(bitUseEditor){
		var Config = new Array;
		alert(Config);
		Config.Width = "100%";
		EditorName = Editor_New_Generate('bbs_contents', Config);
		alert(EditorName);
	}*/
</script>
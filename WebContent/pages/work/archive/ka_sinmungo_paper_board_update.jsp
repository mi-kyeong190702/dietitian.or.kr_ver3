<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="/pages/common.jsp"%>
<%
	String user_level = session.getAttribute(SessionInfo.USER_LEVEL).toString();	
%>
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>
<script type="text/javascript">
	
	var board;
	var write;
	var editor;
	
	$(document).ready(function()
	{
		editor = $("#bbs_contents").ckeditor();
	});
	
	$(document).on("submit",function(){
		
		if($("#board_subject").val()==""){
			alert("제목을 입력해주셔야합니다.");
			return false;
		}
		
		if($("#bbs_contents").val()==""){
			alert("내용을 입력해주셔야합니다.");
			return false;
		}
		
		if($("#board_dept").val()==""){
			alert("문의유형을 선택해주셔야합니다.");
			return false;
		}
		
		if ($("#inputid5").val() != "") {
			if (!isBoardFile($("#inputid5").val())){
				alert("첨부파일1은 파일첨부가 불가합니다.");
				return false;
			}
		}
		
		if ($("#inputid6").val() != "") {
			if (!isBoardFile($("#inputid6").val())){
				alert("첨부파일2은 파일첨부가 불가합니다.");
				return false;
			}
		}
		
		if ($("#inputid7").val() != "") {
			if (!isBoardFile($("#bbs_file3").val())){
				alert("첨부파일3은 파일첨부가 불가합니다.");
				return false;
			}
		}
		
		if ($("#inputid8").val() != "") {
			if (!isBoardFile($("#inputid8").val())){
				alert("첨부파일4은 파일첨부가 불가합니다.");
				return false;
			}
		}
		
		if ($("#inputid9").val() != "") {
			if (!isBoardFile($("#inputid9").val())){
				alert("첨부파일5은 파일첨부가 불가합니다.");
				return false;
			}
		}
		
	})
	
	function doList(){
		location.href="ka_sinmungo_list.do";
	}
</script>
<c:set value="${list}" var="list"/>
<c:forEach var="list" items="${list}">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영</mark>양사신문고</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_sinmungo_check.do" class="cm">영양사신문고</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<form name="ka_sinmungo_update.do" action="ka_sinmungo_update.do" enctype="multipart/form-data" method="post">
	<input type="hidden" id="idx" name="idx" value="${list.idx }">
	<div class="sp_body">
		<div class="form line bt bcm bw2">
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title">
						<strong>제목</strong>
					</div>
					<div class="ff_wrap ml120">
						<div class="area">
							<input type="text" name="board_subject" id="board_subject" class="input t1" value="${list.board_subject }" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">	
				<div class="f_field div1">
					<div class="ff_title">
						<strong>문의유형</strong>
					</div>			
					<div class="ff_wrap ml120">
						<div class="area">
							<select class="input t1 w200 mt10" name="board_dept" id="board_dept">
								<option value="">선택</option>
								<option value="인사">인사</option>
								<option value="업무">업무</option>
								<option value="제도(법률)">제도(법률)</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title">
						<strong>내용</strong>
					</div>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">기본주소</label>
							<textarea id="bbs_contents" name="bbs_contents" class="textarea t1 h350" >${list.bbs_contents}</textarea>
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
							<input type="hidden" name="bbs_file_url1" value="" />					
							<input type="file" name="bbs_file1" class="file t1" id="inputid5" value="${list.board_file1_name }"/>
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
							<input type="hidden" name="bbs_file_url2" value="" />
							<input type="file" name="bbs_file2" class="file t1" id="inputid6" value="${list.board_file2_name }"/>					
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
							<input type="hidden" name="bbs_file_url3" value="" />
							<input type="file" name="bbs_file3" class="file t1" id="inputid7" value="${list.board_file3_name }"/>
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
							<input type="hidden" name="bbs_file_url4" value="" />
							<input type="file" name="bbs_file4" class="file t1" id="inputid8" value="${list.board_file4_name }"/>
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
							<input type="hidden" name="bbs_file_url5" value="" />
							<input type="file" name="bbs_file5" class="file t1" id="inputid9" value="${list.board_file5_name }"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="btn_wrap mt40">
			<ul>
				<li><input type="submit" class="btn big t1" value="완료"></li>
				<li><input type="button" class="btn big t2" value="취소" onclick="doList();"></li>
			</ul>
		</div>
	</div>
	</form>
</div>
</c:forEach>



<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
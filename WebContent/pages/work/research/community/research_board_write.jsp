<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/ckeditor/adapters/jquery.js" ></script>

<script type="text/javascript">
	
	var board;
	var write;
	var state = "<c:out value="${loginVo.pers_state}" />";

	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined )
			alert("board form undefined")
		write = document.forms["write"];
		
		editor = $("#atc_cn").ckeditor();
		
		$("#lic_print_dt,#lic_no").keyup(function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$("#lic_print_dt,#lic_no").focusout(function(){
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$("#tel1,#tel2,#tel3").keyup(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		$("#tel1,#tel2,#tel3").focusout(function(event){
			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
		});
		
	});
	
	function selectMail(v){
		$("#mail2").val(v);
	}
	
	function doWrite() 
	{
		
		if($("#atc_sbj").val() == "") {
			alert("제목을 꼭 써주셔야 합니다.");
			$("#atc_sbj").focus();
			return;
		} 
		
		if($("#atc_wrtr_nm").val() == "" ) {
			alert("작성자를 꼭 써주셔야 합니다.");
			$("#atc_wrtr_nm").focus();
			return;
		}
		
		
		if($("#atc_cn").val() == "") {
			alert("내용을 꼭 써주셔야 합니다.");
			$("#atc_cn").focus();
			return;
		}
		
		if ($("#bbs_file1").val() != "") {
			if (!isBoardFile($("#bbs_file1").val())){
				alert("해당파일은 파일첨부가 불가합니다.");
				return;
			}
		}
		
		if(board.bbs_cd.value=='001' || board.bbs_cd.value=='002'){
			
			if($(':radio[name="radio1"]:checked').length < 1 ) {
				alert("게시여부를 꼭 선택해야 합니다.");
				return;
			}
			
			if($("#atc_impatc_bgn_dttm").val() != "" || $("#atc_impatc_end_dttm").val() != "" ) {
				if($("#atc_impatc_bgn_dttm").val() == "" || $("#atc_impatc_end_dttm").val() == ""){
					alert("중요공지기간 시작일과 종료일을 모두 써주셔야 합니다.");
					return;	
				}
			}
			
			var ck =$(':radio[name="radio1"]:checked').val();
			$("#atc_pst_yn").val(ck);
			
			if($("#atc_impatc_bgn_dttm").val() != "" && $("#atc_impatc_end_dttm").val() != "" ) {
				$("#atc_impatc_yn").val("Y");
			}else {
				$("#atc_impatc_yn").val("N");
			}
			
			
		}else {
			if ( board.board_form.value == "write" || board.board_form.value == "reply") {
			
				if($("#atc_passwd").val() == null || $("#atc_passwd").val() == ""){
					alert("비밀번호를 꼭 써주셔야 합니다.");
					$("#atc_passwd").focus();
					return;
				}
			}
			
			if(board.bbs_cd.value=='004' || board.bbs_cd.value=='005'){
				if(board.board_form.value != "reply"){
				
					if($("#lic_no").val() == "") {
						alert("면허번호를 꼭 써주셔야 합니다.");
						$("#lic_no").focus();
						return;
					}
					
					if($("#lic_print_dt").val() == "") {
						alert("면허발급일을 꼭 써주셔야 합니다.");
						$("#lic_print_dt").focus();
						return;
					}
					
					if($("#lic_print_dt").val().length != 8) {
						alert("면허발급일(8자리)을 꼭 써주셔야 합니다.");
						$("#lic_print_dt").focus();
						return;
					}
					
					if(board.bbs_cd.value=='004'){
						
						if(board.board_form.value == "modify"){
							
							if($("#filecheck").is(":checked") && $("#bbs_file_url").val()!=""){
								if($("#bbs_file1").val()==""){
									alert("첨부파일을 꼭 첨부해야 합니다.");
									return;
								}
							}
						}else{
							if($("#bbs_file1").val()==""){
								alert("첨부파일을 꼭 첨부해야 합니다.");
								return;
							}
						}
						
					}
					
				}
			}
			
			//관리자인 경우 연락처 이메일 입력 제외
			if(state != "00") {
				if( $("#tel1").val() == "" ||  $("#tel2").val() == "" || $("#tel3").val() == "" ) {
					alert("연락처를 모두 써주셔야 합니다.");
					return;
				}
				
				if( $("#mail1").val() == "" || $("#mail2").val() == "") {
					alert("이메일을 모두 써주셔야 합니다.");
					return;
				}
				 
				var ckMail = $("#mail1").val() +"@"+ $("#mail2").val();
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				if(regex.test(ckMail) === false) {  
				    alert("잘못된 이메일 형식입니다.");  
				    return;  
				}				
			}
			 
			 $("#atc_scratc_yn").val("Y");
			 $("#atc_ans_eml_ntc_yn").val("Y");
			 $("#atc_pst_yn").val("Y");
			 
		}
		
		
		write.atc_cn.value = $("#atc_cn").val();
		
		write.bbs_cd.value = board.bbs_cd.value;		
		write.target = "work";
		
		if ( board.board_form.value == "write" ) {
			write.atc_sno.value = "0";
			write.rlt_atc_sno.value ="0";
			write.board_form.value = board.board_form.value;
			write.action = "/research_board_insert.do";
		}
		else if ( board.board_form.value == "modify" ){
			
			if($("#filecheck").is(":checked") && $("#bbs_file_url").val()!=""){
				$("#file_yn").val('Y');
			}else{
				$("#file_yn").val('N');
			}
			
			write.rlt_atc_sno.value ="0";
			write.atc_sno.value = board.atc_sno.value;
			write.board_form.value = board.board_form.value;
			write.action = "/research_board_update.do";
		}
		else if ( board.board_form.value == "reply" ){
			write.rlt_atc_sno.value = board.atc_sno.value;
			write.board_form.value = board.board_form.value;
			write.atc_sno.value = "0";
			write.action = "/research_board_insert.do";
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
		download.bbs_cd.value = board.bbs_cd.value;
		download.atc_sno.value = board.atc_sno.value;
		download.bbs_file_name.value = bbs_file_name;
		download.bbs_file_url.value = bbs_file_url;
		download.num.value = num;
		
		download.method = "post";
		download.action = "/board_file_download.do";
		download.target = "work";
		download.submit();
	}
	
</script>

<form name="write" enctype="multipart/form-data" method="post">
<input type="hidden" name="bbs_cd" value="">
<input type="hidden" name="atc_sno" value="">
<input type="hidden" name="rlt_atc_sno" value="">
<input type="hidden" name="board_form" value="">

<!-- bbs_cd - 001:공지사항, 002:FAQ, 003:문의하기, 004:면허등록 -->
<c:choose>
	<c:when test="${bbs_cd=='001'}">
	    <%@include file="./research_board_write_layer1.jsp"%><!-- 번호,제목,첨부,작성자,등록일,조회수  -->
	</c:when>
	<c:when test="${bbs_cd=='002'}">
	    <%@include file="./research_board_write_layer2.jsp"%><!-- 제목,내용  -->
	</c:when>
	<c:when test="${bbs_cd=='003'}">
	    <%@include file="./research_board_write_layer3.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='004'}">
	    <%@include file="./research_board_write_layer4.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
	<c:when test="${bbs_cd=='005'}">
	    <%@include file="./research_board_write_layer5.jsp"%><!-- 번호,질문,첨부,작성자,조회수, 상태  -->
	</c:when>
</c:choose>
	
<div class="btn_wrap mt40">
	<ul>
		<li><a href="javascript:doWrite();" class="btn big t1">저장</a></li>
		<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
	</ul>
</div>
</form>

<form name="download">
	<input type="hidden" name="bbs_cd">
	<input type="hidden" name="atc_sno">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
	<input type="hidden" name="num">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
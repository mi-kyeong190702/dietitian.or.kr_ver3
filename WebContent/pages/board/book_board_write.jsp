<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String bs_categorytype = "";
	String materials_status = "";
	String otop = "0";
%>

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
		if($("#otitle").val() == "" || $("#otitle").length < 1) {
			alert("제목을 꼭 써주셔야 합니다.");
			$("#otitle").focus();
			return;
		}  
		
		if($("#oyear").val() == "" || $("#oyear").length < 1) {
			alert("출판 년도를 써주세요");
			$("#oyear").focus();
			return;
		} 
		
		if($("#oprice1").val() == "" || $("#oprice1").length < 1) {
			alert("회원 가격을 입력하세요");
			$("#oprice1").focus();
			return;
		} 
		
		if($("#oprice2").val() == "" || $("#oprice2").length < 1) {
			alert("비회원 가격을 입력하세요");
			$("#oprice2").focus();
			return;
		} 
		if( board.board_form.value == "write" ) {
			if ( $("#bbs_file1").val() == "" )
			{
				alert("업로드할 이미지를 선택하세요.");
				return;
			}
		
			if ( !isImage( $("#bbs_file1").val() ) )
			{
				alert("이미지만 첨부하세요.");
				return;
			}
		}
		
		//write.bbs_board_code.value = board.bbs_board_code.value;		
		write.target = "work";
		
		if ( board.board_form.value == "write" ) {
			write.oindex.value = "0";
			write.action = "/book_board_insert.do";
		}
		else {
			write.oindex.value = board.oindex.value;
			write.action = "/book_board_update.do";
		}
		
		
		//$("#bs_categorytype").val($('select[name=bs_categorytype]').val());
		$("#materials_status").val($('select[name=materials_status]').val());
		
		if($('input:checkbox[name=file_del_chk]').is(':checked')){
			write.file_del_chk.value = "Y";
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
		//download.bbs_board_code.value = board.bbs_board_code.value;
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
<input type="hidden" name="oindex" value="">
<div class="form line bt bcm bw2">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid1" class="ff_title i_b"><strong>제목</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="otitle" id="otitle" class="input t1" value="${requestScope.boardRow.otitle}" />
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
	    <div class="f_field div2">
            <label class="ff_title i_b"><strong>요약명</strong></label>
            <div class="ff_wrap ml120">
                <div class="area">
                    <input type="text" maxlength="10" name="short_title" id="short_title" class="input t1 w200" value="${requestScope.boardRow.short_title}" />
                </div>
            </div>
        </div>
		<div class="f_field div2">
			<label for="inputid4" class="ff_title i_b"><strong>출판년도 </strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="oyear" class="input t1 w200" id="oyear" value="${requestScope.boardRow.oyear}" />
				</div>
			</div>
		</div>
	</div>	
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid2" class="ff_title i_b"><strong>회원가격</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="oprice1" class="input t1 w200" id="oprice1" value="${requestScope.boardRow.oprice1}" style="ime-mode:disabled;" onKeyPress="return digit_check(event);"/>
				</div>
			</div>
		</div>
		<div class="f_field div2">
			<label for="inputid3" class="ff_title i_b"><strong>비회원가격</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<input type="text" name="oprice2" class="input t1 w200" id="oprice2" value="${requestScope.boardRow.oprice2}" style="ime-mode:disabled;" onKeyPress="return digit_check(event);"/>
				</div>
			</div>
		</div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div2">
			<label for="inputid18" class="ff_title i_b"><strong>분류</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select  class="select t2 w150" name='bs_categorytype' id='bs_categorytype'>
						<option value='기본' <c:if test="${requestScope.boardRow.bs_categorytype == '기본'}">selected</c:if>>기본</option>
                        <option value='10%' <c:if test="${requestScope.boardRow.bs_categorytype == '10%'}">selected</c:if>>10% 할인</option>
                        <option value='300원' <c:if test="${requestScope.boardRow.bs_categorytype == '300원'}">selected</c:if>>300원 할인</option>
                        <option value='200원' <c:if test="${requestScope.boardRow.bs_categorytype == '200원'}">selected</c:if>>200원 할인</option>
					</select>
				</div>
			</div>
		</div>
		<div class="f_field div2">
            <label class="ff_title i_b"><strong>규격</strong></label>
            <div class="ff_wrap ml120">
                <div class="area">
                    <select  class="select t2 w150" name='std_nm' id='std_nm'>
                        <option value='' <c:if test="${requestScope.boardRow.std_nm == ''}">selected</c:if>></option>
                        <option value='세트' <c:if test="${requestScope.boardRow.std_nm == '세트'}">selected</c:if>>세트</option>
                        <option value='부' <c:if test="${requestScope.boardRow.std_nm == '부'}">selected</c:if>>부</option>
                    </select>
                </div>
            </div>
        </div>
	</div>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid18" class="ff_title i_b"><strong>재고유무</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<select  class="select t2 w150" name='materials_status' id='materials_status'>
						<option value='0' <c:if test="${requestScope.boardRow.materials_status == '0'}">selected</c:if>>재고유</option>
						<option value='1' <c:if test="${requestScope.boardRow.materials_status == '1'}">selected</c:if>>재고무</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid18" class="ff_title i_b"><strong>최신자료</strong></label>
			<div class="ff_wrap ml120">
				<div class="area mt10">
					<input type="checkbox" name="otop" id="otop" value="1" <c:if test="${requestScope.boardRow.otop == '1'}">checked</c:if> /> 최신자료로 합니다.
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
					<textarea id="ocontents" name="ocontents" class="textarea t1 h350" />${requestScope.boardRow.ocontents}</textarea>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${requestScope.boardRow.oimage != ''}">
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid5" class="ff_title"><strong>파일삭제</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid5" class="ti">파일삭제</label>
 					<li class="p10 pl15 link bold line dot bb">${requestScope.boardRow.oimage} 을  <font color="red">삭제</font>&nbsp;&nbsp;<input type="checkbox" class="mr5" name="file_del_chk" id="file_del_chk" value="N"/></li>
 					파일 첨부가 있을경우 기존파일은 <font color="red">삭제</font>됩니다.
 				</div>
			</div>
		</div>
	</div>
	</c:if>
	<div class="f_wrap line bb p8">
		<div class="f_field div1">
			<label for="inputid5" class="ff_title"><strong>이미지</strong></label>
			<div class="ff_wrap ml120">
				<div class="area">
					<label for="inputid5" class="ti">기본주소</label>
					<input type="hidden" name="bbs_file_url" value="${requestScope.boardRow.oimage}" />					
					<input type="file" id="bbs_file1" name="bbs_file1" class="file t1" />						
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
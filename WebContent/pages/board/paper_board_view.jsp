<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kda.board.data.PAPERBOARDSETTINGS" %>
<%@include file="../common.jsp"%>

<%
	String user_level = session.getAttribute(SessionInfo.USER_LEVEL).toString();
    
	
	PAPERBOARDSETTINGS boardSettings = (PAPERBOARDSETTINGS)request.getAttribute("boardSettings");
	String str = "";
	 
	if (g_user_level > boardSettings.getBs_ViewLevel() ) {
		
		str = "<script> alert('조회 권한이 없습니다.'); location.href='/'; </script>";
		out.println(str); 
	}
	 
 
	if(str=="" && ((boardSettings.getBs_code() >= 133 && boardSettings.getBs_code() <= 152 )
	|| (boardSettings.getBs_code() >= 187 && boardSettings.getBs_code() <= 190 ) 
	|| boardSettings.getBs_code() == 184 || boardSettings.getBs_code() == 186 || boardSettings.getBs_code() == 185 )   
	){  
		
		String pers_state = session.getAttribute(SessionInfo.PERS_STATE).toString();
		String code_big = session.getAttribute(SessionInfo.CODE_BIG).toString();
		
		if( !code_big.equals("103") && !"ekdldjxm_!@##@!~".equals(g_userid) ){
		
		  str = "<script> alert('영양교사 분과 회원만 이용 가능합니다.'); history.go(-1); </script>"; 
		  out.println(str);
		//회원상태 정상 / 선인증 && !"09".equals(g_pers_state)
		}else if(  "103".equals(code_big) && !"01".equals(g_pers_state) && !"07".equals(g_pers_state) ){
		  str = "<script> alert('영양교사 분과 회원만 이용 가능합니다.'); history.go(-1); </script>"; 
	      out.println(str); 
		}
	}
	
	if(str=="" && ((boardSettings.getBs_code() >= 153 && boardSettings.getBs_code() <= 157 )  )
	    ){  
		
		String code_big = session.getAttribute(SessionInfo.CODE_BIG).toString();
        
        if( !code_big.equals("104") && !"ekdldjxm_!@##@!~".equals(g_userid) ){
        
          str = "<script> alert('학교영양사 분과 회원만 이용 가능합니다.'); history.go(-1); </script>"; 
          out.println(str); 
        //회원상태 정상 / 선인증
        }else if(  "104".equals(code_big) && !"01".equals(g_pers_state) && !"07".equals(g_pers_state) ){
            str = "<script> alert('학교영양사 분과 회원만 이용 가능합니다.'); history.go(-1); </script>"; 
            out.println(str);
        }
    }
	 

%>


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
		/* $("#print_contents").printElement({
			printMode: 'popup',
			pageTitle:'본문',		
			leaveOpen:false		
		}); */
		parent.frames['bbs_contents'].focus();
	    parent.frames['bbs_contents'].print();
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
	
	function doSelect(bbs_idx, bbs_board_code) {
		board.board_form.value = "view";
		board.bbs_idx.value	 = bbs_idx;
		board.bbs_board_code.value = bbs_board_code;
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
	
	//의견쓰기
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
	
	function doDeleteComments(bbs_idx, bbc_idx)
	{
	
		var param = "bbs_idx="+ bbs_idx + "&bbc_idx=" + bbc_idx;
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
	
	function handleLoadCompleteBbsContents()
	{
		alert("handleLoadCompleteBbsContents");
	}
</script>
<!-- bbs_board_code:88888 시도영양사회 게시판 36~48 번호, 제목.. -->
<!-- bbs_board_code:99999 시도영양사회 공지사항 69~81 번호, 분류... (공지x)-->
<c:choose>
	<c:when test="${(requestScope.bbs_board_code >= 25 && requestScope.bbs_board_code <= 33) 
	            || requestScope.bbs_board_code == 95
	            || requestScope.bbs_board_code == 106
	            || requestScope.bbs_board_code == 108
	            || requestScope.bbs_board_code == 132
	            }">
	    <%@include file="./paper_board_view_layer1.jsp"%><!--ex)KDA자료실>동호회 : 제목,등록일,작성자,조회,이메일,의견 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 34}">
	    <%@include file="./paper_board_view_layer2.jsp"%><!--ex)KDA자료실>회원게시판 :제목,작성자,등록일,조회,내용,의견 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 99999
					|| (requestScope.bbs_board_code >= 69 && requestScope.bbs_board_code <= 81) }">
	    <%@include file="./paper_board_view_layer3.jsp"%><!--ex)KDA영양사업>우리 축산물소비촉진사업>자료실:제목,작성자,등록일,조회,내용-->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 0
	            || requestScope.bbs_board_code == 2
	            || requestScope.bbs_board_code == 64}">
	    <%@include file="./paper_board_view_layer4.jsp"%><!--ex)KDA소식>공지사항: 제목,작성자,등록일,조회,내용-->
	</c:when>
	<c:otherwise><!-- 코드:67 -->
	    <%@include file="./paper_board_view_default.jsp"%><!--ex)영양클리닉>식단 : 제목,작성자,등록일,조회,이메일,내용,이전다음글 -->
	</c:otherwise>
</c:choose>
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
<div class="line bt mt40 text small">
	<h4 class="ti">편의버튼</h4>
	<ul>
		
		<c:if test="${requestScope.boardRowNext != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">이전글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowNext.bbs_idx}, ${requestScope.boardRowPrev.bbs_board_code})">${requestScope.boardRowNext.bbs_subject}</a></span>
				<span class="pa r15 t15">${f:substring(requestScope.boardRowNext.bbs_reg_date_dt, 0, 10)}</span>
			</div>
		</li>
		</c:if>
		
		<c:if test="${requestScope.boardRowPrev != null }">
		<li>
			<div class="pr p15 line bb">
				<strong class="pa l15 t15 bold cm">다음글</strong>
				<span class="link ml100 mr90"><a href="javascript:doSelect(${requestScope.boardRowPrev.bbs_idx}, ${requestScope.boardRowPrev.bbs_board_code})">${requestScope.boardRowPrev.bbs_subject}</a></span>
				<span class="pa r15 t15">${f:substring(requestScope.boardRowPrev.bbs_reg_date_dt, 0, 10)}</span>
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
	
	<ul class="fr">  
		<c:if test="${(requestScope.boardRow.bbs_user_id != '' && g_userid == requestScope.boardRow.bbs_user_id ) || g_user_level <= 2 || requestScope.boardRow.bbs_board_code == 116 }"> 
			<li><a href="javascript:doModify();" class="btn big t4">수정</a></li>
			<li><a href="javascript:doDelete();" class="btn big t4">삭제</a></li>
		</c:if> 
		<c:if test="${requestScope.boardSettings.bs_WriteLevel >= user_level && requestScope.bbs_board_code != 135}">
			<li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
		</c:if>
		<c:if test="${requestScope.bbs_board_code == 135 && g_pers_state=='01' }">
		     <li><a href="javascript:doWrite();" class="btn big t1">글쓰기</a></li>
		</c:if> 
		</ul>
</div>

<form name="download">
	<input type="hidden" name="bbs_board_code">
	<input type="hidden" name="bbs_idx">
	<input type="hidden" name="bbs_file_name">
	<input type="hidden" name="bbs_file_url">
	<input type="hidden" name="num">
</form>

<iframe name="work" id="work" width="0" height="0" style="display:none;"></iframe>
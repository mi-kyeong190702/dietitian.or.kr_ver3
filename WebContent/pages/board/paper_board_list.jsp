<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../common.jsp"%>

<% 
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	

	String file_path =  pageName.substring(0, pageName.length()-3);
	request.setAttribute("file_path", file_path); 
%>

	
<script type="text/javascript">
	
	var board;
	
	$(document).ready(function()
	{
		board = document.forms["board"];
		if ( board == undefined ){
			alert("board form undefined");	
		}
	});
	
	function doSearch()
	{ 
		board.board_form.value		="list";
		board.board_search.value 	= $("#board_search").val();
		board.board_keyword.value 	= $("#board_keyword").val();
		board.board_page.value 		= "1";
		board.g_userid.value		= $("#g_userid").val();

		board.submit();
		
	}
	
	function doSelect(bbs_idx, bbs_board_code)
	{
		board.board_form.value 		= "view";
		board.bbs_idx.value	 		= bbs_idx;
		board.bbs_board_code.value	= bbs_board_code;
		board.submit();
	}

	function doWirte()
	{
		board.board_form.value="write";
		board.submit();
	}
	
	function moveFirst(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function movePrev(page)
	{
		//이전  페이지(<) 클릭 시 X1 번 글록 이동
        var iPage = parseInt(page / 10);
        const iRest = page % 10;
        if ( iRest == 0 ) {
        	if ( iPage == 0 ) {
        		iPage = 1;
        	} else {
        		iPage = (iPage - 1) * 10 + 1;
        	}
        } else {
            iPage = iPage * 10 + 1;
        }
        
		board.board_form.value="list";
		board.board_page.value=iPage;
		board.submit();
	}
	
	function movePage(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	function moveNext(page)
	{
		//다음  페이지(>) 클릭 시 X1 번 글록 이동
		var iPage = parseInt(page / 10);
		const iRest = page % 10;
		if ( iRest == 0 ) {
			iPage = (iPage - 1) * 10 + 1;
		} else {
			iPage = iPage * 10 + 1;
		}
		
		board.board_form.value="list";
		board.board_page.value=iPage;
		board.submit();
	}
	
	function moveLast(page)
	{
		board.board_form.value="list";
		board.board_page.value=page;
		board.submit();
	}
	
	
	
</script>  
<!-- bbs_board_code:88888 시도영양사회 게시판 36~48 번호, 제목.. -->
<!-- bbs_board_code:99999 시도영양사회 공지사항 69~81 번호, 분류... (공지x)-->
<input type="hidden" id="g_userid" name="g_userid" class="input t1 fl w200 ml5" value="${g_userid}"/>
<input type="hidden" id="g_code_big" name="g_code_big" class="input t1 fl w200 ml5" value="${g_code_big}"/>
<c:choose>
    <c:when test="${requestScope.bbs_board_code == 89}">
      <script>
    location.href = '/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_userid}';
    </script>
    </c:when>

	<c:when test="${requestScope.bbs_board_code == 6
				|| (requestScope.bbs_board_code >= 25 && requestScope.bbs_board_code <= 34  )
	            || requestScope.bbs_board_code == 95
	            || requestScope.bbs_board_code == 106
	            || requestScope.bbs_board_code == 108
	            || requestScope.bbs_board_code == 123
	            || requestScope.bbs_board_code == 128  
	            || requestScope.bbs_board_code == 88888}">
	    <%@include file="./paper_board_list_layer1.jsp"%><!-- 번호,제목,작성자,등록일,조회  -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 99999  || (requestScope.bbs_board_code >= 69 && requestScope.bbs_board_code <= 81)  }">
	  <%@include file="./paper_board_list_layer2.jsp"%><!-- 번호,제목,작성자,등록일,조회, 공지x :  공지사항  -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 91 || requestScope.bbs_board_code == 87 }">
	   <%@include file="./paper_board_list_image.jsp"%><!-- 이미지 /제목/내용/등록일 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 2 || requestScope.bbs_board_code == 63  || requestScope.bbs_board_code == 22
	 				|| requestScope.bbs_board_code == 64 || requestScope.bbs_board_code == 107  
	 				|| requestScope.bbs_board_code == 87 
					|| requestScope.bbs_board_code == 125 || requestScope.bbs_board_code == 127 || requestScope.bbs_board_code == 129
					|| requestScope.bbs_board_code == 171
					|| requestScope.bbs_board_code == 176 || requestScope.bbs_board_code == 180 || requestScope.bbs_board_code == 182 
					}">					
		<%@include file="./paper_board_list_layer3.jsp"%><!-- (자동화)번호,(자료분류),제목,등록일,조회,(추천수)공지x--><!-- /board/list.asp -->
	</c:when> 
	<c:when test="${requestScope.bbs_board_code == 134 || requestScope.bbs_board_code == 135 || requestScope.bbs_board_code == 138
					|| requestScope.bbs_board_code == 139 || requestScope.bbs_board_code == 136 || requestScope.bbs_board_code == 137
					|| requestScope.bbs_board_code == 184 || requestScope.bbs_board_code == 185 || requestScope.bbs_board_code == 186 }">					
		<%@include file="./paper_board_list_layer4.jsp"%><!-- (자동화)번호,(자료분류),제목,등록일,조회,(추천수)공지x 영양교사--><!-- /board/list.asp -->
	</c:when>
	<c:when test="${ requestScope.bbs_board_code == 156 || requestScope.bbs_board_code == 157 || requestScope.bbs_board_code == 154}">					
		<%@include file="./paper_board_list_layer5.jsp"%><!-- (자동화)번호,(자료분류),제목,등록일,조회,(추천수)공지X 학교영양사--><!-- /board/list.asp -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 92 }">
	    <%@include file="./paper_board_list_default2.jsp"%><!-- 번호,분류,제목,등록일,조회,공지ㅇ-->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 133 || (requestScope.bbs_board_code >= 140 && requestScope.bbs_board_code <= 152)
	               || (requestScope.bbs_board_code >= 187 && requestScope.bbs_board_code <= 190) || requestScope.bbs_board_code == 991 }">
	    <%@include file="./paper_board_list_default3.jsp"%><!-- 번호,분류,제목,등록일,조회,공지ㅇ 영양교사 -->
	</c:when>
	<c:when test="${requestScope.bbs_board_code == 153 || requestScope.bbs_board_code == 155 }">
	   <%@include file="./paper_board_list_default4.jsp"%><!-- 번호,분류,제목,등록일,조회,공지ㅇ 학교영양사 -->
	</c:when>	
	<c:otherwise><!-- 67번 --> 
	    <%@include file="./paper_board_list_default.jsp"%><!-- 번호,분류,제목,등록일,조회,공지ㅇ-->
	</c:otherwise>
</c:choose>

<c:if test="${f:length(requestScope.boardSettings.bs_admin) > 0}">
	<c:set var="str" value="${requestScope.boardSettings.bs_admin}"/>
	<c:set var="doneLoop" value="false"/>
	<c:forEach var="spt" items="${f:split(str, ',')}"  varStatus="status">
		<c:if test="${(spt == g_userid) && (g_userid != '') }"><%g_user_level =2;%></c:if>
		<c:set var="doneLoop" value="true"/>
	</c:forEach>
</c:if>


<div class="btn_wrap mt20">
	<ul class="fr">
		<c:set var="bs_admin" value="${fn:split(requestScope.boardSettings.bs_admin,',') }" />
		<c:set var="check" value="0"/>
		<c:set var="dntchk" value="0"/>
		<c:if test="${g_isLogin}"> 
		  <c:forEach var="list" items="${bs_admin }">			
			<c:if test="${list==g_userid }">
				<c:set var="check" value="1"/> 
			</c:if>			
		  </c:forEach> 
		  <c:choose>
			  <c:when test="${
			    (
			      ((requestScope.bbs_board_code >= 133 && requestScope.bbs_board_code <= 152)
			      || (requestScope.bbs_board_code >= 184 && requestScope.bbs_board_code <= 190)
			      )
			      && g_code_big == 103
			    ) 
			    || 
			    (
			      (requestScope.bbs_board_code >= 153 && requestScope.bbs_board_code <= 157)
			      && g_code_big == 104
			    )
			    || g_userid == 'ekdldjxm_!@##@!~'
			  }">
			    <c:set var="dntchk" value="1"/>
			  </c:when>
			  <c:otherwise>
			    <c:set var="dntchk" value="0"/>
			  </c:otherwise>
		  </c:choose>
	   </c:if>
		<c:if test="${ 
		(g_user_level <= requestScope.boardSettings.bs_WriteLevel && requestScope.bbs_board_code != 99999 && requestScope.bbs_board_code != 88888 
		&& !(requestScope.bbs_board_code >= 153 && requestScope.bbs_board_code <= 157)
		&& (requestScope.bbs_board_code != 135)
        && !((requestScope.bbs_board_code >= 133 && requestScope.bbs_board_code <= 134)
                  || (requestScope.bbs_board_code >= 136 && requestScope.bbs_board_code <= 152)
                  || (requestScope.bbs_board_code >= 184 && requestScope.bbs_board_code <= 190))		
		) 
		|| check==1 
		|| requestScope.bbs_board_code == 116}">
		    <c:set var="dntchk" value="0"/>
			<li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
		</c:if>
		<c:if test="${requestScope.bbs_board_code == 135 && g_pers_state=='01'}">
		    <li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
		</c:if>
		<c:if test="${ dntchk  ==1 && g_user_level <= requestScope.boardSettings.bs_WriteLevel && (requestScope.bbs_board_code != 135) }">
		  <li><a href="javascript:doWirte();" class="btn big t1">글쓰기</a></li>
		</c:if>
	</ul>
</div>

<div class="paging small mt30">
	<a href="javascript:moveFirst(${requestScope.boardPage.getFirstPage()});" class="p_btn start"><span class="icon"></span><span class="ti">처음</span></a>
	<a href="javascript:movePrev(${requestScope.boardPage.getPrevPage()});" class="p_btn prev"><span class="icon"></span><span class="ti">이전</span></a>			
		
	<c:forEach var="i" begin="${requestScope.boardPage.getStartPage() }" end="${requestScope.boardPage.getEndPage()}" step="1">
		<c:choose>
			<c:when test="${requestScope.boardPage.getCurPage() == i }">
				<a href="javascript:movePage(${i});" class="p_btn on">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:movePage(${i});" class="p_btn">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		
	<a href="javascript:moveNext(${requestScope.boardPage.getNextPage()});" class="p_btn next"><span class="icon"></span><span class="ti">다음</span></a>
	<a href="javascript:moveLast(${requestScope.boardPage.getLastPage()});" class="p_btn end"><span class="icon"></span><span class="ti">끝</span></a>
</div>
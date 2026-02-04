<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
function f_Action() {
	if( $("#kda_title").val() == "") {
		alert("제목을 입력하여 주십시요");
		return;
	}
	
	document.frmColumn.action = "kp_m_list_action.do";
	document.frmColumn.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark> 검색</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">KDA 출판</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">국민영양</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_m_list" class="cm">국민영양 검색</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
		<!-- // Contents Start -->
		<div class="tab_2 div2 mb30">
			<ul>
				<li><a href="/work/publication/kp_m_list.do" class="on">목차/e-Book 보기</a></li>
				<li><a href="/publication/paper_board/kp_m_search.do?bbs_board_code=13">내용검색</a></li>
			</ul>
		</div>
		<div class="form line bt bcm bw2">
		
			<form:form name="frmColumn" method="post" modelAttribute="column" enctype="multipart/form-data">
			<form:hidden path="idx" />
			<form:hidden path="crud"/>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_title" class="ff_title i_b"><strong>제목</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<form:input path="kda_title" class="input t1"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="textarea1" class="ff_title i_b"><strong>설명</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="title_contents" class="ti">설명</label>
							<form:textarea path="title_contents" class="textarea t1 h100" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title i_b"><strong>옵션</strong></div>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<form:checkbox path="tagchecked" value="1" />
							<label for="tagchecked" class="mr20">HTML</label>
						</div>
					</div>
				</div>
			</div>
			<!----------------------------------------- 1,2월호에만 적용됨 --------------------------------------------->
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="textarea2" class="ff_title i_b"><strong>KDA 칼럼</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">기본주소</label>
							<form:textarea path="kda_column" class="textarea t1 h100" />
						</div>
					</div>
				</div>
			</div>
			<!----------------------------------------------------------------------------------------------------------->
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="textarea2" class="ff_title i_b"><strong>KDA ISSUE</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">기본주소</label>
							<form:textarea path="kda_special" class="textarea t1 h100" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_nd" class="ff_title i_b"><strong>KDA FOCUS</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">기본주소</label>
							<form:textarea path="kda_nd"  class="textarea t1 h100"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_practice" class="ff_title i_b"><strong>KDA PRACTICE</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">기본주소</label>
							<form:textarea path="kda_practice" class="textarea t1 h100"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_we" class="ff_title i_b"><strong>KDA PEOPLE</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="inputid19" class="ti">KDA PEOPLE</label>
							<form:textarea path="kda_we" class="textarea t1 h100"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_news" class="ff_title i_b"><strong>KDA NOW</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="kda_news" class="ti">KDA NOW</label>
							<form:textarea path="kda_news"  class="textarea t1 h100" />
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_board" class="ff_title i_b"><strong>열린게시판</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="kda_board" class="ti">열린게시판</label>
							<form:textarea path="kda_board"  class="textarea t1 h100"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_picture" class="ff_title i_b"><strong>화보</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="kda_picture" class="ti">화보</label>
							<form:textarea path="kda_picture" class="textarea t1 h100"/>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="upload_image" class="ff_title"><strong>이미지</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="upload_image" class="ti">이미지</label>
							<form:input path="upload_image" type="file" class="file t1" />
							<form:hidden path="imagename" />
						</div>
					</div>
				</div>
			</div>
			</form:form>
			
			<div class="btn_wrap mt40">
				<ul>
					<li><a href="javascript:f_Action();" class="btn big t1">완료</a></li>
					<li><a href="kp_m_list.do" class="btn big">취소</a></li>
				</ul>
			</div>
		</div>
		
		<!-- // Contents Start -->	
	</div>
</div>

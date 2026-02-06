<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="/css/layout_add.css">
<script>
function f_Action() {
	if( $("#kda_title").val() == "") {
		alert("제목을 입력하여 주십시요");
		return;
	}
	
	document.frmColumn.action = "kp_ebook_list_action.do";
	document.frmColumn.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">학술지</mark> 검색(e-Book)</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
                <li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
                <li><a href="/work/publication/kp_journal.do">학술지</a></li>
				<li><a href="/work/publication/kp_ebook_list.do" class="cm">학술지 검색(e-Book)</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!-- 190122modi -->
		<!-- // Contents Start -->
		<div class="form line bt bcm bw2">
		
			<form:form name="frmColumn" method="post" modelAttribute="column" enctype="multipart/form-data">
			<form:hidden path="idx" />
			<form:hidden path="crud"/>
            <div class="f_wrap line bb p8">
				<div class="f_field div2">
					<label for="kda_yyyy" class="ff_title i_b"><strong>발행연도</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
						   <select id="kda_yyyy" name="kda_yyyy" class="select t1 w100">
								<option value="2019" <c:if test="${ column.kda_yyyy == '2019' }">selected</c:if>>2019</option>
								<option value="2020" <c:if test="${ column.kda_yyyy == '2020' }">selected</c:if>>2020</option>
								<option value="2021" <c:if test="${ column.kda_yyyy == '2021' }">selected</c:if>>2021</option>
								<option value="2022" <c:if test="${ column.kda_yyyy == '2022' }">selected</c:if>>2022</option>
								<option value="2023" <c:if test="${ column.kda_yyyy == '2023' }">selected</c:if>>2023</option>
								<option value="2024" <c:if test="${ column.kda_yyyy == '2024' }">selected</c:if>>2024</option>
								<option value="2025" <c:if test="${ column.kda_yyyy == '2025' }">selected</c:if>>2025</option>
								<option value="2026" <c:if test="${ column.kda_yyyy == '2026' }">selected</c:if>>2026</option>
								<option value="2027" <c:if test="${ column.kda_yyyy == '2027' }">selected</c:if>>2027</option>
								<option value="2028" <c:if test="${ column.kda_yyyy == '2028' }">selected</c:if>>2028</option>
								<option value="2029" <c:if test="${ column.kda_yyyy == '2029' }">selected</c:if>>2029</option>
								<option value="2030" <c:if test="${ column.kda_yyyy == '2030' }">selected</c:if>>2030</option>
							</select>
						</div>
						
					</div>
				</div>
				<div class="f_field div2">
					<label for="kda_mm" class="ff_title i_b"><strong>NO.</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<select id="kda_mm" name="kda_mm" class="select t1 w100">
								<option value="1" <c:if test="${ column.kda_mm == '1' }">selected</c:if>>1</option>
								<option value="2" <c:if test="${ column.kda_mm == '2' }">selected</c:if>>2</option>
								<option value="3" <c:if test="${ column.kda_mm == '3' }">selected</c:if>>3</option>
								<option value="4" <c:if test="${ column.kda_mm == '4' }">selected</c:if>>4</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="kda_yn" class="ff_title i_b"><strong>사용여부</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
						   <select id="kda_yn" name="kda_yn" class="select t1 w100">
								<option value="N" <c:if test="${ column.kda_yn == 'N' }">selected</c:if>>N</option>
								<option value="Y" <c:if test="${ column.kda_yn == 'Y' }">selected</c:if>>Y</option>
							</select>
						</div>
						
					</div>
				</div>
			</div>
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
			<!-- 
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<div class="ff_title i_b"><strong>옵션</strong></div>
					<div class="ff_wrap ml120 text">
						<div class="area">
							<input id="tagchecked1" name="tagchecked" type="checkbox" value="1"/><input type="hidden" name="_tagchecked" value="on"/>
							<label for="tagchecked" class="mr20">HTML</label>
						</div>
					</div>
				</div>
			</div>
			 -->
			<div class="f_wrap line bb p8">
				<div class="f_field div1">
					<label for="textarea1" class="ff_title i_b"><strong>e-book URL</strong></label>
					<div class="ff_wrap ml120">
						<div class="area">
							<label for="kda_url" class="ti">URL</label>
							<textarea id="kda_url" name="kda_url"  class="textarea t1">${ column.kda_url }</textarea>
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
							<input id="upload_image" name="upload_image" class="file t1" type="file" value=""/>
							<input id="imagename" name="imagename" type="hidden" value=""/>
						</div>
					</div>
				</div>
			</div>
			</form:form>
			
			<div class="btn_wrap mt40">
				<ul>
					<li><a href="javascript:f_Action();" class="btn big t1">완료</a></li>
					<li><a href="kp_ebook_list.do" class="btn big">취소</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

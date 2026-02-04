<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function SearchWord(){
	var form = document.form;

	if (form.findword.value == ""){
		alert("검색어를 입력해 주세요.");
		form.findword.focus();
		return;
	}
	
	form.act.value = "W";
	form.submit();
}

function SearchPreWord(str){
	var form = document.form;

	form.act.value = "P";
	form.hword.value = str;
	form.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">간편정보</mark> 118</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_info118.do" class="cm">간편정보118</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // Contents Start -->
				<div class="text s1 center">
						건강 관련 정보를 전문가의 검증을 통해 보다 체계적으로 유용한 정보를 제공합니다.<br />
						검색 서비스를 통해 궁금한 건강정보를 확인해 보세요.
					</div>
					<form name="form" method="post" action="kb_c_info118.do">
					<input type="hidden" name="act">
					<input type="hidden" name="hword">
						<fieldset>
						<legend><span class="ti">간편영양정보검색</span></legend>
							<div class="box p20 mt30">
								<div class="form">
									<div class="f_wrap">
										<div class="f_field div1">
											<div class="title s1 i_b_t6 fl">
												검색어 입력
											</div>
											<div class="ff_wrap fl ml40">
												<div class="area">
													<input type="text" name="findword" class="input t1 fl w300" id="findword" />
													<a href="javascript:SearchWord();" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
												</div>
											</div>
										</div>
									</div>
									<div class="f_wrap mt20">
										<div class="f_field div1">
											<div class="title s1 i_b_t6 fl">
												사전식 검색
											</div>
											<div class="ff_wrap fl ml40">
												<div class="area">
													<div class="paging small">
														<a href="javascript:SearchPreWord('ㄱ');" class="p_btn">ㄱ</a>
														<a href="javascript:SearchPreWord('ㄴ');" class="p_btn">ㄴ</a>
														<a href="javascript:SearchPreWord('ㄷ');" class="p_btn">ㄷ</a>
														<a href="javascript:SearchPreWord('ㄹ');" class="p_btn">ㄹ</a>
														<a href="javascript:SearchPreWord('ㅁ');" class="p_btn">ㅁ</a>
														<a href="javascript:SearchPreWord('ㅂ');" class="p_btn">ㅂ</a>
														<a href="javascript:SearchPreWord('ㅅ');" class="p_btn">ㅅ</a>
														<a href="javascript:SearchPreWord('ㅇ');" class="p_btn">ㅇ</a>
														<a href="javascript:SearchPreWord('ㅈ');" class="p_btn">ㅈ</a>
														<a href="javascript:SearchPreWord('ㅊ');" class="p_btn">ㅊ</a>
														<a href="javascript:SearchPreWord('ㅋ');" class="p_btn">ㅋ</a>
														<a href="javascript:SearchPreWord('ㅌ');" class="p_btn">ㅌ</a>
														<a href="javascript:SearchPreWord('ㅍ');" class="p_btn">ㅍ</a>
														<a href="javascript:SearchPreWord('ㅎ');" class="p_btn">ㅎ</a>
														<a href="javascript:SearchPreWord('A-Z');" class="p_btn">A-Z</a>
														<a href="javascript:SearchPreWord('All');" class="p_btn">전체</a>
		
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
						<c:if test="${not empty fileList  }">	
							<div class="box t3 text s1 small mt20 p10  link"><!--검색시 노출-->
								<ul>
									<c:forEach items="${fileList}" var="file">
									<li><a href="${FILE_BASE}${file.html}" target="_blank" class="p5">${file.name}</a></li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						</fieldset>
					</form>
					
					


    
                                            
    <!-- // Contents End -->
	</div>
</div>

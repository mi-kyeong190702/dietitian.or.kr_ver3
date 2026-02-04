<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>

<script>
function f_sendIt() {
	if( $("#banner_type").val() == "0") {
		alert("배너구분을 선택하여 주십시요");
		$("#banner_type").focus();
		return;
	}
	
	if( $("#banner_name").val() == "") {
		alert("배너명을 입력하여 주십시요");
		$("#banner_name").focus();
		return;
	}
	
	<c:if test="${banner.crud == 'C' }">
	if( $("#image_file").val() == "" ) {
		alert("배너이미지를 선택하여 주십시요");
		return;
	}
	</c:if>
	
	if( $("#link_url").val() == "" ) {
		alert("링크주소를 입력하여 주십시요");
		$("#link_url").focus();
		return;
	}
	
	document.frmBanner.submit();
}

function f_deleteIt(){
	if( confirm("정말 삭제하시겠습니까?") ) {
		$("#crud").val("D");
		document.frmBanner.submit();
	}
}

</script>
<div id="adm_contents">
	<div class="c_page">
		<div class="cp_head">
			<div class="cp_title">
				<h2 class="title t1 s1">배너 관리</h2>
			</div>
			<div class="cp_navi">
				<ul>
					<li><a href="#">관리자 홈</a></li>
					<li><span>&gt;</span> <a href="#">홈페이지 관리</a></li>
					<li><span>&gt;</span> <a href="#" class="cm">배너 관리</a></li>
				</ul>
			</div>
		</div>
		<div class="cp_contents">
			<form:form name="frmBanner" modelAttribute="banner" method="post" enctype="multipart/form-data" action="bannerAction.do">
			<form:hidden path="crud" />
			<form:hidden path="idx" />	
			<div class="form line bt bw2 bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>배너구분</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="banner_type" class="select t2 fl w200" >
									<form:option value="0">---선택---</form:option>
									<c:forEach items="${bannerTy}" var="ty">
									<form:option value="${ty.key}">${ty.value}</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid2" class="ff_title"><strong>배너명</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="banner_name"  class="input t1"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid3" class="ff_title"><strong>배너이미지</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="image_file"  type="file" class="input t1" />
							</div>
							<c:if test="${ not empty banner.banner_img  }">
							<form:hidden path="banner_img"/>
							<div class="area">
								<p class="text cp">${banner.banner_img} <a href="${banner.banner_img}" class="btn" target="_blank">미리보기</a></p>
							</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid4" class="ff_title"><strong>링크주소</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="link_url" class="input t1" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>링크타겟</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<form:radiobutton path="link_target" id="link_target_1" class="mr5" value="" />
								<label for="link_target_1" class="mr20">현재창</label>
									
								<form:radiobutton path="link_target" class="mr5" id="link_target_2" value="_blank"/>
								<label for="link_target_2" class="mr20">새창</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>게시여부</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<form:radiobutton path="use_yn" id="use_yn_y" value="Y" class="mr5"/>
								<label for="use_yn_y" class="mr20">게시</label>
								
								<form:radiobutton path="use_yn" id="use_yn_n" value="N" class="mr5"/>
								<label for="use_yn_n" class="mr20">게시안함</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>순서</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<form:input path="order_num"  class="input t1" size="10"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form:form>
			
			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="bannerList.do?srchTy=${param.srchTy}&srchName=${param.srchName}" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<c:if test="${banner.crud == 'C' }">
					<li><a href="javascript:f_sendIt()" class="btn big t1">등록</a></li>
					</c:if>
					<c:if test="${banner.crud == 'U' }">
					<li><a href="javascript:f_sendIt()" class="btn big t1">수정</a></li>
					</c:if>
					<li><a href="javascript:document.frmBanner.reset();" class="btn big t2">취소</a></li>
					
					<c:if test="${banner.crud == 'U' }">
					<li><a href="javaScript:f_deleteIt()" class="btn big t3">삭제</a></li>
					</c:if>
				</ul>
			</div>
			
			
			<div class="text center mt40">
				<img src="../images/ex_banner.jpg" alt="배너위치 안내 이미지" />
			</div>
		</div>
	</div>
</div>

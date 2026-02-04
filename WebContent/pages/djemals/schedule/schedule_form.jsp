<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function f_action()	{
	
	if( $("#title").val()=="" ){
		alert("제목은 필수 입력 사항입니다.");
		$("#title").focus();
		return;
	}
	
	document.frmSchedule.submit();
}

function f_delete(){
	if( confirm("정말 삭제하시겠습니까?") ) {
		$("#crud").val("D");
		document.frmSchedule.submit();
	}
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<form:form name="frmSchedule" modelAttribute="schedule" method="post" action="scheduleAction.do">
		<form:hidden path="crud" />
		<form:hidden path="num" />
		<form:hidden path="yy" />
		<form:hidden path="mm" />
		<form:hidden path="dd" />
		<div class="cp_contents">
			<div class="form line bt bw2 bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title"><strong>제목</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="title"  class="input t1"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="textarea1" class="ff_title"><strong>내용</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:textarea path="content"  class="textarea t1 h150"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid2" class="ff_title"><strong>장소</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="s_where"  class="input t1"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid3" class="ff_title"><strong>시간</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="s_time"  class="input t1"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid4" class="ff_title"><strong>연락처</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="s_tel"  class="input t1"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="scheduleList.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<c:if test="${schedule.crud == 'C' }">
					<li><a href="javascript:f_action();" class="btn big t1">저장</a></li>
					</c:if>
					<c:if test="${schedule.crud == 'U' }">
					<li><a href="javascript:f_action();" class="btn big t1">수정</a></li>
					<li><a href="javascript:f_delete();" class="btn big t3">삭제</a></li>
					</c:if>
					<li><a href="scheduleList.do" class="btn big">취소</a></li>
				</ul>
			</div>
		</div>
		</form:form>
	</div>
</div>

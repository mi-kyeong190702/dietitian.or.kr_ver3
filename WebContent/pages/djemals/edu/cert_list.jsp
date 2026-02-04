<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function f_search() {
	var srchTy = $("#srchTy").val();
	var srchName = $("#srchName").val();
	var srchNo = $("#srchNo").val();

	location.href="certList.do?srchTy=" + srchTy + "&srchName=" + srchName + "&srchNo=" + srchNo;
}

function f_insert() {
	var srchTy = $("#srchTy").val();
	var srchName = $("#srchName").val();
	var srchNo = $("#srchNo").val();
	
	if(srchTy ==""){
		alert("구분을 선택해 주십시오.");
		return;
	}
	if(srchName  ==""){
		alert("이름을 입력해 주십시오.");
		return;
	}
	if(srchNo ==""){
		alert("면허번호를 입력해 주십시오.");
		return;
	}
	
	document.frmCert.action="certInsert.do";
	document.frmCert.submit();

}

function f_edit(id,nm,no,codenm) {
	
	$("#pers_name").val(nm);
	$("#lic_no").val(no);
	$("#code_old").val(codenm);
	$("#code_new").val($("#sel"+id).val());
	
	document.frmCert.action="certEdit.do";
	document.frmCert.submit();
	
}
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<form name="frmCert" action="certInsert.do" method="post">
		<input type="hidden" name="pers_name" id="pers_name" />
		<input type="hidden" name="lic_no" id="lic_no" />
		<input type="hidden" name="code_old" id="code_old" />
		<input type="hidden" name="code_new" id="code_new" />
		<div class="cp_contents">
			<h3 class="title t3 bold s1"><mark class="cm">온라인교육센터</mark> 회원 연동 정보</h3>
			<div class="box t1 p10 mt10">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div4">
							<label for="inputid1" class="ff_title"><strong>구분</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<select class="select t2" id="srchTy" name="srchTy">
										<option value="">구분</option>
										<c:forEach items="${certTy}" var="ty">
										<option value="${ty.key}" <c:if test="${param.srchTy == ty.key }">selected</c:if> >${ty.value}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="f_field div4">
							<label for="inputid2" class="ff_title"><strong>이름</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" class="input t1" id="srchName" name="srchName" value="${param.srchName}"/>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="inputid3" class="ff_title"><strong>면허번호</strong></label>
							<div class="ff_wrap ml80">
								<div class="area">
									<input type="text" class="input t1 fl w30p" id="srchNo" name="srchNo" value="${param.srchNo}"/>
									<a href="javascript:f_search();" class="btn form t2 fl ml5">검색</a>
									<a href="javascript:f_insert();" class="btn form t1 fl ml5">신규저장</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<table class="table t1 text small center mt5">
				<colgroup>
					<col width="60">
					<col width="*">
					<col width="80">
					<col width="150">
					<col width="80">
					<col width="120">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm"></th>
					<th scope="col" class="bold cm">구분</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">아이디</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">회원상태</th>
					<th scope="col" class="bold cm">변경</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="cert">
				<tr>
					<td>${cert.num}</td>
					<td>${cert.groupcodename}</td>
					<td>${cert.pers_name }</td>
					<td>${cert.id }</td>
					<td>${cert.lic_no}</td>
					<td>${cert.state}</td>
					<td>
						<div class="ib">
							<select class="fl select t1 w200" id="sel${cert.num}">
								<option value='001002' <c:if test="${cert.groupcodename=='임상영양사 소지자'}">selected="selected"</c:if> >임상영양사 소지자</option>
								<option value='001003' <c:if test="${cert.groupcodename=='임상영양사 수료자'}">selected="selected"</c:if> >임상영양사 수료자</option>
								<option value='002001' <c:if test="${cert.groupcodename=='재수강 임상 소지자 및 수료자'}">selected="selected"</c:if> >재수강 임상 소지자 및 수료자</option>
								<option value='002002' <c:if test="${cert.groupcodename=='재수강 일반'}">selected="selected"</c:if> >재수강 일반</option>
							</select>
							<a href="javascript:f_edit(${cert.num},'${cert.pers_name }','${cert.lic_no }','${cert.groupcode }');" class="fl ml5 btn form">수정</a>
						</div>
			
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</form>
	</div>
</div>

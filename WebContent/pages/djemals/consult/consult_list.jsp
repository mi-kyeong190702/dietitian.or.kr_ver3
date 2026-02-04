<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(id){
	
	if(id == 'C'){
		var cid = $("#cuserId");
		var cnm = $("#cuserName");
		
		if(cid.val()==""){
			alert("아이디를 입력하세요.");
			cid.focus();
			return;
		}
		if(cnm.val()==""){
			alert("이름을 입력하세요.");
			cnm.focus();
			return;
		}
		
		location.href="consultAction.do?cuserId="+cid.val()+"&cuserName="+cnm.val()+"&crud=C";
		
	}else{
		
		if( confirm("정말 삭제하시겠습니까?") ) {
			location.href="consultAction.do?cuserId="+id+"&crud=D";
		}
		
	}
	
	
}
	
</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<div class="box t1 p10 mt5">
				<div class="form">
					<div class="f_wrap">
						<div class="f_field div3">
							<label for="inputid1" class="ff_title"><strong>아이디</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" name="cuserId" id="cuserId" class="input t1 fl w50p ml5"> 
								</div>
							</div>
						</div>
						<div class="f_field div3">
							<label for="inputid1" class="ff_title"><strong>이름</strong></label>
							<div class="ff_wrap ml100">
								<div class="area">
									<input type="text" name="cuserName" id="cuserName" class="input t1 fl w50p ml5"> 
								</div>
							</div>
						</div>
						<div class="f_field div3">
							<div class="ib fl"><a href="javascript:f_action('C');" class="fr btn form t1">상담원 추가</a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="area">
				<div class="ib fl">
					<div class="text mt5">
						*** 지정된 상담원들 아이디 ***
					</div>
				</div>
			</div>
			<table class="table t1 text small center  mt5">
				<colgroup>
					<col width="300">
					<col width="300">
					<col width="70">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">아이디</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listHelper.list}" var="consult">
				<tr>
					<td>${consult.cuserId }</td>
					<td>${consult.cuserName}</td>
					<td><a href="javascript:f_action('${consult.cuserId }');" class="btn t3">삭제</a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		<kda:paging listHelper="${listHelper}" layout="admin"/>
		
		
		</div>
		
	</div>
</div>

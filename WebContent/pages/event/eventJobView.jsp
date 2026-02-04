<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kda.event.data.EventView"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>취업설명회 알리기 이벤트</title>
	<link rel="stylesheet" href="https://www.dietitian.or.kr/css/common.css">
	<link rel="stylesheet" href="https://www.dietitian.or.kr/css/layout.css">
	<link rel="shortcut icon" href="https://www.dietitian.or.kr/css/favicon.ico" />   
	<link rel="stylesheet" href="https://www.dietitian.or.kr/css/jquery-ui-1.10.4.custom.min.css" />
	<link rel="stylesheet" href="https://www.dietitian.or.kr/css/jquery.ui.timepicker.css" />		

	<script src="/js/jquery-1.11.2.min.js"></script>	
	<script type="text/javascript" src="https://www.dietitian.or.kr/js/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="https://www.dietitian.or.kr/js/jquery.ui.datepicker-ko.min.js"></script>
	<script type="text/javascript" src="https://www.dietitian.or.kr/js/jquery.ui.timepicker.js"></script>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>		
</head>

<script language="JavaScript">
function selEvent(val){
	

		document.getElementById("sns").style.display="block";
		document.getElementById("plusone").style.display="none";
 		document.getElementById("code_event").value="2"
 		document.join.new_name.value="";
		document.join.new_tel.value="";
		document.join.new_compname.value="";
		
	
} 
	
/* 
	function test(){
		//alert(document.getElementByName("event_sel").value);
		var ta=document.getElementById("t_plusone");
		var ta2=document.getElementById("t_sns");
		if(document.getElementById("plusoner").checked){
			var idx=Number(document.getElementById("t_idx").value)+1;

			var row=ta.insertRow(ta.rows.length);
			var td1=row.insertCell(0);
			var td2=row.insertCell(1);
			var td3=row.insertCell(2);
			var td4=row.insertCell(3);

			td1.style.textAlign="center";
			td1.innerHTML=idx;
			td2.innerHTML="<input name='new_name_"+idx+"' size='8'>";
			td3.innerHTML="<input name='new_tel_"+idx+"' size='23' onKeyPress='onlyNumber();' maxlength='11'>";
			td4.innerHTML="<input name='new_compname_"+idx+"' size='38'>";

			document.getElementById("t_idx").value=idx;
		}else{
			var idx=Number(document.getElementById("t_idx").value)+1;
			var row2=ta2.insertRow(ta2.rows.length);
			var td1=row2.insertCell(0);
			var td2=row2.insertCell(1);

			td1.style.textAlign="center";
			td1.innerHTML=idx;
			td2.innerHTML="<input name='sns_domain_"+idx+"' size='75'>";
			document.getElementById("t_idx").value=idx;
		}
		
		//alert(document.getElementById("t_idx").value);
	}

	function resetTable(){
		//alert("test");
		var ta=document.getElementById("t_plusone");
		var ta2=document.getElementById("t_sns");

		var idx=Number(document.getElementById("t_idx").value)-1;

		if(document.getElementById("plusoner").checked){
			var rowLen=ta.rows.length-1;
			if(rowLen==2){
				alert("첫번째 행은 삭제할 수 없습니다.");
				return;
			}else{
				ta.deleteRow(rowLen);
				document.getElementById("t_idx").value=idx;
			}
		}else{
			var rowLen2=ta2.rows.length-1;
			if(rowLen2==2){
				alert("첫번째 행은 삭제할 수 없습니다.");
				return;
			}else{
				ta2.deleteRow(rowLen2);
				document.getElementById("t_idx").value=idx;
			}
		}
		
} */
	function check_send()
	{
		if(document.getElementById("code_event").value=="1"){
			if (document.join.new_name.value == ""){
				document.join.new_name.focus();
				alert("성명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				return false;
			}
			/* if (document.join.new_lic.value == ""){
				document.join.new_lic.focus();
				alert("면허번호를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				return false;
			} */
			if (document.join.new_tel.value == ""){
				document.join.new_tel.focus();
				alert("연락처를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				return false;
			}
			if (document.join.new_compname.value == ""){
				document.join.new_compname.focus();
				alert("근무처명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				return false;
			}
		}else{
			if (document.join.sns_domain.value == ""){
				document.join.sns_domain.focus();
				alert("도메인을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
				return false;
			}
			
		}
		return true;
	}
	
	function send()
	{
		if (check_send()){
			
		
			/* alert ("${code_pers}"); */
			
		var f = document.forms["join"];
		f.action = "/eventinsert.do";
		f.method = "post";
		f.submit();}

	}
			
			
</script>
<body>

<div id="popup">

<form id="join" name="join" >
<!-- <input type="hidden" name="pers_name" id="pers_name" value=""/>
<input type="hidden" name="detcodename" id="detcodename" value=""/>
<input type="hidden" name="lic_no" id="lic_no" value=""/>
<input type="hidden" name="pers_tel" id="pers_tel" value=""/>
<input type="hidden" name="pers_hp" id="pers_hp" value=""/>
<input type="hidden" name="email" id="email" value=""/>
<input type="hidden" name="company_name" id="company_name" value=""/>
<input type="hidden" name="code_post" id="code_post" value=""/>
<input type="hidden" name="pers_add" id="pers_add" value=""/>
<input type="hidden" name="pers_add_detail" id="pers_add_detail" value=""/>
<input type="hidden" name="code_pers" id="code_pers" value=""/> -->

	<div class="p_head">
		<h2 class="title t3 cw bold s1 i_b_t6">취업설명회 알리기 이벤트 : SNS를 통한 우리 협회 취업설명회 후기 알리기</h2>
	</div>
	<div class="p_body text ca small">
    	<span class="bold s1 mt20 ml20">
    	<input type="hidden" name="code_event" id="code_event"  value="3"/>
    	
		<div class="p20">
        	<h5 class=" title bold s1 t3 i_b_t3 mt20">회원정보</h5>
			<div class="area">
				<div class="form mt10 line bt bcm">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
							<div class="ff_wrap ml120">
 								<input type="text" class="input t1 fl w80" id="pers_name"
												name="pers_name" value="${requestScope.eventview.pers_name}" readonly />
								<%-- <div class="area"><%=eventview.pers_name%></div> --%>
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>회원구분</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl w120" id="detcodename"
											name="detcodename" value="${requestScope.eventview.detcodename}" readonly />
							</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>면허번호</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl w120" id="lic_no"
											name="lic_no" value="${requestScope.eventview.lic_no}" readonly />
							</div>
						</div>
					</div>
                    
                    <div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>이메일</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl" id="email"
											name="email" value="${requestScope.eventview.email}" readonly />
							</div>
						</div>
					</div>
                    
                    
                    <div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>학교명</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl" id="company_name"
											name="company_name" value="${requestScope.eventview.company_name}" readonly />
							</div>
						</div>
					</div>
                    
                    <div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>전화번호</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl" id="pers_hp"
											name="pers_hp" value="${requestScope.eventview.pers_hp}" readonly />
							</div>
						</div>
					</div>
                    
                    <div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>주소</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl" id="pers_add"
											name="pers_add" value="${requestScope.eventview.pers_add}" readonly />
							</div>
						</div>
					</div>
					
					<div style="display:none">
						<div class="f_field div1">
							<label for="inputid1" class="ff_title i_b"><strong>회원번호</strong></label>
							<div class="ff_wrap ml120">
								<input type="text" class="input t1 fl" id="code_pers"
											name="code_pers" value="${requestScope.eventview.code_pers}" readonly />
							</div>
						</div>
					</div>
                    
                    
				</div>
			</div>            
            <!-- -->
            <style type="text/css">
				strong, b {font-weight:bold;}
			</style>
			
            <!-- 협회 IN 이벤트 -->
            <div id="plusone" style="display:none">
			<h5 class=" title bold s1 t3 i_b_t3 mt20">협회 IN 이벤트 신규 가입자 정보</h5>
			<table id="t_plusone" class="table t1 text s1 ca center mt20">
				<colgroup>					
					<col width="40">					
					<col width="150">
					<col width="*">
					<col width="*">				
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="bold cm">No</th>
						<th scope="col" class="bold cm">성명</th>
						<th scope="col" class="bold cm">연락처(숫자만입력)</th>
						<th scope="col" class="bold cm">근무처명</th>
						
					</tr>
				</thead>
				<tbody>		
                    <tr>			
                        <td>1</td>
                        <td><input name="new_name" type="text" class="input t1 w100"  value=""></td>
                        <td><input name="new_tel" type="text" class="input t1 w150"  value=""></td>
                        <td><input name="new_compname" type="text" class="input t1 w150"  value=""></td>                     
                    </tr>
                    <!-- -->
<!--                     <tr>			
                        <td>2</td>
                        <td><input name="pers_name" type="text" class="input t1 w100"  value=""></td>
                        <td><input name="pers_name" type="text" class="input t1 w150"  value=""></td>
                        <td><input name="pers_name" type="text" class="input t1 w150"  value=""></td>                     
                    </tr> -->
                    <!-- -->
<!--                     <tr>			
                        <td>3</td>
                        <td><input name="pers_name" type="text" class="input t1 w100"  value=""></td>
                        <td><input name="pers_name" type="text" class="input t1 w150"  value=""></td>
                        <td><input name="pers_name" type="text" class="input t1 w150"  value=""></td>                     
                    </tr> -->
				</tbody>
			</table>
            </div>  
            
            
            <!-- 협회 人 이벤트 -->
            <div id="sns" style="display:block">
			<h5 class="title bold s1 t3 i_b_t3 mt20">SNS 등록하기</h5>
			<table class="table t1 text s1 ca center mt20">
				<colgroup>					
					<col width="40">
					<col width="*">				
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="bold cm">No</th>
						<th scope="col" class="bold cm">홍보 도메인</th>
						
					</tr>
				</thead>
				<tbody>		
                    <tr>			
                        <td>1</td>
                        <td><input name="sns_domain" type="text" class="input t1 w500"  ></td>                     
                    </tr>
                    <!-- -->
                    
				</tbody>
			</table>
			</div>
			
			<div class="btn_wrap mt20">
				<ul class="fr">
                
				</ul>
			</div>
            <!-- 버튼추가 -->
<!--             <div id="btn_msg" class="btn_wrap mt10">
                <ul>
                    <li><a href="#" class="btn t1" onclick="javascript:test();">행추가</a></li>
                    <li><a href="#" class="btn t1" onclick="javascript:resetTable();">마지막 행 삭제</a></li>
                </ul>
            </div> -->
            <!--// 버튼추가 -->
		</div>
	</div>
	<div class="p_foot line bt">
		<div id="btn_msg" class="btn_wrap mt20 mb20">
			<ul>
				<li><a href="javascript:send();" class= "btn big t1">완료</a></li>
                <li><a href="javascript:window.close()" class="btn big">취소</a></li>
			</ul>
		</div>
	</div>
</div>
</form>


</body>
</html>

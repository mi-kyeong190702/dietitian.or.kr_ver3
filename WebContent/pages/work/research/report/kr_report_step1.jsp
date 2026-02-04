<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String main_pers_name =request.getParameter("main_pers_name");
	String main_lic_no= request.getParameter("main_lic_no");
	if(main_pers_name==null) main_pers_name="";
	if(main_lic_no==null) main_lic_no="";
%>

<script type="text/javascript">
	$(document).ready(function()
	{
		//180402 추가
		$("#lic_no").keyup(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});
   		$("#lic_no").focusout(function(event){
   			$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );
   		});

	});
	
	var main_pers_name='<%=main_pers_name%>';
	var main_lic_no='<%=main_lic_no%>';
	
	if(main_pers_name!=""){
		
		var pn = document.createElement("input");
		pn.type="hidden";
		pn.name="pers_name";
		pn.value=main_pers_name;
		var lc = document.createElement("input");
		lc.type="hidden";
		lc.name="lic_no";
		lc.value=main_lic_no;
		
		var f = document.forms["report"];		
		f.insertBefore(lc,null);
		f.insertBefore(pn,null);
		f.step.value= "chk";
		f.method = "POST";
		f.submit();
	}

	function doCheck(name,lic){
		if(name.val()==""){
			alert("성명을 입력해 주세요");
			name.focus();
			return false;
		}
		if(lic.val()==""){
			alert("면허번호를 입력해 주세요");
			lic.focus();
			return false;
		}
		return true;
	}
	
	function doSearch(){
		var name= $("#pers_name");
		var lic = $("#lic_no");
		
		
		if(doCheck(name,lic)){
			
			var pn = document.createElement("input");
			pn.type="hidden";
			pn.name="pers_name";
			pn.value=name.val();
			var lc = document.createElement("input");
			lc.type="hidden";
			lc.name="lic_no";
			lc.value=lic.val();
			
			var f = document.forms["report"];
			f.insertBefore(lc,null);
			f.insertBefore(pn,null);
			f.step.value= "chk";
			f.method = "POST";
			f.submit();
		}
	}
	
	function doCancel(){
		$(".w150").val("");
	}
	
</script>

					<h4 class="title bold t2 cm s1 i_b_t2">면허신고(실태신고) 신청</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="pers_name" />
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="lic_no" />
										<span style="font-size: 15px; line-height: 30px; text-indent: 15px; color: red;" >&nbsp;&nbsp;(숫자만 입력)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap mt20">
						<ul>
							<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - start  -->
<!-- 							<li><a href="#" class="btn big t1">확인</a></li> -->
<!-- 							<li><a href="#" class="btn big">취소</a></li> -->
							<!-- 면허신고 년도 변경시 수정 : 면허신고 CLOSE - 링크삭제 Y - end  -->
							
							<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - start  -->
							<li><a href="javascript:doSearch();" class="btn big t1">확인</a></li>
							<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
							<!-- 면허신고 년도 변경시 수정 : 면허신고 OPEN - 링크삭제 N - end  -->
						</ul>
					</div>
					<div class="box t1 bgs mt30 p15 text ssmall">
						<div class="area">
							<ul>
								<li>- 개명 등으로 면허정보가 다른 경우 면허정보 등록 후 신고해 주십시오.</li>
								<li>- 면허번호가 제129733호 이후일 경우 면허정보 등록 후 신고해 주십시오.</li>
								<li>- 2013년, 2015년, 2017년, 2019년, 2021년 보수교육 미대상자는 보수교육 미대상 신청 후 신고해 주십시오.</li>
								<li>- 면허번호 등록 후에도 면허 신고를 할 수 없는 경우 면허신고 담당자에게 문의하시기 바랍니다.</li>
							</ul>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<a href="/work/research/license/kr_license.do?bbs_cd=004" class="btn bbig t1" >면허정보 등록 바로 가기</a>
					</div>
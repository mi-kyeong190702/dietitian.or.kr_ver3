<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String main_pers_name = request.getParameter("main_pers_name");
	String main_lic_no= request.getParameter("main_lic_no");
	if(main_pers_name==null) main_pers_name="";
	if(main_lic_no==null) main_lic_no="";
%>
	<c:if test="${loginVo.pers_state=='00' || loginVo.pers_state=='01' }">
		<script type="text/javascript"> 
			location.href="/work/research/license/kr_license.do?bbs_cd=004";
		</script>
	</c:if>

<script type="text/javascript">
	$(document).ready(function(){
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
		f.step.value= "step2";
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
			
			$("#success_url").val("/work/research/license/kr_license.do?bbs_cd=004");
			$("#fail_url").val("/work/research/license/kr_license_check.do");
			$("#menuCD").val("license");
			
			var f = document.forms["check"];		
			f.method = "POST";
			f.action = "/statusCheck.do";
			f.submit();
			
		}

	}
	
	function doCancel(){
		$(".w150").val("");
	}
	
</script>
<form name="check">
<input type="hidden" name="success_url" id="success_url"/>
<input type="hidden" name="fail_url"  id="fail_url"/>
<input type="hidden" name="menuCD"  id="menuCD"/>

<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">면허</mark>정보 등록</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/license/kr_license_check.do">면허정보 등록 신청</a></li>
							<li><a href="/work/research/license/kr_license_check.do" class="cm">면허정보 등록 신청</a></li>
						</ul>
					</div>
				</div>
				<hr />
	<div class="sp_body">
		<!-- 2022.12.29 신규 오픈으로 주석처리 및 이미지 디스플레이-->
		<!-- <img src="/assets/ver2/popup/images/popup_20221229.png" width="700" alt="" usemap="#imgmap" border="0"> -->
					<h4 class="title bold t2 cm s1 i_b_t2">면허정보 등록자 면허신고 절차<br/>(면허정보 등록 → 보수교육 이수여부 확인 → 면허신고(실태신고))</h4>
					<div class="box t2 mt10 p20 text middle cb s1">
						<div class="area">
							<p>1. 면허정보 등록(성명, 면허번호 입력) → 게시판 글 등록(면허증 첨부)</p>
							<p>2. 보수교육 이수여부 확인 (사유에 따라, 추가보수교육 이수, 보수교육 미대상자 또는 면제 신청)</p>
							<p>3. 면허신고 신청(성명, 면허번호 입력) → 절차에 따라 면허신고</p>
						</div>
					</div>
					<h4 class="title bold t2 cm s1 i_b_t2 mt40">면허정보 등록 신청</h4>
					<div class="form line bt bcm bw2 mt20">
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="pers_name"  name="pers_name"/>
									</div>
								</div>
							</div>
						</div>
						<div class="f_wrap line bb p8">
							<div class="f_field div1">
								<label for="inputid2" class="ff_title i_b"><strong>면허번호</strong></label>
								<div class="ff_wrap ml120">
									<div class="area">
										<input type="text" class="input t1 w150" id="lic_no" name="lic_no"/>
										<span style="font-size: 15px; line-height: 30px; text-indent: 15px; color: red;" >&nbsp;&nbsp;(숫자만 입력)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap mt20">
						<ul>
							<li><a href="javascript:doSearch();" class="btn big t1"> 확인</a></li>
							<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
						</ul>
					</div>
					<div class="box t1 bgs mt30 p10 pl15 text ssmall">
						<div class="area">
							※ 면허정보 등록 신청 후 24시간이 지나서 보수교육 이수&#183;면제&#183;미대상 여부를 확인 후 면허신고를 신청해 주십시오.
						</div>
					</div>
	</div>
</div>
</form>
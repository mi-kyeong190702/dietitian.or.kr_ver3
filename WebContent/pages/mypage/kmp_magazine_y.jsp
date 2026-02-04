<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String nMonth = new java.text.SimpleDateFormat ("MM").format(new java.util.Date());
int iMon = Integer.parseInt(nMonth);
%>
<script type="text/javascript">
	function CopyAddress()
	{
		var sss = $("#get_place").val();
		if (sss == "자택") {
			document.join.address.value = $("#pers_add").val() + " " + $("#pers_add_detail").val();
			document.join.zip1.value = $("#ppost").val();
		} else {
			document.join.address.value =  $("#company_add").val() + " " + $("#company_add_detail").val();
			document.join.zip1.value = $("#cpost").val();
		}
		
	}
	
	function CopyPhone()
	{
		var sss = document.join.get_phone.options[document.join.get_phone.selectedIndex].value;
		if (sss == "휴대폰") {
			document.join.phone.value = $("#pers_hp").val();			
		} else if (sss == "자택") {
			document.join.phone.value = $("#pers_tel").val();
		} else {
			document.join.phone.value = $("#company_tel").val();
		}
	}


	function send()
	{
		if(check()) {
			
			$("input[id=review_chk]:checked").each(function() {
				$(this).val("신청");
			});

			var f = document.forms["join"];
			f.action = "/kmp_magazine_sendmail.do";
			f.submit();
		}
	}

	function check()
	{

		if(document.join.pers_name.value.length < 1){
			alert("이름이 입력되지 않았습니다.");
			return false;
		}
		
		if(document.join.pers_birth.value.length < 1){
			alert("생년월일이 입력되지 않았습니다.");
			return false;
		}

		if(document.join.address.value.length < 1){
			alert("회신가능한주소가 입력되지 않았습니다.");
			return false;
		}
		
		if(document.join.phone.value.length < 1){
			alert("연락가능한번호가 입력되지 않았습니다.");
			return false;
		}	
		return true;
	}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark>을 받지 못한 경우</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kmp_member_info.do">마이페이지</a></li>
				<li><a href="/mypage/kmp_magazine.do" class="cm">국민영양을 받지 못한 경우</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
	
		<form name="join" method="post">
		<input type="hidden" id="ppost" value="${info.ppost}" />
		<input type="hidden" id="pers_add" value="${info.pers_add }" />
		<input type="hidden" id="pers_add_detail" value="${info.pers_add_detail}" />
		
		<input type="hidden" id="cpost" value="${info.cpost }" />
		<input type="hidden" id="company_add" value="${info.company_add }" />
		<input type="hidden" id="company_add_detail" value="${info.company_add_detail }" />
		
		<input type="hidden" id="pers_tel" value="${info.pers_tel }" />
		<input type="hidden" id="pers_hp" value="${info.pers_hp }" />
		<input type="hidden" id="company_tel" value="${info.company_tel }" />
		
		
		
		
		
		<fieldset>
		<legend><span class="ti">면허정보 수정하기</span></legend>
			<div class="box t2 bgs mt20 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1"><mark class="cm">국민영양</mark>을 받지 못한 경우</h5>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3"><mark class="bold">기본 정보</mark></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid1" class="ff_title i_b"><strong>이름</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" name="pers_name" class="input t1 fl w200" id="inputid1"  value="${info.pers_name}" readonly="readonly"/>
										
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid1" class="ff_title i_b"><strong>생년월일</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<input type="text" name="pers_birth" class="input t1 fl w200"  style="width:70" value="${info.pers_birth}" ReadOnly>		
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid2" class="ff_title i_b"><strong>회신가능한 주소</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											<select name="get_place" id="get_place" class="select t2 fl w200" onChange="CopyAddress();">
										          <option value="자택" <c:if test="${requestScope.info.code_place == 1 || requestScope.info.code_place == 3}">selected</c:if>>자택</option>
										          <option value="근무처" <c:if test="${requestScope.info.code_place == 2}">selected</c:if>>근무처</option>
										   	</select>
		        						</div>
										<div class="area mt5">
											<c:set var="post" value="${info.ppost}" />
											<c:if test="${ info.code_place == 2 }">
											<c:set var="post" value="${info.cpost}" />
											</c:if>
											<input type="text" name="zip1"  class="input t1 fl w200" size=10 maxlength=6 value="${post}" ReadOnly>
											
										</div>
										<div class="area mt5">
											<c:set var="address" value="${info.pers_add} ${info.pers_add_detail}" />
											<c:if test="${ info.code_place == 2 }">
											<c:set var="address" value="${info.company_add} ${info.company_add_detail }" />
											</c:if>
											<label for="inputid4" class="ti">상세주소</label>
											<input type="text" class="input t1" name="address" size=70 value="${address}" ReadOnly>
										</div>
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="inputid5" class="ff_title i_b"><strong>연락가능한 번호</strong></label>
									<div class="ff_wrap ml120">
										<div class="area">
											 <select name="get_phone"  class="select t2 fl w200" onChange="CopyPhone();">
										          <option value="휴대폰">휴대폰</option>
										          <option value="자택">자택</option>
										          <option value="근무처">근무처</option>
										    </select>
											<input type="text" name="phone"  class="input t1 fl w200 ml5" style="width:100" value="${info.pers_hp}" ReadOnly>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h6 class="title s1 i_b_t3 mt40"><mark class="bold">기관지 미수령</mark></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>국민영양</strong></div>
									<div class="ff_wrap ml120 text">
										<ul class="area">
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 1 || iMon == 2 || iMon == 3) ) { %> disabled="true" <% } %> class="mr5" name="review01_0102" id="review_chk" /><label for="checkbox1_1">1·2월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 3 || iMon == 4) ) { %> disabled="true" <% } %> class="mr5" name="review01_03" id="review_chk" /><label for="checkbox1_2">3월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 4 || iMon == 5) ) { %> disabled="true" <% } %> class="mr5" name="review01_04" id="review_chk" /><label for="checkbox1_3">4월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 5 || iMon == 6) ) { %> disabled="true" <% } %> class="mr5" name="review01_05" id="review_chk" /><label for="checkbox1_4">5월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 6 || iMon == 7) ) { %> disabled="true" <% } %> class="mr5" name="review01_06" id="review_chk" /><label for="checkbox1_5">6월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 7 || iMon == 8 || iMon == 9) ) { %> disabled="true" <% } %> class="mr5" name="review01_0708" id="review_chk" /><label for="checkbox1_6">7-8월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 9 || iMon == 10) ) { %> disabled="true" <% } %> class="mr5" name="review01_09" id="review_chk" /><label for="checkbox1_8">9월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 10 || iMon == 11) ) { %> disabled="true" <% } %> class="mr5" name="review01_10" id="review_chk" /><label for="checkbox1_9">10월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 11 || iMon == 12) ) { %> disabled="true" <% } %> class="mr5" name="review01_11" id="review_chk" /><label for="checkbox1_10">11월호</label></li>
											<li class="fl mr20 pb3"><input type="checkbox" <% if(  !(iMon == 12 || iMon == 1) ) { %> disabled="true" <% } %> class="mr5" name="review01_12" id="review_chk" /><label for="checkbox1_11">12월호</label></li>
										</ul>
										
									</div>
									
									<div class="ff_wrap ml120 text">
										※ 국민영양은 매월 10~15일경 수령이 가능하므로 매월 15일 이후 신청해 주시기 바랍니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;국민영양 제작부수가 정해져 있어 당월호 또는 전월호에 한하여 신청이 가능합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;지난호 국민영양 열람(e-book) 및 활용을 원하시는 분들께서는 <mark class="cm">"협회 홈페이지<br>
										&nbsp;&nbsp;&nbsp;&nbsp;(www.dietitian.or.kr) → KDA 출판 → 국민영양 → 국민영양 검색"</mark>을 통해 이용해주시기<br>
										&nbsp;&nbsp;&nbsp;&nbsp;바랍니다.
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>학술지</strong></div>
									<!-- 190404modi -->
									<div class="ff_wrap ml120 text">
                                    	학술지는 e-BOOK으로만 발행됩니다.<br />논문 열람 및 활용을 원하시는 분들께서는 <mark class="cm">"협회 홈페이지(www.dietitian.or.kr) → KDA 출판 →<br />학술지 → 학술지 검색(e-Book)"</mark>을 통해 이용해주시기 바랍니다.<br /> 
									</div>
                                    <!--// 190404modi -->
								</div>
							</div>
						</div>
						<h6 class="title s1 i_b_t3 mt40"><mark class="bold">기타문의 내용</mark></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<label for="textarea1" class="ti"><strong>내용입력</strong></label>
									<div class="ff_wrap">
										<div class="area">
											<textarea class="textarea t1 h200" name="question" id="textarea1" /></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt30">
				<ul>
					<li><a href="javascript:send();" class="btn big t2">완료</a></li>
					<li><a href="javascript:history.back();" class="btn big t1">취소</a></li>
				</ul>
			</div>
		</fieldset>
	</form>
					
		
    
	</div>
</div>

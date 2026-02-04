<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%
Calendar calendar = Calendar.getInstance();
java.util.Date date = calendar.getTime();

String today    = new java.text.SimpleDateFormat ("yyyyMMdd").format(new java.util.Date());
int yyyyMMdd = Integer.parseInt(today);
%>

<script>
function f_send(){
	if( $("#name").val() == "" ) {
		alert("이름을 입력하여 주십시요");
		$("#name").focus();
		return;
	}	
	
	if( $("#tel_hp").val() == "" ) {
		alert("핸드폰 번호를 입력하여 주십시요");
		$("#tel_hp").focus();
		return;
	}	
	document.frm.submit();
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">초록</mark>접수</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a></li>
				<li><a href="/work/education/ke_green.do" class="cm">초록접수</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!-- // Contents Start  -->
		<div class="tab t2 div3 mb30">
			<ul>
			     <% if( yyyyMMdd >= 20250626 ) { %>
                     <!-- 마감  -->
                     <li><a href="./ke_green.do">접수안내</a></li>
                     <li><a href="">온라인접수</a></li>
                     <li><a href="./ke_green_verification.do" class="on">접수확인 및 심사결과</a></li>
                 <% } else {%>
                     <!-- 접수시작  -->
                     <li><a href="./ke_green.do">접수안내</a></li>
                     <li><a href="./ke_green_online.do">온라인접수</a></li>
                     <li><a href="./ke_green_verification.do" class="on">접수확인 및 심사결과</a></li>
                 <% } %>
			</ul>
		</div>
		<div class="w400 ac mt40">
			<div class="box t2 mt10 p50 pt40 pb40">
				<div class="area mb25">
					<h4 class="title bold t2 s1 i_b_t3">접수확인 및 심사결과</h4>
					<p class="text bold cb si ml15"><mark class="cm">입력</mark>하여 주세요.</p>
				</div>
				
				<form name="frm" method="post" action="./ke_green_list.do">
					<fieldset>
						<legend><span class="ti">접수확인 및 심사결과</span></legend>
						<div class="area">
							<ul class="w300 ">
								<li><label for="kda_user_id"><span class="ti">이름</span></label><input type="text" name="name" id="name" class="input login" placeholder="이름" /></li>
								<li class="mt5"><label for="kda_user_nb"><span class="ti">핸드폰번호</span></label><input type="text" name="tel_hp" class="input login" id="tel_hp" placeholder="핸드폰번호(“-” 없이)" />
								</li>
							</ul>
							<div class="center mt5">
								<a href="javascript:f_send();" class="btn t1 big w270">확인</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>	
		<!-- // Contents end  -->		
	</div>
</div>

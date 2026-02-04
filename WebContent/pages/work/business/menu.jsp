<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/common.jsp"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
<div class="s_menu">
	<div class="sm_title">
		<strong>NUTRITION PROJECT</strong>
		<h2>KDA 영양</h2>
	</div>
	<div class="sm_list">
		<ul class="sm_depth1">
			<li <% if( (file_path.substring(0, 5)).equals("kb_nu")) {%> class="on" <%}%>><a href="/work/business/kb_nutrition.do">영양의 날</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_nutrition.do" 
					<% if( file_path.equals("kb_nutrition") || file_path.equals("kb_nutrition_2007") || file_path.equals("kb_nutrition_2008")
							|| file_path.equals("kb_nutrition_2009") || file_path.equals("kb_nutrition_2010") || file_path.equals("kb_nutrition_2011")
							|| file_path.equals("kb_nutrition_2012") || file_path.equals("kb_nutrition_2013") || file_path.equals("kb_nutrition_2014")
							|| file_path.equals("kb_nutrition_2015") || file_path.equals("kb_nutrition_2016") || file_path.equals("kb_nutrition_2017")
							|| file_path.equals("kb_nutrition_2018") || file_path.equals("kb_nutrition_2019")) {%> class="on" <%}%>>개요</a></li>
					<li><a href="/work/business/kb_nutrition_material.do?bbs_board_code=88&g_userid=${g_encoded_userid}" 
					<% if( file_path.equals("kb_nutrition_material")
							|| file_path.equals("kb_nutrition_material_write")
							|| file_path.equals("kb_nutrition_material_view")) {%> class="on" <%}%>>자료실</a>
					</li>
				</ul>
			</li>
			
			<li <% if( (file_path.substring(0, 7)).equals("kb_farm")) {%> class="on" <%}%>><a href="/work/business/kb_farm.do">우리농축수산물소비촉진</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_farm.do" 
					<% if( file_path.equals("kb_farm") || file_path.equals("kb_farm_2004") || file_path.equals("kb_farm_2005") || file_path.equals("kb_farm_2006") || file_path.equals("kb_farm_2007")
							|| file_path.equals("kb_farm_2008") || file_path.equals("kb_farm_2009") || file_path.equals("kb_farm_2010") || file_path.equals("kb_farm_2011")
							|| file_path.equals("kb_farm_2012") || file_path.equals("kb_farm_2013") || file_path.equals("kb_farm_2014") || file_path.equals("kb_farm_2015")
							|| file_path.equals("kb_farm_2016") || file_path.equals("kb_farm_2017") || file_path.equals("kb_farm_2018")) {%> class="on" <%}%>>개요</a></li>
					<li><a href="/work/business/kb_farm_material.do?bbs_board_code=6&g_userid=${g_encoded_userid}" 
					<% if(file_path.length()  >= 16 && file_path.equals("kb_farm_material")) {%> class="on" <%}%>>자료실</a>
					</li>
				</ul>
			</li>
			
			<li <% if( file_path.equals("kb_reduction") )
				{%> class="on" <%}%>><a href="/work/business/kb_reduction.do">당류·나트륨 저감 홍보</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_reduction.do" <% if( file_path.equals("kb_reduction")) {%> class="on" <%}%>>개요</a></li>
				</ul>
			</li>
			<li <% if( file_path.equals("kb_safety") )
				{%> class="on" <%}%>><a href="/work/business/kb_safety.do">음식업종 사망사고 예방</a>
				<%-- <ul class="sm_depth2">
					<li><a href="/work/business/kb_safety.do" <% if( file_path.equals("kb_safety")) {%> class="on" <%}%>>개요</a></li>
				</ul> --%>
			</li>	
			
					
<%-- 			<li <% if( file_path.equals("kb_waste") || file_path.equals("kb_waste_2004")  --%>
<!-- 					|| file_path.equals("kb_waste_2005") || file_path.equals("kb_waste_2006")  -->
<!-- 					|| file_path.equals("kb_waste_2007") || file_path.equals("kb_waste_2008")  -->
<!-- 					|| file_path.equals("kb_waste_2009") || file_path.equals("kb_waste_2010") -->
<!-- 					|| file_path.length() >= 17 && file_path.substring(0, 17).equals("kb_waste_material")) -->
<%-- 				{%> class="on" <%}%>><a href="/work/business/kb_waste.do">음식물쓰레기 감량사업</a> --%>
<!-- 				<ul class="sm_depth2"> -->
<%-- 					<li><a href="/work/business/kb_waste.do" <% if( file_path.equals("kb_waste") || file_path.equals("kb_waste_2004")  --%>
<!-- 							|| file_path.equals("kb_waste_2005") || file_path.equals("kb_waste_2006")  -->
<!-- 							|| file_path.equals("kb_waste_2007") || file_path.equals("kb_waste_2008")  -->
<%-- 							|| file_path.equals("kb_waste_2009")) {%> class="on" <%}%>>사업소개</a></li> --%>
<!-- 					<li><a href="/work/business/kb_waste_material.do?bbs_board_code=4"  -->
<%-- 					<% if( file_path.length() >= 17 && file_path.substring(0, 17).equals("kb_waste_material")) {%> class="on" <%}%>>자료실</a></li> --%>
<!-- 				</ul> -->
<!-- 			</li> -->
			
			<li <% if( file_path.length() >= 9 && (file_path.substring(0, 9).equals("kb_health"))) {%> class="on" <%}%>><a href="/work/business/kb_health.do">국민건강증진사업</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_health.do" <% if(file_path.equals("kb_health")
							|| file_path.equals("kb_health_2003") || file_path.equals("kb_health_2004")
							|| file_path.equals("kb_health_2005") || file_path.equals("kb_health_2006")
							|| file_path.equals("kb_health_2007") || file_path.equals("kb_health_2008")
							|| file_path.equals("kb_health_2009") || file_path.equals("kb_health_2010") || file_path.equals("kb_health_2016") ) {%> class="on" <%}%>>개요</a></li>
					<li><a href="/work/business/kb_health_material.do?bbs_board_code=11&g_userid=${g_encoded_userid}" 
					<% if(file_path.equals("kb_health_material")
							|| file_path.equals("kb_health_material_write")
							|| file_path.equals("kb_health_material_view")) {%> class="on" <%}%>>자료실</a></li>
				</ul>
			</li>
			<li <% if((file_path.substring(0, 5)).equals("kb_c_") || file_path.equals("kb_clinic")) {%> class="on" <%}%>><a href="/work/business/kb_clinic.do">영양클리닉</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_c_info118.do" <% if(file_path.equals("kb_c_info118")) {%> class="on" <%}%>>간편 영양 정보 118</a></li>
					<li><a href="/work/business/kb_c_habits.do" <% if(file_path.equals("kb_c_habits") || file_path.equals("kb_c_habits_diagnosis")) {%> class="on" <%}%>>올바른 식습관</a></li>
					<li><a href="/work/business/kb_c_obesity_adult.do" <% if(file_path.equals("kb_c_obesity_adult")) {%> class="on" <%}%>>비만도 평가</a></li>
					<li><a href="/work/business/kb_c_diabetes.do" <% if((file_path.substring(0, 6)).equals("kb_c_d")) {%> class="on" <%}%>>당뇨병 관리</a></li>
					<li><a href="/work/business/kb_c_child_obesity.do" <% if((file_path.length() >= 18) && (file_path.substring(0, 18).equals("kb_c_child_obesity"))) {%> class="on" <%}%>>소아비만 관리</a></li>
					<li><a href="/work/business/kb_c_adult_obesity.do" <% if((file_path.length() >= 18) && (file_path.substring(0, 18).equals("kb_c_adult_obesity"))) {%> class="on" <%}%>>성인비만 관리</a></li>
					<li><a href="/work/business/kb_c_heart.do" <% if(file_path.length() >= 10 && file_path.substring(0, 10).equals("kb_c_heart")) {%> class="on" <%}%>>심혈관계질환 관리</a></li>
					<li><a href="/work/business/kb_c_kidney.do" <% if(file_path.length() >= 11 && file_path.substring(0, 11).equals("kb_c_kidney")) {%> class="on" <%}%>>신장질환 관리</a></li>
					<li><a href="/work/business/kb_c_liver.do" <% if(file_path.length() >= 10 && file_path.substring(0, 10).equals("kb_c_liver")) {%> class="on" <%}%>>간질환 관리</a></li>
					<li><a href="/work/business/kb_c_stomach.do" <% if(file_path.length() >= 12 && file_path.substring(0, 12).equals("kb_c_stomach")) {%> class="on" <%}%>>위장질환 관리</a></li>
					<li><a href="/work/business/kb_c_cancer.do" <% if(file_path.length() >= 11 && file_path.substring(0, 11).equals("kb_c_cancer")) {%> class="on" <%}%>>암과 영양</a></li>
					<li><a href="/work/business/kb_c_tubefeeding.do" <% if(file_path.length() >= 16 && file_path.substring(0, 16).equals("kb_c_tubefeeding")) {%> class="on" <%}%>>경관급식</a></li>
					<li><a href="/work/business/kb_c_children.do" <% if(file_path.length() >= 13 && file_path.substring(0, 13).equals("kb_c_children")) {%> class="on" <%}%>>소아질환 관리</a></li>
					<li><a href="/work/business/kb_c_etc_osteoporosis.do" <% if(file_path.length() >= 9 && file_path.substring(0, 9).equals("kb_c_etc_")) {%> class="on" <%}%>>기타질환</a></li>
					<li><a href="/work/business/kb_c_family_baby.do" <% if(file_path.length() >= 12 && file_path.substring(0, 12).equals("kb_c_family_")) {%> class="on" <%}%>>우리가족영양관리</a></li>
					<li><a href="/work/business/kb_c_counsel_intro.do" <% if(file_path.length() >= 18 && file_path.substring(0, 18).equals("kb_c_counsel_intro")) {%> class="on" <%}%>>상담영양사 소개</a></li>
				</ul>
			</li>
			<li <% if(file_path.equals("kb_ko_site")
					|| file_path.equals("kb_fo_site")
					|| file_path.equals("kb_fo_nutrition")) {%> class="on" <%}%>><a href="/work/business/kb_ko_site.do">관련사이트</a>
				<ul class="sm_depth2">
					<li><a href="/work/business/kb_ko_site.do" <% if(file_path.equals("kb_ko_site")) {%> class="on" <%}%>>국내사이트</a></li>
					<li><a href="/work/business/kb_fo_site.do" <% if(file_path.equals("kb_fo_site")) {%> class="on" <%}%>>국외사이트</a></li>
					<li><a href="/work/business/kb_fo_nutrition.do" <% if(file_path.equals("kb_fo_nutrition")) {%> class="on" <%}%>>외국영양사회</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

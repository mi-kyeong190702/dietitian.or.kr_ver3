<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
<div class="s_menu">
<div class="sm_title">

	<strong>ABOUT</strong>
		<h2>협회 소개</h2>
	</div>
	<div class="sm_list">
	<ul class="sm_depth1">
			
			<li <% if( file_path.equals("ki_intro")
					|| (file_path.substring(0, 8)).equals("ki_group") 
					|| (file_path.substring(0, 8)).equals("ki_activ")
					|| (file_path.substring(0, 8)).equals("ki_locat")
					|| file_path.equals("ki_situation")) {%>
						class="on"
					<%}%>><a href="/work/introduction/ki_intro.do">대한영양사협회소개</a>
				<ul class="sm_depth2">
					<li><a href="/work/introduction/ki_intro.do" <% if(file_path.equals("ki_intro")){ %>class="on"<%}%>>인사말</a></li>
					<li><a href="/work/introduction/ki_group.do" <% if((file_path.substring(0, 8)).equals("ki_group")){ %>class="on"<%}%>>조직 및 연락처</a></li>
					<li><a href="/work/introduction/ki_activity.do" <% if((file_path.substring(0, 8)).equals("ki_activ")){ %>class="on"<%}%>>활동</a></li>
					<li><a href="/work/introduction/ki_location.do" <% if((file_path.substring(0, 8)).equals("ki_locat")){ %>class="on"<%}%>>찾아오시는 길</a></li>
					<li><a href="/work/introduction/ki_situation.do" <% if(file_path.equals("ki_situation")){ %>class="on"<%}%>>협회 현황</a></li>
				</ul>
			</li>
			<li <% if( file_path.equals("ki_about")
					|| file_path.equals("ki_dietitian") 
					|| file_path.equals("ki_us_activity")
					|| file_path.equals("ki_clinical")
					|| file_path.equals("ki_nutrition")
					|| file_path.equals("ki_operation")
					|| file_path.equals("ki_industry")) {%>
						class="on"
					<%}%>><a href="/work/introduction/ki_about.do">영양사소개</a>
				<ul class="sm_depth2">
					<li><a href="/work/introduction/ki_about.do" <% if(file_path.equals("ki_about")){ %>class="on"<%}%>>영양사란</a></li>
					<li><a href="/work/introduction/ki_dietitian.do" <% if(file_path.equals("ki_dietitian")){ %>class="on"<%}%>>영양사가 되려면</a></li>
					<li><a href="/work/introduction/ki_us_activity.do" <% if(file_path.equals("ki_us_activity")){ %>class="on"<%}%>>우리나라 영양사 활동</a></li>
					<li><a href="/work/introduction/ki_clinical.do" <% if(file_path.equals("ki_clinical")){ %>class="on"<%}%>>임상영양사</a></li>
					<li><a href="/work/introduction/ki_nutrition.do" <% if(file_path.equals("ki_nutrition")){ %>class="on"<%}%>>영양교사</a></li>
					<!-- 
					<li><a href="/work/introduction/ki_operation.do" <% if(file_path.equals("ki_operation")){ %>class="on"<%}%>>급식경영영양사</a></li>
					<li><a href="/work/introduction/ki_industry.do" <% if(file_path.equals("ki_industry")){ %>class="on"<%}%>>산업보건영양사</a></li>
					 -->
				</ul>
			</li>
		</ul>
	</div>
</div>
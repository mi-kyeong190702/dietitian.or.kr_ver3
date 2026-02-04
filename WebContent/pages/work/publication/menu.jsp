<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>

<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	String file_path =  pageName.substring(0, pageName.length()-3);
	
	SessionInfo sessionInfo = new SessionInfo ( session );
    String  g_userid        = sessionInfo.getUserId();
%>

<div class="s_menu">
	<div class="sm_title">
		<strong>PUBLICATION</strong>
		<h2>KDA 출판</h2>
	</div>
	<div class="sm_list">
		<ul class="sm_depth1">
			<li <% if(file_path.equals("kp_magazine")
					
					|| file_path.equals("kp_participation") || file_path.equals("kp_participation_manuscript") || file_path.equals("kp_participation_mornitor")
					|| file_path.equals("kp_m_list") || file_path.equals("kp_m_list_view") || ((file_path.length() >= 11) && (file_path.substring(0, 11).equals("kp_m_search")))
					) {%> class="on" <%}%>><a href="/work/publication/kp_magazine.do">국민영양</a>
				<ul class="sm_depth2">
					<li><a href="/work/publication/kp_participation.do" <% if(file_path.equals("kp_participation") || file_path.equals("kp_participation_manuscript")
							|| file_path.equals("kp_participation_mornitor")) {%> class="on" <%}%>>국민영양 참여</a></li>
					<li><a href="/work/publication/kp_m_list.do" <% if(file_path.equals("kp_m_list") || file_path.equals("kp_m_list_view") ||(file_path.length() >= 11) 
							&& (file_path.substring(0, 11).equals("kp_m_search"))) {%> class="on" <%}%>>국민영양 검색</a></li>
				</ul>
			</li>
			
			<%-- <li <% if( file_path.equals("kp_journal")
					|| file_path.equals("kp_journal_law01")
					|| file_path.equals("kp_journal_search")
					|| file_path.equals("kp_ebook_list")
					|| file_path.equals("kp_ebook_list_form")
					|| file_path.length() >= 14 &&  file_path.substring(0,14).equals("kp_journal_law")) {%> class="on" <%}%>><a href="/work/publication/kp_journal.do">학술지</a>
				<ul class="sm_depth2">
					<li><a href="/work/publication/kp_journal_law01.do" <% if( file_path.length() >= 14 &&  file_path.substring(0,14).equals("kp_journal_law")) {%> class="on" <%}%>>학술지 규정</a></li>
					<li><a href="/work/publication/kp_journal_search.do" <% if(file_path.equals("kp_journal_search")) {%> class="on" <%}%>>학술지 검색</a></li>
					<li><a href="/work/publication/kp_ebook_list.do" <% if(file_path.equals("kp_ebook_list") || file_path.equals("kp_ebook_list_form")) {%> class="on" <%}%>>학술지 검색(e-Book)</a></li>
				</ul>
			</li>
			<li <% if(file_path.equals("kp_thesis")) {%> class="on" <%}%>><a href="/work/publication/kp_thesis.do">학술지 논문투고</a></li> --%>
			<li <% if(file_path.equals("kp_archiveshop") || file_path.equals("kp_archiveshop_cart") 
					|| file_path.equals("kp_archiveshop_pay") 
					|| file_path.equals("cart_payment")){%> class="on" <%}%>><a href="/work/publication/kp_archiveshop.do">교육자료(판매품)</a></li>
			<li <% if(file_path.equals("publishing_list") || file_path.equals("kp_publishing_form") ) {%> class="on" <%}%>><a href="/work/publication/kp_publishing_form.do">MY 구매정보</a></li>
			<li <% if(file_path.equals("faq_list") || file_path.equals("faq_form") ) {%> class="on" <%}%>><a href="/work/publication/faq/faq_list.do?faq_category=3">출판 FAQ</a></li>
			
			<% if( "ekdldjxm_!@##@!~".equals(g_userid) ){ %>
                <li><a href="/work/publication/kp_ebook_list.do" <% if(file_path.equals("kp_ebook_list") || file_path.equals("kp_ebook_list_form")) {%> class="on" <%}%>>학술지 검색(e-Book)</a></li>
            <% } %>
		</ul>
	</div>
</div>

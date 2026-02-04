<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>USE</strong>
					<h2>이용안내</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if( file_path.equals("ku_sitemap") || file_path.equals("ku_faq")
								|| file_path.equals("ku_popupzone") || file_path.equals("ku_banner")
								|| file_path.equals("ku_personal") || file_path.equals("ku_copyright")
								|| file_path.equals("faq_list") || file_path.equals("faq_form")
								|| file_path.equals("ku_viewer")) {%> class="on" <%}%>><a href="/use/ku_sitemap.do">이용안내</a>
							<ul class="sm_depth2">
								<li><a href="/use/ku_sitemap.do" <% if(file_path.equals("ku_sitemap")) {%> class="on" <%}%>>사이트맵</a></li>
								<li><a href="/use/faq/faq_list.do?faq_category=4" <% if( file_path.equals("faq_list") || file_path.equals("faq_form") ) {%> class="on" <%}%>>FAQ</a></li>
								<li><a href="/use/ku_popupzone.do" <% if(file_path.equals("ku_popupzone")) {%> class="on" <%}%>>팝업모두보기</a></li>
								<%-- <li><a href="/use/ku_banner.do" <% if(file_path.equals("ku_banner")) {%> class="on" <%}%>>배너모두보기</a></li> --%>
								<%-- <li><a href="/use/ku_personal.do" <% if(file_path.equals("ku_personal")) {%> class="on" <%}%>>개인정보처리방침</a></li> --%>
								<!-- 
								<li><a href="/use/ku_copyright.do" <% if(file_path.equals("ku_copyright")) {%> class="on" <%}%>>저작권보호정책</a></li>
								 -->
								<li><a href="/use/ku_viewer.do" <% if(file_path.equals("ku_viewer")) {%> class="on" <%}%>>뷰어 다운로드</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

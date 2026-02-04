<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>
<div class="kb_menu mt20">
	<ul>
		<li class="kb_main" style="width: 20%;"><a href="./kb_health.do"<% if( "kb_health.do".contains(uri) ) { %> class="on" <% } %>>사업소개</a></li>
		<li class="kb_main" style="width: 20%;"><a href="./kb_health_2021.do" <% if( "kb_health_2021.do".contains(uri) ) { %> class="on" <% } %>>2021</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_health_2021.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_health_2021.do">2021</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 20%;"><a href="./kb_health_2016.do" <% if( "kb_health_2016.do".contains(uri) ) { %> class="on" <% } %>>2016</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_health_2016.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_health_2016.do">2016</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 20%;"><a href="./kb_health_2010.do" <% if( "kb_health_2010.do|kb_health_2009.do|kb_health_2006.do".contains(uri) ) { %> class="on" <% } %>>2010~2006</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_health_2010.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_health_2010.do">2010</a></li>
						<li <% if( "kb_health_2009.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_health_2009.do">2009</a></li>
						<li <% if( "kb_health_2006.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_health_2006.do">2006</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 20%;"><a href="./kb_health_2005.do" <% if( "kb_health_2005.do".contains(uri) ) { %> class="on" <% } %> >2005~2003</a></li>
	</ul>
</div>
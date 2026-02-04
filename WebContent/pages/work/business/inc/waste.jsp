<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>
<div class="kb_menu2 mt20">
	<ul>
		
		<li class="kb_main"><a href="/kb_waste.do" <% if( "kb_waste.do".contains(uri) || "kb_waste_2009.do".contains(uri) 	|| "kb_waste_2008.do".contains(uri) || "kb_waste_2007.do".contains(uri)  ) { %> class="on" <% } %> >2010~2007</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_waste.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste.do">2010</a></li>
						<li <% if( "kb_waste_2009.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2009.do">2009</a></li>
						<li <% if( "kb_waste_2008.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2008.do">2008</a></li>
						<li <% if( "kb_waste_2007.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2007.do">2007</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main"><a href="./kb_waste_2006.do" <% if( "kb_waste_2006.do".contains(uri) || "kb_waste_2005.do".contains(uri) 	|| "kb_waste_2004.do".contains(uri) ) { %> class="on" <% } %>>2006~2004</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_waste_2006.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2006.do">2006</a></li>
						<li <% if( "kb_waste_2005.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2005.do">2005</a></li>
						<li <% if( "kb_waste_2004.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_waste_2004.do">2004</a></li>
					</ul>
				</div>
			</div>
		</li>
		
	</ul>
</div>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>
<div class="kb_menu mt20">
	<ul>
		<li class="kb_main"><a href="./kb_farm.do" <% if( "kb_farm.do|kb_farm_2017.do|kb_farm_2016.do|kb_farm_2015.do".contains(uri) ) { %> class="on" <% } %>>2018~2015</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li<% if( "kb_farm.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm.do">2018</a></li>
						<li<% if( "kb_farm_2017.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2017.do">2017</a></li>
						<li<% if( "kb_farm_2016.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2016.do">2016</a></li>
						<li<% if( "kb_farm_2015.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2015.do">2015</a></li>
						
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main"><a href="./kb_farm_2014.do" <% if( "|kb_farm_2014.do|kb_farm_2013.do|kb_farm_2012.do|kb_farm_2011.do|kb_farm_2010.do".contains(uri) ) { %> class="on" <% } %>>2014~2010</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li<% if( "kb_farm_2014.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2014.do">2014</a></li>
						<li<% if( "kb_farm_2013.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2013.do">2013</a></li>
						<li<% if( "kb_farm_2012.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2012.do">2012</a></li>
						<li<% if( "kb_farm_2011.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2011.do">2011</a></li>
						<li<% if( "kb_farm_2010.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2010.do">2010</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main"><a href="./kb_farm_2009.do" <% if( "kb_farm_2009.do|kb_farm_2008.do|kb_farm_2007.do|kb_farm_2006.do|kb_farm_2005.do|kb_farm_2004.do".contains(uri) ) { %> class="on" <% } %>>2009~2004</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li<% if( "kb_farm_2009.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2009.do">2009</a></li>
						<li<% if( "kb_farm_2008.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2008.do">2008</a></li>
						<li<% if( "kb_farm_2007.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2007.do">2007</a></li>
						<li<% if( "kb_farm_2006.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2006.do">2006</a></li>
						<li<% if( "kb_farm_2005.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2005.do">2005</a></li>
						<li<% if( "kb_farm_2004.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_farm_2004.do">2004</a></li>
					</ul>
				</div>
			</div>
		</li>
	</ul>
</div>
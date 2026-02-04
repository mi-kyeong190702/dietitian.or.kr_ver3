<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil" %>
<%
	String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
	uri = KdaStringUtil.uriPage(uri);
%>
<div class="kb_menu mt20">
	<ul>
		<li class="kb_main" style="width: 148px;"><a href="./kb_nutrition.do" <% if( "kb_nutrition_2023.do|kb_nutrition_2024.do|kb_nutrition.do".contains(uri) ) { %> class="on" <% } %>>2025~2023</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_nutrition.do".contains(uri) )      { %> class="on" <% } %> ><a href="./kb_nutrition.do">2025</a></li>
						<li <% if( "kb_nutrition_2024.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2024.do">2024</a></li>
						<li <% if( "kb_nutrition_2023.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2023.do">2023</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 148px;"><a href="./kb_nutrition_2022.do" <% if( "kb_nutrition_2022.do|kb_nutrition_2021.do|kb_nutrition_2020.do|kb_nutrition_2019.do".contains(uri) ) { %> class="on" <% } %>>2022~2019</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_nutrition_2022.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2022.do">2022</a></li>
						<li <% if( "kb_nutrition_2021.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2021.do">2021</a></li>
						<li <% if( "kb_nutrition_2020.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2020.do">2020</a></li>
						<li <% if( "kb_nutrition_2019.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2019.do">2019</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 148px;"><a href="./kb_nutrition_2018.do" <% if( "kb_nutrition_2018.do|kb_nutrition_2017.do|kb_nutrition_2016.do|kb_nutrition_2015.do".contains(uri) ) { %> class="on" <% } %>>2018~2015</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_nutrition_2018.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2018.do">2018</a></li>
						<li <% if( "kb_nutrition_2017.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2017.do">2017</a></li>
						<li <% if( "kb_nutrition_2016.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2016.do">2016</a></li>
						<li <% if( "kb_nutrition_2015.do".contains(uri) ) { %> class="on" <% } %> ><a href="./kb_nutrition_2015.do">2015</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 148px;"><a href="./kb_nutrition_2014.do" <% if( "|kb_nutrition_2014.do|kb_nutrition_2013.do|kb_nutrition_2012.do|kb_nutrition_2011.do".contains(uri) ) { %> class="on" <% } %>>2014~2011</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_nutrition_2014.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2014.do">2014</a></li>
						<li <% if( "kb_nutrition_2013.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2013.do">2013</a></li>
						<li <% if( "kb_nutrition_2012.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2012.do">2012</a></li>
						<li <% if( "kb_nutrition_2011.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2011.do">2011</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="kb_main" style="width: 148px;"><a href="./kb_nutrition_2010.do" <% if( "kb_nutrition_2010.do|kb_nutrition_2009.do|kb_nutrition_2008.do|kb_nutrition_2007.do".contains(uri) ) { %> class="on" <% } %>>2010~2007</a>
			<div class="kb_year">
				<div class="ky_list">
					<ul>
						<li <% if( "kb_nutrition_2010.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2010.do">2010</a></li>
						<li <% if( "kb_nutrition_2009.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2009.do">2009</a></li>
						<li <% if( "kb_nutrition_2008.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2008.do">2008</a></li>
						<li <% if( "kb_nutrition_2007.do".contains(uri) ) { %> class="on" <% } %>><a href="./kb_nutrition_2007.do">2007</a></li>
					</ul>
				</div>
			</div>
		</li>
	</ul>
</div>

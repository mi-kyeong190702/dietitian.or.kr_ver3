<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String yyyy = request.getParameter("yyyy");
	String yyyyTop = request.getParameter("yyyyTop");
%>
<script>
 var yyyy ='<%=yyyy%>';
 var yyyyTop ='<%=yyyyTop%>';
 
 $(document).ready(function(){
	$("#on"+yyyy).addClass("on");
	$("#top"+yyyyTop).addClass("on");
 });
</script>

	<div class="kb_menu mt20">
						<ul>
							<li class="kb_main" style="width: 185px;"><a href="/work/introduction/ki_activity_transition.do" id="top2024">2024~2021</a>
								<div class="kb_year">
									<div class="ky_list">
										<ul>
											<li id="on2024"><a href="/work/introduction/ki_activity_transition.do">2024</a></li>
											<li id="on2023"><a href="/work/introduction/ki_activity_transition_2023.do">2023</a></li>
											<li id="on2022"><a href="/work/introduction/ki_activity_transition_2022.do">2022</a></li>
											<li id="on2021"><a href="/work/introduction/ki_activity_transition_2021.do">2021</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="kb_main" style="width: 185px;"><a href="/work/introduction/ki_activity_transition_2020.do" id="top2020">2020~2011</a>
								<div class="kb_year">
									<div class="ky_list">
										<ul>
											<li id="on2020"><a href="/work/introduction/ki_activity_transition_2020.do">2020</a></li>
											<li id="on2019"><a href="/work/introduction/ki_activity_transition_2019.do">2019</a></li>
											<li id="on2018"><a href="/work/introduction/ki_activity_transition_2018.do">2018</a></li>
											<li id="on2017"><a href="/work/introduction/ki_activity_transition_2017.do">2017</a></li>
											<li id="on2016"><a href="/work/introduction/ki_activity_transition_2016.do">2016</a></li>
											<li id="on2015"><a href="/work/introduction/ki_activity_transition_2015.do">2015</a></li>
											<li id="on2014"><a href="/work/introduction/ki_activity_transition_2014.do">2014</a></li>
											<li id="on2013"><a href="/work/introduction/ki_activity_transition_2013.do">2013</a></li>
											<li id="on2012"><a href="/work/introduction/ki_activity_transition_2012.do">2012</a></li>
											<li id="on2011"><a href="/work/introduction/ki_activity_transition_2011.do">2011</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="kb_main" style="width: 185px;"><a href="/work/introduction/ki_activity_transition_2010.do" id="top2010">2010~2001</a>
								<div class="kb_year">
									<div class="ky_list">
										<ul>
											<li id="on2010"><a href="/work/introduction/ki_activity_transition_2010.do">2010</a></li>
											<li id="on2009"><a href="/work/introduction/ki_activity_transition_2009.do">2009</a></li>
											<li id="on2008"><a href="/work/introduction/ki_activity_transition_2008.do">2008</a></li>
											<li id="on2007"><a href="/work/introduction/ki_activity_transition_2007.do">2007</a></li>
											<li id="on2006"><a href="/work/introduction/ki_activity_transition_2006.do">2006</a></li>
											<li id="on2005"><a href="/work/introduction/ki_activity_transition_2005.do">2005</a></li>
											<li id="on2004"><a href="/work/introduction/ki_activity_transition_2004.do">2004</a></li>
											<li id="on2003"><a href="/work/introduction/ki_activity_transition_2003.do">2003</a></li>
											<li id="on2002"><a href="/work/introduction/ki_activity_transition_2002.do">2002</a></li>
											<li id="on2001"><a href="/work/introduction/ki_activity_transition_2001.do">2001</a></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="kb_main" style="width: 185px;"><a href="/work/introduction/ki_activity_transition_2000.do" id="top2000">2000~1960</a>
								<div class="kb_year">
									<div class="ky_list">
										<ul>
											<li id="on2000"><a href="/work/introduction/ki_activity_transition_2000.do">2000</a></li>
											<li id="on1990"><a href="/work/introduction/ki_activity_transition_1990.do">1990</a></li>
											<li id="on1980"><a href="/work/introduction/ki_activity_transition_1980.do">1980</a></li>
											<li id="on1970"><a href="/work/introduction/ki_activity_transition_1970.do">1970</a></li>
											<li id="on1960"><a href="/work/introduction/ki_activity_transition_1960.do">1960</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
	</div>

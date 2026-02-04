<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="/css/layout_add.css">
<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">학술지</mark> 검색(e-Book)</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
                            <li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
                            <li><a href="/work/publication/kp_journal.do">학술지</a></li>
							<li><a href="/work/publication/kp_ebook_list.do" class="cm">학술지 검색(e-Book)</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t2 mb10 p20">
						<div class="area mt10">
							<div class="text center">
								<h4 class="title t2 bold s1"><mark class="cm">대한영양사협회 </mark>학술지검색(e-Book)</h4><br />
								<span class="ssmall ca">Journal of the Korean Dietetic Association</span><span class="ssmall cs s1 ml5">ISSN 1225-9861, e-ISSN 2383-966X</span><br>
							</div>
						</div>
					</div>
                    <!-- 190122modi -->
                    <div class="kp_journal_e">
                    	<img src="${FILE_BASE}${imagename}"> <!-- /images/publication/icon_journal_201901.png -->
                    	<c:if test="${sessionScope.user_level == 1}">	
                        <p><a href="/work/publication/kp_ebook_list_form.do"><img src="/images/publication/btn_add_ebook.png" alt="등록하기"></a></p>
                        </c:if>
                    </div>
               
                    <c:forEach items="${listHelper.list}" var="yyyy">
                    	<c:if test="${yyyy.kda_mm == '1'}">
	                    	<h4 class="title bold t2 s1 i_b_t2">${yyyy.kda_yyyy}</h4>
		                    <div class="mb50">
								<ul class="area journal_tit">
									<c:forEach items="${listHelper.list}" var="col">
										<c:if test="${yyyy.kda_yyyy == col.kda_yyyy}">
											<c:if test="${col.kda_yn == 'Y'}">
												<li>
					                                <div class="jnumber">
					                                	<a href="/work/publication/kp_ebook_list_form.do?idx=${col.idx}&curPage=${listHelper.curPage}">${col.kda_title}</a>
					                                </div>
					                                <span>
					                                    <a href="${col.kda_url}" target="_blank"><img src="/images/publication/btn_journalebook_on.png" alt="e-BOOK보기" /></a>
					                                </span>
												</li>
											</c:if>
											<c:if test="${col.kda_yn == 'N'}">
												<li>
					                                <div class="jnumber">
					                                	<c:choose>
					                                		<c:when test="${sessionScope.user_level == 1}">
					                                			<a href="/work/publication/kp_ebook_list_form.do?idx=${col.idx}&curPage=${listHelper.curPage}">${col.kda_title}</a>
					                                		</c:when>
					                                		<c:otherwise>
					                                			<a href="javascript://">${col.kda_title}</a>
					                                		</c:otherwise>
					                                	</c:choose>
					                                	
					                                </div>
					                                <span>
					                                    <a href="javascript://"><img src="/images/publication/btn_journalebook_off.png" alt="e-BOOK보기" /></a>
					                                </span>
												</li>
											</c:if>
										</c:if>
								 	</c:forEach>
								</ul>
							</div>
						</c:if>
                    </c:forEach>

					<kda:paging listHelper="${listHelper}" />
				    <!--// 190122modi -->
					
				</div>
			</div>

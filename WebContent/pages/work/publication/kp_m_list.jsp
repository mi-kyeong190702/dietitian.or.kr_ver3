<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark> 검색</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
							<li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
							<li><a href="/work/publication/kp_m_list.do" class="cm">국민영양 검색</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="tab_2 div2 mb30">
						<ul>
							<li><a href="/work/publication/kp_m_list.do" class="on">목차/e-Book 보기</a></li>
							<li><a href="/publication/paper_board/kp_m_search.do?bbs_board_code=13">내용검색</a></li>
						</ul>
					</div>
					<div class="box t3 p20 text small">
						<ul class="area">
						 	<c:forEach items="${listHelper.list}" var="col">
						 	<li class="fl w25p">
								<div class="p10">
									<div class="box bw2 bga p5">
										<a href="/work/publication/kp_m_list_view.do?idx=${col.idx}&curPage=${listHelper.curPage}">
											<img src="${FILE_BASE}${col.imagename}" style="width:100%; height:188px;" alt="${ kdaFunc:cleanHtml(col.kda_title)}" />
										</a>
									</div>
									<ul class="area mt5">
										<li class="link"><a href="/work/publication/kp_m_list_view.do?idx=${col.idx}&curPage=${listHelper.curPage}" class="bold cm">${col.kda_title}</a></li>
									</ul>
								</div>
							</li>
						 	</c:forEach>
						</ul>
					</div>
					
					<c:if test="${sessionScope.user_level == 1}">	
					<div class="btn_wrap mt20">
						<ul class="fr">
							<li><a href="/work/publication/kp_m_list_form.do" class="btn big t1">글쓰기</a></li>
						</ul>
					</div>
					</c:if>
					
					<kda:paging listHelper="${listHelper}" />
				</div>
			</div>

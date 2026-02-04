<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<c:if test="${faq_category== 1}">	
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">회원가입</mark> FAQ</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/member/km_join.do">회원가입</a></li>
				<li><a href="/member/faq/faq_list.do" class="cm">회원가입 FAQ</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body"  style="min-height: 800px;">
</c:if>

<c:if test="${faq_category==2}">	
	<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육지원</mark>센터</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
					<li><a href="/work/education/ke_center_notice.do" class="cm">교육지원센터</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body"  style="min-height: 800px;">
			<div class="tab t2 div3 mb30">
				<ul>
					<li><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육">공지사항</a></li>
					<li><a href="/work/education/faq/faq_list.do?faq_category=2" class="on">FAQ</a></li>
					<li><a href="/work/education/ke_center_edu.do?bbs_board_code=116">교육후기</a></li>
				</ul>
			</div>	
</c:if>

<c:if test="${faq_category == 3 }">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">출판</mark> FAQ</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/faq/faq_list.do?faq_category=3" class="cm">출판 FAQ</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height: 800px;">
</c:if>

<c:if test="${faq_category == 4 }">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">이용</mark>안내</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/use/ku_sitemap.do">이용안내</a></li>
				<li><a href="/use/faq/faq_list.do?faq_category=4" class="cm">FAQ</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body" style="min-height: 800px;">
</c:if>
	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">배너</mark>모두보기</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/use/ku_sitemap.do">이용안내</a></li>
				<li><a href="/use/ku_banner.do" class="cm">배너모두보기</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<div class="box t2 h100 mb30">
				<p class="text bold s1 ml50 pt40">배너 이미지를 클릭하시면 해당 사이트가 새창으로 열립니다.</p>
			</div>
			<div class="area">
				<ul>
					<c:forEach items="${bannerList}" var="banner">
						<c:if test="${  banner.banner_type ==  5 }">
							<c:choose>
								<c:when test="${banner.idx==39}">
									<li class="box fl mr5 mb10 p14"><a href="${banner.link_url}" title="새창으로 이동"><img src="${banner.banner_img}"  alt=""></a></li>
								</c:when>
								<c:otherwise>
									<li class="box fl mr5 mb10 p14"><a href="${banner.link_url}" target="_blank" title="새창으로 이동"><img src="${banner.banner_img}"  alt=""></a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>

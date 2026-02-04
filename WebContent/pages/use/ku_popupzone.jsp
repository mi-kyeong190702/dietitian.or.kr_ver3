<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">팝업</mark>모두보기</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/use/ku_sitemap.do">이용안내</a></li>
				<li><a href="/use/ku_popupzone.do" class="cm">팝업모두보기</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<div class="box t3 mt20 p20 text small">
			<ul class="area">
			<c:forEach items="${bannerList}" var="banner">
				<c:if test="${banner.banner_type ==  3 }">
				<li class="fl w33p">
					<div class="p10 ">
						<div class="box bw2 bga p5">
							<a href="${banner.link_url}" target="_blank">
								<img src="${banner.banner_img}" style="width:100%; height:154px;" alt="${banner.banner_name}" />
							</a>
						</div>
						<ul class="area mt5">
							<li class="link"><a href="/news/kn_gallery_view.do" class="bold cm">${banner.banner_name}</a></li>
							<li class="ca">${banner.regi_date}</li>
						</ul>
					</div>
				</li>
				</c:if>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>

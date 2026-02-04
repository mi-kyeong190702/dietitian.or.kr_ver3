<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<c:if test="${sessionScope.user_level == 1}">	
<script type="text/javascript">
function f_deleteIt(idx) {
	if( confirm("정말 삭제하시겠습니까?") ) {
		location.href="kp_m_list_action.do?crud=D&idx=" + idx;	
	}
}
</script>
</c:if>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark> 검색</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">KDA 출판</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_magazine">국민영양</a></li>
				<li><a href="/kda/views/layout.html?m=kda-publication&f=kp_m_list" class="cm">국민영양 검색</a></li>
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
		<div class="box t3 text small">
			<ul class="area">
				<li class="line bb bgs">
					<div class="p10 pl15">
						<h4 class="title i_b_t6"><strong class="ti">제목 </strong> ${fn:replace(column.kda_title, "<br>" , "")}</h4>
					</div>
				</li>
			</ul>
		</div>
		<div class="line bb p30 text">
			<h4 class="ti">본문</h4>
			<img src="${FILE_BASE}${column.imagename}"  alt="${ kdaFunc:cleanHtml(column.kda_title)}"  align="left"/>
			${column.title_contents}
		</div>
		<div class="line bt text small">
			<ul>
			<!----------------------------------------- 1,2월호에만 적용됨 ---------------------------------------->
			
				
					<c:choose>
							<c:when test="${(column.idx == 144) || (column.idx == 133) || (column.idx == 122) || (column.idx == 112) || (column.idx == 100) || (column.idx == 89)}">
							<li>
								<div class="pr p15 line bb">
									<strong class="pa l15 t15 bold cm i_b_t3">KDA 신년사</strong>
									<span class="link ml140">${column.kda_column}</span>
								</div>
							</li>
							</c:when>
							<c:when test="${(column.idx < 89)}">
							<li>
								<div class="pr p15 line bb">
									<strong class="pa l15 t15 bold cm i_b_t3">KDA 컬럼</strong>
									<span class="link ml140">${column.kda_column}</span>
								</div>
							</li>
							</c:when>

					</c:choose>
				
	
			<!----------------------------------------------------------------------------------------------------------->

				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">
						<c:choose>
							<c:when test="${column.idx == 24}">
							국민영향 300호 특집
							</c:when>
							<c:when test="${column.idx == 39}">
							대한 영양사협회<br> 창립40주년 특집호
							</c:when>
							<c:otherwise>
							KDA ISSUE
							</c:otherwise>
						</c:choose>
						
						</strong>
						<span class="link ml140">${column.kda_special}</span>
					</div>
				</li>
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">KDA FOCUS</strong>
						<span class="link ml140">${column.kda_nd}</span>
					</div>
				</li>
				
				
				<!--  20151006 KDA PRACTICE 추가-->
				<c:choose>
							<c:when test="${column.idx >= 101}">
							<li>
								<div class="pr p15 line bb">
									<strong class="pa l15 t15 bold cm i_b_t3">KDA PRACTICE</strong>
									<span class="link ml140">${column.kda_practice}</span>
								</div>
							</li>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
				
				<!--  20151006 KDA PRACTICE 추가 끝-->		
								
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">KDA PEOPLE</strong>
						<span class="link ml140">${column.kda_we}</span>
					</div>
				</li>
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">KDA NOW</strong>
						<span class="link ml140">${column.kda_news }</span>
					</div>
				</li>
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">열린게시판</strong>
						<span class="link ml140">${column.kda_board}</span>
					</div>
				</li>
				<li>
					<div class="pr p15 line bb">
						<strong class="pa l15 t15 bold cm i_b_t3">화보</strong>
						<span class="link ml140">${column.kda_picture}</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="btn_wrap mt20">
			<ul class="fl">
				<li><a href="kp_m_list.do?curPage=${param.curPage}" class="btn big">목록</a></li>
			</ul>
			<c:if test="${sessionScope.user_level == 1}">	
			<ul class="fr">
				<li><a href="kp_m_list_form.do?idx=${param.idx}" class="btn big t4">수정</a></li>
				<li><a href="javascript:f_deleteIt(${param.idx})" class="btn big t4">삭제</a></li>
			</ul>
			</c:if>
		</div>
	</div>
</div>

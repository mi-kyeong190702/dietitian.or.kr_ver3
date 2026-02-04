<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>
function f_Search() {
	
	
	document.frmSearch.submit();

}
</script>
<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">검색</mark></h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/" class="icon_home" title=""><span class="ti">HOME</span></a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<form:form modelAttribute="search" method="post" name="frmSearch" action="ks_result.do">
				<fieldset>
					<legend><span class="ti">검색</span></legend>
					<div class="box p20">
						<div class="form">
							<div class="f_wrap">
								<div class="f_field div1">
									<div class="title s1 i_b_t6">
										먼저 검색을 하시면 원하는 내용을 쉽게 찾을 수 있습니다.
									</div>
									<div class="ff_wrap mt10">
										<div class="area">
											<form:select path="search" class="select t2 fl w150">
												<form:option value="1">회원자료실</form:option>
												<form:option value="2">영양관련정보</form:option>
												<form:option value="3">국민영양</form:option>
											</form:select>	
											
											<form:input path="keyword" class="input t1 fl w300 ml5" />
											<a href="javascript:f_Search();" class="btn form t1 fl ml5">검색<span class="icon search"></span></a>
										</div>
										<div class="area">
											<ul class="mt10">
												<li class="fl mr20 p3 pt10"><form:checkbox path="check1" class="mr5" value="on"/><label for="check1">이름</label></li>
												<li class="fl mr20 p3 pt10"><form:checkbox path="check2" class="mr5" value="on"/><label for="check2">제목</label></li>
												<li class="fl mr20 p3 pt10"><form:checkbox path="check3" class="mr5" value="on"/><label for="check3">내용</label></li>
											</ul>
											
											<label for="inputid3" class="fl text ssmall ml10 mr10">공백</label>
											
											<form:select path="check4" class="select t2 fl w150 mr5" >
												<form:option value="1">AND</form:option>
												<form:option value="2">OR</form:option>
											</form:select>
											
											<form:select path="check5" class="select t2 fl w150">
												<form:option value="">전체</form:option>
												<form:option value="7" >1주일이내</form:option>
												<form:option value="30" >1개월이내</form:option>
												<form:option value="90" >3개월이내</form:option>
												<form:option value="180" >6개월이내</form:option>
												<form:option value="365" >1년이내</form:option>
												<form:option value="730" >2년이내</form:option>
												<form:option value="1095" >3년이내</form:option>
											</form:select>
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="mt50">
						
						<div class="area mt5 text ca s1 small pb5">
							<span class="fl">
								<mark class="cb bold i_b_t6">검색어</mark> : <mark class="cp">${search.keyword}</mark>
							</span>
							<span class="fr"><mark class="cb bold">검색 결과 수 </mark> : 총 <mark class="cp">${listHelper.totalCount}</mark> 건</span>
						</div>
						
						<div class="area box t3 mt5 text s1 pb5">
						
							<c:if test="${listHelper.totalCount == 0 }">
							<div class="p10 line bb">
								<div class="ks_text">
									검색 결과가 존재하지 않습니다.
								</div>
							</div>
							</c:if>
							
							<c:forEach items="${listHelper.list}" var="search">
							<div class="p10 line bb">
								<div class="area">
									${search.bs_name}
									<a href="${search.bs_toplink}?bbs_board_code=${search.bs_code}&board_form=view&bbs_idx=${search.bbs_idx}" class="link" target="_blank"><mark class="ml10 cp ssmall bold fr">새창열기</mark></a>
								
								</div><!--카테고리-->
								<div class="mr90 small ca fl"><span class="ti">제목 : </span><a href="#" class="link cb">${search.bbs_subject}</a></div><!--제목-->
								<div class="fr ssmall fl"><span class="ti">글쓴이 : </span>${search.bbs_name}<mark class="ml5 ca">${search.bbs_edit_date_dt}</mark></div>
								<div class="ks_text">
									${kdaFunc:cleanHtml(search.bbs_contents)}
								</div>
							</div>
							</c:forEach>
						
						</div>
						
						<kda:paging listHelper="${listHelper}"/>
					
					</div>
				</fieldset>
			</form:form>

		</div>
	</div>



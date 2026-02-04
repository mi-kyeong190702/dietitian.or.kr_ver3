<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

		
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자격시험</mark> 신청확인</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
					<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
					<li><a href="/work/education/ke_exam.do" class="cm">자격시험 신청</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<!-- // Contents Start -->
			<div class="area">
				<table class="table t1 text s1 ssmall ca center mt50">
					<colgroup>
						<col width="100">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<td scope="row" class="bold cm bgs">신청시험명</td>
						<td class="left"> ${operator.edutest_name}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">이름</td>
						<td class="left">${operator.oper_name}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">면허번호</td>
						<td class="left">${operator.oper_lic_no}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">근무처명</td>
						<td class="left">${operator.oper_comp_name1}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">근무처연락처</td>
						<td class="left">${operator.company_tel}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">핸드폰</td>
						<td class="left">${operator.oper_hp}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">이메일주소</td>
						<td class="left">${operator.oper_email}</td>
					</tr>
					<tr>
						<td scope="row" class="bold cm bgs">시험장소</td>
						<td class="left">${operator.operation_place }</td>
					</tr>
				</table>
			
				<div class="btn_wrap mt30">
					<ul>
						<li><a href="/work/education/ke_exam_situation.do" class="btn big t1 wide">자격시험 신청현황</a></li>
					</ul>
				</div>
		
			</div>
				
			<!-- // Contents end -->
			</div>
		</div>
	</div>
	

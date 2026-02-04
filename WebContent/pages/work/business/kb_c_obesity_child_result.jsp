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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비만도</mark>평가</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="./kb_c_obesity_adult.do" class="cm">비만도평가</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body h900">
	
		<div class="tab_2 div2">
			<ul>
				<li><a href="/work/business/kb_c_obesity_adult.do">성인의 비만상태 평가</a></li>
				<li><a href="/work/business/kb_c_obesity_child.do" class="on">초중고생의 비만도 평가</a></li>
			</ul>
		</div>
		
		<fieldset>
			<legend><span class="ti">비만도 결과</span></legend>
			<div class="box t2 bgs mt50 p20 text">
				<div class="area">
					<h5 class="title i_b_t6 bold s1"><mark class="cm">비만도</mark>결과</h5>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3"><mark class="bold">개인신상</mark></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>성명</strong></div>
									<div class="ff_wrap ml120 text">${result.kname}</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>성별</strong></div>
									<div class="ff_wrap ml120 text">${result.sexKo}</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
									<div class="ff_title i_b"><strong>나이</strong></div>
									<div class="ff_wrap ml120 text">
									만 ${result.fage} 세
									</div>
								</div>
							</div>
						</div>
						
						<h6 class="title s1 i_b_t3 mt40"><mark class="bold">체위조사</mark></h6>
						<div class="form mt10 line bt bcm">
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>신장</strong></div>
									<div class="ff_wrap ml120 text">
										
										<fmt:formatNumber value="${result.fhit}" type="number"/> cm
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>체중</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.fwit}" type="number" /> kg
									</div>
								</div>
							</div>
						
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>비만도</strong></div>
									<div class="ff_wrap ml120 text">
										<fmt:formatNumber value="${fatness}"  pattern=".00"/> % 
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>표준체중</strong></div>
									<div class="ff_wrap ml120 text">
									${standard}kg 
									[
									<fmt:formatNumber value="${standard_m}"  pattern=".00"/> 
									-
									<fmt:formatNumber value="${standard_p}"  pattern=".00"/> 
									]
									</div>
								</div>
							</div>
						
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>체지방</strong></div>
									<div class="ff_wrap ml120 text">
										<fmt:formatNumber value="${result.fat}" type="number"/> % 
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>열량권장량</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${eKal}" type="number"/> kcal
									</div>
								</div>
							</div>
						</div>
						
						<div class="text s1 mt40">
							<ul>
								<li><mark  class="area bold t3 i_b_t3">측정결과</mark>
									<p class="text s1 small p10">${resultStr}</p>
								</li>
							</ul>
							<div class="ssmall ca mt20 mb50">※ 대한영양사회에서는 여러분의 식사 및 영양관리에 도움을 드리고자 각종 자료 및 정보를 제공하고 있습니다. <br />
								의문사항은 전화(02-823-5680)나 Email(<a href="mailtodietitian@dietitian.or.kr:">dietitian@dietitian.or.kr</a>)을 이용하여 주십시오.</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		
						
		
		<!-- /비만도 평가 하는 부분 -->
	
	</div>
</div>

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
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">비만도</mark>평가(성인)</h3>
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
	<div class="sp_body">
	
		<p class="text middle s1">
		이 프로그램은 질병이 없는 18세 이상의 성인과 당뇨환자를 위한 건강상태 평가 프로그램입니다. <br />
		각 문항에 신상 및 신체계측자료를 입력하시면 기초건강상태 평가자료와 열량권장량을 알려드립니다. 허리 및 엉덩이둘레, 체지방(%), 혈압, 혈당은 선택사항입니다. 
		</p>
		
		<div class="tab_2 div2 mt20">
			<ul>
				<li><a href="/work/business/kb_c_obesity_adult.do" class="on">성인의 비만상태 평가</a></li>
				<li><a href="/work/business/kb_c_obesity_child.do">초중고생의 비만도 평가</a></li>
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
									<div class="ff_title i_b"><strong>체지방</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.fat}" type="number"/>	%
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>체중</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.fwit}" type="number"/> kg
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>비만도</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.ll_weight}" type="number"/>	%
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>허리둘레</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.waist}" type="number"/> cm
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>표준체중</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.lp_weight}" pattern=".0"/> kg
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>엉덩이둘레</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.heap}" type="number"/> cm
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>단백질권장량</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.ll_protein}" pattern=".0"/>	g
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>혈압</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.bloodph}" type="number"/>  / <fmt:formatNumber value="${result.bloodpl}" type="number"/>  mmHg
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>열량권장량</strong></div>
									<div class="ff_wrap ml120 text">
									<fmt:formatNumber value="${result.l_energy}" type="number"/> kcal
									</div>
								</div>
							</div>
							<div class="f_wrap line bb p8">
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>혈당</strong></div>
									<div class="ff_wrap ml120 text">
										<fmt:formatNumber value="${result.bloodsb}" type="number"/> /  <fmt:formatNumber value="${result.bloodsa}" type="number"/> mg/dl
									</div>
								</div>
								<div class="f_field div2">
									<div class="ff_title i_b"><strong>허리엉덩이둘레비</strong></div>
									<div class="ff_wrap ml120 text">
										<c:choose>
					                		<c:when test="${ result.ll_whr < 1 }">
					                			<fmt:formatNumber value="${result.lss_whr}" pattern="0.00" />
					                		</c:when>
					                		<c:otherwise>
					                			<fmt:formatNumber value="${result.ll_whr}" pattern="0.00" />
					                	
					                		</c:otherwise>
					                	</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="text s1 mt40">
				<ul>
					<li><mark  class="area bold t3 i_b_t3">혈당</mark>
						<p class="text s1 small p10">${result.ls_bloods}</p>
					</li>
					<li class="mt20"><mark  class="area text bold t3 s1 i_b_t3">혈압</mark>
						<p class="small p10">${result.ls_blood}</p>
					</li>
					<li class="mt20"><mark  class="area text bold t3 s1 i_b_t3">체지방</mark>
						<p class="small p10">${result.ls_fat}</p>
					</li>
					<li class="mt20"><mark  class="area text bold t3 s1 i_b_t3">허리엉덩이둘레비</mark>
						<p class="small p10">${result.ls_whr}</p>
					</li>
					<li class="mt20"><mark  class="area text bold t3 s1 i_b_t3">비만도</mark>
						${result.ls_weight}
						<div class="ssmall ml15 cm">※ 참고사항 : 비만인 경우 비만도를 낮추기 위하여 열량권장량이 실제권장량보다 500kcal 적게 권장됩니다. </div>
					</li>
				</ul>
				<div class="ssmall ca mt20 mb50">※ 대한영양사회에서는 여러분의 식사 및 영양관리에 도움을 드리고자 각종 자료 및 정보를 제공하고 있습니다. <br />
				의문사항은 전화(02-823-5680)나 Email(<a href="mailtodietitian@dietitian.or.kr:">dietitian@dietitian.or.kr</a>)을 이용하여 주십시오.</div>
			</div>
		</fieldset>
							




		<!-- /비만도 평가 하는 부분 -->
	
	</div>
</div>

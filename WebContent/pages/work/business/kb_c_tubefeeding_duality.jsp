<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">경관</mark>급식</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_tube_feeding.do" class="cm">경관급식</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="h900 w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<%@ include file="inc/tubefeeding.jsp" %>
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">경관급식의 투여경로에 따른 장단점</h4>
						<div class="w700 ac mt20 mb20"><span class="bold i_b_t6">경관급식의 투여경로에 따른 장단점</span>
							<table class="table t2 mt10 text ssmall s1 ca center">
								<colgroup>
									<col width="100" />
									<col width="200" />
									<col width="200" />
									<col width="200" />
								</colgroup>
								<thead>
								<tr>
									<th scope="col" class="bold cm">투여경로</th>
									<th scope="col" class="bold cm">적용대상</th>
									<th scope="col" class="bold cm">장점</th>
									<th scope="col" class="bold cm">단점</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td class="bgf7 bold ca">비위관<br />(Nasogastric)</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 적은 경우</li>
											<li class="i_b_t7">식도 역류가 없고 위장관 기능이 정상인 경우</li>
											<li class="i_b_t7">단기간의 경관급식이 예상되는 경우</li>
										</ul>
									</td>
									<td class="left top">Tube의 삽입이 비교적 쉽다</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 높다.</li>
											<li class="i_b_t7">환자에게 불편감을 준다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="bgf7 bold ca">비십이지장관 비공장관<br />(Nasoduodenal Nasojejunal)</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 높은 경우</li>
											<li class="i_b_t7">위무력이나 식도역류가 있는 경우</li>
											<li class="i_b_t7">단기간의 경관급식이 예상되는 경우</li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 적다.</li>
											<li class="i_b_t7">수술 과정은 필요치 않으나 비위관 급식(nasogastric)에 비해 관의 삽입이 어렵다</li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">영양액의 주입속도, 삼투압 농도에 따라 부적응 발생 가능성이 있다.</li>
											<li class="i_b_t7">관의 위치 확인을 위해 X-ray 촬영등 검사가 요망될 수 있다.</li>
											<li class="i_b_t7">환자에게 불편감을 준다</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="bgf7 bold ca">위조루술<br />(Gastrostomy)</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 적은 경우</li>
											<li class="i_b_t7">식도역류가 없고 위장관 기능이 정상인 경우</li>
											<li class="i_b_t7">장기간 급식이 예상되는 환자</li>
											<li class="i_b_t7">비강으로 관 삽입이 어려운 경우</li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">환자의 불편감이 적다.</li>
											<li class="i_b_t7">PEG*의 경우 수술과정이 없이 저렴한 비용으로 시술이 가능하다.</li>
											<li class="i_b_t7">수술 과정은 필요치 않으나 비위관 급식(nasogastric)에 비해 관의 삽입이 어렵다</li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">수술과정을 필요로 한다.</li>
											<li class="i_b_t7">관 부위의 감염관리가 필요하다.</li>
											<li class="i_b_t7">소화액 유출로 인한 피부의 찰상이 발생된다.</li>
											<li class="i_b_t7">관제거 이후 누공이 생길 수 있다.</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="bgf7 bold ca">공장조루술<br />(Jejunostomy)</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 높은 환자</li>
											<li class="i_b_t7">위무력이나 식도역류가 있는 경우</li>
											<li class="i_b_t7">장기간의 경관급식이 예상되는 경우</li>
											<li class="i_b_t7">상부 위장관으로 관 삽입이 어려운 경우 </li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">흡인의 위험이 적다.</li>
											<li class="i_b_t7">환자의 불편감이 적다.</li>
											<li class="i_b_t7">PEJ**의 경우 수술과정이 없이 저렴한 비용으로 시술이 가능하다.</li>
										</ul>
									</td>
									<td class="left top">
										<ul>
											<li class="i_b_t7">수술과정을 필요로 한다.</li>
											<li class="i_b_t7">관 부위의 감염관리가 필요하다.</li>
											<li class="i_b_t7">소화액 유출로 인한 피부의 찰상이 발생된다.</li>
											<li class="i_b_t7">관제거 이후 누공이 생길 수 있다.</li>
										</ul>
									</td>
								</tr>
								</tbody>
							</table>
							<ul class="small cm">
								<li>※ PEG: percutaneous endoscopic gastrostomy</li>
								<li>※ PEJ : percutaneous endoscopic jejunostomy</li>
							</ul>
						</div>
								
					</div>
			</c:otherwise>
	    </c:choose>
	</div>
</div>

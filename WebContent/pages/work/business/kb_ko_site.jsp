<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국내</mark>사이트</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="./kb_nutrition.do">KDA 영양</a></li>
				<li><a href="./kb_ko_site.do">관련사이트</a></li>
				<li><a href="./kb_ko_site.do" class="cm">국내사이트</a></li>
			</ul>
		</div>
	</div>
	<hr />
	
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
		
				<div class="area">
					<h4 class="title bold cm t2 s1 i_b_t2 mt50">국내 사이트</h4><br />
					<h5 class="title bold t3 s1 i_b_t3 mt40">정부기관</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="*" />
								<col width="150" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  scope="row" class="left bold bgf7">공정거래위원회</td>
									<td class="link left"><a title="새창열림" href="http://www.ftc.go.kr" target="_blank">http://www.ftc.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">교육부</td>
									<td class="link left"><a title="새창열림" href="http://www.moe.go.kr" target="_blank">http://www.moe.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국가전자도서관</td>
									<td class="link left"><a title="새창열림" href="http://www.dlibrary.go.kr" target="_blank">http://www.dlibrary.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">국방부</td>
									<td class="link left"><a title="새창열림" href="http://www.mnd.go.kr" target="_blank">http://www.mnd.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국토교통부</td>
									<td class="link left"><a title="새창열림" href="http://www.molit.go.kr" target="_blank">http://www.molit.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">국회 </td>
									<td class="link left"><a title="새창열림" href="http://www.assembly.go.kr" target="_blank">http://www.assembly.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">규제정보포털</td>
									<td class="link left"><a title="새창열림" href="http://www.better.go.kr" target="_blank">http://www.better.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">기획재정부</td>
									<td class="link left"><a title="새창열림" href="http://www.moef.go.kr" target="_blank">http://www.moef.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">고용노동부</td>
									<td class="link left"><a title="새창열림" href="http://www.moel.go.kr" target="_blank">http://www.moel.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">농림축산식품부</td>
									<td class="link left"><a title="새창열림" href="http://www.mafra.go.kr" target="_blank">http://www.mafra.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">농촌진흥청</td>
									<td class="link left"><a title="새창열림" href="http://www.rda.go.kr" target="_blank">http://www.rda.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">문화체육관광부</td>
									<td class="link left"><a title="새창열림" href="http://www.mcst.go.kr" target="_blank">http://www.mcst.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">법무부</td>
									<td class="link left"><a title="새창열림" href="http://www.moj.go.kr" target="_blank">http://www.moj.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">법제처</td>
									<td class="link left"><a title="새창열림" href="http://www.moleg.go.kr" target="_blank">http://www.moleg.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">보건복지부</td>
									<td class="link left"><a title="새창열림" href="http://www.mohw.go.kr" target="_blank">http://www.mohw.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">식품의약품안전처</td>
									<td class="link left"><a title="새창열림" href="http://www.mfds.go.kr" target="_blank">http://www.mfds.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">여성가족부</td>
									<td class="link left"><a title="새창열림" href="http://www.mogef.go.kr" target="_blank">http://www.mogef.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">외교부</td>
									<td class="link left"><a title="새창열림" href="http://www.mofa.go.kr" target="_blank">http://www.mofa.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">정부24</td>
									<td class="link left"><a title="새창열림" href="http://www.gov.kr" target="_blank">http://www.gov.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">산업통상자원부</td>
									<td class="link left"><a title="새창열림" href="http://www.motie.go.kr" target="_blank">http://www.motie.go.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">질병관리청</td>
									<td class="link left"><a title="새창열림" href="http://www.cdc.go.kr" target="_blank">http://www.cdc.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">통계청</td>
									<td class="link left"><a title="새창열림" href="http://kostat.go.kr" target="_blank">http://kostat.go.kr</a></td>
									<!-- <td  scope="row" class="left bold bgf7">청와대</td>
									<td class="link left"><a title="새창열림" href="http://www.president.go.kr" target="_blank">http://www.president.go.kr</a></td> -->
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국민신문고</td>
									<td class="link left"><a title="새창열림" href="http://www.epeople.go.kr" target="_blank">http://www.epeople.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">한국보건의료인국가시험원</td>
									<td class="link left"><a title="새창열림" href="http://www.kuksiwon.or.kr" target="_blank">http://www.kuksiwon.or.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">통일부</td>
									<td class="link left"><a title="새창열림" href="http://www.unikorea.go.kr" target="_blank">http://www.unikorea.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">행정안전부</td>
									<td class="link left"><a title="새창열림" href="http://www.mois.go.kr" target="_blank">http://www.mois.go.kr</a></td>
								</tr>
								<!-- <tr>
									<td  scope="row" class="left bold bgf7">한국산업안전보건공단</td>
									<td class="link left"><a title="새창열림" href="http://www.kosha.or.kr" target="_blank">http://www.kosha.or.kr</a></td>
								</tr> -->
								<tr>
									<td  scope="row" class="left bold bgf7">환경부 </td>
									<td class="link left"><a title="새창열림" href="http://www.me.go.kr" target="_blank">http://www.me.go.kr</a></td>
									<td  scope="row" class="left bold bgf7"> </td>
									<td class="link left"><a title="새창열림" href="#" target="_blank"></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h5 class="title bold t3 s1 i_b_t3 mt40">식품영양 관련기관 및 학회</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="*" />
								<col width="150" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  scope="row" class="left bold bgf7">국민건강영양조사</td>
									<td class="link left"><a title="새창열림" href="https://knhanes.kdca.go.kr" target="_blank">https://knhanes.kdca.go.kr</a></td>
									<td  scope="row" class="left bold bgf7">국제보건의료발전재단</td>
									<td class="link left"><a title="새창열림" href="http://www.kofih.org" target="_blank">http://www.kofih.org</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">대한당뇨병학회</td>
									<td class="link left"><a title="새창열림" href="http://www.diabetes.or.kr" target="_blank">http://www.diabetes.or.kr</a></td>
									<td  scope="row" class="left bold bgf7">대한당뇨병교육영양사회</td>
									<td class="link left"><a title="새창열림" href="http://cafe.daum.net/kadde" target="_blank">http://cafe.daum.net/kadde</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">대한병원협회</td>
									<td class="link left"><a title="새창열림" href="http://www.kha.or.kr" target="_blank">http://www.kha.or.kr</a></td>
									<td  scope="row" class="left bold bgf7">대한의학회</td>
									<td class="link left"><a title="새창열림" href="http://www.kams.or.kr" target="_blank">http://www.kams.or.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">한국장류협동조합</td>
									<td class="link left"><a title="새창열림" href="http://www.koreajang.or.kr" target="_blank">http://www.koreajang.or.kr</a></td>
									<td  scope="row" class="left bold bgf7">대한지역사회영양학회</td>
									<td class="link left"><a title="새창열림" href="http://koscom.or.kr" target="_blank">http://koscom.or.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">한국보건산업진흥원</td>
									<td class="link left"><a title="새창열림" href="http://www.khidi.or.kr" target="_blank">http://www.khidi.or.kr</a></td>
									<td  scope="row" class="left bold bgf7">한국보건사회연구원</td>
									<td class="link left"><a title="새창열림" href="http://www.kihasa.re.kr" target="_blank">http://www.kihasa.re.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">한국영양학회</td>
									<td class="link left"><a title="새창열림" href="http://www.kns.or.kr" target="_blank">http://www.kns.or.kr</a></td>
									<td  scope="row" class="left bold bgf7">한국식품과학회</td>
									<td class="link left"><a title="새창열림" href="http://www.kosfost.or.kr" target="_blank">http://www.kosfost.or.kr</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">한국식품연구원</td>
									<td class="link left"><a title="새창열림" href="http://www.kfri.re.kr" target="_blank">http://www.kfri.re.kr</a></td>
									<td  scope="row" class="left bold bgf7"></td>
									<td class="link left"><a title="새창열림" href="#" target="_blank"></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<h5 class="title bold t3 s1 i_b_t3 mt40">유통 관련기관</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="*" />
								<col width="150" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  scope="row" class="left bold bgf7">서울시농수산식품공사</td>
									<td class="link left"><a title="새창열림" href="http://www.garak.co.kr" target="_blank">http://www.garak.co.kr</a></td>
									<td  scope="row" class="left bold bgf7">농식품 수출정보</td>
									<td class="link left"><a title="새창열림" href="http://www.kati.net" target="_blank">http://www.kati.net</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">aT한국농수산식품유통공사 </td>
									<td class="link left"><a title="새창열림" href="http://www.at.or.kr" target="_blank">http://www.at.or.kr</a></td>
									<td  scope="row" class="left bold bgf7"></td>
									<td class="link left"><a title="새창열림" href="#" target="_blank"></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
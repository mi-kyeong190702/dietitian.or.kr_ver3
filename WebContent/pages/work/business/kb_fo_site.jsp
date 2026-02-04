<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국외</mark>사이트</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="./kb_nutrition.do">KDA 영양</a></li>
				<li><a href="./kb_ko_site.do">관련사이트</a></li>
				<li><a href="./kb_fo_site.do" class="cm">국외사이트</a></li>
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
					<h4 class="title bold cm t2 s1 i_b_t2 mt50">국외 사이트</h4><br />
					<h5 class="title bold t3 s1 i_b_t3 mt40">미국</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">보건복지부(DHHS)</td>
									<td class="link left"><a title="새창열림" href="http://www.hhs.gov" target="_blank">http://www.hhs.gov</a></td>
									<td  scope="row" class="left bold bgf7">농림부(USDA)</td>
									<td class="link left"><a title="새창열림" href="http://www.usda.gov" target="_blank">http://www.usda.gov</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">식품의약품안전청(FDA)</td>
									<td class="link left"><a title="새창열림" href="http://www.fda.govr" target="_blank">http://www.fda.gov</a></td>
									<td  scope="row" class="left bold bgf7">국립보건원(NIH)</td>
									<td class="link left"><a title="새창열림" href="http://www.nih.gov" target="_blank">http://www.nih.gov</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">보건통계센터(NIHS)</td>
									<td class="link left"><a title="새창열림" href="http://www.cdo.gov/nchs" target="_blank">http://www.cdo.gov/nchs</a></td>
									<td  scope="row" class="left bold bgf7">식품위생검사국(FSIS)</td>
									<td class="link left"><a title="새창열림" href="http://www.fsis.usda.gov" target="_blank">http://www.fsis.usda.gov</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">식품과학회(IFT)</td>
									<td class="link left"><a title="새창열림" href="http://www.ift.org" target="_blank">http://www.ift.org</a></td>
									<td  scope="row" class="left bold bgf7">보건산업제조협회(HIMS)</td>
									<td class="link left"><a title="새창열림" href="http://www.himanet.com" target="_blank">http://www.himanet.com</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">Food Safety DB</td>
									<td class="link left"><a title="새창열림" href="http://www.foodsafety.org" target="_blank">http://www.foodsafety.org</a></td>
									<td  scope="row" class="left bold bgf7">식중독예방관련(Fight BAC!)</td>
									<td class="link left"><a title="새창열림" href="http://www.fightbac.org" target="_blank">http://www.fightbac.org</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국회도서관(LOC)</td>
									<td class="link left"><a title="새창열림" href="http://www.loc.gov" target="_blank">http://www.loc.gov</a></td>
									<td  scope="row" class="left bold bgf7">Cornell 법대</td>
									<td class="link left"><a title="새창열림" href="http://www.law.cornell.edu" target="_blank">http://www.law.cornell.edu</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">호주</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">보건노인부</td>
									<td class="link left"><a title="새창열림" href="http://www.health.gov.au" target="_blank">http://www.health.gov.au</a></td>
									<td  scope="row" class="left bold bgf7">AusFoodNews</td>
									<td class="link left"><a title="새창열림" href="http://www.ausfoodnews.com.au" target="_blank">http://www.ausfoodnews.com.au</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국립도서관</td>
									<td class="link left"><a title="새창열림" href="http://www.nla.gov.au" target="_blank">http://www.nla.gov.au</a></td>
									<td  scope="row" class="left bold bgf7">호주·뉴질랜드식품국(ANZFA)</td>
									<td class="link left"><a title="새창열림" href="http://www.anzfa.gov.au" target="_blank">http://www.anzfa.gov.au</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">Food Safety</td>
									<td class="link left"><a title="새창열림" href="hhttp://www.safefood.com" target="_blank">http://www.safefood.com</a></td>
									<td  scope="row" class="left bold bgf7">법령 등(호주 중심)</td>
									<td class="link left"><a title="새창열림" href="http://www.austlii.edu.au" target="_blank">http://www.austlii.edu.au</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">캐나다</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">보건부</td>
									<td class="link left"><a title="새창열림" href="http://www.hc_sc.gc.ca/english" target="_blank">http://www.hc_sc.gc.ca/english</a></td>
									<td  scope="row" class="left bold bgf7">농림부</td>
									<td class="link left"><a title="새창열림" href="http://www.agr.c" target="_blank">http://www.agr.ca</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">Law Library</td>
									<td class="link left"><a title="새창열림" href="http://www.droit.umontreal.ca/doc/biblio/en/bv/sources/goverments.html" target="_blank">
										http://www.droit.umontreal.ca/doc/<br />biblio/en/bv/sources/goverments.html</a>
									</td>
									<td  scope="row" class="left bold bgf7">Food Net</td>
									<td class="link left"><a title="새창열림" href="http://foodnet.fic.ca/index.html" target="_blank">http://foodnet.fic.ca/index.html</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">뉴질랜드</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">보건부(MOH)</td>
									<td class="link left"><a title="새창열림" href="http://www.moh.govt.nz" target="_blank">http://www.moh.govt.nz</a></td>
									<td  scope="row" class="left bold bgf7">농림부(MAF)</td>
									<td class="link left"><a title="새창열림" href="http://www.maf.govt.nz/MAFnet/index.html" target="_blank">http://www.maf.govt.nz/<br />MAFnet/index.html</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">정부법령</td>
									<td class="link left"><a title="새창열림" href="http://io.knowledge-basket.co.nz/gpprin" target="_blank">http://io.knowledge-basket.co.nz/gpprin</a></td>
									<td  scope="row" class="left bold bgf7"></td>
									<td class="link left"><a title="새창열림" href="#" target="_blank"></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">일본</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">후생성</td>
									<td class="link left"><a title="새창열림" href="http://www.hmw.go.jp/english/index.html" target="_blank">http://www.hmw.go.jp/<br />english/index.html</a></td>
									<td  scope="row" class="left bold bgf7">농무성</td>
									<td class="link left"><a title="새창열림" href="http://www.maff.go.jp/eindex.html" target="_blank">http://www.maff.go.jp/eindex.html</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">영국</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">보건부(DOH)</td>
									<td class="link left"><a title="새창열림" href="http://www.doh.gov.uk" target="_blank">http://www.doh.gov.uk</a></td>
									<td  scope="row" class="left bold bgf7">농림부(MAFF)</td>
									<td class="link left"><a title="새창열림" href="http://www.maff.gov.uk" target="_blank">http://www.maff.gov.uk</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">식품관련법령</td>
									<td class="link left"><a title="새창열림" href="http://www.fst_rdg.ac.uk/Foodlaw/index.html" target="_blank">http://www.fst_rdg.ac.uk/<br />Foodlaw/index.htm</a></td>
									<td  scope="row" class="left bold bgf7">Leatherhead Food Research Association</td>
									<td class="link left"><a title="새창열림" href="http://www.lfra.co.uk/index.html" target="_blank">http://www.lfra.co.uk/index.html</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">기타국가</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">중국법령(한글: Law China)</td>
									<td class="link left"><a title="새창열림" href="http://www.lawchina.co.kr" target="_blank">http://www.lawchina.co.kr</a></td>
									<td  scope="row" class="left bold bgf7">이스라엘 복지부</td>
									<td class="link left"><a title="새창열림" href="http://www.health.gov.il/code_eng/rashi" target="_blank">http://www.health.gov.il/code_eng/rashi</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">세계각국 정부</td>
									<td class="link left"><a title="새창열림" href="http://www.gksoft.com/govt/en" target="_blank">http://www.gksoft.com/govt/en</a></td>
									<td  scope="row" class="left bold bgf7">대만 보건부</td>
									<td class="link left"><a title="새창열림" href="http://www.doh.gov.tw" target="_blank">http://www.doh.gov.tw</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">필리핀-NFA (National Food Authority)</td>
									<td class="link left"><a title="새창열림" href="http://www.nfa.gov.ph/index2.html" target="_blank">http://www.nfa.gov.ph/index2.html</a></td>
									<td  scope="row" class="left bold bgf7">덴마크-식품농업수산부</td>
									<td class="link left"><a title="새창열림" href="http://www.afrsci.dk" target="_blank">http://www.afrsci.dk</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">세계정부목록 (Electronic Frontier Foundation)</td>
									<td class="link left"><a title="새창열림" href="http://www.eff.org/gov.html" target="_blank">http://www.eff.org/gov.html</a></td>
									<td  scope="row" class="left bold bgf7"></td>
									<td class="link left"><a title="새창열림" href="#" target="_blank"></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">EU</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">EU</td>
									<td class="link left"><a title="새창열림" href="http://europa.eu.int/index_en.htm" target="_blank">http://europa.eu.int/index_en.htm</a></td>
									<td  scope="row" class="left bold bgf7">EU law</td>
									<td class="link left"><a title="새창열림" href="http://europa.eu.int/eurlex/en/index.html" target="_blank">http://europa.eu.int/eurlex/en/index.html</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">DF VI - 농업</td>
									<td class="link left"><a title="새창열림" href="http://europa.eu.int/comn/dgo6/index_en.html" target="_blank">http://europa.eu.int/comn/<br />dgo6/index_en.htm</a></td>
									<td  scope="row" class="left bold bgf7">DFIII - 산업</td>
									<td class="link left"><a title="새창열림" href="http://europa.eu.int/comn/dog3/index_en.htm" target="_blank">http://europa.eu.int/comn/<br />dog3/index_en.htm</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국제기구 목록</td>
									<td class="link left"><a title="새창열림" href="http://home.inforamp.net/∼iufost" target="_blank">http://home.inforamp.net/∼iufost</a></td>
									<td  scope="row" class="left bold bgf7">국제법령찾기(FindLaw_Internet Legal Resources)</td>
									<td class="link left"><a title="새창열림" href="http://www.findlaw.com" target="_blank">http://www.findlaw.com</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">전문기구</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="*" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="bold cm">사이트명</th>
									<th scope="col" class="bold cm">주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td  scope="row" class="left bold bgf7">국제식품규격위원회(CODEX)</td>
									<td class="link left"><a title="새창열림" href="http://www.fao.org/waicent/faoinfo/economic/esn/codex/default.htm" target="_blank">http://www.fao.org/waicent/faoinfo/economic/esn/codex/default.htm</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<h5 class="title bold t3 s1 i_b_t3 mt40">기타기구 등</h5>
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="150" />
								<col width="220" />
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
									<td  scope="row" class="left bold bgf7">국제식품정보위원회(IFIC)</td>
									<td class="link left"><a title="새창열림" href="http://ificinofo.health.org/index.htm" target="_blank">http://ificinofo.health.org/index.htm</a></td>
									<td  scope="row" class="left bold bgf7">국제기구 목록</td>
									<td class="link left"><a title="새창열림" href="http://home.inforamp.net/∼iufost" target="_blank">http://home.inforamp.net/∼iufost</a></td>
								</tr>
								<tr>
									<td  scope="row" class="left bold bgf7">국제법령찾기(FindLaw_Internet Legal Resources)</td>
									<td class="link left"><a title="새창열림" href="http://www.findlaw.com" target="_blank">http://www.findlaw.com</a></td>
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



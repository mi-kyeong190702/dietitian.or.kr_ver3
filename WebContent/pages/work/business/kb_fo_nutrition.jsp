<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">외국</mark>영양사회</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="./kb_nutrition.do">KDA 영양</a></li>
				<li><a href="./kb_ko_site.do">관련사이트</a></li>
				<li><a href="./kb_fo_nutrition.do" class="cm">외국영양사회</a></li>
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
					<h4 class="title bold cm t2 s1 i_b_t2 mt50">외국 영양사회</h4><br />
					<div class="area">
						<table class="table t1 text ssmall s1 ca center mt20 mb10">
							<colgroup>
								<col width="100" />
								<col width="270" />
								<col width="100" />
								<col width="270" />
							</colgroup>
							<tbody>
								<tr>
									<td scope="row" class="bgs bold cm">Australia</td>
									<td class="link left top">
										<ul>
											<li>Dietitians Association of Australia</li>
											<li class="i_b_t7 mt10">Jan Finley, ICDA Rep</li>
											<li class="i_b_t7">1/8 Phipps Close Deakin ACT 2600</li>
											<li class="i_b_t7 mt10">Telephone: 61 6 282 9555</li>
											<li class="i_b_t7">Fax: 61 6 282 9888</li>
											<li class="i_b_t7">Email daa.apd@hcn.net.au</li>
											<li class="mt10">Web : <a href="http://www.daa.asn.au" target="_blank" title="새창열림">http://www.daa.asn.au</a></li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">Austria</td>
									<td class="link left top">
										<ul>
											<li>Austrian Association of Dietitians</li>
											<li class="i_b_t7 mt10">Marion Binder, ICDA Rep</li>
											<li class="i_b_t7">Verband der Diplom DiatassistentInnen und<br />Ernahrungsmedizinischen BeraterInnen</li>
											<li class="i_b_t7">Oesterreichs Raaber Bahngasse 3/2/8 A 1100 Wien, Austria</li>
											<li class="mt10">Telephone : 43 222 6269 984</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">Canada</td>
									<td class="link left top">
										<ul>
											<li>Dietitians of Canada </li>
											<li class="i_b_t7 mt10">Marsha Sharp, ICDA Rep</li>
											<li class="i_b_t7">480 University Ave, Suite 604 <br />Toronto, Ontario M5G 1V2 Canada</li>
											<li class="mt10">Telephone : 416 596 0857</li>
											<li>Fax : 416 596 0603</li>
											<li>Email : <a href="mailto:centralinfo@dietitians.ca" target="_blank" title="새창열림">centralinfo@dietitians.ca</a></li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">China</td>
									<td class="link left top">
										<ul>
											<li>The Chinese Nutrition Society of Taipei</li>
											<li>Department Nutrition & Health Service</li>
											<li class="i_b_t7 mt10">Chingman Tsai, ICDA Rep c/o C. Frances 250 Wu-Hsing Street</li>
											<li class="i_b_t7">Taipei, Taiwan 110 Republic of China</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">Denmark</td>
									<td class="link left top">
										<ul>
											<li>The Danish Dietetic Association</li>
											<li>Okonomaforeningen</li>
											<li class="i_b_t7 mt10">Irene Kofoed-Nielsen, ICDA Rep</li>
											<li class="i_b_t7">Norre Voldgade 90 <br />DK-1358 Kobenhavn K., Denmark</li>
											<li class="mt10">Telephone : 45 33138 211</li>
											<li>Fax : 45 33 13 82 40</li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">Finland</td>
									<td class="link left top">
										<ul>
											<li>The Association of Clinical and Public Health Nutritionists in Finland</li>
											<li class="i_b_t7 mt10">Riitta Stirkkinen, ICDA Rep</li>
											<li class="i_b_t7">Fabianinkatv 17 B 10<br />FW 00130 Helsinki, Findland</li>
											<li class="mt10">Telephone : 358 9 662630</li>
											<li>Fax : 358 9 657168</li>
											<li>Email : <a href="mailto:riitta.stirkkinen@rty.pp.fi" target="_blank" title="새창열림">riitta.stirkkinen@rty.pp.fi</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">France</td>
									<td class="link left top">
										<ul>
											<li>Association des Dieteticiens de Langue Francaise</li>
											<li class="i_b_t7 mt10">Mireille Simon, ICDA Rep</li>
											<li class="i_b_t7">c/o 35 Allee Vivaldi 75012 Paris, France</li>
											<li class="mt10">Telephone : 33 1 40020 302</li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Germany</td>
									<td class="link left top">
										<ul>
											<li>Verband Diatassistenten - Deutscher Bundesverband e.V.</li>
											<li class="i_b_t7 mt10">Hiltrud Wehner, ICDA Rep</li>
											<li class="i_b_t7">Bismarckstrasse 96 Postfach 105112D 40042 Dusseldorf, Germany</li>
											<li class="mt10">Telephone : 49 0211 162 175 </li>
											<li>Fax :49 0211 357 389</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">Greece</td>
									<td class="link left top">
										<ul>
											<li>Hellenic Dietetic Association</li>
											<li class="i_b_t7 mt10">Evagelia Maglara, ICDA Rep</li>
											<li class="i_b_t7">Erithrou Stavrou 8 - 10 str 115 26 Athens, Greece</li>
											<li class="mt10">Telephone : 30 1 6484 400</li>
											<li>Fax : 30 1 6484 400</li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">India</td>
									<td class="link left top">
										<ul>
											<li>Verband Diatassistenten - Deutscher Bundesverband e.V.</li>
											<li class="i_b_t7 mt10">Dr. Varsha, ICDA Rep</li>
											<li class="i_b_t7">#2A DR. Thirumurthy Nagar III Street Nungambakkam, Chennai 600 034 India</li>
											<li class="mt10">Telephone : 91-44-8221106</li>
											<li>Fax : 91-44-4767008</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">Ireland</td>
									<td class="link left top">
										<ul>
											<li>Irish Nutrition & Dietetic Institute</li>
											<li class="i_b_t7 mt10">Ms. Kathryn Holly, ICDA Rep</li>
											<li class="i_b_t7">Ashgrove House, Kill Avenue</li>
											<li class="i_b_t7">Dun Laoghaire<br />Dean Grange County Dublin, Ireland</li>
											<li class="mt10">Telephone: 353 1 280 4839</li>
											<li>Fax: 353 1 280 4299</li>
											<li class="mt10">Web : <a href="http://indi.ie.eu.or" target="_blank" title="새창열림">http://indi.ie.eu.or</a></li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Israel</td>
									<td class="link left top">
										<ul>
											<li>Israel Dietetic Association</li>
											<li class="i_b_t7 mt10">Tova Abramowitz, ICDA Rep</li>
											<li class="i_b_t7">Naomi Trostler (ICDA Rep)<br />Histadrut Executive Committee Bldg R. Arlozorov 93 Tel Aviv 62098, Israel</li>
											<li class="mt10">Telephone: 972 3 431789, 431889</li>
											<li>Fax: 972 3 269906</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">Italy</td>
									<td class="link left top">
										<ul>
											<li>Italian National Association of Dietitians<br />Associazione Nazionale Diplomati in Dietologia</li>
											<li class="i_b_t7 mt10">Giovanna Cecchetto, ICDA Rep</li>
											<li class="i_b_t7">Via Ugo Foscolo 1110126 Torino, Italy</li>
											<li class="mt10">Telephone and fax: 39 011 6504954</li>
											<li>Email : <a href="mailto:dietisti@tin.it" target="_blank" title="새창열림">dietisti@tin.it</a></li>
											<li>Web : <a href="http://www.sameint.it/andid" target="_blank" title="새창열림">http://www.sameint.it/andid</a></li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">Japan</td>
									<td class="link left top">
										<ul>
											<li>The Japan Dietetic Association</li>
											<li class="i_b_t7 mt10">Motoko Sakamoto, ICDA Rep</li>
											<li class="i_b_t7">1-39 Kanda-Jinbocho Tokyo 101, Japan</li>
											<li class="mt10">Telephone: 81 43 0473 71 1111 Ext. 535</li>
											<li>Fax: 81 43 0473 72 7796</li>
											<li>Web : <a href="www.dietitian.or.jp" target="_blank" title="새창열림">www.dietitian.or.jp</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">Korea</td>
									<td class="link left top">
										<ul>
											<li>The Korean Dietetic Association</li>
											<li class="i_b_t7 mt10">Ms. Hyun-Kyung Moon, PhD, ICDA Rep</li>
											<li class="i_b_t7">603 Chunroc Bldg. 1351-3<br />Singil 7 Dong,<br />Yeongdeung-PO-Ku Seoul,<br />Korea 150-057</li>
											<li class="mt10">Telephone: 82 2 842 2466</li>
											<li>Fax: 82 2 848 7655</li>
											<li>Web : <a href="http://www.dietitian.or.kr" target="_blank" title="새창열림">http://www.dietitian.or.kr</a></li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Malaysia</td>
									<td class="link left top">
										<ul>
											<li>Malaysian Dietitians' Association</li>
											<li class="i_b_t7 mt10">Fatimah Arshad, PhD, RD - ICDA Rep.<br />c/o Department of Nutrition & Dietetics<br />Faculty of Allied Health Sciences
												<br />University Kebangsaan Malaysia<br />Jalan Raja Muda Abdul Aziz<br />50300 Kuala Lumpur, Malaysia</li>
											<li class="mt10">Telephone: 603 4405511</li>
											<li>Fax: 603 2947621</li>
											<li>Email : <a href="mailto:fatimah@medic.ukm.my" target="_blank" title="새창열림">fatimah@medic.ukm.my</a></li>
											<li>Web : <a href="http://www.nutriweb.org.my" target="_blank" title="새창열림">http://www.nutriweb.org.my</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">The Netherlands</td>
									<td class="link left top">
										<ul>
											<li>Dutch Association of Dietitians</li>
											<li class="i_b_t7 mt10">Marian Bouman, ICDA Rep<br />Boterstraat 1a, Postbus 3415340 AH OSS The Netherlands</li>
											<li class="mt10">Telephone: 31 0 412 624543</li>
											<li>Fax: 31 0 412 637736</li>
											<li>Web : <a href="http://www.nvdietist.nl" target="_blank" title="새창열림">http://www.nvdietist.nl</a></li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">New Zealand</td>
									<td class="link left top">
										<ul>
											<li>New Zealand Dietetic Association</li>
											<li class="i_b_t7 mt10">Jenny Black, ICDA Rep</li>
											<li class="i_b_t7">P O Box 5065 Wellington, New Zealand</li>
											<li class="mt10">Telephone: 64 3 5487662</li>
											<li>Fax: 64 3 5487661</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">Norway</td>
									<td class="link left top">
										<ul>
											<li>Norsk Forening for Ernaering og Dietetikk</li>
											<li class="i_b_t7 mt10">Kristina Monsbakka, ICDA Rep<br />Postboks 9202 Vaterland<br />N-0134 Oslo, Norway</li>
											<li class="mt10">Telephone: 47 22 173 355</li>
											<li>Fax: 47 22 173 816</li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Philippines</td>
									<td class="link left top">
										<ul>
											<li>Nutritionist-Dietitians' Association of the Philippines</li>
											<li class="i_b_t7 mt10">Velona Corpus, ICDA Rep</li>
											<li class="i_b_t7">1106 Herrera Tower Herrera Corner Valero Sts., Salcedo Villagec Makati, Metro Manila<br />Philippines</li>
											<li class="mt10">Telephone: 632 810 5034</li>
											<li>Fax: 632 845 1651</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">Slovenija</td>
									<td class="link left top">
										<ul>
											<li>Dietetic Association Slovene</li>
											<li class="i_b_t7 mt10">Ms. Marusa Pavcic, ICDA Rep</li>
											<li class="i_b_t7">Univerzitetni Klinicni Centre<br />Zaloska 7 Ljubljana, 61000, Slovenija</li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">South Africa</td>
									<td class="link left top">
										<ul>
											<li>Association for Dietetics in Southern Africa</li>
											<li class="i_b_t7 mt10">Ms Penny Love, ICDA Rep.</li>
											<li class="i_b_t7">P O Box 1310 Cramerview, 2060<br />South Africa</li>
											<li class="mt10">Telephone: 27 11 886 8130</li>
											<li>Fax: 27 12 886 7612</li>
											<li>Email : <a href="mailto:adsa@iafrica.com" target="_blank" title="새창열림">adsa@iafrica.com</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">Spain</td>
									<td class="link left top">
										<ul>
											<li>Asociacion de ProfesionalesPro Asociacion Espanola De Dietistas-Nutricionistas</li>
											<li class="i_b_t7 mt10">Susan Johnston, ICDA Rep</li>
											<li class="i_b_t7">Avda. Vallvidrera, 73 Edificio<br /> Cruz Roja 08017 Barcelona, Spain</li>
											<li class="mt10">Phone: 93 20538 80</li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Sweden</td>
									<td class="link left top">
										<ul>
											<li>The Swedish Association of Dietitians</li>
											<li class="i_b_t7 mt10">Karin H?ell, ICDA Rep</li>
											<li class="i_b_t7">S:t Eriksgatan 26, Box 12069<br />S 102 22 Stockholm, Sweden</li>
											<li class="mt10">Phone: 46 8 51772785</li>
											<li>Fax: 46 8 51776210</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgs bold cm">Switzer land</td>
									<td class="link left top">
										<ul>
											<li>Schweizerischer Verband diplomierter<br />Ern'rungsberaterInnen c/o M.</li>
											<li class="i_b_t7 mt10">Susan Johnston, ICDA Rep</li>
											<li class="i_b_t7">Walker ICDA Rep</li>
											<li class="i_b_t7">Office <br />Oberstadt 11 CH-6204 Sempach-Stadt, Switzerland</li>
											<li class="mt10">Telephone: 41 41 462 70 66</li>
											<li>Fax: 41 41 462 70 61</li>
										</ul>
									</td>
									<td scope="row" class="bgs bold cm">United Kingdom</td>
									<td class="link left top">
										<ul>
											<li>British Dietetic Association</li>
											<li class="i_b_t7 mt10">c/o Miss Irene Mackay, ICDA Rep<br />5th Floor, Elizabeth House 22 Suffolk Street, Queensway<br />Birmingham, BI ILS<br />United Kingdom</li>
											<li class="mt10">Phone: 44 121 616 4900</li>
											<li>Fax: 44 121 616 4921</li>
											<li>Email : <a href="mailto:bda@dial.pipex.com" title="메일창열림">bda@dial.pipex.com</a></li>
											<li>Web : <a href="http://www.bda.uk.com" target="_blank" title="새창열림">http://www.bda.uk.com</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7 bold cm">United States</td>
									<td class="link left top">
										<ul>
											<li>The American Dietetic Association</li>
											<li class="i_b_t7 mt10">Connie Rivera, ICDA Rep</li>
											<li class="i_b_t7">Suite 800, 216 W Jackson Blvd<br />Chicago, IL60606-6995</li>
											<li class="mt10">Telephone: 312 899 4807</li>
											<li>Fax: 312 899 0008</li>
											<li>Web : <a href="http://www.eatright.org" target="_blank" title="새창열림">http://www.eatright.org</a></li>
										</ul>
									</td>
									<td scope="row" class="bgf7 bold cm">Pakistan</td>
									<td class="link left top">
										<ul>
											<li>PAKISTAN DIETETIC & NUTRITION ASSOCIATION</li>
											<li class="i_b_t7 mt10">Dr. Atta-ura-Rehman Quadri ICDA Rep.</li>
											<li class="i_b_t7">Shaukat Khanum Memorial Cancer Hospital & Reserch</li>
											<li class="mt10">Telephone: 92 42 5180725 34</li>
											<li>Web : <a href="http://www.come.to/pdna" target="_blank" title="새창열림">http://www.come.to/pdna</a></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

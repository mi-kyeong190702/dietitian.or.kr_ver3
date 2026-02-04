<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>

<%	
	String work_userid = ParamUtils.getParameter(request, "g_userid", "");

	// 정상적인 값으로 넘옴
	System.out.println("story g_userid : " + work_userid);

	work_userid = work_userid.replace("!", "%21");
	work_userid = work_userid.replace("@", "%40");
	work_userid = work_userid.replace("#", "%23");
	work_userid = work_userid.replace("~", "%7E");
%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양사면허증</mark>재교부</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="/work/news/kn_re_license.do?g_userid=<%=work_userid%>" class="cm">영양사면허증재교부</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
<%		if ( work_userid == "" ) { %>
			<div class="w600 ac">
				<div class="box t2 p20 mt20">
					<div class="box p50 text big s1 center">
						<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
						<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
					</div>
				</div>
			</div>
<%		} else { %>
		
			<div class="box t2 h100 kn_license_bg">
				<p class="text bold s1 ml250 pt40"><mark class="cs">면허증 재교부신청</mark>은 보건복지부 운영지원과에서 관리하고 있습니다.</p>
			</div>
			<div class="area">
				<h5 class=" title bold t3 s1 i_b_t3 mt50">신청방법</h5>
				<ul class="text s1 mt20 ml10">
					<li class="i_box_t1">직접방문시 본인의 신분증 및 아래구비서류를 준비하여 보건복지부로 방문하시면 됩니다.<br />
						<span class="small cr">※ 약 5일후 발급 : 우편발송기간제외</span>
					</li>
					<li class="i_box_t1 mt5">우편접수 시 아래 구비서류를 준비하여 우편으로 보내주시면 됩니다.<br />
						<span class="small cm">※ 우편신청하실 경우 가급적 등기우편을 이용하시기 바랍니다.</span>
					</li>
					<li class="i_box_t1 mt15"><mark class="bold">보건복지부 주소</mark> <br/> 우편번호 30113<br />
						세종특별자치시 도움 4로 13, 보건복지부 운영지원과(면허)<br />
						<a class="btn t2 middle mt10" href="http://lic.mohw.go.kr/" title="보건복지부 홈페이지로" target="_blank">인터넷신청바로가기</a>
					</li>
				</ul>
				<h5 class=" title bold t3 s1 i_b_t3 mt40">구비서류</h5>
				<div class="area">
								<table class="table t2 text small s1 ca center mt20">
									<colgroup>
										<col width="200">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<td scope="row" class="bgs_2">공통서류</td>
											<td class="left">
												<ul>
													<li class="i_box_t1">면허증 재교부신청서<a class="btn t4 ssmall ml10" href="/assets/ver2/download/data/재교부신청서식.hwp" title="">서식 다운로드</a></li>
													<li class="i_box_t1">정부수입인지 2000원(우체국, 은행에서 구입가능)</li>
													<li class="i_box_t1">반명함판사진(3*4cm) 2매</li>
													<li class="i_box_t1">신분증사본 1부(주민등록증, 여권 등)</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2">분실시</td>
											<td class="left">공통서류</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2">이름, 주민번호 변경시</td>
											<td class="left">공통서류, 면허증 원본, 주민등록표 초본</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2">훼손시</td>
											<td class="left">공통서류, 면허증 원본</td>
										</tr>
										<tr>
											<td scope="row" class="bgs_2">국적변경시</td>
											<td class="left">공통서류, 면허증 원본, 국내거소신고증 또는 외국인등록증 사본 1부<br>
												<span class="ssmall cm">※ 국내거소신고증이 없는 경우 국내거소 사실증명 및 여권사본 1부</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
				<h5 class=" title bold t3 s1 i_b_t3 mt40">주의사항</h5>
				<ul class="text s1 mt20 ml10 mb50">
						<li>①면허증은 일반등기로 발송되므로 직접 받아보실 수 있는 주소를 정확히 기재하여 주십시오. <br/>&nbsp;&nbsp;&nbsp;&nbsp;발송당일에 부재중인 경우 보건복지부로 반송됩니다.<br />
							<span class="small">&nbsp;&nbsp;&nbsp;&nbsp;(직접인수란에 표기시에는 발송하지 않으므로 재교부여부를 전화로 미리 확인하신 후 보건복지부로 내방하여 인수하시기 바랍니다.)</span>
						</li>
						<li>②외국인의 경우는 외국인등록번호(국내거소신고번호) 또는 생년월일과 국적을 기재하십시오.</li>
						<li class="bold mt15">※ 전화문의 : 보건복지콜센터 129</li>
					</ul>
			</div>
<%		} %>
	</div>
</div>
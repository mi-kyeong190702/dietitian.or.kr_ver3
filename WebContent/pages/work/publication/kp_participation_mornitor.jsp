<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@include file="../../common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String user_id		= "";
	String pers_name 	= "";
	String pers_hp 		= "";
	String code_post 		= "";
	String pers_add 		= "";
	
	
	if( g_isLogin && session != null ){
	
		user_id 	= session.getAttribute(SessionInfo.USER_ID).toString();
		pers_name 	= session.getAttribute(SessionInfo.PERS_NAME).toString();
		
		if(session.getAttribute(SessionInfo.PERS_HP) != null)
			pers_hp 	= session.getAttribute(SessionInfo.PERS_HP).toString();
		
		if(session.getAttribute(SessionInfo.CODE_POST) != null)
			code_post 	= session.getAttribute(SessionInfo.CODE_POST).toString();
		
		if(session.getAttribute(SessionInfo.PERS_ADD) != null){
			pers_add 	= session.getAttribute(SessionInfo.PERS_ADD).toString() + session.getAttribute(SessionInfo.PERS_ADD_DETAIL).toString();
		}
	}
%>

<script type="text/javascript">

	function  sendit(){

		
		var f = document.forms["FrmMonitor"];
		
		

		if ( $("#pers_name").val() == "" ) 
		{
			alert("성명은 필수 입력 사항입니다");
			$("#pers_name").focus();
			return;
		}
		if ( $("#pers_hp").val() == "" ) 
		{
			alert("연락처는 필수 입력 사항입니다");
			$("#pers_hp").focus();
			return;
		}
		
		if( $("#S_text01_01").val() == "" ) {
			alert("최소 하나의 컬럼을 입력하여 주십시요");
			return;
		}
		
		if( $("#S_gubun01_01").val() == "" ) {
			alert("최소 하나의 의견을 입력하여 주십시요");
			return;
		}
		
		
		f.action = "/publication_doMonitor.do";
		f.method = "post";
		f.submit();
	}
</script>
<form name="FrmMonitor">
<input type="hidden" name="user_id" value="<%=user_id %>">
<input type="hidden" name="M_post" value="<%=code_post %>">
<input type="hidden" name="M_addr" value="<%=pers_add %>">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양 </mark>참여</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
				<li><a href="/work/publication/kp_magazine.do">국민영양</a></li>
				<li><a href="/work/publication/kp_participation.do" class="cm">국민영양 참여</a></li>
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
				<div class="tab t2 div3 mb30">
					<ul>
						<li><a href="/work/publication/kp_participation.do">표지모델 신청</a></li>
						<li><a href="/work/publication/kp_participation_manuscript.do">원고 공모</a></li>
						<li><a href="/work/publication/kp_participation_mornitor.do" class="on">모니터 참여</a></li>
					</ul>
				</div>
				<h4 class="title bold cm t2 s1 i_b_t2 mt30">모니터 참여</h4>
				<div class="text mt30">
					항상 「국민영양」에 많은 관심 가져주시는 회원 여러분께 감사드립니다.<br />
					국민영양을 더욱 알차고 유용하게 꾸려 나가기 위하여 모니터를 실시하고 있사오니,<br />
					<mark class="bold cm">아래의 질문에 좋은 의견 부탁드립니다.</mark><br />
					앞으로도 국민영양은 회원 여러분들이 영양전문인으로 확고히 자리 잡을 수 있도록 최선을 다하겠습니다.
					<br />
					<span class="cp">모니터 참여기간 : 매달 10일 ~ 17일</span>
				</div>
		
				<div class="form line bt bcm bw2 mt10">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="M_name" class="ff_title i_b"><strong>성명</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="M_name" name="M_name" value="<%=pers_name%>" readonly />
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="M_Tel" class="ff_title i_b"><strong>연락처</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="M_Tel" name="M_Tel" value="<%=pers_hp%>" readonly />
								</div>
							</div>
						</div>
					</div>
				</div>
				<img src="/images/sub/kp_magazin_01.png" class="mt10" />
		
				<div class="box t3 bgs mt30 p10 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">이번 달 국민영양에서 유익했던 컬럼과 이유는?</h4><span class="ssmall ml10">(3개까지 복수 응답 가능)</span>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="inputid3" class="ff_title i_b"><strong>칼럼명 1</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="S_gubun01_01" name="S_gubun01_01"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="textarea1" class="ff_title i_b"><strong>의견 1</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text01_01" name="S_text01_01"/></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="inputid4" class="ff_title i_b"><strong>칼럼명 2</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="S_gubun01_02" name="S_gubun01_02"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="textarea2" class="ff_title i_b"><strong>의견 2</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text01_02" name="S_text01_02"/></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="inputid5" class="ff_title i_b"><strong>칼럼명 3</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200"  id="S_gubun01_03" name="S_gubun01_03"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="textarea3" class="ff_title i_b"><strong>의견 3</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text01_03" name="S_text01_03"/></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
		
				<div class="box t3 bgs mt30 p10 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">이번 달 국민영양에서 아쉬웠던 칼럼과 이유는?</h4><span class="ssmall ml10">(3개까지 복수 응답 가능)</span>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="S_gubun02_01" class="ff_title i_b"><strong>칼럼명 1</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="S_gubun02_01" name="S_gubun02_01" />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="S_text01_03" class="ff_title i_b"><strong>의견 1</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text02_01" name="S_text02_01" /></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="S_gubun02_02" class="ff_title i_b"><strong>칼럼명 2</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="S_gubun02_02" name="S_gubun02_02" />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="S_text02_02" class="ff_title i_b"><strong>의견 2</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text02_02" name="S_text02_02" /></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb dot p8">
						<div class="f_field div1">
							<label for="S_gubun02_03" class="ff_title i_b"><strong>칼럼명 3</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="text" class="input t1 w200" id="S_gubun02_03" name="S_gubun02_03" />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="S_text02_03" class="ff_title i_b"><strong>의견 3</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text02_03" name="S_text02_03" /></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
		
				<div class="box t3 bgs mt30 p10 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">앞으로 국민영양에서 다루었으면 하는 내용은?</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="textarea4" class="ff_title i_b"><strong>의견</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<textarea class="textarea t1 text ssmall" id="S_text03_01" name="S_text03_01" /></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap mt40">
					<ul>
						<li><a href="javascript:sendit();" class="btn big t1">작성완료</a></li>
						<li><a href="javascript:history.back(-1);" class="btn big">취소</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</form>
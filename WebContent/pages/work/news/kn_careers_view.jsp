<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<style>
.mh {
 min-height: 32px;
}
</style>
<script>
	function f_WriteComments(){
		if( $("#cContents").val() == "" ) {
			alert("내용을 입력해 주십시요");
			$("#cContents").focus();
			return;
		}
		
		document.frmCmt.action = "kn_careers_cmt_action?method=c&${params}"; 
		document.frmCmt.submit();
	}
	function showPopup() {  	
  		$('#popup_pwd').bPopup();  		
	}
	
	function f_pwdSubmit() {
		if( $("#pwd").val() == "" ) {
			alert("비밀번호를 입력해 주세요");
			return;
		}
		document.frmPwd.submit();
	}
	
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">채용</mark>센터</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/kda/views/layout.html?m=kda-main&f=main" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/kda/views/layout.html?m=kda-news&f=kn_notice">협회 소식</a></li>
				<li><a href="/kda/views/layout.html?m=kda-news&f=kn_careers">채용센터</a></li>
				<li><a href="/kda/views/layout.html?m=kda-news&f=kn_careers" class="cm">구인</a></li>
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
		
				<!-- // 본문 시작 -->
				<div class="box t3 bgs p10 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">기본정보</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>회사명</strong></div>
							<div class="ff_wrap ml100 text">${employ.ecname }</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>담당자</strong></div>
							<div class="ff_wrap ml100 text">${employ.ecpname}</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>전화번호</strong></div>
							<div class="ff_wrap ml100 text">${employ.ectel}</div>
						</div>
						<%-- 2022.08.12 주석처리
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>팩스번호</strong></div>
							<div class="ff_wrap ml100 text">${employ.ecfax}</div>
						</div> --%>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>이메일</strong></div>
							<div class="ff_wrap ml100 text link">
		<!--						<a href="mailto:ddc8300@naver.com">${employ.ecemail}</a>-->
								${employ.ecemail}
							</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>홈페이지</strong></div>
							<div class="ff_wrap ml100 text link">
								<a href="http://${employ.echome}" target="_blank">http://${employ.echome}</a>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>주소</strong></div>
							<div class="ff_wrap ml100 text">${employ.ecpost}<br />${employ.ecaddress}</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>모집분야</strong></div>
							<div class="ff_wrap ml100 text">
							<c:set var="txt1" value="기타("/>
							<c:set var="txt2" value=")"/>
							<c:set var="txt" value="${txt1 }${employ.ecparttext }${txt2 }"/>
							${fn:replace(employ.ecpart,'기타',txt) }
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>모집인원</strong></div>
							<div class="ff_wrap ml100 text"> ${employ.ecnumber} 명 </div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>모집기한</strong></div>
							<div class="ff_wrap ml100 text"> ${kdaFunc:formatDay(employ.eclimitdate)} </div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>접수방법</strong></div>
							<div class="ff_wrap ml100 text">
							<c:choose>
								<c:when test="${ fn:contains( employ.ecrtype, '기타') }">${employ.ecrtype}(${employ.ecrtypetext })</c:when>
								<c:otherwise>${employ.ecrtype}</c:otherwise>
							</c:choose>
							</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>작성일자</strong></div>
							<div class="ff_wrap ml100 text"> ${kdaFunc:formatDay(employ.edate)} </div>
						</div>
					</div>
				</div>
				<div class="box t3 bgs mt10 p15 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">자격요건</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>경력</strong></div>
							<div class="ff_wrap ml100 text">${employ.erhistory}</div>
						</div>
						<%-- 2022.08.12 주석처리
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>혼인여부</strong></div>
							<div class="ff_wrap ml100 text">${employ.ermarry}</div>
						</div> --%>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>성별</strong></div>
							<div class="ff_wrap ml100 text">${employ.ersex}</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>식수인원</strong></div>
							<div class="ff_wrap ml100 text">${employ.erfamily} 명</div>
						</div>
					</div>
				</div>
				<div class="box t3 bgs mt10 p15 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">근무요건</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>근무시간</strong></div>
							<div class="ff_wrap ml100 text">${employ.ettime}</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>특이사항</strong></div>
							<div class="ff_wrap ml100 text">
								${employ.ettimecontents}
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>급여</strong></div>
							<div class="ff_wrap ml100 text">
								연 <fmt:formatNumber value="${employ.etprice}" type="number"/> 만원
							</div>
						</div>
						<div class="f_field div2">
							<div class="ff_title i_b"><strong>근무지역</strong></div>
							<div class="ff_wrap ml100 text">${employ.etlocation}</div>
						</div>
					</div>
					
					<div class="f_wrap line bb p8 mh">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>업무내용</strong></div>
							<div class="ff_wrap ml100 text">
								${employ.etcontents}
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8 mh">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>복리후생</strong></div>
							<div class="ff_wrap ml100 text">
								<c:choose>
									<c:when test="${ fn:contains( employ.etwel, '기타') }">${employ.etwel}[${employ.etweltext}]</c:when>
									<c:otherwise>${employ.etwel}</c:otherwise>
								</c:choose>
							
							</div>
						</div>
					</div>
				</div>
				
				<div class="box t3 bgs mt10 p15 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6">입사절차 및 제출서류</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>입사절차</strong></div>
							<div class="ff_wrap ml100 text">
								<c:set var="process" value="${fn:split(employ.epprocess,',')}" />
								<ul class="area">
									<li class="fl mr30"><strong class="ib fl w30">1차</strong><span class="fl">( ${process[0]} )</span></li>
									<li class="fl mr30"><strong class="ib fl w30">2차</strong><span class="fl">( ${process[1]} )</span></li>
									<li class="fl mr30"><strong class="ib fl w30">3차</strong><span class="fl">( ${process[2]})</span></li>
									<li class="fl mr30"><strong class="ib fl w30">기타</strong><span class="fl">( ${process[3]} )</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>제출서류</strong></div>
							<div class="ff_wrap ml100 text">
								<c:choose>
									<c:when test="${ fn:contains( employ.eppaper, '기타') }">${employ.eppaper}(${employ.eppapertext})</c:when>
									<c:otherwise>${employ.eppaper}</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					
					
					<div class="f_wrap line bb p8 mh">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>합격통보</strong></div>
							<div class="ff_wrap ml100 text">
								${employ.epreport}
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8 mh">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>기타</strong></div>
							<div class="ff_wrap ml100 text">${employ.epetc}</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>첨부파일</strong></div>
							<div class="ff_wrap ml100 text link">
								<span class="i_file pdf mr10"></span>
								<a href="./kn_careers_download.do?idx=${employ.eindex}" target="_blank">${employ.bbs_file_name}<a/>
								
							</div>
						</div>
					</div>
				</div>
				
				
				
							
							
							
							
							
					
						
				<c:if test="${sessionScope.login == 'Y'}">
				<script>
				function f_WriteComments() {
					if( $("#cContents").val() == "" ) {
						alert("의견 쓰기를 입력하여 주십시요");
						 $("#cContents").focus();
						return;
					}
					document.frmCmt.submit();
				}
				
				function doDeleteComments(cIndex) {
					if( confirm("정말 삭제하시겠습니까?") ) {
						$("#crud").val("D");
						$("#cIndex").val(cIndex);
						document.frmCmt.submit();
					}
					
					
				}
				</script>
				<div class="line bb bw2 text small">
					<div class="p10 pl15 pr15">
						<label for="textarea1" class="bold cm"><h4>의견쓰기</h4></label>
						
						<div class="area pr mt10">
							<form name="frmCmt" method="post" action="kn_careers_cmt_action.do">
							<input type="hidden" id="crud" name="crud" value="C">
							<input type="hidden" id="cEmIndex" name="cEmIndex" value="${param.idx}">
							<input type="hidden" id="cIndex" name="cIndex" >
							<input type="hidden" name="rnum" value="${param.rnum}">
							<div class="mr95">
								<textarea id="cContents" name="cContents" class="textarea t1 text ssmall"></textarea>
							</div>
							</form>
							<button class="pa r0 t0 btn comment" onclick="javascript:f_WriteComments();" >등록</button>
						</div>
						
						<div class="mt5 ssmall ca">(100자 이내로 작성해주세요.)</div>
					</div>
					<c:if test="${not empty  cmtList }">
					<div class="line bt">
						<ul>
							<c:forEach items="${cmtList}" var="cmt">
							<li>
								<div class="pr p15 line dot bb">
									<strong class="pa l15 t15 bold">${cmt.cName}</strong>
									<span class="ml100 mr90 ssmall ca">${cmt.cContents}</span>
									<span class="pa r15 t15">
									${kdaFunc:formatDay(cmt.cDate)}
									<c:if test="${ isAdmin or sessionScope.userid == cmt.cUser_Id   }">
									<a href="javascript:doDeleteComments(${cmt.cIndex})">[삭제]</a>
									</c:if>
									</span>								
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					</c:if>
				</div>
				</c:if>
		
				<div class="line bt mt40 text small">
					<h4 class="ti">편의버튼</h4>
					<ul>
					<c:forEach items="${naviList}" var="navi">
						<li>
							<div class="pr p15 line bb">
								<strong class="pa l15 t15 bold cm">
									<c:if test="${navi.dir == 1  }">이전글</c:if>
									<c:if test="${navi.dir == 2  }">다음글</c:if>
								</strong>
								<span class="link ml100 mr90">
									<a href="kn_careers_view.do?idx=${navi.eIndex}&rnum=${navi.rnum}"><b>${navi.eCName }</b></a>
								</span>
								<span class="pa r15 t15">${navi.eCLimitDate}</span>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
		
				
				<div class="btn_wrap mt20">
					<ul class="fl">
						<li><a href="./kn_careers.do?page=${param.curPage}&searchKind=${param.searchKind}&searchWord=${param.searchWord}" class="btn big t0">목록</a></li>
					</ul>
					<ul class="fr">
						<li><a href="javascript:showPopup()" class="btn big t4">수정/삭제</a></li>
						<!-- <li><a href="/kda/views/layout.html?m=kda-news&f=kn_careers_write" class="btn big t1">글쓰기</a></li> -->
					</ul>
				</div>
					
		
				<div id="popup_pwd" class="p_style"	style="width: 600px; height: 270px">
					<div id="popup">
						<div class="p_head" style="width: 570px;">
							<h2 class="title t3 cw bold s1 i_b_t6">비밀번호 확인</h2>
						</div>
						<div class="p_body text ca small center">
							<div class="p30">
								<form name="frmPwd" method="post" action="kn_careers_form.do" >
								<input type="hidden" name="eIndex" value="${param.idx}" /> 
								<div class="area">비밀번호를 입력하여 주십시요.</div>
								<div class="area mt20">
									<input type="password" class="input t1 w200" id="pwd" name="pwd"  onKeyPress="if(event.keyCode==13){ f_pwdSubmit()}"/> 
									<a href="javascript:f_pwdSubmit();" class="btn form p5 t1">확인</a> 
								</div>
								</form>
							</div>
						</div>
						<div class="p_foot line bt">
							<div class="btn_wrap mt20">
								<ul>
									<li><a href="#" class="bClose">닫기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>   
			
				</div>
				<!-- // 본문 끝 -->
			</c:otherwise>
    	</c:choose>
	</div>
</div>


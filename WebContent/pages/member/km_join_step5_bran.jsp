<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.MEMBER_JOIN"%>
<%@ page import="kda.utils.ParamUtils"%> 

<%
	MEMBER_JOIN member_join = (MEMBER_JOIN) session.getAttribute(SessionInfo.MEMBER_JOIN);
%>
<script type="text/javascript">

	$(document).ready(function() 
	{		
		loadGroupCode();
	});
	
	function loadGroupCode()
	{
		// --007 : 지회		
		var param = "groupCode=007"; // 지회
		$.ajax ( {
            type		: "POST"
			, url		: "/common_groupcode_option.do"
			, dataType  : "text"
			, data		: param
			, cache		: false
			, success	: handleLoadGroupCode007							
		});
	}
	
	function handleLoadGroupCode007(data)
	{
		data = "<option value=''>지회선택</option>" + data
		$("#code_bran").html(data);
	}
	
	
	function check()
	{
		if ( $("#code_bran").val() == "" )
		{
			alert("지회를 선택해 주세요.");
			$("#code_bran").focus();
			return false;
		}			
		return true;
	}
	
	function doPrev() {
		document.location.href = "/member/km_join_step4.do";
	}

	function doNext() {
		if ( check() ) {
			$("#btn_zone").hide();
			var f = document.forms["join"];
			f.action = "/member_join_insert.do";			
			f.submit();		
		}
	}		
</script>

<form name="join" method="post">
<input text="hidden" name="code_pay_flag" id="code_pay_flag" value="<%=ParamUtils.getParameter(request, "code_pay_flag")%>">
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">신규</mark>회원가입</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/member/km_join.do">회원가입</a></li>
				<li><a href="/member/km_join.do" class="cm">신규회원 가입</a></li>
			</ul>
		</div>
		</div>
				<hr />
		<div class="sp_body">
			<div class="area">
			<h4 class="title bold t2 cm s1 i_b_t2">회원가입 절차</h4><span class="ib mt10 ml10 text small ca">회원가입은 다음과 같은 순서에 따라 진행됩니다.</span>
		</div>
			<ol class="step_join mt20">
				<li class="start"><span class="icon step1"></span><span class="txt">실명확인</span></li>
				<li><span class="icon step2"></span><span class="txt">회원종류 선택</span></li>
				<li><span class="icon step3"></span><span class="txt">회원정보 입력</span></li>
				<li class="on"><span class="icon step4"></span><span class="txt"><strong>입금 및 확인</strong></span></li>
				<li><span class="icon step5"></span><span class="txt">가입완료</span></li>
			</ol>
			<div class="box t2 bgs mt40 p20 text">
			<div class="area">
				<h5 class="title i_b_t6 bold s1"><mark class="cm">입금</mark> 및 확인</h5>
				<div class="box t1 r5 mt10 p20 left ssmall">
					<div class="area">
						<span class="mt5">귀하의 근무지역을 선택해주세요. (미취업의 경우는 자택지역을 선택)</span>
						<label for="inputid1" class="ti">지회선택</label>
						<select class="select t2 fr w150 ml5" id="code_bran" name="code_bran">
						</select>
					</div>
				</div>
				<div class="box t1 r5 mt10 p10">
					<h6 class="title s1 i_b_t3"><mark class="bold">회비</mark></h6>
					<table class="table t2 text ssmall ca center mt10">
						<colgroup>
							<col width="80">
							<col width="*">
							<col width="250">
							<col width="250">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" colspan="2" class="bold cm">구분</th>
								<th scope="col" class="bold cm">기존회원</th>
								<th scope="col" class="bold cm">신규회원</th>
							</tr>
						</thead>
							<tbody>
								<tr>
									<td scope="row" rowspan="4">정회원</td>
									<td>취업회원</td>
									<td>월 12,000 * 12회 (연 144,000)</td>
									<td>월 12,500 * 12회 (연 150,000)</td>
								</tr>
								<tr>
									<td>미취업회원</td>
									<td>월 10,000 * 12회 (연 120,000)</td>
									<td>월 10,500 * 12회 (연 126,000)</td>
								</tr>
								<tr>
									<td>학생회원</td>
									<td>20,000</td>
									<td>20,000</td>
								</tr>
								<tr>
									<td>특별회원</td>
									<td>월 12,000 * 12회 (연 144,000)</td>
									<td>월 12,500 * 12회 (연 150,000)</td>
								</tr>
								<tr>
									<td scope="row" rowspan="2">평생회원</td>
									<td>정회원</td>
									<td>2,160,000</td>
									<td>2,250,000</td>
								</tr>
								<tr>
									<td>특별회원</td>
									<td>2,160,000</td>
									<td>2,250,000</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="box t1 r5 mt10 p10">
						<h6 class="title s1 i_b_t3"><mark class="bold">소속시도영양사회</mark></h6>
						<table class="table t2 text ssmall ca center mt10">
							<colgroup>
								<col width="100">
								<col width="100">
								<col width="170">
								<col width="150">
								<col width="*">
							</colgroup>
							<thead>
							<tr>
								<th scope="col" class="bold cm">지역</th>
								<th scope="col" class="bold cm">은행명</th>
								<th scope="col" class="bold cm">계좌번호</th>
								<th scope="col" class="bold cm">예금주명</th>
								<th scope="col" class="bold cm">전화번호/FAX</th>
							</tr>
							</thead>
							<tbody>
						<tr>
							<td scope="row">서울</td>
							<td>신한은행</td>
							<td>140-012-521054</td>
							<td>대한영양사협회 </td>
							<td>TEL : 02)3289-7200<br />FAX : 02)3289-7201</td>
						</tr>
						<tr>
							<td scope="row">부산</td>
							<td>부산은행</td>
							<td>022-13-000008-9</td>
							<td>대한영양사협회 </td>
							<td>TEL : 051)634-7640<br />FAX : 051)631-6136</td>
						</tr>
						<tr>
							<td scope="row">인천</td>
							<td>수협</td>
							<td>163-61-005928</td>
							<td>대한영양사협회 </td>
							<td>TEL : 032)435-5990<br />FAX : 032)432-5199</td>
						</tr>
						<tr>
							<td scope="row">경기</td>
							<td>신한은행</td>
							<td>100-023-367042</td>
							<td>대한영양사협회 </td>
							<td>TEL : 031)468-9417<br />FAX : 031)448-9890</td>
						</tr>
						<tr>
							<td scope="row">강원</td>
							<td>농협</td>
							<td>203-01-225733</td>
							<td>대한영양사협회 </td>
							<td>TEL : 033)251-7576<br />FAX : 033)251-7579</td>
						</tr>
						<tr>
							<td scope="row">충북</td>
							<td>농협</td>
							<td>304-17-000096</td>
							<td>대한영양사협회 </td>
							<td>TEL : 043)268-4798<br />FAX : 043)266-0166</td>
						</tr>
						<tr>
							<td scope="row">대전/충남/세종</td>
							<td>농협</td>
							<td>407-01-100377</td>
							<td>대한영양사협회 </td>
							<td>TEL : 042)252-4346<br />FAX : 042)252-9110</td>
						</tr>
						<tr>
							<td scope="row">전북</td>
							<td>농협</td>
							<td>301-0011-9700-11</td>
							<td>대한영양사협회 </td>
							<td>TEL : 063)272-0175<br />FAX : 063)255-1811</td>
						</tr>
						<tr>
							<td scope="row">광주전남</td>
							<td>신한은행</td>
							<td>100-024-993030</td>
							<td>대한영양사협회 </td>
							<td>TEL : 062)364-6773<br />FAX : 062)364-6772</td>
						</tr>
						<tr>
							<td scope="row">대구경북</td>
							<td>대구은행</td>
							<td>090-05-000936-4</td>
							<td>대한영양사협회 </td>
							<td>TEL : 053)563-6066<br />FAX : 053)563-6466</td>
						</tr>
						<tr>
							<td scope="row">경남</td>
							<td>경남은행</td>
							<td>578-07-0022469</td>
							<td>대한영양사협회 </td>
							<td>TEL : 055)268-6846<br />FAX : 055)268-6847</td>
						</tr>
						<tr>
							<td scope="row">울산</td>
							<td>경남은행</td>
							<td>531-35-0003039</td>
							<td>대한영양사협회 </td>
							<td>TEL : 052)258-6069<br />FAX : 052)275-2823</td>
						</tr>
						<tr>
							<td scope="row">제주</td>
							<td>농협</td>
							<td>957-01-104080 </td>
							<td>대한영양사협회 </td>
							<td>TEL : 064)721-9062<br />FAX : 064)721-9062</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="btn_wrap mt30" id="btn_zone">
			<ul>
				<li><a href="javascript:doPrev();" class="btn big t2">이전</a></li>
				<li><a href="javascript:doNext();" class="btn big t1">다음</a></li>
			</ul>
		</div>
	</div>
</div>
</form>
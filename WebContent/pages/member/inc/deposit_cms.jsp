<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.member.data.MEMBER_JOIN"%>
<%
	MEMBER_JOIN member_join = null;
	
	Object obj = session.getAttribute(SessionInfo.MEMBER_JOIN);
	if( obj != null ) {
		member_join = (MEMBER_JOIN)obj;
	} else {
		member_join = (MEMBER_JOIN)request.getAttribute("memberJoin");
	}
	
	String code_member      = member_join.getCode_member();	    //회원구분코드
	String pers_name		= member_join.getPers_name();        
	String 	code_bran		= member_join.getCode_bran();        
	String 	lic_no			= member_join.getLic_no();           
	String 	pers_tel		= member_join.getPers_tel();         
	String 	pers_hp			= member_join.getPers_hp();          
	String	company_name	= member_join.getCompany_name();     
	String 	email			= member_join.getEmail();            
	String 	pers_add		= member_join.getPers_add();	     
	String 	CMS_bank 		= member_join.getCMS_bank();         
	String 	CMS_acount		= member_join.getCMS_acount();       
	String 	CMS_name		= member_join.getCMS_name();         
	String 	CMS_birth		= member_join.getCMS_birth();        
	String 	CMS_pers_tel	= member_join.getCMS_pers_tel();     
	String 	CMS_pers_hp		= member_join.getCMS_pers_hp();
%>

<script>
$(document).ready(function() {
	$.ajax ( {
           type		: "POST"
		, url		: "/common_groupcode_option.do"
		, dataType  : "text"
		, data		: "groupCode=007"		// 위탁업체
		, cache		: false
		, success	: handleLoadGroupCode007
	});
});

function handleLoadGroupCode007(data) {		
	data = "<option value='0'>지회선택</option>" + data
	$("#code_bran").html(data);
}
	
function check() {
	var f = document.forms["join"];
	
	// 신청인명		
	if(document.join.depositor_relation.value == "")  {
        alert("예금주와의 관계를 선택하여 주십시요.");
        f.depositor_relation.focus();	        
        return false;
    }
	
	
	// 신청인 소속지부
    if(document.join.code_bran.value == "0" || document.join.code_bran.value == "") {
        alert("신청인 소속지부를 선택하세요.");
        f.code_bran.focus();	   
        return false;
    }
	
    <% if (  !( code_member.equals("07") || code_member.equals("82")|| code_member.equals("88") || code_member.equals("92") ) )  { %>
	// 신청인 영양사 면허번호
	if(document.join.lic_no.value == "") {
        alert("신청인 영양사 면허번호를 입력하세요.");
        f.lic_no.focus();	   
        return false;
    }
	<% } %>
	
	// 신청인 연락처
	if(document.join.pers_tel.value == "") {
        alert("신청인 연락처를 입력하세요.");
        f.pers_tel.focus();	   
        return false;
    }
	
	// 신청인 휴대번호
	if(document.join.pers_hp.value == "") {
        alert("신청인 휴대번호를 입력하세요.");
        f.pers_hp.focus();	   
        return false;
    }
	
	
	// 신청인 이메일
	if(document.join.email.value == ""){
        alert("신청인 이메일을 입력하세요.");
        f.email.focus();	   
        return false;
    }
	
	// 신청인 주소
	if(document.join.pers_add.value == "") {
        alert("신청인 주소를 입력하세요.");
        f.pers_add.focus();	   
        return false;
    }
	
	var CMS_dues  = $(':input[name=CMS_dues]:radio:checked').val();
	var CMS_auth_start = $(':input[name=CMS_auth_start]:radio:checked').val();
	var CMS_auth_end = $(':input[name=CMS_auth_end]:radio:checked').val();
	
      if( CMS_dues == null && CMS_auth_start == null  && CMS_auth_end == null)
      {
         alert("월 납부금액을 선택하세요.");
         return false;
      }

	// 납부일	
	var CMS_date = $(':input[name=CMS_date]:radio:checked').val();

	if( CMS_date == null) {
         alert("납부일을 선택하세요.");
         return false;
	}
	
	// 출금계좌 금융기관명	
	if(document.join.CMS_bank.value == ""){
		alert("출금계좌 금융기관명  입력하세요.");
        f.CMS_bank.focus();	   
        return false;
    }
	
	// 츨금계좌번호
	if(document.join.CMS_acount.value == "") {
        alert("출금계좌번호를  입력하세요.");
        f.CMS_acount.focus();	   
        return false;
    }
	
	// 출금계좌 에금주명
	if(document.join.CMS_name.value == ""){
        alert("출금계좌 예금주명을  입력하세요.");
        f.CMS_name.focus();	   
        return false;
    }
	
	// 예금주 생년월일
	if(document.join.CMS_birth.value == "") {
        alert("출금계좌 생년월일을  입력하세요.");
        f.CMS_birth.focus();	   
        return false;
    }
	
	// 예금주 연락처
	if(document.join.CMS_pers_tel.value == "") {
        alert("예금주 연락처를  입력하세요.");
        f.CMS_pers_tel.focus();	   
        return false;
    }
	
	
	// 예금주 휴대전화
	if(document.join.CMS_pers_hp.value == "") {
        alert("예금주 휴대전화를  입력하세요.");
        f.CMS_pers_hp.focus();	   
        return false;
    }
	
	return true;
}

// 기존회원/신규회원 납부금액 체크시 다른쪽 체크 방지
function amtCheck(gubun) {

	//기존회원 체크시
	if ( gubun == 'old' ) {
		$("input:radio[name='CMS_auth_start']").removeAttr("checked");
		$("input:radio[name='CMS_auth_end']").removeAttr("checked");
			
	//신규회원 체크시
	} else if ( gubun == 'new' ) {
		$("input:radio[name='CMS_dues']").removeAttr("checked");
	}
	
}
</script>

		<div class="box t1 r5 mt10 p20 center ssmall">
			<p class="left">
				아래 온라인신청서 작성한 후, CMS 신청서 다운로드를 클릭/출력하여 신청서를 작성/서명하고,<br />
				시도영양사회로 FAX 송부하셔야 합니다.
			</p>
			<a href="/assets/ver2/member/docu/21_CMS출금이체신청서.pdf" target="_blank" class="btn t3 middle wide mt10">CMS 신청서 다운로드</a>
		</div>
		<div class="box t1 r5 mt10 p10">
			<h6 class="title s1 i_b_t3"><mark class="bold">수납기관 및 요금종류</mark> <span class="ssmall">(수납업체 기재란)</span></h6>
			<div class="form mt10 line bt bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>수납기관명</strong></div>
						<div class="ff_wrap ml150">
							<div class="area text">
								<mark class="bold cm">(사)대한영양사협회</mark>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>사업자등록번호</strong></div>
						<div class="ff_wrap ml150">
							<div class="area text">
								118-82-00627
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>대표자</strong></div>
						<div class="ff_wrap ml150">
							<div class="area text">
								<mark class="bold">이영은</mark>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>수납 요금 종류</strong></div>
						<div class="ff_wrap ml150">
							<div class="area text">
								회비
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>사업자주소</strong></div>
						<div class="ff_wrap ml150">
							<div class="area text">
								서울특별시 영등포구 63로 40, 202호(여의도동)
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="box t1 r5 mt10 p10">
			<h6 class="title s1 i_b_t3"><mark class="bold">출금이체 신청내용</mark> <span class="ssmall">(신청고객 기재란)</span></h6>
			<div class="form mt10 line bt bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="pers_name" class="ff_title i_b"><strong>신청인명</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="pers_name" name="pers_name" value="<%=pers_name%>" />
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="depositor_relation" class="ff_title i_b"><strong>예금주와의 관계</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<select  class="select t2" id="depositor_relation" name="depositor_relation">
									<option value="">선택</option> 
									<option value="본인">본인</option>
									<option value="배우자">배우자</option>
									<option value="부모">부모</option>
									<option value="자녀">자녀</option>
									<option value="조부모">조부모</option>
									<option value="손자">손자</option>
									<option value="형제">형제</option>
									<option value="친구">친구</option>
									<option value="동료">동료</option>
									<option value="친척">친척</option>
									<option value="대표자">대표자</option>
									<option value="기타">기타</option>
									<option value="기업담당자">기업담당자</option>	
								</select>
								
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="code_bran" class="ff_title i_b"><strong>신청인  소속지부</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<select class="select t2" id="code_bran" name="code_bran" value="<%=code_bran%>"></select>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="lic_no" class="ff_title i_b"><strong>신청인 영양사면허번호</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="lic_no" name="lic_no" value="<%=lic_no%>" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="pers_tel" class="ff_title i_b"><strong>신청인 연락처</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="pers_tel" name="pers_tel" value="<%=pers_tel %>"/>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="pers_hp" class="ff_title i_b"><strong>신청인 휴대번호</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="pers_hp" name="pers_hp" value="<%=pers_hp %>" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="company_name" class="ff_title i_b"><strong>신청인 근무처명</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="company_name" name="company_name" value="<%=company_name %>" />
								<p class="text cp s1">* 미취업회원은 미기재</p>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="email" class="ff_title i_b"><strong>신청인 이메일</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="email" name="email" value="<%=email%>"/>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="pers_add" class="ff_title i_b"><strong>신청인 주소</strong></label>
						<div class="ff_wrap ml150 text">
							<div class="area">
								<input type="text" class="input t1" id="pers_add" name="pers_add" value="<%=pers_add%>"/>
								<p class="text cp s1">* 취업회원은 근무처주소 / 미취업회원은 자택주소</p>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>월 납부금액</strong></div>
						<div class="ff_wrap ml150 text">
							<ul>
								<li>
									<div class="area">
										<label for="CMS_dues" class="fl w130 bold cm">기존회원</label>
										<input type="radio" class="mr5" id="CMS_dues" name="CMS_dues" value="12000" onclick="javascript:amtCheck('old');"/>
										<label for="radio1_1" class="mr20"onclick="javascript:amtCheck('old')">12,000원 (취업회원)</label>
										<input type="radio" class="mr5" id="CMS_dues" name="CMS_dues" value="10000" onclick="javascript:amtCheck('old');"/>
										<label for="CMS_dues" class="mr20" >10,000원 (미취업회원)</label>
									</div>
								</li>
								<li class="mt5">
									<div class="area">
										<label for="CMS_auth_start" class="fl w130 bold cm">신규회원 (최초 1년)</label>
										<input type="radio" class="mr5" name="CMS_auth_start" id="CMS_auth_start" value="12500" onclick="javascript:amtCheck('new');"/>
										<label for="radio1_3" class="mr20">12,500원 (취업회원)</label>
										<input type="radio" class="mr5" name="CMS_auth_start" id="CMS_auth_start" value="10500" onclick="javascript:amtCheck('new');"/>
										<label for="CMS_auth_start" class="mr20">10,500원 (미취업회원)</label>
									</div>
								</li>
								<li class="mt5">
									<div class="area">
										<label for="CMS_auth_end" class="fl w130 bold cm">신규회원 (1년 이후)</label>
										<input type="radio" class="mr5" name="CMS_auth_end" id="CMS_auth_end" value="12000" onclick="javascript:amtCheck('new');"/>
										<label for="radio1_5" class="mr20">12,000원 (취업회원)</label>												
										<input type="radio" class="mr5" name="CMS_auth_end" id="CMS_auth_end" value="10000" onclick="javascript:amtCheck('new');"/>
										<label for="CMS_auth_end" class="mr20">10,000원 (미취업회원)</label>
									</div>
								</li>
							</ul>
							<p class="text cp s1">* 신규회원은 최초1년간의 금액과 1년이후의 금액 2개를 모두 체크</p>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>출금개시일</strong></div>
						<div class="ff_wrap ml150 text">
							<ul>
								<li>
									<div class="area">
										<label for="inputid9" class="fl w130 bold cm">기존회원</label>
										<span class="fl">회원만료 익월 납부일부터</span>
									</div>
								</li>
								<li class="mt5">
									<div class="area">
										<label for="inputid12" class="fl w130 bold cm">신규회원</label>
										<span class="fl">CMS신청 당월 납부일부터</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>납부일</strong></div>
						<div class="ff_wrap ml150 text">
							<div class="area">
								<input type="radio" class="mr5" id="CMS_date" name="CMS_date" value="17" />
								<label for="CMS_date" class="mr20">매월 17일</label>
								<input type="radio" class="mr5" id="CMS_date" name="CMS_date" value="25" />
								<label for="CMS_date" class="mr20">매월 25일</label>
							</div>
							<p class="text cp s1">* 휴일시 금융기관 익영업일에 출금 / 미납시 다음달 10일, 다음달 납부일에 재출금</p>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="CMS_bank" class="ff_title i_b"><strong>출금계좌 금융기관명</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_bank" name="CMS_bank" value="<%=CMS_bank%>" />
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="CMS_acount" class="ff_title i_b"><strong>출금계좌번호</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_acount" name="CMS_acount" value="<%=CMS_acount%>" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="CMS_name" class="ff_title i_b"><strong>출금계좌 예금주명</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_name"  name="CMS_name" value="<%=CMS_name%>"/>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="CMS_birth" class="ff_title i_b"><strong>예금주 생년월일</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_birth" name="CMS_birth" value="<%=CMS_birth%>"/>
							</div>
						</div>
						<div class="ff_wrap ml15">
							<div class="area">
								<p class="text cp s1">* 주민등록상의 생년월일 / 사업자는 등록번호</p>
							</div>
						</div> 
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<label for="CMS_pers_tel" class="ff_title i_b"><strong>예금주 연락처</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_pers_tel" name="CMS_pers_tel" value="<%=CMS_pers_tel%>"/>
							</div>
						</div>
					</div>
					<div class="f_field div2">
						<label for="CMS_pers_hp" class="ff_title i_b"><strong>예금주 휴대전화</strong></label>
						<div class="ff_wrap ml150">
							<div class="area">
								<input type="text" class="input t1" id="CMS_pers_hp" name="CMS_pers_hp" value="<%=CMS_pers_hp%>"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="box t2 bgs mt20 p20 text">
	<div class="area">
		<h5 class="title i_b_t6 bold s1"><mark class="cm">개인정보</mark> 수집 및 이용 동의</h5>
		<div class="box t1 r5 mt10 p10">
			<div class="area text  ssmall left">
				- 수집 및 이용목적 : CMS 출금이체를 통한 요금수납<br />
				- 수집항목 : 성명, 전화번호, 휴대폰번호, 이메일, 근무처명, 주소, 소속지부, 영양사면허번호<br />
				<span class="w65"></span> 금융기관명, 계좌번호, 예금주명, 예금주 생년월일, 예금주 연락처 및 휴대전화번호<br />
				- 보유 및 이용기간 : 수집, 이용 동의일로부터 CMS 출금이체 종료일(해지일) 후 5년까지<br />
				- 신청자는 개인정보 수집 및 이용을 거부할 권리가 있으며, 권리행사시 출금이체 신청이 거부될 수 있습니다.
			</div>
			<div class="line bt dot mt10 p8 pb0 text ssmall left">
				<input type="radio" class="mr5" name="CMS_agree_YN" id="CMS_agree_YN" value="Y" />
				<label for="CMS_agree_YN" class="mr20">동의함</label>						
				<input type="radio" class="mr5" name="CMS_agree_YN" id="CMS_agree_YN"  value="N" />
				<label for="CMS_agree_YN">동의안함</label>
			</div>
		</div>
	</div>
</div>
<div class="box t2 bgs mt20 p20 text">
	<div class="area">
		<h5 class="title i_b_t6 bold s1"><mark class="cm">개인정보</mark> 제3자 제공 동의</h5>
		<div class="box t1 r5 mt10 p10">
			<div class="area text ssmall left">
				- 개인정보를 제공받는 자 : 사단법인 금융결제원, 금융기관<br />
				- 개인정보를 제공받는 자의 개인정보 이용 목적<br />
				<span class="w10"></span>: CMS 출금이체 서비스 제공 및 출금동의 확인, 출금이체 신규등록 및 해지 사실 통지<br />
				- 제공하는 개인정보의 항목<br />
				<span class="w10"></span>: 성명, 금융기관명, 계좌번호, 생년월일, 전화번호, (은행 등 금융회사 및 이용기관 보유)휴대폰번호<br />
				- 개인정보를 제공받는 자의 개인정보 보유 및 이용기간<br />
				<span class="w10"></span>: CMS 출금이체 서비스 제공 및 출금동의 확인 목적을 달성할 때까지<br />
				- 신청자는 개인정보에 대해 금융결제원에 제공하는 것을 거부할 권리가 있으며,<br />
				<span class="w10"></span>거부시 출금이체 신청이 거부될 수 있습니다.
			</div>
			<div class="line bt dot mt10 p8 pb0 text ssmall left">
				<input type="radio" class="mr5" name="CMS_agree_other_yn" id="CMS_agree_other_yn" value="Y" />
				<label for="CMS_agree_other_yn" class="mr20">동의함</label>
				<input type="radio" class="mr5" name="CMS_agree_other_yn" id="CMS_agree_other_yn" value="N" />
				<label for="CMS_agree_other_yn">동의안함</label>
			</div>
		</div>
	</div>
</div>
<div class="box t2 bgs mt20 p20 text">
	<div class="area">
		<h5 class="title i_b_t6 bold s1"><mark class="cm">출금이체</mark> 동의여부 및 해지사실 통지 안내</h5>
		<div class="box t1 r5 mt10 p10">
			<div class="area text ssmall left">
				은행 등 금융회사 및 금융결제원은 CMS 제도의 안정적 운영을 위하여 고객의 (은행 등 금융회사 및 이용기관 보유) 연락처 정보를 활용하여 문자메세지, 유선 등으로 고객의 출금이체 동의여부 및 해지사실을 통지할 수 있습니다.
			</div>
		</div>
	</div>
</div>
<div class="mt20 area text bold s1 center">
	상기 신청정보, 금융거래정보의 제공 및 개인정보의 수집 및 이용, 제3자 제공에 동의하며 CMS 출금이체를 신청합니다.
</div>
<div class="mt20 area text bold s1 center">
	<input type="text" class="input t3 w80" id="inputid16" /><label for="inputid16" class="ml5 mr20">년</label>
	<input type="text" class="input t3 w40" id="inputid17" /><label for="inputid17" class="ml5 mr20">월</label>
	<input type="text" class="input t3 w40" id="inputid18" /><label for="inputid18" class="ml5">일</label>
</div>
<div class="mt30 area text">
	<ul class="fr">
		<li>
			<div class="area">
				<span class="fl w200">&nbsp;</span>
				<label for="inputid19" class="fl w70 bold cm">신청인 :</label>
				<input type="text" class="input t3 fl w120" id="inputid19" />
				<span class="fl w90 ca ml5">인 또는 서명</span>
			</div>
		</li>
		<li class="mt5">
			<div class="area">
				<span class="fl w200 ca small">(신청인과 예금주가 다를 경우)</span>
				<label for="inputid20" class="fl w70 bold cm">예금주 :</label>
				<input type="text" class="input t3 fl w120" id="inputid20" />
				<span class="fl w90 ca ml5">인 또는 서명</span>
			</div>
		</li>
	</ul>
</div>

<div class="mt30 area text ssmall ca">
	<ul>
		<li>1. 인감 또는 서명은 해당 예금계좌 사용인감 또는 서명을 날인하여야 합니다.</li>
		<li>2. 기존 신청내용을 변경하고자 하는 경우에는 먼저 해지신청을 하고 신규 작성을 하여야 합니다.</li>
		<li>3. 주계약자와 예금주가 다른 경우 반드시 예금주의 별도 서명을 받아야 합니다.</li>
	</ul>
</div>
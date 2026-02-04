<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.SessionInfo" %>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../common.jsp" %>
<%	
	Calendar cal = java.util.Calendar.getInstance();
	
	int Price = 0 ;
	int totalPrice = 0;
%>

<script type="text/javascript">
	
	function check_common() {
		var result = true;
		try {
			// ====== 주문자정보
			if($("#bf_name").val().trim() == "") { 
				alert("주문자정보의 이름을 입력하세요."); 
				$("#bf_name").focus(); 
				return false;
			}
			
			if($("#pers_birth").val().trim() == "" || $("#pers_birth").val().trim().length != 8 ) {
                alert("주문자정보의 생년월일(8자리)을 입력하세요."); 
                $("#pers_birth").focus(); 
                return false;
            }
			
			//필수값 제외 주석처리
			/* if($("#bf_tel").val() == "") {
				alert("주문자정보의 전화번호를 입력하세요."); 
				$("#bf_tel").focus(); 
				return false;
			} */

			if($("#bf_mobile").val() == "")
			{
				alert("주문자정보의 휴대폰번호를 입력하세요."); 
				$("#bf_mobile").focus(); 
				return false;
			}

			if($("#bf_email").val().trim() == "")
			{
				alert("주문자정보의 이메일 정보를 입력하세요."); 
				$("#bf_email").focus(); 
				return false;
			}

			if($("#bf_email2").val().trim() == "")
			{
				alert("주문자정보의 이메일 정보를 입력하세요."); 
				$("#bf_email2").focus(); 
				return false;
			}

			var email = $("#bf_email").val().trim() + "@" + $("#bf_email2").val().trim();
			if ( !isEmail( email ) )
			{
				alert("정확한 이메일을 입력하세요."); 
				$("#bf_email").focus();
				return false;
			}

			// ====== 수령지정보
            
			if($("#bt_name").val().trim() == "")
			{
				alert("수령지정보의 이름을 입력하세요."); 
				$("#bt_name").focus(); 
				return false;
			}
		    
			//필수값 제외 주석처리
			/* if($("#bt_tel").val().trim() == "")
            {
                alert("수령지정보의 전화번호를 입력하세요."); 
                $("#bt_tel").focus(); 
                return false;
            } */

            if($("#bt_mobile").val().trim() == "")
            {
                alert("수령지정보의 휴대폰번호를 입력하세요."); 
                $("#bt_mobile").focus(); 
                return false;
            }   
			
			if($("#bt_address").val().trim() == "")
			{
				alert("수령지정보의 주소를 입력하세요."); 
				$("#bt_address").focus(); 
				return false;
			}
		    
			if($("#bt_address2").val().trim() == "")
			{
				alert("수령지정보의 주소를 입력하세요."); 
				$("#bt_address2").focus(); 
				return false;
			}

					
		} catch (e){
			alert( e ) ;
			result = false;
		}
		return result;
	}

	function check_giro() {
		var result = true;
		if ( $("#bf_paymentname").val().trim() == "" ) {
			alert("송금자를 입력하세요");
			$("#bf_paymentname").focus();
			return false;
		}

		result = check_common();		
		return result;
	}

	function check_card() {
		var result = check_common();
		return result;
	}

	function check_point() {
		var result = false;		
		var myPoint = ${requestScope.point};
		var totalPrice = $("#totalPrice").val(); 

		if(myPoint < 10000) {
			alert("보유 Point가 부족합니다.");
			return false;
		}
	
		if(totalPrice > myPoint) {
			alert("보유 Point가 부족합니다.");
			return false;
		}

		result = check_common();
		return result;
	}

	function doWrite() {
		var f = document.forms["payform"];
		//필요서류 삭제로 주석처리
		/* var bt_paper ="";		
		$(":checkbox[name='bt_paper']:checked").each(function(){
			 bt_paper += ", " + $(this).val();
		});
	    
		if(bt_paper.length > 0 ){
			bt_paper = bt_paper.substring(2, bt_paper.length);
		}
		
		f.bt_paper.value = bt_paper; */
		
		var result = false;
		var pay_gubun = $("input:radio[name='pay_gubun']:checked").val();

		if		( pay_gubun == "GIRO"  ) result = check_giro();
		else if ( pay_gubun == "CARD"  ) result = check_card();
		else if ( pay_gubun == "POINT" ) result = check_point();
	    
		var tMonth = "";
		var tDay = "";
		if(result) {
			tMonth = $("#rMonth").val().trim();
			if ( tMonth.length == 1 ) {
				tMonth = "0" + tMonth;
			}
			tDay = $("#rDay").val().trim();
            if (  tDay.length == 1 ) {
            	tDay = "0" + tDay;
            }
			$("#bf_paymentdate").val($("#rYear").val() +"-"+ tMonth + "-"+ tDay);
			$("#bt_address").val($("#bt_address").val() + ", " + $("#bt_address2").val() );
			$("#bf_email").val($("#bf_email").val() +"@"+ $("#bf_email2").val());
						
			f.action = "/cart_payment.do";
			f.method = "post";
			f.submit();
		}
	}
	
	function doCancel() {
		if (window.confirm("결제를 취소 하시 겠습니까 ?")==true) {
			window.location ='/work/publication/kp_archiveshop.do'
		}
	}
	
	function doComplete() {
		document.forms["payform"].value="list";
		document.forms["payform"].submit();
	}

	function openJusoPopup() {
		var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack( roadFullAddr
						 , roadAddrPart1
						 , addrDetail
						 , roadAddrPart2
						 , engAddr
						 , jibunAddr
						 , zipNo
						 , admCd
						 , rnMgtSn
						 , bdMgtSn)
	{
		document.payform.bt_address.value  = roadAddrPart1 ;		
		document.payform.bt_address2.value = addrDetail + " " + roadAddrPart2;
		document.payform.bt_post.value = zipNo;
	}
	
	function checkemailaddy() {
        if (payform.email_select.value == '') {
        	$("#bf_email2").attr("readonly", false);
        	payform.bf_email2.value = '';
        	payform.bf_email2.focus();
        }
        else {
        	$("#bf_email2").attr("readonly", true);
        	payform.bf_email2.value = payform.email_select.value;
        }
    }
	
	function change_part(part) {
		if (part=="CARD") {
			GiroCard.style.display ='none';
			point.style.display ='none';
		}	
		if (part=="GIRO") {
			GiroCard.style.display ='block';
			point.style.display ='none';
		}
		if (part=="POINT") {
			GiroCard.style.display ='none';
			point.style.display ='block';

		}		
		document.payform.pay_gubun.value = part;
	}

	function ChangeWordNumber(str,word){
		var reStr = "";
		
		if ( str.length > 0 ) {
		
			for (var i=0;i<str.length;i++){
				check_str=str.substring(i,i+1);
				for (var j=0;j<word.length;j++)	{
					check_word=word.substring(j,j+1);
					if (check_str == check_word){
						reStr += check_str;
						break; //안써줘도 되지만, 맞을경우 안쪽 for문을 빠져나와 전단계(for문)으로 이동한다.
					}
				}
			}
		}
		return reStr;
	}

	function phoneNumber(This) {
		var sMsg = This.value ;
		if( sMsg == "" ) return;
		var onlynum = "";
		onlynum = ChangeWordNumber(sMsg,"1234567890");
		
		if (onlynum.substring(0,2) == "02") { // 전화번호가 서울전화번호일때
			switch (onlynum.length) {
				case(2) : This.value = onlynum.substring(0,2);break;
				case(3) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,3);break;
				case(4) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,4);break;
				case(5) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5);break;
				case(6) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6);break;
				case(7) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,3) + "-" + onlynum.substring(3,7);break;
				case(8) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,4) + "-" + onlynum.substring(4,8);break;
				case(9) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,9);break;
				case(10) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10);break;
				default : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,11);break;
			}
			
		} else if (onlynum.substring(0,2) == "01") { // 전화번호가 핸드폰일때 (011,016,017,018,019)
			switch (onlynum.length) {
				case(2) : This.value = onlynum.substring(0,2);break;
				case(3) : This.value = onlynum.substring(0,3);break;
				case(4) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4);break;
				case(5) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5);break;
				case(6) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6);break;
				case(7) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7);break;
				case(8) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) + "-" + onlynum.substring(4,8);break;
				case(9) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) + "-" + onlynum.substring(5,9);break;
				case(10) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10);break;
				default : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11);break;
			}
		} else if (onlynum.substring(0,1) == "0") { // 전화번호가 0을 포함한(지역번호,무료전화080)를 포함한 번호일때
			switch (onlynum.length) {
				case(1) : This.value = onlynum.substring(0,1);break;
				case(2) : This.value = onlynum.substring(0,2);break;
				case(3) : This.value = onlynum.substring(0,3);break;
				case(4) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4);break;
				case(5) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5);break;
				case(6) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6);break;
				case(7) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7);break;
				case(8) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) + "-" + onlynum.substring(4,8);break;
				case(9) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) + "-" + onlynum.substring(5,9);break;
				case(10) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10);break;
				default : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11);break;
			}
		} else {
			switch (onlynum.length) { //기타 무료전화 및 알수 없는 형태일때
				case(0) : This.value = "";break;
				case(1) : This.value = onlynum.substring(0,1);break;
				case(2) : This.value = onlynum.substring(0,2);break;
				case(3) : This.value = onlynum.substring(0,3);break;
				case(4) : This.value = onlynum.substring(0,4);break;
				case(5) : This.value = onlynum.substring(0,1) + "-" + onlynum.substring(1,5);break;
				case(6) : This.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6);break;
				case(7) : This.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7);break;
				default : This.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,11);break;
			}
		}
	}
</script>

<form name="payform" >
	
	<div class="s_page">
		<div class="sp_head">
			<div class="sp_title">
				<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">교육자료</mark>(판매품)</h3>
			</div>
			<div class="sp_navi">
				<ul>
					<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
					<li><a href="/work/publication/kp_magazine">KDA 출판</a></li>
					<li><a href="/work/publication/kp_archiveshop" class="cm">교육자료</a></li>
				</ul>
			</div>
		</div>
		<hr />
		<div class="sp_body">
			<div class="box bga text ssmall mt5 p10">
				입금이 확인되면 영업일 기준 2~3일 이내에 교육자료를 발송합니다.<br />
				입금 후 1주일 이상 소요 시 문의처로 연락 부탁드립니다.<br />
				<br />
				<span class="mt10 i_b_t3">문의처 : 교육국 kdabook@kdiet.or.kr</span>
			</div>
			<div class="box t3 bgs mt10 p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">주문자료 확인</h4>
				</div>
			</div>
			<div class="line bb bw2 p10 text">
				<ul>
				<input type="hidden" id="sessionId" name="sessionId" value="${sessionId}" >
				<c:choose>
					<c:when test="${ fn:length(cartList) > 0 }">
						<c:forEach items="${cartList}" var="cart">
							<li class="p10">
								${cart.otitle}<span class="ml10">${cart.ctea}부 :
								<c:if test="${isMember}" >
									<c:set var="price" value="${cart.oprice1 * cart.ctea}"/>
								</c:if>
								<c:if test="${!isMember}">
									<c:set var="price" value="${cart.oprice2 * cart.ctea}"/>
								</c:if>
								<c:set var="totalPrice" value="${totalPrice + price}" />
								<fmt:formatNumber type="currency" value="${price}" pattern="###,###" />원
								</span>
							</li>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="p10">
							장바구니에 담긴 상품이 없습니다.
						</li>
					</c:otherwise>
				</c:choose>
				<c:if test="${totalPrice < 50000 }">
					<c:set var="totalPrice" value="${totalPrice + 3000}"/>
					<li class="p10 right cp bold line bb dot"><strong>배송비</strong> : 3,000 원</li>
				</c:if>
					<li class="p10">
					   <p style="text-align: left">※ 50,000원 미만의 자료의 경우 택배 발송비 3,000원이 추가됩니다.</p>
					   <p style="text-align: right;"><b>총 결제 금액 : <fmt:formatNumber type="currency" value="${totalPrice}" pattern="###,###" />원</b></p>
					</li>
				</ul>
			</div>
			
			<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}" >
			<div class="box t3 bgs mt20 p10 pl15 text small">
				<div class="area">
					<h4 class="fl title i_b_t6 w90">결제정보</h4>
					<div class="ib fl mt2 text ssmall">
						<input type="radio" class="mr5" value='GIRO' id='pay_gubun' name='pay_gubun' checked onclick="change_part('GIRO');" />
						<label for="radio1_1" class="mr20">무통장입금</label>
					</div>
					
					<c:if test="${isMember}">
					<div class="ib fl mt2 text ssmall">
						<input type="radio" class="mr5" value='CARD' id='pay_gubun' name='pay_gubun' onclick="change_part('CARD');"/>
						<label for="radio1_1" class="mr20">영양사카드 결제</label>
					</div>
					<!-- <div class="ib fl mt2 text ssmall">
						<input type="radio" class="mr5" value='POINT' id='pay_gubun' name='pay_gubun' onclick="change_part('POINT');"/>
						<label for="radio1_1" class="mr20">포인트결제</label>
					</div> -->
					</c:if>
				</div>
			</div>
			<div class="form" id='GiroCard' >
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>입금은행</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								신한은행 : 140-006-740640
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>예금주</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<strong class="bold">(사)대한영양사협회</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid19" class="ff_title i_b"><strong>입금예정일</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="hidden" name="bf_paymentdate" id="bf_paymentdate">
								<select class="select t2 fl w100 ml5" id="rYear" name="rYear">
									<% for(int i=2015; i <=2030 ; i++){ %>
									<option value="<%=i%>" <%if(cal.get( cal.YEAR ) == i){%>selected<%}%>><%=i%></option>
									<%}%>
								</select>
								<label for="inputid20" class="fl text ml10 mr10">년</label>
								<select class="select t2 fl w100 ml5" id="rMonth" name="rMonth">
									<% for(int i=1; i <=12 ; i++){ %>
									<option value="<%=i%>" <%if(cal.get( cal.MONTH ) + 1 == i){%>selected<%}%>><%=i%></option>
									<%}%>
								</select>
								<label for="inputid21" class="fl text ml10 mr10">월</label>
								<select class="select t2 fl w100 ml5" id="rDay" name="rDay">
									<% for(int i=1; i <=31 ; i++){ %>
									<option value="<%=i%>" <%if(cal.get( cal.DATE ) == i){%>selected<%}%>><%=i%></option>
									<%}%>
								</select>
								<label for="inputid21" class="fl text ml10 mr10">일</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bf_paymentname" class="ff_title i_b"><strong>송금자이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 w200" id="bf_paymentname" name="bf_paymentname"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${isMember}">
			<div class="form" id='point' style="display:none">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>보유포인트</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area"><fmt:formatNumber type="currency" value="${requestScope.point}" pattern="###,###" /> point
							</div>
							<p class="text cp ml10">*포인트는 10,000 Point 이상이 되야 결제하실 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div2">
						<div class="ff_title i_b"><strong>사용포인트</strong></div>
						<div class="ff_wrap ml120 text">
							
							<fmt:formatNumber type="currency" value="${totalPrice}" pattern="###,###" /> point
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
			<div class="box t3 bgs mt20 p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">주문자정보</h4>
					<p class="text ssmall cp mt10"><font color="red">※ 입력하신 주문자 정보를 기준으로 견적서, 영수증, 거래명세서를 MY 구매정보에서 출력 가능합니다.</font></p>
				</div>
			</div>
			<div class="form">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
							    <c:if test="${isMember}">
								    <input type="text" class="input t1 fl w200" id="bf_name" name="bf_name" value="${person.pers_name}" readonly/>
								</c:if>
								<c:if test="${!isMember}">
								    <input type="text" class="input t1 fl w200" id="bf_name" name="bf_name" value="${person.pers_name}"/>
								</c:if>
								<input type="hidden" id="buserid" name="buserid" value="${person.id}"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
                    <div class="f_field div1">
                        <label for="inputid1" class="ff_title i_b"><strong>생년월일(8자리)</strong></label>
                        <div class="ff_wrap ml120">
                            <div class="area">
                                <c:if test="${isMember}">
                                    <input type="text" class="input t1 fl w200" maxlength="8" id="pers_birth" name="pers_birth" value="${person.pers_birth}" readonly />
                                </c:if>
                                <c:if test="${!isMember}">
                                    <input type="text" class="input t1 fl w200" maxlength="8" id="pers_birth" name="pers_birth" value="${person.pers_birth}" onkeyup="if(this.value.match(/[^0-9]/)){this.value=this.value.replace(/[^0-9]/g,'');}" />
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
				
				<c:if test="${isMember}">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>면허번호</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" id="bf_license"	name="bf_license" value="${person.lic_no}" readonly />
							</div>
						</div>
					</div>
				</div>
				</c:if>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>전화번호</strong></div>
						<div class="ff_wrap ml120">
							<ul>
								<li>
									<div class="area">
										<label for="inputid2" class="fl w80 text bold cm">자택</label>
										<c:if test="${isMember}">
										      <input type="text" class="input t1 fl w200" maxlength="13" name="bf_tel" id="bf_tel" value="${person.pers_tel}" readonly />
										</c:if>
										<c:if test="${!isMember}">
										      <input type="text" class="input t1 fl w200" maxlength="13" name="bf_tel" id="bf_tel" value="${person.pers_tel}" onkeyup="phoneNumber(this)" />
										</c:if>
									</div>
								</li>
								<li class="mt5">
									<div class="area">
										<label for="inputid5" class="fl w80 text bold cm">휴대폰</label>
										<c:if test="${isMember}">
										      <input type="text" class="input t1 fl w200"  maxlength="13" name="bf_mobile" id="bf_mobile" value="${person.pers_hp }" readonly />
										</c:if>
                                        <c:if test="${!isMember}">
                                              <input type="text" class="input t1 fl w200"  maxlength="13" name="bf_mobile" id="bf_mobile" value="${person.pers_hp }" onkeyup="phoneNumber(this)" />
                                        </c:if>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid8" class="ff_title i_b"><strong>이메일</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
							    <c:if test="${isMember}">
									<input type="text" class="input t1 fl w200" id="bf_email" name="bf_email" value="${person.email1}" readonly />
									<label for="inputid9" class="fl text ml10 mr10">@</label>
									<input type="text" class="input t1 fl w150" id="bf_email2" name="bf_email2" value="${person.email2}" readonly />
								</c:if>
                                <c:if test="${!isMember}">
                                    <input type="text" class="input t1 fl w200" id="bf_email" name="bf_email" value="${person.email1}" />
                                    <label for="inputid9" class="fl text ml10 mr10">@</label>
                                    <input type="text" class="input t1 fl w150" id="bf_email2" name="bf_email2" value="${person.email2}" />
                                    <label for="inputid10" class="ti">이메일 입력</label>
                                
	                                <select class="select t2 fl w150 ml5" name="email_select" id="email_select" onChange="checkemailaddy();">
										<option value="" selected>직접입력</option>
										<option value="naver.com" >naver.com</option>
										<option value="nate.com" >nate.com</option>
										<option value="hanmail.net" >hanmail.net</option>
										<option value="daum.net" >daum.net</option>
										<option value="gmail.com" >gmail.com</option>
										<option value="kakao.com" >kakao.com</option>
										<option value="cbe.go.kr" >cbe.go.kr</option>
										<option value="ice.go.kr">ice.go.kr</option>
										<option value="korea.kr" >korea.kr</option>
										<option value="sen.go.kr" >sen.go.kr</option>
										<option value="1">직접입력</option>
									</select>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<!-- <div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>배송료 안내</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								50,000원 미만의 자료의 경우 택배 발송비 3,000원이 추가됩니다.
							</div>
						</div>
					</div>
				</div> -->
				
				<!-- <div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>수령방법</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<input type="radio" class="mr5" name="bf_delivery" value="0" checked/>
								<label for="radio2_1" class="mr20">일반배송</label>
								<input type="radio" class="mr5" name="bf_delivery" value="1"/>
								<label for="radio2_2" class="mr20">택배</label>
							</div>
							<p class="text cp ml10">*50,000원 미만의 자료의 경우 택배 발송 시 배송비 3,000원이 추가됩니다.</p>
						</div>
					</div>
				</div> -->
			</div>
			<div class="box t3 bgs mt20 p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">수령지정보</h4>
				</div>
			</div>
			<div class="form">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bt_name" class="ff_title i_b"><strong>수령자이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" id="bt_name" maxlength="20" name="bt_name" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid12" class="ff_title i_b"><strong>주소</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" class="input t1 fl w200" name="bt_post" onFocus="document.payform.bt_address.focus();" onClick="javascript:openJusoPopup();" readonly/>
								<a href="javascript:openJusoPopup();" class="btn form t1 fl ml5">주소검색</a>
							</div>
							<div class="area mt5">
								<label for="inputid13" class="ti">상세주소</label>
								<input type="text" class="input t1" id="bt_address" name="bt_address" readonly/> <br> 
								<input type="text" class="input t1" id="bt_address2" name="bt_address2" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>전화번호</strong></div>
						<div class="ff_wrap ml120">
							<ul>
								<li>
									<div class="area">
										<label for="inputid14" class="fl w80 text bold cm">자택</label>
										<input type="text" class="input t1 fl w200" maxlength="13" name="bt_tel" id="bt_tel" onkeyup="phoneNumber(this)" />
									</div>
								</li>
								<li class="mt5">
									<div class="area">
										<label for="inputid17" class="fl w80 text bold cm">휴대폰</label>
										<input type="text" class="input t1 fl w200" maxlength="13" name="bt_mobile" id="bt_mobile" onkeyup="phoneNumber(this)" />
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<p class="text ssmall cp mt10"><font color="red">※ 구매시 발송되는 모든 내용물은 입력하신 수령지 정보의 주소지로 모두 배송됩니다.<br />
			&nbsp;&nbsp;&nbsp;&nbsp;허위 기재나 잘못된 기재로 인하여 배송물의 분실 시에는 본인 책임임을 알려드리며 다시 배송해 드리지 않습니다.<br />
			&nbsp;&nbsp;&nbsp;&nbsp;정확하게 기재하여 주시기 바랍니다.</font></p>
			<div class="box t3 bgs mt20 p10 pl15 text small">
				<div class="area">
					<h4 class="title i_b_t6">부가정보</h4>
				</div>
			</div>
			<div class="form">
				<!-- <div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title i_b"><strong>필요서류</strong></div>
						<div class="ff_wrap ml120 text">
							<ul class="area">
								<li class="fl mr20 p3"><input type="checkbox" class="mr5" name="bt_paper" value="영수증"/><label for="checkbox1_1">영수증</label></li>
								<li class="fl mr20 p3"><input type="checkbox" class="mr5" name="bt_paper" value="견적서" /><label for="checkbox1_2">견적서</label></li>
								<li class="fl mr20 p3"><input type="checkbox" class="mr5" name="bt_paper" value="거래명세서" /><label for="checkbox1_3">거래명세서</label></li>
								<li class="fl mr20 p3"><input type="checkbox" class="mr5" name="bt_paper" value="구입과 지출결의서" /><label for="checkbox1_4">구입과 지출결의서</label></li>
							</ul>
						</div>
					</div>
				</div> -->
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="textarea1" class="ff_title i_b"><strong>기타</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<textarea class="textarea t1 text ssmall" id="textarea1" name="bt_text" /></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt40">
				<ul>
					<li><a href="javascript:doWrite();" class="btn big t1">완료</a></li>
					<li><a href="javascript:doCancel();" class="btn big">취소</a></li>
				</ul>
			</div>

		</div>
	</div>
</form>

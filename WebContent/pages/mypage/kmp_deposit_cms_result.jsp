<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>

<script>
function f_sendIt(){
	if( check() ) {
		document.join.action = "kmp_deposit_cms_action.do";
		document.join.submit();
	}
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">기존회원 </mark>재가입/입금 확인</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/member/km_join.do">마이페이지</a></li>
				<li><a href="/work/member/km_deposit.do" class="cm">기존회원 재가입/입금 확인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<!--  // Contents Start -->
		<h4 class="title bold t2 cm s1 i_b_t2 mt50">CMS입금</h4>
		<div class="box t2 bgs mt20 p20 text">
			
			<table width="656" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="30" rowspan="2">&nbsp;</td>
                  <td width="626" height="33" class="font_998"><div align="right"></div>
                      <div align="left"><strong><span class="style12">소속 시도영양사회로 CMS 신청서를 팩스 송부해 주시면
회비 재가입이 완료 되십니다.</span> </strong></div>
                      <div align="right"></div></td>
                </tr>
                <tr>
                  <td valign="top" class="font_998">
                  
					<table width="616" height="48" border="0" cellpadding="0" cellspacing="0">
                      <tr class="font_998">
                        <td height="19"> 회비 출금 후 약 24시간 후부터 홈페이지 상의 회원 전용공간을 이용하실 수 있습니다<br></td>
                      </tr>
					  <tr class="font_998">
                        <td height="19">&nbsp; </td>
                      </tr>
                  	</table>
                  
                  </td>
                </tr>
            </table>
<!-------------------------------------------------------------------------------------->
 <table width="356" height="124" border="0" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC" align="center">
                        <tr bgcolor="#EFEFEF">
                          <td ><div align="center" class="style11">지역</div></td>
                          <!--<td><div align="center" class="style11">은행명</div></td>
                          <td width="139"><div align="center" class="style11">계좌번호</div></td>
                          <td width="106">
                            <div align="center" class="style11">예금주명</div></td>
							-->
                          <td  colspan="3"><p align="center" class="style11">전화번호/FAX</p></td>
                        </tr>
						<!--<tr bgcolor="#EFEFEF">
                          <td colspan="2" bgcolor="#FFFFEC"><div align="center" class="style7"><strong>평생회비</strong></div></td>
                          <td width="63" bgcolor="#FFFFFF"><div align="center" class="style7">신한은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">385-05-006540</div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 02)823-5680<br>
                       ⓕ 02)823-5689 </div></td>
                        </tr>-->
                        <tr bgcolor="#EFEFEF">
                         <!-- <td width="100" rowspan="13" align="center" bgcolor="#FFFFEC"><strong>연회비</strong></td>-->
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>서울</strong></div></td>
                         <!-- <td width="63" bgcolor="#FFFFFF"><div align="center" class="style7">국민은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">384701-04-151254</div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 02)3289-7200 <br>
                      ⓕ 02)3289-7201 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>부산</strong></div></td>
                          <!--<td bgcolor="#FFFFFF"><div align="center" class="style7">부산은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">022-13-000008-9 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 051)634-7640<br>
                      ⓕ 051)631-6136 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>인천</strong></div></td>
                        <!--  <td bgcolor="#FFFFFF"><div align="center" class="style7">수협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">163-61-005928 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 032)435-5990<br>
                      ⓕ 032)432-5199 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>경기</strong></div></td>
                         <!-- <td bgcolor="#FFFFFF"><div align="center" class="style7">신한은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">100-023-367042 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 031)468-9417<br>
                      ⓕ <strong>031)448-9890 </strong> </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>강원</strong></div></td>
                     <!--     <td bgcolor="#FFFFFF"><div align="center" class="style7">농협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">203-01-225733 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 033)251-7576<br>
                      ⓕ 033)251-7579</div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>충북</strong></div></td>
                      <!--    <td bgcolor="#FFFFFF"><div align="center" class="style7">농협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">304-17-000096 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 043)268-4798<br>
                      ⓕ 043)266-0166</div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>대전충남세종</strong></div></td>
                         <!-- <td bgcolor="#FFFFFF"><div align="center" class="style7">농협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">407-01-100377 </div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 042)252-4346<br>
                      ⓕ 042)252-9110 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>전북</strong></div></td>
                       <!--   <td bgcolor="#FFFFFF"><div align="center" class="style7">농협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">301-0011-9700-11</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 063)272-0175<br>
                      ⓕ 063)255-1811 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>광주전남</strong></div></td>
                      <!--    <td bgcolor="#FFFFFF"><div align="center" class="style7">신한은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">100-024-993030</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회</div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 062)364-6773<br>
                      ⓕ 062)364-6772 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>대구경북</strong></div></td>
                       <!--   <td bgcolor="#FFFFFF"><div align="center" class="style7">대구은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">090-05-000936-4 </div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 053)563-6066<br>
                      ⓕ 053)563-6466 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><p align="center" class="style7"><strong>경남</strong></p></td>
                      <!--    <td bgcolor="#FFFFFF"><div align="center" class="style7">경남은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">578-07-0022469 </div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 055)268-6846<br>
                      ⓕ 055)268-6847 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>울산</strong></div></td>
                     <!--     <td bgcolor="#FFFFFF"><div align="center" class="style7">경남은행</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">531-35-0003039 </div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF">
                            <div align="center" class="style7">ⓞ 052)258-6069<br>
                      ⓕ 052)275-2823 </div></td>
                        </tr>
                        <tr bgcolor="#EFEFEF">
                          <td bgcolor="#FFFFEC"><div align="center" class="style7"><strong>제주</strong></div></td>
                       <!--   <td bgcolor="#FFFFFF"><div align="center" class="style7">농협</div></td>
                          <td bgcolor="#FFFFFF">
                            <div align="center" class="style7">957-01-104080 </div></td>
                          <td bgcolor="#FFFFFF"><div align="center" class="style7"> 대한영양사협회 </div></td>-->
                          <td colspan="3" bgcolor="#FFFFFF"><div align="center" class="style7"> ⓞ 064)721-9062<br>
                      ⓕ 064)721-9062 </div></td>
                        </tr>
						 
              	</table>
			
		</div>	
		<!-- // Contents End -->
	</div>
</div>

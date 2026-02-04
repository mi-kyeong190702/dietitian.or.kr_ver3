<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>

<%

	
	String O_gubun			= ParamUtils.getParameter(request, "O_gubun");
	String good_name		= ParamUtils.getParameter(request, "good_name");
	
	
	String good_mny			= ParamUtils.getParameter(request, "good_mny"); 
	String pers_name		= ParamUtils.getParameter(request, "pers_name"); 
	String pers_tel			= ParamUtils.getParameter(request, "pers_tel"); 
	String pers_hp			= ParamUtils.getParameter(request, "pers_hp"); 
	String email			= ParamUtils.getParameter(request, "email"); 
	
	String pers_birth		= ParamUtils.getParameter(request, "pers_birth");
	String user_id 			= ParamUtils.getParameter(request, "user_id");
	String code_bran		= "";
	String goods_code_NUm	= ParamUtils.getParameter(request, "goods_code_NUm");
	String mem_due			= ParamUtils.getParameter(request, "dues_bran").trim();
	String edu_kind			= ParamUtils.getParameter(request, "edu_kind"); //재가입 카드결제 부분에서는 값을 보내주는 부분이 없음.
	String seq				= ParamUtils.getParameter(request, "seq").trim();//재가입 카드결제 부분에서는 값을 보내주는 부분이 없음.
	
	//2013 년 4월 3일  수정 - 신규 회원구분의 회비 추가 (125만원, 120만원)
	if(    good_mny.equals("1250000") ||  good_mny.equals("1200000")
		|| good_mny.equals("1050000") ||  good_mny.equals("800000")
		|| good_mny.equals("1000000") ||  good_mny.equals("750000"))
	{
		code_bran = "0";
	}else{
		code_bran = ParamUtils.getParameter(request, "code_bran").trim();	
	}
   
%>

<script type="text/javascript">
// 플러그인 설치(확인)
StartSmartUpdate();

function  jsf__chk_plugin()
{
	document.joinCard.action="/member/order.do"
  	document.joinCard.submit();
}

setTimeout( 'jsf__chk_plugin()', '1000' );
</script>
</head>
<div class="s_page">
<body topmargin=0 leftmargin=0 onload='jsf__chk_plugin();'>



	<form name="joinCard" method="post" ID="Form1">

	<input type="hidden" name="O_gubun" 		value="<%=O_gubun%>">
	<input type="hidden" name="good_name" 		value="<%=good_name%>">
	<input type="hidden" name="good_mny"        value="<%=good_mny%>" title="결제금액">
    <input type="hidden" name="pers_name"       value="<%=pers_name%>"> 
    <input type="hidden" name="pers_tel"        value="<%=pers_tel%>"> 
    <input type="hidden" name="pers_hp"         value="<%=pers_hp%>">    
    <input type="hidden" name="email"         	value="<%=email%>">

	<input type="hidden" name="pers_birth"		value="<%=pers_birth%>">
	<input type="hidden" name="user_id" 		value="<%=user_id%>">
	<input type="hidden" name="code_bran" 		value="<%=code_bran%>">
	<input type="hidden" name="goods_code_NUm" 	value="<%=goods_code_NUm%>">
	<input type="hidden" name="edu_kind" 		value="<%=edu_kind%>">
	<input type="hidden" name="mem_due" 		value="<%=mem_due%>">
	<input type="hidden" name="seq" 			value="<%=seq%>">
	</form>

<table border='0' width='600'>
    <tr>
        <td height='50'>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <hr noshade size="2">
            <b style="color:blue">결제에 필요한 프로그램을 확인(설치) 중입니다.</b>
            <hr noshade size="2">
        </td>
    </tr>
    <tr>
        <td height='30'>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <table width="600" border="0" align="center" cellpadding="1" cellspacing="0" bgcolor="#DFDFDF">
                <tr>
                    <td>
                        <table width="600" border="0" align="center" cellpadding="5" cellspacing="0" class='text3' bgcolor='#f6fff6'>
                            <tr>
                                <td class='text8' colspan='2' style='padding:10 0 10 20;'>
                                    고객님의 안전한 결제를 위해 결제 정보를 암호화하는 프로그램을 확인(설치)하는 중입니다.
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>1</td>
                                <td>
                                    Windows XP ServicePack2 를 설치하신 고객님은 페이지 상단의 알림표시줄이 나타났을 경우
                                    알림표시줄에서 마우스 오른쪽 버튼을 눌러 『ActiveX 컨트롤 설치』를 선택하여 주십시오.
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>2</td>
                                <td>
                                    보안경고 창이 나타나면 『설치』 또는 『예』 버튼을 눌러 설치를 진행하여 주십시오.
                                    통신 환경에 따라 2-3초에서 수분이 걸릴수도 있습니다.
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>3</td>
                                <td>
                                    암호화를 위한 프로그램 설치가 완료되면 자동으로 압축이 해제된 후 설치가 됩니다.
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table width="600" border="0" align="center" cellpadding="1" cellspacing="0" bgcolor="#DFDFDF">
                <tr>
                    <td>
                        <table width="600" border="0" align="center" cellpadding="5" cellspacing="0" class='text3' bgcolor='#f6fff6'>
                            <tr>
                                <td class='text8' colspan='2' style='padding:10 0 10 20;'>
                                    프로그램이 자동으로 설치가 되지 않는 경우
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>1</td>
                                <td>
                                    <B><a href='http://pay.kcp.co.kr/plugin/file/PayplusWizard.zip'>이곳</a></B>을 눌러 설치 파일을 다운로드하여 주십시오.
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>2</td>
                                <td>
                                    다운받은 프로그램을 실행하시면 설치가 진행됩니다.
                                </td>
                            </tr>
                            <tr>
                                <td valign='top'>3</td>
                                <td>
                                    설치가 완료된 후 키보드의 『F5』버튼을 눌러 새로고침을 하면 다음 결제 페이지로 이동합니다.
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>












		  </td>
      </tr>

    </table></td>
  </tr>
												</table>
												<!-- 상세페이지 끝 --->
											</td>
										</tr>
										<tr>
											<td align="left" valign="top">								</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="933" height="157" align="left" valign="top">
						<!-- #include virtual="/inc/copy.asp" -->
					</td>
				</tr>
			</table>
		</td>
		<td width="21%" align="center" valign="top" background="/images/bg.gif"></td>
	</tr>
</table>
</body>
<map name="Map2">
	<area shape=rect coords="162,209,318,236" href="card.asp" />
</map>
</html>
</div>
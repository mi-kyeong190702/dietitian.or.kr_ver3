<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="kda.WorkData"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="kda.SessionInfo"%>
<%@ page import="kda.member.data.MEMBER_JOIN"%>

<%
	//'아이핀팝업에서 조회한 PERSONALINFO이다.
	String encPsnlInfo = ParamUtils.getParameter(request, "encPsnlInfo", "");
	
	//'KCB서버 공개키
	String WEBPUBKEY = ParamUtils.getParameter(request, "WEBPUBKEY", "");
  
	//'KCB서버 서명값?
	String WEBSIGNATURE = ParamUtils.getParameter(request, "WEBSIGNATURE", "");
   	
	String exe 		= WorkData.IPIN_PATH + "/I-PIN/module/okname";
	String keypath 	= WorkData.IPIN_PATH + "/I-PIN/key/okname.key";
	String logpath	= WorkData.IPIN_PATH + "/I-PIN/log/";
	
	String cpCode 	= "J00290000001";

	String EndPointURL = "http://www.ok-name.co.kr/KcbWebService/OkNameService";
	String cpubkey	= WEBPUBKEY;       // 'server publickey
	String csig		= WEBSIGNATURE;    // 'server signature
	String encdata	= encPsnlInfo;     // 'PERSONALINFO
	
	String option1	= "SL";

	// ************************* SHELL EXEC ************************* //

	String buf =" ";
	Runtime rt = Runtime.getRuntime();
	Process ps = null;
	String command = exe + " " + keypath + " " + cpCode + " " + EndPointURL + " " + cpubkey + " " + csig + " " + encdata + " " + logpath + " " + option1;
	
	ArrayList<String> results = new ArrayList<String>();

	try
	{
		ps = rt.exec(command);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream()),"euc-kr"));

		int i = 0 ;
		String line = "";
		while ( ( line = br.readLine() ) != null ) {
			results.add(i, line);
			i++;
		}
	
		br.close();
		ps.waitFor();
		ps.destroy(); 

	} catch(IOException ie) {
		ie.printStackTrace();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	MEMBER_JOIN member_join = new MEMBER_JOIN();
	
	// ********************* MEMBER_JOIN *********************// 
	System.out.println("================== km_joinipin.jsp ===============");	
	System.out.println("================== I-PIN RESULT ==================");
	System.out.println("encPsnlInfo     : " + encPsnlInfo);
	System.out.println("dupinfo         : " + results.get(0));
	System.out.println("coinfo1         : " + results.get(1));
	System.out.println("coinfo2         : " + results.get(2));
	System.out.println("ciupdate        : " + results.get(3));
	
	System.out.println("virtualno       : " + results.get(4));
	System.out.println("cpcode          : " + results.get(5));
	System.out.println("realname        : " + results.get(6));
	System.out.println("cprequestnumber : " + results.get(7));
	System.out.println("age             : " + results.get(8));
	
	System.out.println("sex             : " + results.get(9));
	System.out.println("nationalinfo    : " + results.get(10));
	System.out.println("birthdate       : " + results.get(11));
	System.out.println("authinfo        : " + results.get(12));
	System.out.println("================== I-PIN RESULT ==================");
	
	member_join.setEncpsnlinfo(encPsnlInfo);
	member_join.setDupinfo(results.get(0));
	member_join.setCoinfo1(results.get(1));
	member_join.setCoinfo2(results.get(2));
	member_join.setCiupdate(results.get(3));
	
	member_join.setVirtualno(results.get(4));
	member_join.setCpcode(results.get(5));
	member_join.setPers_name(results.get(6)); //
	member_join.setCprequestnumber(results.get(7));
	member_join.setAge(results.get(8));
	
	member_join.setCode_sex(results.get(9)); //
	member_join.setNationalinfo(results.get(10));
	member_join.setPers_birth(results.get(11)); //
	member_join.setAuthinfo(results.get(12));
	
	session.setAttribute(SessionInfo.MEMBER_JOIN, member_join);
	
	// ********************* MEMBER_JOIN *********************//
	
%>

<html>
<head>
<script language="JavaScript">
	function onLoad() 
	{
		opener.document.IPIN.AUTHINFO.value = "<%=results.get(12)%>";
		opener.doIpinCheckComplete();
		self.close();
	}
</script>
</head>
<body onload="javascript:onLoad();">
</body>
</html>
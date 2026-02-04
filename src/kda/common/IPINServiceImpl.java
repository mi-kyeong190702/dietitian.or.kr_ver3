package kda.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.SequenceInputStream;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kda.SessionInfo;
import kda.common.data.IPIN;
import kda.member.data.MEMBER_JOIN;
import kda.utils.ParamUtils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ipinService")
public class IPINServiceImpl implements IPINService {
	
	private Log log = LogFactory.getLog(IPINServiceImpl.class);
	
	@Autowired 
	private ServletContext servletContext;
	
	@Override
	public IPIN getIPIN(HttpServletRequest request) throws Exception {
		IPIN ipin = new IPIN();
		String host = request.getServerName();
		int port = request.getServerPort();
		String serverUrl = "https://" + host;
		if(   port != 80 ) {
			serverUrl += ":" + port;
		}
		System.out.println(ipin);
		
		serverUrl = serverUrl + ipin.getReturnUrl();
		ipin.setReturnUrl(serverUrl);
		
		String ipinPath = servletContext.getRealPath("I-PIN");
		String exe			= ipinPath + "/module/okname.exe";
		String keypath		= ipinPath + "/key/okname.key";
		String logpath		= ipinPath + "/log/";
		
		System.out.println(">>>>>>>>>>>>>>"+ipinPath);
		
		 
		
		// ************************* SHELL EXEC ************************* //
		String buf =" ";
		Runtime rt = Runtime.getRuntime();
		Process ps = null;
		// String command = exe + " " + keypath + " " + memid +  " " + reserved1 + " " + reserved2 + " " +  EndPointURL + " " + logpath + " " + option1;
		/*String command = exe + " " + keypath + " " + ipin.getMemid() +  " " + ipin.getReserved1() + " " + ipin.getReserved2() + " " +  ipin.getEndPointURL() + " " 
				+ logpath + " " + ipin.getOption1();*/
		String command = exe + " " + keypath + " " + "J00290000001" +  " " + "0" + " " + "0" + " " +  "http://www.ok-name.co.kr/KcbWebService/OkNameService" + " " 
				+ logpath + " " + "CL";
		
		BufferedReader br = null;
		try
		{
			ps = rt.exec(command);
			
			br = new BufferedReader( new InputStreamReader( new SequenceInputStream(ps.getInputStream(), ps.getErrorStream())));

			
			String line;
			while((line = br.readLine()) != null) {
			    System.out.println(">> OUT: " + line);
			}
			
			ipin.setPubkey(br.readLine());
			ipin.setSig(br.readLine());
			ipin.setCurtime(br.readLine());

			br.close();
			ps.waitFor();
			ps.destroy(); 
		} catch(IOException ie) {
			
			//ie.printStackTrace();
			log.info("Exception : " + ie.toString());
			throw ie;
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
			throw e;
		}finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return ipin;
	}

	
	
	@Override
	public MEMBER_JOIN getResult(HttpServletRequest request) throws Exception {
		
		IPIN ipin = new IPIN();
		//'아이핀팝업에서 조회한 PERSONALINFO이다.
		String encPsnlInfo = ParamUtils.getParameter(request, "encPsnlInfo", "");
		//'KCB서버 공개키
		String WEBPUBKEY = ParamUtils.getParameter(request, "WEBPUBKEY", "");
		//'KCB서버 서명값?
		String WEBSIGNATURE = ParamUtils.getParameter(request, "WEBSIGNATURE", "");
	   	
		String ipinPath = servletContext.getRealPath("I-PIN");
		String exe			= ipinPath + "/module/okname";
		String keypath		= ipinPath + "/key/okname.key";
		String logpath		= ipinPath + "/log/";
		
		String cpCode 	= "J00290000001";
		String EndPointURL = "http://www.ok-name.co.kr/KcbWebService/OkNameService";
		String option1	= "SL";

		// ************************* SHELL EXEC ************************* //

		String buf =" ";
		Runtime rt = Runtime.getRuntime();
		Process ps = null;
		//String command = exe + " " + keypath + " " + ipin.getCpCode() + " " + ipin.getEndPointURL() + " " + WEBPUBKEY + " " + WEBSIGNATURE + " " + encPsnlInfo + " " + logpath + " " + option1;
		String command = exe + " " + keypath + " " + "J00290000001" + " " + "http://www.ok-name.co.kr/KcbWebService/OkNameService" + " " + WEBPUBKEY + " " + WEBSIGNATURE + " " + encPsnlInfo + " " + logpath + " " + option1;
		
		ArrayList<String> results = new ArrayList<String>();

		BufferedReader br = null;
		try
		{
			ps = rt.exec(command);	
			br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream()),"euc-kr"));

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
			//ie.printStackTrace();
			log.info("Exception : " + ie.toString());
			throw ie;
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
			throw e;
		}finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
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
	
		return member_join;
	}

	
	
}

package kda.common.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class IPIN {
	private String idpCode = "V"; // ' 웹사이트 선호본인확인기관(KCB기관)코드// ' 웹사이트 선호본인확인기관(KCB기관)코드
	private String idpUrl = "https://ipin.ok-name.co.kr/tis/ti/POTI90B_SendCertInfo.jsp";
	private String cpCode = "J00290000001"; // ' 회원사코드
	
	private String returnUrl = "/common/result_ipin.do";
	
	private String pubkey = "";
	private String sig = "";
	private String curtime = "";
	private String authInfo = "";
	
	String endPointURL	= "http://www.ok-name.co.kr/KcbWebService/OkNameService"; // ' 운영계
	String memid		= cpCode;	// ' memid
	String reserved1	= "0";		// ' reserved1
	String reserved2	= "0";		// ' reserved2
	String option1		= "CL";
	
}

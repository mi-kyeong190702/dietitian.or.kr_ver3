package kda.utils;

import kda.common.data.LOCAL_ACC;

/**
 *  This class assists skin writers in getting parameters.
 */
public class KdaUtil 
{
    public static boolean isHTML( String data ) 
    {    	
    	boolean isHTML = false;
    	
		if ( data.indexOf("<html") >= 0 ||
			 data.indexOf("style=") >= 0 ||
			 data.indexOf("<head=") >= 0 ||
			 data.indexOf("SPAN>") >= 0 ) {
			isHTML = true;
		}
		
		return isHTML;
    }
    
    public static String getCodePayName(String codePayFlag) {	
    	int iCodePayFlag = KdaStringUtil.nullToInt(codePayFlag, 0);
    	switch(iCodePayFlag) {
    	case 15:
    		return "CMS 입금";
    	case 60:
    		return "지로 입금";
    	case 10:
    		return "무통장 입금";
    	default :
    			return "";
    	}
    }
    
    public static LOCAL_ACC getLocalAcc(String codeBran) {
    	LOCAL_ACC localAcc = new LOCAL_ACC();
    	int iCodeBran = KdaStringUtil.nullToInt(codeBran, 0);
    	switch(iCodeBran) {
    	case 1:
    		localAcc.setLocal_name("중앙회");
    		localAcc.setBank("신한은행");
    		localAcc.setAccount_num("385-05-006530");
    		localAcc.setTel("ⓞ 02-823-5680");
    		localAcc.setFax("ⓕ 02-823-5689");
    		break;
    	case 2:
			localAcc.setLocal_name("서울");
    		localAcc.setBank("우리은행");
    		localAcc.setAccount_num("1005-501-385956");
    		localAcc.setTel("ⓞ 02-3289-7200");
    		localAcc.setFax("ⓕ 02-3289-7201");
    		break;
    	case 3:
    		localAcc.setLocal_name("부산");
    		localAcc.setBank("부산은행");
    		localAcc.setAccount_num("022-13-000008-9");
    		localAcc.setTel("ⓞ 051-634-7640");
    		localAcc.setFax("ⓕ 051-631-6136");
    		break;
    	case 4:
    		localAcc.setLocal_name("인천");
    		localAcc.setBank("수협");
    		localAcc.setAccount_num("163-61-005928");
    		localAcc.setTel("ⓞ 032-435-5990");
    		localAcc.setFax("ⓕ 032-432-5199");
    		break;
    	case 5:
    		localAcc.setLocal_name("경기");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("211012-51-004295");
    		localAcc.setTel("ⓞ 031-468-9417");
    		localAcc.setFax("ⓕ 031-448-9890");
    		break;
    	case 6:
    		localAcc.setLocal_name("강원");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("203-01-225733");
    		localAcc.setTel("ⓞ 033-251-7576");
    		localAcc.setFax("ⓕ 033-251-7579");
    		break;
    	case 7:
    		localAcc.setLocal_name("충북");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("304-17-000096");
    		localAcc.setTel("ⓞ 043-268-4798");
    		localAcc.setFax("ⓕ 043-266-0166");
    		break;
    	case 8:
    		localAcc.setLocal_name("대전충남세종");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("407-01-225733");
    		localAcc.setTel("ⓞ 042-252-4346");
    		localAcc.setFax("ⓕ 042-252-9110");
    		break;
    	case 9:
    		localAcc.setLocal_name("전북");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("301-0032-0304-71");
    		localAcc.setTel("ⓞ 063-272-0175");
    		localAcc.setFax("ⓕ 063-255-1811");
    		break;
    	case 10:
    		localAcc.setLocal_name("광주전남");
    		localAcc.setBank("신한은행");
    		localAcc.setAccount_num("100-024-993030");
    		localAcc.setTel("ⓞ 062-364-6773");
    		localAcc.setFax("ⓕ 062-364-6772");
    		break;
    	case 11:
    		localAcc.setLocal_name("대구경북");
    		localAcc.setBank("대구은행");
    		localAcc.setAccount_num("090-05-000936-4");
    		localAcc.setAccount_name("예금주 : (사)대한영양사협회");
    		localAcc.setTel("ⓞ 053-563-6066");
    		localAcc.setFax("ⓕ 053-563-6466");
    		break;
    	case 12:
    		localAcc.setLocal_name("경남");
    		localAcc.setBank("경남은행");
    		localAcc.setAccount_num("578-07-0022469");
    		localAcc.setAccount_name("예금주 : 대한영양사협회 울산지부");
    		localAcc.setTel("ⓞ 055-268-6846");
    		localAcc.setFax("ⓕ 055-268-6847");
    		break;
    	case 13:
    		localAcc.setLocal_name("울산");
    		localAcc.setBank("경남은행");
    		localAcc.setAccount_num("531-35-0003039");
    		localAcc.setTel("ⓞ 052-258-6069");
    		localAcc.setFax("ⓕ 052-275-2823");
    		break;
    	case 14:
    		localAcc.setLocal_name("제주");
    		localAcc.setBank("농협");
    		localAcc.setAccount_num("957-01-104080");
    		localAcc.setTel("ⓞ 064-721-9062");
    		localAcc.setFax("ⓕ 064-721-9062");
    		break;
    	}
    	return localAcc;
    }
    
    public static String getOperImageNo(String codeOperation) {
    	int iOperation = KdaStringUtil.nullToInt(codeOperation,0);
    	switch(iOperation) {
    	case 2 :
    		return "22";
    	case 3 :
    		return "42";
    	case 4:
    		return "52";
    	case 6:
    		return "72";
    	}
    	return "";
    }
    
    public static String getOperAttachNo(String codeOperation) {
    	int iOperation = KdaStringUtil.nullToInt(codeOperation,0);
    	switch(iOperation) {
    	case 2 :
    		return "28";
    	case 3 :
    		return "48";
    	case 4:
    		return "58";
    	case 6:
    		return "78";
    	}
    	return "";
    }
    
    
    public static String[] convertOperKey(String operKey) {
    	String[] rtnAry = new String[6];
    	/*
    	rtnAry[0] = operKey.substring(0,1);
    	rtnAry[1] = operKey.substring(1,2);
    	rtnAry[2] = operKey.substring(2,5);
    	rtnAry[3] = operKey.substring(5,7);
    	rtnAry[4] = operKey.substring(7,9);
    	rtnAry[5] = operKey.substring(9,13);
    	*/
    	rtnAry[0] = operKey.substring(0,1);
    	rtnAry[1] = operKey.substring(1,2);
    	rtnAry[2] = operKey.substring(2,6);
    	rtnAry[3] = operKey.substring(6,8);
    	rtnAry[4] = operKey.substring(8,11);
    	rtnAry[5] = operKey.substring(11,15);
    	  
    	return rtnAry;
    }
}

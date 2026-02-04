package kda;

public class WorkData 
{
	// REAL
	//public static String ROOT		= "/";
	//public static String UPLOAD		= "/upload/";
	
	//	public static String UPLODAD_LICENSE = "/upload/license_inspection/";
	//public static String UPLOAD_LICENSE_RENEWAL = "/upload/license_renewal/";
	//public static String UPLOAD_EDU_TEMP = UPLODAD_LICENSE  + "temp/";
	//public static String UPLOAD_EUD_GREEN = "/edu/green_down/";
	
	//public static String IPIN_PATH		= "D:/WEB/dietitian.or.kr_ver3/WEB-INF/";
	//public static String PROPERTIES 	= "D:/WEB/dietitian.or.kr_ver3/WEB-INF/properties/";
	//public static String DOMAIN			= "http://dietitian.or.kr";
	//public static String GIROMAIL		= "dietitian@paran.com";
	//public static String MAGAZINEMAIL 	= "center@dietitian.or.kr";
	//public static String CMS_MAIL 		= "dietitian@paran.com";
	
	//	public static String DEPOSIT_TO_MAIL = "center@dietitian.or.kr";
	
	//public static String CENTER_FROM_MAIL = "center@dietitian.or.kr";
	//public static String CENTER_FROM_MAIL_NAME = "center";
	
	//	public static String MASTER_USER = "ekdldjxm_!@##@!~";

	//public static String CART_SIMAGE = "./sImage/";
	//public static String UPLOAD_CART_IMAGE_PATH = "/pages/work/publication/sImage/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
	//public static String UPLOAD_CART_FRONT_PATH = "/pages/work/publication/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
	
//	public static String IS_DEV		= "N";	

	
	// DEV
		public static String ROOT		= "/";
	public static String UPLOAD		= "/upload/";
	
	public static String UPLODAD_LICENSE = "/upload/license_inspection/";
	public static String UPLOAD_LICENSE_RENEWAL = "/upload/license_renewal/";
	public static String UPLOAD_EDU_TEMP = UPLODAD_LICENSE  + "temp/";
	public static String UPLOAD_EUD_GREEN = "/edu/green_down/";
	
	//public static String IPIN_PATH		= "C:/WEB_REF_N_TOBEDEV/workspace/dietitian.or.kr_ver3/WebContent"; //DEV
	//public static String PROPERTIES 	= "C:/WEB_REF_N_TOBEDEV/workspace/dietitian.or.kr_ver3/WebContent/WEB-INF/properties/";//DEV 
	public static String IPIN_PATH		= "D:/WEB/dietitian.or.kr_ver3/WEB-INF/"; //REAL
	public static String PROPERTIES 	= "D:/WEB/dietitian.or.kr_ver3/WEB-INF/properties/"; //REAL
	public static String DOMAIN			= "https://dietitian.or.kr";//"http://210.127.56.232:5050";
	//2022.09.08 메일주소 변경
	public static String GIROMAIL		= "kdacenter@kdiet.or.kr";
	public static String MAGAZINEMAIL 	= "kdacenter@kdiet.or.kr";
	public static String CMS_MAIL 		= "kdacenter@kdiet.or.kr";

	public static String DEPOSIT_TO_MAIL = "kdacenter@kdiet.or.kr";
	
	public static String CENTER_FROM_MAIL = "kdacenter@kdiet.or.kr";
	public static String CENTER_FROM_MAIL_NAME = "kdacenter";
	
	public static String MASTER_USER = "ekdldjxm_!@##@!~";

	public static String CART_SIMAGE = "./sImage/";
	public static String UPLOAD_CART_IMAGE_PATH = "/pages/work/publication/sImage/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
	public static String UPLOAD_CART_FRONT_PATH = "/pages/work/publication/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
	
	public static String IS_DEV		= "Y";	
	public static String ENC_KEY 	= "E66DCEB95BFBD45DF9DFAEEBCB092B5DC2EB3BF0"; // KCP KEY (반드시 외부에 노출되지 않도록 관리하시기 바랍니다.) 

	
	// KOY
//	public static String ROOT		= "/";
//	public static String UPLOAD		= "/upload/";
//	
//	public static String UPLODAD_LICENSE = "/upload/license_inspection/";
//	public static String UPLOAD_LICENSE_RENEWAL = "/upload/license_renewal/";
//	public static String UPLOAD_EDU_TEMP = UPLODAD_LICENSE  + "temp/";
//	public static String UPLOAD_EUD_GREEN = "/edu/green_down/";
//	
//	public static String IPIN_PATH		= "D:\\WORK2\\KDA\\workspace\\dietitian.or.kr_ver3\\WebContent";
//	public static String PROPERTIES 	= "D:\\WORK2\\KDA\\workspace\\dietitian.or.kr_ver3\\WebContent\\WEB-INF\\properties\\";
//	public static String DOMAIN			= "http://127.0.0.1:9090";
//	public static String GIROMAIL		= "koy@orderinc.co.kr";
//	public static String MAGAZINEMAIL 	= "koy@orderinc.co.kr";
//	public static String CMS_MAIL 		= "koy@orderinc.co.kr";
//
//	public static String DEPOSIT_TO_MAIL = "koy@orderinc.co.kr";
//	
//	public static String CENTER_FROM_MAIL = "koy@orderinc.co.kr";
//	public static String CENTER_FROM_MAIL_NAME = "center";
//	
//	public static String MASTER_USER = "ekdldjxm_!@##@!~";
//
//	public static String CART_SIMAGE = "./sImage/";
//	public static String UPLOAD_CART_IMAGE_PATH = "/pages/work/publication/sImage/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
//	public static String UPLOAD_CART_FRONT_PATH = "/pages/work/publication/"; //http://www.dietitian.or.kr/publ/Store/sImage/94723275820150422152458.jpg
//	
//	public static String IS_DEV		= "Y";	

	
	
	public static String GetLevelName(int code){
		String name = "";
		switch (code){
			case 1 : name = "최고관리자";
			case 2 : name = "중간관리자";			
			case 3 : name = "회원▲▲";			
			case 4 : name = "회원▲";			
			case 5 : name = "회원";			
			case 6 : name = "비회원";
		}
		
		return name;
	}

}

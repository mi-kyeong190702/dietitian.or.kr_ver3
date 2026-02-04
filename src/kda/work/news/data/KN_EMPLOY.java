package kda.work.news.data;

import kda.spring.abstr.KdaAbstractDto;
import kda.utils.KdaStringUtil;
import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@Data
public class KN_EMPLOY  extends KdaAbstractDto {
	private int 	eindex;
	private String 	epwd;
	private String 	ecname;
	private String 	ecpname;
	private String 	ectel;
	
	private String 	ectel1;
	private String 	ectel2;
	private String 	ectel3;
	
	private String 	ecfax;
	private String 	ecfax1;
	private String 	ecfax2;
	private String 	ecfax3;
	
	private String 	ecemail;	
	private String 	echome;
	
	private String 	ecpost;
	private String 	ecaddress;
	private String 	ecpart;
	private String[]  ecpartAry;
	
	private String 	eclimitdate;
	private String 	eclimit_day;
	private String 	eclimit_tm;
	
	private int 	ecnumber;
	private String 	ecrtype;
	private String[] ecrtypeAry;
	
	private String 	erhistory;
	private String 	ermarry = "무관";
	private String 	ersex = "무관";
	private int 	erfamily;
	
	private String 	ettime;
	private String 	ettime1;
	private String  ettime2;
	
	/*2022.08.12 근무시간 특이사항 추가*/
	private String 	ettimecontents;
	
	private String 	etlocation;
	private int 	etprice;
	private int 	etsprice;
	private String 	etcontents;
	private String 	etwel;
	private String[] etwelAry;
	
	private String epprocess;
	private String epprocess1;
	private String epprocess2;
	private String epprocess3;
	private String epprocess4;
	
	private String 	eppaper;
	private String[] eppaperAry;
	private String 	epreport;
	private String 	epetc;
	private String 	edate;
	private int 	eview = 0;
	private String 	bbs_file_name;
	private String 	bbs_file_url;
	private String 	bbs_file_type;
	private long 	bbs_file_size;
	private int 	bbs_file_down;
	private String 	ecrtypetext;
	private String 	ecparttext;
	private String 	etweltext;
	private String 	eppapertext;
	
	private CommonsMultipartFile bbs_file;
	
	public void convertForm() {
		String temp[] = this.ectel.split("-");
		if( temp.length == 3 ) {
			this.ectel1 = temp[0];
			this.ectel2 = temp[1];
			this.ectel3 = temp[2];	
		}
		temp = this.ecfax.split("-");
		if( temp.length == 3  ) {
			this.ecfax1 = temp[0];
			this.ecfax2 = temp[1];
			this.ecfax3 = temp[2];	
		}
		
		this.eclimit_day = this.eclimitdate;
		
		temp = this.ettime.split("~");
		if( temp.length == 2) {
			this.ettime1 = KdaStringUtil.reverseTimeKo(temp[0]);
			this.ettime2 = KdaStringUtil.reverseTimeKo(temp[1]);		
		}
		
		temp = this.epprocess.split("\\,");
		if( temp.length > 0 ) 
			this.epprocess1 = temp[0];
		if( temp.length > 1 )
			this.epprocess2 = temp[1];
		if( temp.length > 2 )
			this.epprocess3 = temp[2];
		if ( temp.length > 3 )
			this.epprocess4 = temp[3];
		
		temp = this.eclimitdate.split(" ");
		if( temp.length == 2 ) {
			this.eclimit_day = temp[0];
			this.eclimit_tm = temp[1];
		}
		
		this.ecpartAry = this.ecpart.split(",");
		this.ecrtypeAry = this.ecrtype.split(",");
		this.etwelAry = this.etwel.split(",");
		this.eppaperAry = this.eppaper.split(",");
 	}
	
	public void convertDB() {
		this.ectel = this.ectel1 + "-" + this.ectel2 + "-" + this.ectel3;
		this.ecfax = this.ecfax1 + "-" + this.ecfax2 + "-" + this.ecfax3;
		this.eclimitdate = this.eclimit_day + " " + this.eclimit_tm;
		
		this.ettime1 =  KdaStringUtil.convertTimeKo(this.ettime1);
		this.ettime2 =  KdaStringUtil.convertTimeKo(this.ettime2);
		
		this.ettime = this.ettime1 + "~" + this.ettime2;
		this.epprocess = this.epprocess1 + "," + this.epprocess2 + "," + this.epprocess3 + "," + this.epprocess4;
		
		this.ecpart =  StringUtils.arrayToCommaDelimitedString(this.ecpartAry);
		this.ecrtype =  StringUtils.arrayToCommaDelimitedString(this.ecrtypeAry);
		this.etwel =  StringUtils.arrayToCommaDelimitedString(this.etwelAry);
		this.eppaper = StringUtils.arrayToCommaDelimitedString(this.eppaperAry);
	}
	
	
}

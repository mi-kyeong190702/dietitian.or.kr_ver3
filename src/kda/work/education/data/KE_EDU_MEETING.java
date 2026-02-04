package kda.work.education.data;

import kda.utils.KdaStringUtil;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class KE_EDU_MEETING {
	private String idx;
	private String name;
	private String birth;
	private String lic_no;
	private String member_flag;
	private String office_name;
	private String zip;
	private String addr;
	private String tel;
	private String tel_hp;
	private String email;
	private String lic_clinic_flag;
	private String lic_supply_flag;
	private String join_flag;
	private String join_flag1;
	private String join_flag2;
	private String pay_date;
	private String pay_amount;
	private String reg_date;
	private String pay_flag;
	private String diet_License01;
	private String diet_License02;
	private String diet_License03;
	private String diet_License04;
	private String branch_name;
	private String big_name;
	private String sect_name;
	private String gtype;
	private String card_Status;
	private int inx_key = 0;
	private String baccname;
	private String agree_yn;
	private String nice_agree_yn;
	private String nice_no;
	private String trainingName_no;
	private String online_yn;
	private String online_yn2;
	private String ebook_yn;
	

	public void convertValue() {
		this.lic_clinic_flag = "0";
		this.lic_supply_flag = "0";
		
		this.diet_License01		= "N";
		this.diet_License02		= "N";
		this.diet_License03		= "N";
		this.diet_License04		= "N";
		
		this.join_flag1 = KdaStringUtil.nullToString(this.join_flag1);
		this.join_flag2 = KdaStringUtil.nullToString(this.join_flag2);
		this.agree_yn = KdaStringUtil.nullToString(this.agree_yn);
		this.online_yn2 = KdaStringUtil.nullToString(this.online_yn2);
		
		if( this.join_flag1.equals("Y") && this.join_flag2.equals("Y") ) {
			this.join_flag = "3";
		} else if ( this.join_flag1.equals("Y") ) {
			this.join_flag = "1";
		} else if (this.join_flag2.equals("Y")) {
			this.join_flag = "2";
		}
		
		/*if( !this.agree_yn.equals("y") || !this.agree_yn.equals("n") ) {
			this.agree_yn = "N/A";
		} 
*/
	}

}

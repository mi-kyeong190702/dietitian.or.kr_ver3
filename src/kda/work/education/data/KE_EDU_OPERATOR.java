package kda.work.education.data;

import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Data
public class KE_EDU_OPERATOR {

	private String code_kind = "";
	private String code_certifi ="";
	private String code_seq = "";
	private String code_bran = "";
	private String bran_seq = "";
	private String receipt_no = "";
	private String person_yn = "";
	private String pers_birth = "";
	private String oper_birth = "";
	private String code_pers = "";
	
	private String edutest_name = "";
	private String outside_yn = "";
	private int new_cost = 0;
	private int new_cost_nomem = 0;	
	private int oper_start_dt = 0;
	private int start_dt = 0;
	private int oper_end_dt = 0;
	private String operation_place = "";
	private String oper_state = "";
	private String yyyy = "";
	private String account_way = "";
	private String account_end_dt = "";
	private String detcodename = "";
	private String code_pay_flag = "";
	private String payname = "";
	private String operkey = "";
	private String register = "";
	private String regi_date = "";
	
	private String oper_name = "";
	private String oper_lic_no = "";
	private String oper_comp_name1 = "";
	private String pers_tel = "";
	private String company_tel = "";
	private String oper_hp = "";
	private String code_post = "";
	private String code_post1 = "";
	private String code_post2 = "";
	private String oper_comp_add1_2 = "";
	private String code_operation = "";
	private String edu_test_key = "";
	private String remittor = "";
	private String deposit_due_date = "";
	private String refund_bank = "";
	private String refund_account = "";
	private String refund_account_owner = "";
	private String oper_email = "";
	private String email1 = "";
	private String email2 = "";
	private int pers_career_y = 0;
	private int pers_career_m = 0;
	private MultipartFile oper_add_file = null;
	
	private String oper_key ="";
	private String update_kind = "";
	
	private String btext;
	
	/* 재시험 관련 */
	private String result_end_dt;
	private String once_oper_key = "";
	private String bank_nm = "";
	private String code_email_comp = "";
	
	private String oper_account = "";
	private String bank_name = "";
	
	/* TEST_입금_은행 */
	private String test_bank_name = "";
	private String test_bank_acc = "";
	private String test_bank_acc_owner = "";
	
	/* 자격증 관련 */
  	private int season;
  	private String add_file_no;
	
	public boolean convertEduTestKey(){
		String eduTestKey = this.edu_test_key;
		if( eduTestKey.length() > 8 ) {
			/* 
			this.code_kind = eduTestKey.substring(0,1);
			this.code_certifi = eduTestKey.substring(1,2);
			this.code_seq = eduTestKey.substring(2, 5);
			this.code_bran = eduTestKey.substring(5,7);
			this.bran_seq = eduTestKey.substring(7,9);
			*/
			this.code_kind = eduTestKey.substring(0,1);
			this.code_certifi = eduTestKey.substring(1,2);
			this.code_seq = eduTestKey.substring(2, 6);
			this.code_bran = eduTestKey.substring(6,8);
			this.bran_seq = eduTestKey.substring(8,11);
			return true;
		} else {
			return false;
		}
	}
	
	public String makeEduTestKey() {
		String eduTestKey = "";
		eduTestKey += this.code_kind;
		eduTestKey += this.code_certifi;
		eduTestKey += this.code_seq;
		eduTestKey += this.code_bran;
		eduTestKey += this.bran_seq;
		return eduTestKey;
	}
	
	public String makeOperKey() {
		String operKey = "";
		operKey += this.code_kind;
		operKey += this.code_certifi;
		operKey += this.code_seq;
		operKey += this.code_bran;
		operKey += this.bran_seq;
		operKey += this.receipt_no;
		return operKey;
	}
	
	public void setDB() {
		this.deposit_due_date = this.deposit_due_date.replaceAll("-", "");
				
		if( this.code_bran.equals("01")) this.bank_nm = "신한은행";
		if( this.code_bran.equals("02")) this.bank_nm = "우리은행";
		if( this.code_bran.equals("03")) this.bank_nm = "부산은행";
		if( this.code_bran.equals("04")) this.bank_nm = "수협";
		if( this.code_bran.equals("05")) this.bank_nm = "농협";
		if( this.code_bran.equals("06")) this.bank_nm = "농협";
		if( this.code_bran.equals("07")) this.bank_nm = "농협";
		if( this.code_bran.equals("08")) this.bank_nm = "농협";
		if( this.code_bran.equals("09")) this.bank_nm = "농협";
		if( this.code_bran.equals("10")) this.bank_nm = "신한은행";
		if( this.code_bran.equals("11")) this.bank_nm = "대구은행";
		if( this.code_bran.equals("12")) this.bank_nm = "경남은행";
		if( this.code_bran.equals("13")) this.bank_nm = "경남은행";
		if( this.code_bran.equals("14")) this.bank_nm = "농협";
		
		this.oper_email = this.email1 + "@" + this.email2;
	}
	
}

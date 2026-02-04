package kda.member.data;

import java.util.Map;

import kda.login.data.LOGININFO;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class MEMBER_PAY {

	private String good_name 	= "";
	private String user_id  	= "";
	private String pers_name 	= "";
	private String pers_birth	= "";
	private String send_name 	= "";
	private String pers_hp		= "";
	private String pers_tel 	= "";
	private String email 		= "";
	private String code_bran	= "";
	private String code_member 	= "";
	private String method 		= "";
	
	private String dues_bran 	= "";
	private String dues_name 	= "";
	private String send_date 	= "";
	private String ref_msg 		= "";
	
    private String local_name = "";
    private String bank = "";
    private String account_num = "";
    private String local_tel = "";
    private String local_email = "";
    private String account_owner = "";
       
	private Map bankMap = null;
    
	public MEMBER_PAY() {
		
	}
	
	public MEMBER_PAY(PERSON_M_TBL person) {
		this.pers_name = person.getPers_name();
		this.pers_birth = person.getPers_birth();
		this.send_name = person.getPers_name();
		this.code_bran = person.getCode_bran();
		this.code_member = person.getCode_member();
		this.user_id = person.getId();
		this.pers_tel = person.getPers_tel();
		
		this.email = person.getEmail();
	}

}

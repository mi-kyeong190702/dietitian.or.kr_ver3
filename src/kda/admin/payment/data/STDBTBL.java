package kda.admin.payment.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class STDBTBL extends KdaAbstractDto{

	
	private String edu_name;
	private String code_session;
	private String code_season;
	private String good_mny;
	private String code_inst;
	private String edu_open;
	private String pers_no;
	private String pers_name;
	private String pers_tel;
	private String pers_hp;
	private String email;
	private String id_name;
	
}

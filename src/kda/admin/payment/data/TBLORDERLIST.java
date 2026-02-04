package kda.admin.payment.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class TBLORDERLIST extends KdaAbstractDto{

	
	private int o_code;
	private String code_bran;
	private String o_gubun;
	private String req_tx;
	private String res_cd;
	private String res_msg;
	private String ordr_idxx;
	private String tno;
	private int good_mny;
	private String good_name;
	private String buyr_tel1;
	private String buyr_tel2;
	private String buyr_mail;
	private String card_cd;
	private String card_name;
	private String app_time;
	private String app_no;
	private String quota;
	private String dbindate;
	private String id;
	private String goods_code_num;
	private String o_etc;
	private String buyr_name;
	private int edu_kind;
	private String order_status;
	private String order_cancel_msg;
	private String order_cancel_name;
	private String order_cancel_date;
	private String pers_birth;
	
	private int num;
	private int round_economent;
	private int bindex;
	private String code_pers;
	private String startm;
	private String endm;
	private int curPage=1;
	
}

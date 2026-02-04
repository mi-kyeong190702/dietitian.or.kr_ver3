package kda.common.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TBL_ORDER_LIST
{
	double o_code	= 0l;
	String code_bran;
	String o_gubun;
	String req_tx;
	String res_cd;
	String res_msg;
	String ordr_idxx;
	String tno;
	int    good_mny;
	String good_name;
	String buyr_tel1;
	String buyr_tel2;
	String buyr_mail;
	String card_cd;
	String card_name;
	String app_time;
	String app_no;
	String quota;
	String dbindate;
	String pers_birth;
	String id;
	String goods_code_num		= "0";
	String o_etc;
	String buyr_name;
	int    edu_kind				= 1;
	String order_Status			= "00";
	String order_cancel_msg		= "";
	String order_cancel_name	= "";
	String order_cancel_date	= "";

}

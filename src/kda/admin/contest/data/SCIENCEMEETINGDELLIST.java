package kda.admin.contest.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class SCIENCEMEETINGDELLIST extends KdaAbstractDto{
	
	private int idx;
	private String name;
	private String pers_no;
	private String office_name;
	private String tel_hp;
	private String in_Date;
	private String in_payDate;
	private String in_payPrice;
	private String bank_name;
	private String bank_num;
	private String bank_userName;
	private String dbindate;
	private String c_Flag;
	private String lic_no;
	private String ipgum_bambup;
	private String del_date;
	private String del_price;
	private String online_yn;

}

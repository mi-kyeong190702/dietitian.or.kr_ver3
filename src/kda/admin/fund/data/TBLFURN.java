package kda.admin.fund.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class TBLFURN extends KdaAbstractDto{
	
	private int fund_key;
	private String fund_name;
	private String fund_group;
	private String fund_group_job;
	private String fund_bank_name;
	private String fund_guja1;
	private String fund_guja_etc;
	private String fund_guja_price;
	private String regdate;
	private String fund_account;
	private String fund_liscense;
	private String fund_h_tel;       
	private String h_post1;           
	private String h_post2;           
	private String h_post_add;        
	private String h_post_add_detail; 
	private String fund_c_name;       
	private String fund_c_tel;
	private String c_post1;           
	private String c_post2;           
	private String c_post_add;        
	private String c_post_add_detail; 
	private String fund_pcs1;         
	private String fund_email;
	private String fund_method;       
	private String fund_month;        
	private String fund_day;          
	private String fund_month2;       
	private String fund_day2;
	private String fund_price;       
	private String fund_input_name;   
	private String fund_input_name2;   
	

}

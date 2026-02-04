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
	public int getFund_key() {
		return fund_key;
	}
	public void setFund_key(int fund_key) {
		this.fund_key = fund_key;
	}
	public String getFund_name() {
		return fund_name;
	}
	public void setFund_name(String fund_name) {
		this.fund_name = fund_name;
	}
	public String getFund_group() {
		return fund_group;
	}
	public void setFund_group(String fund_group) {
		this.fund_group = fund_group;
	}
	public String getFund_group_job() {
		return fund_group_job;
	}
	public void setFund_group_job(String fund_group_job) {
		this.fund_group_job = fund_group_job;
	}
	public String getFund_bank_name() {
		return fund_bank_name;
	}
	public void setFund_bank_name(String fund_bank_name) {
		this.fund_bank_name = fund_bank_name;
	}
	public String getFund_guja1() {
		return fund_guja1;
	}
	public void setFund_guja1(String fund_guja1) {
		this.fund_guja1 = fund_guja1;
	}
	public String getFund_guja_etc() {
		return fund_guja_etc;
	}
	public void setFund_guja_etc(String fund_guja_etc) {
		this.fund_guja_etc = fund_guja_etc;
	}
	public String getFund_guja_price() {
		return fund_guja_price;
	}
	public void setFund_guja_price(String fund_guja_price) {
		this.fund_guja_price = fund_guja_price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getFund_account() {
		return fund_account;
	}
	public void setFund_account(String fund_account) {
		this.fund_account = fund_account;
	}
	public String getFund_liscense() {
		return fund_liscense;
	}
	public void setFund_liscense(String fund_liscense) {
		this.fund_liscense = fund_liscense;
	}
	public String getFund_h_tel() {
		return fund_h_tel;
	}
	public void setFund_h_tel(String fund_h_tel) {
		this.fund_h_tel = fund_h_tel;
	}
	public String getH_post1() {
		return h_post1;
	}
	public void setH_post1(String h_post1) {
		this.h_post1 = h_post1;
	}
	public String getH_post2() {
		return h_post2;
	}
	public void setH_post2(String h_post2) {
		this.h_post2 = h_post2;
	}
	public String getH_post_add() {
		return h_post_add;
	}
	public void setH_post_add(String h_post_add) {
		this.h_post_add = h_post_add;
	}
	public String getH_post_add_detail() {
		return h_post_add_detail;
	}
	public void setH_post_add_detail(String h_post_add_detail) {
		this.h_post_add_detail = h_post_add_detail;
	}
	public String getFund_c_name() {
		return fund_c_name;
	}
	public void setFund_c_name(String fund_c_name) {
		this.fund_c_name = fund_c_name;
	}
	public String getFund_c_tel() {
		return fund_c_tel;
	}
	public void setFund_c_tel(String fund_c_tel) {
		this.fund_c_tel = fund_c_tel;
	}
	public String getC_post1() {
		return c_post1;
	}
	public void setC_post1(String c_post1) {
		this.c_post1 = c_post1;
	}
	public String getC_post2() {
		return c_post2;
	}
	public void setC_post2(String c_post2) {
		this.c_post2 = c_post2;
	}
	public String getC_post_add() {
		return c_post_add;
	}
	public void setC_post_add(String c_post_add) {
		this.c_post_add = c_post_add;
	}
	public String getC_post_add_detail() {
		return c_post_add_detail;
	}
	public void setC_post_add_detail(String c_post_add_detail) {
		this.c_post_add_detail = c_post_add_detail;
	}
	public String getFund_pcs1() {
		return fund_pcs1;
	}
	public void setFund_pcs1(String fund_pcs1) {
		this.fund_pcs1 = fund_pcs1;
	}
	public String getFund_email() {
		return fund_email;
	}
	public void setFund_email(String fund_email) {
		this.fund_email = fund_email;
	}
	public String getFund_method() {
		return fund_method;
	}
	public void setFund_method(String fund_method) {
		this.fund_method = fund_method;
	}
	public String getFund_month() {
		return fund_month;
	}
	public void setFund_month(String fund_month) {
		this.fund_month = fund_month;
	}
	public String getFund_day() {
		return fund_day;
	}
	public void setFund_day(String fund_day) {
		this.fund_day = fund_day;
	}
	public String getFund_month2() {
		return fund_month2;
	}
	public void setFund_month2(String fund_month2) {
		this.fund_month2 = fund_month2;
	}
	public String getFund_day2() {
		return fund_day2;
	}
	public void setFund_day2(String fund_day2) {
		this.fund_day2 = fund_day2;
	}
	public String getFund_price() {
		return fund_price;
	}
	public void setFund_price(String fund_price) {
		this.fund_price = fund_price;
	}
	public String getFund_input_name() {
		return fund_input_name;
	}
	public void setFund_input_name(String fund_input_name) {
		this.fund_input_name = fund_input_name;
	}
	public String getFund_input_name2() {
		return fund_input_name2;
	}
	public void setFund_input_name2(String fund_input_name2) {
		this.fund_input_name2 = fund_input_name2;
	}   
	

}

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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPers_no() {
		return pers_no;
	}
	public void setPers_no(String pers_no) {
		this.pers_no = pers_no;
	}
	public String getOffice_name() {
		return office_name;
	}
	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}
	public String getTel_hp() {
		return tel_hp;
	}
	public void setTel_hp(String tel_hp) {
		this.tel_hp = tel_hp;
	}
	public String getIn_Date() {
		return in_Date;
	}
	public void setIn_Date(String in_Date) {
		this.in_Date = in_Date;
	}
	public String getIn_payDate() {
		return in_payDate;
	}
	public void setIn_payDate(String in_payDate) {
		this.in_payDate = in_payDate;
	}
	public String getIn_payPrice() {
		return in_payPrice;
	}
	public void setIn_payPrice(String in_payPrice) {
		this.in_payPrice = in_payPrice;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_num() {
		return bank_num;
	}
	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}
	public String getBank_userName() {
		return bank_userName;
	}
	public void setBank_userName(String bank_userName) {
		this.bank_userName = bank_userName;
	}
	public String getDbindate() {
		return dbindate;
	}
	public void setDbindate(String dbindate) {
		this.dbindate = dbindate;
	}
	public String getC_Flag() {
		return c_Flag;
	}
	public void setC_Flag(String c_Flag) {
		this.c_Flag = c_Flag;
	}
	public String getLic_no() {
		return lic_no;
	}
	public void setLic_no(String lic_no) {
		this.lic_no = lic_no;
	}
	public String getIpgum_bambup() {
		return ipgum_bambup;
	}
	public void setIpgum_bambup(String ipgum_bambup) {
		this.ipgum_bambup = ipgum_bambup;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	public String getDel_price() {
		return del_price;
	}
	public void setDel_price(String del_price) {
		this.del_price = del_price;
	}
	public String getOnline_yn() {
		return online_yn;
	}
	public void setOnline_yn(String online_yn) {
		this.online_yn = online_yn;
	}
	private String bank_userName;
	private String dbindate;
	private String c_Flag;
	private String lic_no;
	private String ipgum_bambup;
	private String del_date;
	private String del_price;
	private String online_yn;

}

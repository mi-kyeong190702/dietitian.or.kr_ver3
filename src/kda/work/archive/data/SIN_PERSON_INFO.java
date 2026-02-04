package kda.work.archive.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class SIN_PERSON_INFO {
	
	private int idx;
	private String pers_name;
	private String pers_id;
	private String code_sex;
	private String lic_no;
	private String email;
	private String pers_hp;
	private String company_name;
	private String code_bran;
	private String code_part;
	private String code_great;
	private String code_small;
	private String code_user;
	
	public SIN_PERSON_INFO() {
		// TODO Auto-generated constructor stub
	}

	public SIN_PERSON_INFO(int idx, String pers_name, String pers_id, String code_sex, String lic_no, String email,
			String pers_hp, String company_name, String code_bran, String code_part, String code_great,
			String code_small, String code_user) {
		super();
		this.idx = idx;
		this.pers_name = pers_name;
		this.pers_id = pers_id;
		this.code_sex = code_sex;
		this.lic_no = lic_no;
		this.email = email;
		this.pers_hp = pers_hp;
		this.company_name = company_name;
		this.code_bran = code_bran;
		this.code_part = code_part;
		this.code_great = code_great;
		this.code_small = code_small;
		this.code_user = code_user;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPers_name() {
		return pers_name;
	}

	public void setPers_name(String pers_name) {
		this.pers_name = pers_name;
	}

	public String getPers_id() {
		return pers_id;
	}

	public void setPers_id(String pers_id) {
		this.pers_id = pers_id;
	}

	public String getCode_sex() {
		return code_sex;
	}

	public void setCode_sex(String code_sex) {
		this.code_sex = code_sex;
	}

	public String getLic_no() {
		return lic_no;
	}

	public void setLic_no(String lic_no) {
		this.lic_no = lic_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPers_hp() {
		return pers_hp;
	}

	public void setPers_hp(String pers_hp) {
		this.pers_hp = pers_hp;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCode_bran() {
		return code_bran;
	}

	public void setCode_bran(String code_bran) {
		this.code_bran = code_bran;
	}

	public String getCode_part() {
		return code_part;
	}

	public void setCode_part(String code_part) {
		this.code_part = code_part;
	}

	public String getCode_great() {
		return code_great;
	}

	public void setCode_great(String code_great) {
		this.code_great = code_great;
	}

	public String getCode_small() {
		return code_small;
	}

	public void setCode_small(String code_small) {
		this.code_small = code_small;
	}

	public String getCode_user() {
		return code_user;
	}

	public void setCode_user(String code_user) {
		this.code_user = code_user;
	}
	
	
	
}

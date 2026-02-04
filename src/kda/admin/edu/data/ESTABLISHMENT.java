package kda.admin.edu.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

@Component
@Data public class ESTABLISHMENT extends KdaAbstractDto{
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSrchTy() {
		return srchTy;
	}
	public void setSrchTy(String srchTy) {
		this.srchTy = srchTy;
	}
	public String getSrchName() {
		return srchName;
	}
	public void setSrchName(String srchName) {
		this.srchName = srchName;
	}
	public String getSrchNo() {
		return srchNo;
	}
	public void setSrchNo(String srchNo) {
		this.srchNo = srchNo;
	}
	public String getCode_pers() {
		return code_pers;
	}
	public void setCode_pers(String code_pers) {
		this.code_pers = code_pers;
	}
	public String getGroupcode() {
		return groupcode;
	}
	public void setGroupcode(String groupcode) {
		this.groupcode = groupcode;
	}
	public String getGroupcodename() {
		return groupcodename;
	}
	public void setGroupcodename(String groupcodename) {
		this.groupcodename = groupcodename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPers_name() {
		return pers_name;
	}
	public void setPers_name(String pers_name) {
		this.pers_name = pers_name;
	}
	public String getLic_no() {
		return lic_no;
	}
	public void setLic_no(String lic_no) {
		this.lic_no = lic_no;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCode_new() {
		return code_new;
	}
	public void setCode_new(String code_new) {
		this.code_new = code_new;
	}
	public String getCode_old() {
		return code_old;
	}
	public void setCode_old(String code_old) {
		this.code_old = code_old;
	}
	public String getPers_birth() {
		return pers_birth;
	}
	public void setPers_birth(String pers_birth) {
		this.pers_birth = pers_birth;
	}
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getWork_yy() {
		return work_yy;
	}
	public void setWork_yy(String work_yy) {
		this.work_yy = work_yy;
	}
	public String getWork_mm() {
		return work_mm;
	}
	public void setWork_mm(String work_mm) {
		this.work_mm = work_mm;
	}
	public String getEdu_type() {
		return edu_type;
	}
	public void setEdu_type(String edu_type) {
		this.edu_type = edu_type;
	}
	public String getEdu_type_text() {
		return edu_type_text;
	}
	public void setEdu_type_text(String edu_type_text) {
		this.edu_type_text = edu_type_text;
	}
	public String getEdu_area() {
		return edu_area;
	}
	public void setEdu_area(String edu_area) {
		this.edu_area = edu_area;
	}
	public String getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}
	public String getRegi_time() {
		return regi_time;
	}
	public void setRegi_time(String regi_time) {
		this.regi_time = regi_time;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	private int num;
	private String srchTy;
	private String srchName;
	private String srchNo;
	
	
	private String code_pers;
	private String groupcode;
	private String groupcodename;
	private String id;
	private String pers_name;
	private String lic_no;
	private String state;
	private String code_new;	
	private String code_old;	
	private String pers_birth;
	
	
	
	
	private int idx;
	private String name;
	private String birth;
	private String work_yy;
	private String work_mm;
	private String edu_type;
	private String edu_type_text;
	private String edu_area;
	private String regi_date;
	private String regi_time;
	
	private String hp;
	private String email;
	private String big_name;
	private String company_name;

}

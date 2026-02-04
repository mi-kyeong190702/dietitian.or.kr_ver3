package kda.mypage.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class MYMEMBEREVENT 
{	
	private String code_pers = "";
	private int comp_seq;
	private String pers_name = "";
	private String lic_no = "";
	private String pers_tel = "";
	private String pers_hp = "";
	private String email = "";
	private String code_great = "";
	private String code_part = "";	
	private String code_small = "";
	private String code_post= "";
	private String pers_add = "";
	private String pers_add_detail = "";
	private String company_name = "";
	private String company_post = "";
	private String company_add = "";
	private String company_add_detail = "";
	private String code_place = "";
	private String pers_tel_org = "";
	private String pers_hp_org = "";
	private String email_org = "";
	private String code_great_org = "";
	private String code_part_org = "";	
	private String code_small_org = "";
	private String code_post_org = "";
	private String pers_add_org = "";
	private String pers_add_detail_org = "";
	private String company_name_org = "";
	private String company_post_org = "";
	private String company_add_org = "";
	private String company_add_detail_org = "";
	private String code_place_org = "";
	
	private String register = "";
}
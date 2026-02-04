package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TblResearchMember
{
	//Tbl_Research_Member ?¤ë¬¸???µì??
	private int resm_idx; 
	private String resm_name;
	private String resm_licensenum;
	private String resm_tel_no;
	private String resm_post;
	private String resm_addr;
	private String resm_ip;
	private String resm_indate;
}
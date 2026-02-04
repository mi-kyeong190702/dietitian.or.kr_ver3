package kda.work.education.data;

import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class KE_EDU_OPER_ADD_FILE {

	private String code_kind;
	private String code_certifi;
	private String code_seq;
	private String code_bran;
	private String bran_seq;
	private String receipt_no;
	private String add_file_no;
	private String chang_file_name;
	private String extension;
	private double file_size;
	private String regi_date;
	
	public KE_EDU_OPER_ADD_FILE(){
	}
	
	public KE_EDU_OPER_ADD_FILE(String operKey, String addFileNo, String chang_file_name, double file_size) {
		String[] rtnAry = KdaUtil.convertOperKey(operKey);
		this.code_kind = rtnAry[0];
		this.code_certifi = rtnAry[1];
		this.code_seq = rtnAry[2];
		this.code_bran = rtnAry[3];
		this.bran_seq = rtnAry[4];
		this.receipt_no = rtnAry[5];
		this.add_file_no = addFileNo;
		this.chang_file_name = chang_file_name;
		this.file_size = file_size;
		this.extension = KdaStringUtil.getExtension(this.chang_file_name);
	}
	

	
}

package kda.work.education.data;

import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Data
public class KE_EDU_CERTIFI {

	private int classify_code;
	
	private String code_pers;
	private String code_certifi;
	private String certifi_text;
	private String certifi_name;
	private String print_state;
	private String result_dt;
	private String result_no;
	private String result_start_dt;
	private String result_end_dt;
	
	private String code_seq;
	private int quarter;
	
	private String add_file_no;
	private String file_name;
	private String img_file;
	private String file_type;
	private String file_size;
	
	private String remittor = "";
	private String deposit_due_date = "";
	private String reissued_reason = "";
	
	private String add_file_2;		// DB상 첨부파일명
	private String add_file_5;		// DB상 첨부파일명
	
	private String add_file1;			// 사진 이미지 파일
	private MultipartFile add_file2;	// 압축 첨부파일
	
	private String pers_name = "";
	private String birth_no = "";
	private String lic_no = "";
	
	public void setDB() {
		this.deposit_due_date = this.deposit_due_date.replaceAll("-", "");
	}
	
}


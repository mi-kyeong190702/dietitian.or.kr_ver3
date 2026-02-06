package kda.main.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@Data
public class BANNER extends KdaAbstractDto {

	private int num;
	private int idx;
	private int banner_type = 0;
	private String banner_name = "";
	private String banner_img = "";
	private String link_url = "";
	private String link_target = "";
	private String use_yn = "Y";
	private int order_num = 1;
	
	private String user_id;
	private String user_name;
	private String regi_date;
	
	/** 이미지 업로드 파일 */
	private CommonsMultipartFile image_file;
	
	
}

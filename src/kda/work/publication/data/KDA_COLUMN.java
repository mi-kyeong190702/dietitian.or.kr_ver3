package kda.work.publication.data;

import kda.spring.abstr.KdaAbstractDto;
import kda.utils.KdaStringUtil;
import lombok.Data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@Data 
public class KDA_COLUMN extends KdaAbstractDto {
	private int idx;
	private String imagename;
	private String kda_title;
	private String kda_column;
	private String kda_special;
	private String kda_nd;
	private String kda_we;
	private String kda_news;
	private String kda_board;
	private String kda_picture;
	private String regidate;
	private String tagchecked;
	private String title_contents;
	private String kda_practice;
	private String kda_code;
	private String kda_yyyy;
	private String kda_mm;
	private String kda_url;
	private String kda_yn;
	
	private CommonsMultipartFile upload_image;
	
	public void setNotag2() {
		this.kda_column = KdaStringUtil.notag2( this.kda_column );
		this.kda_special = KdaStringUtil.notag2( this.kda_special );
		this.kda_nd = KdaStringUtil.notag2( this.kda_nd );
		this.kda_we = KdaStringUtil.notag2( this.kda_we );
		this.kda_news = KdaStringUtil.notag2( this.kda_news );
		this.kda_board = KdaStringUtil.notag2( this.kda_board );
		this.kda_picture = KdaStringUtil.notag2( this.kda_picture );
		this.title_contents = KdaStringUtil.notag2( this.title_contents );
		this.kda_practice = KdaStringUtil.notag2( this.kda_practice );
		this.kda_url = KdaStringUtil.notag2( this.kda_url );
				
	}
}

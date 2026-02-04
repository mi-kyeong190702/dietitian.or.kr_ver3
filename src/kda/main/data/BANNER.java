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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBanner_type() {
		return banner_type;
	}

	public void setBanner_type(int banner_type) {
		this.banner_type = banner_type;
	}

	public String getBanner_name() {
		return banner_name;
	}

	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}

	public String getBanner_img() {
		return banner_img;
	}

	public void setBanner_img(String banner_img) {
		this.banner_img = banner_img;
	}

	public String getLink_url() {
		return link_url;
	}

	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}

	public String getLink_target() {
		return link_target;
	}

	public void setLink_target(String link_target) {
		this.link_target = link_target;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}

	public CommonsMultipartFile getImage_file() {
		return image_file;
	}

	public void setImage_file(CommonsMultipartFile image_file) {
		this.image_file = image_file;
	}
	
	
}

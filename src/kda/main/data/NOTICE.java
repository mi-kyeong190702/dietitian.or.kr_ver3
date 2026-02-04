package kda.main.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class NOTICE
{
	private int 	bbs_board_code;
	private String	bbs_category;
	private String	bbs_contents;
	private int		bbs_comments_count;
	private Boolean	bbs_del_flag;
	private String	bbs_edit_date_dt;
	private int 	bbs_file_size;
	private String 	bbs_file_type;
	private String	bbs_file_url;
	private int		bbs_idx;
	private String	bbs_name;
	private Boolean	bbs_notice;
	private String	bbs_reg_date_dt;
	private String	bbs_step;
	private String	bbs_subject;
	private int		bbs_view;
	public int getBbs_board_code() {
		return bbs_board_code;
	}
	public void setBbs_board_code(int bbs_board_code) {
		this.bbs_board_code = bbs_board_code;
	}
	public String getBbs_category() {
		return bbs_category;
	}
	public void setBbs_category(String bbs_category) {
		this.bbs_category = bbs_category;
	}
	public String getBbs_contents() {
		return bbs_contents;
	}
	public void setBbs_contents(String bbs_contents) {
		this.bbs_contents = bbs_contents;
	}
	public int getBbs_comments_count() {
		return bbs_comments_count;
	}
	public void setBbs_comments_count(int bbs_comments_count) {
		this.bbs_comments_count = bbs_comments_count;
	}
	public Boolean getBbs_del_flag() {
		return bbs_del_flag;
	}
	public void setBbs_del_flag(Boolean bbs_del_flag) {
		this.bbs_del_flag = bbs_del_flag;
	}
	public String getBbs_edit_date_dt() {
		return bbs_edit_date_dt;
	}
	public void setBbs_edit_date_dt(String bbs_edit_date_dt) {
		this.bbs_edit_date_dt = bbs_edit_date_dt;
	}
	public int getBbs_file_size() {
		return bbs_file_size;
	}
	public void setBbs_file_size(int bbs_file_size) {
		this.bbs_file_size = bbs_file_size;
	}
	public String getBbs_file_type() {
		return bbs_file_type;
	}
	public void setBbs_file_type(String bbs_file_type) {
		this.bbs_file_type = bbs_file_type;
	}
	public String getBbs_file_url() {
		return bbs_file_url;
	}
	public void setBbs_file_url(String bbs_file_url) {
		this.bbs_file_url = bbs_file_url;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	public Boolean getBbs_notice() {
		return bbs_notice;
	}
	public void setBbs_notice(Boolean bbs_notice) {
		this.bbs_notice = bbs_notice;
	}
	public String getBbs_reg_date_dt() {
		return bbs_reg_date_dt;
	}
	public void setBbs_reg_date_dt(String bbs_reg_date_dt) {
		this.bbs_reg_date_dt = bbs_reg_date_dt;
	}
	public String getBbs_step() {
		return bbs_step;
	}
	public void setBbs_step(String bbs_step) {
		this.bbs_step = bbs_step;
	}
	public String getBbs_subject() {
		return bbs_subject;
	}
	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}
	public int getBbs_view() {
		return bbs_view;
	}
	public void setBbs_view(int bbs_view) {
		this.bbs_view = bbs_view;
	}
}

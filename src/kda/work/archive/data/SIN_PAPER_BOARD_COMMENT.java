package kda.work.archive.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class SIN_PAPER_BOARD_COMMENT {
	
	private int idx;
	private String comment_name;
	private String comment_content;
	private String comment_reg_date;
	
	public SIN_PAPER_BOARD_COMMENT() {
		// TODO Auto-generated constructor stub
	}

	public SIN_PAPER_BOARD_COMMENT(int idx, String comment_name, String comment_content, String comment_reg_date) {
		super();
		this.idx = idx;
		this.comment_name = comment_name;
		this.comment_content = comment_content;
		this.comment_reg_date = comment_reg_date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getComment_name() {
		return comment_name;
	}

	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_reg_date() {
		return comment_reg_date;
	}

	public void setComment_reg_date(String comment_reg_date) {
		this.comment_reg_date = comment_reg_date;
	}
	
	
	
}

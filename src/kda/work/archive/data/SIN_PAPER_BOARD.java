package kda.work.archive.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class SIN_PAPER_BOARD {
	
	private String rnum;
	private String rnum2;
	private int idx;
	private String board_user_id;
	private String board_subject;
	private String board_handling;
	private String board_dept;
	private String board_dept_com;
	private String bbs_contents;
	private String board_reg_date;
	private String board_mail;
	private String board_file1_name;
	private String board_file1_url;
	private String board_file2_name;
	private String board_file2_url;
	private String board_file3_name;
	private String board_file3_url;
	private String board_file4_name;
	private String board_file4_url;
	private String board_file5_name;
	private String board_file5_url;
	private String search;
	private String search_keyword;
	private int board_idx;
	private String comment_name;
	private String comment_content;
	private String comment_reg_date;

	public SIN_PAPER_BOARD() {
		// TODO Auto-generated constructor stub
	}

	public SIN_PAPER_BOARD(String rnum, int idx, String board_user_id, String board_subject, String board_handling,
			String board_dept, String board_dept_com, String bbs_contents, String board_reg_date, String board_mail,
			String board_file1_name, String board_file1_url, String board_file2_name, String board_file2_url,
			String board_file3_name, String board_file3_url, String board_file4_name, String board_file4_url,
			String board_file5_name, String board_file5_url, String search, String search_keyword, int board_idx,
			String comment_name, String comment_content, String comment_reg_date) {
		super();
		this.rnum = rnum;
		this.idx = idx;
		this.board_user_id = board_user_id;
		this.board_subject = board_subject;
		this.board_handling = board_handling;
		this.board_dept = board_dept;
		this.board_dept_com = board_dept_com;
		this.bbs_contents = bbs_contents;
		this.board_reg_date = board_reg_date;
		this.board_mail = board_mail;
		this.board_file1_name = board_file1_name;
		this.board_file1_url = board_file1_url;
		this.board_file2_name = board_file2_name;
		this.board_file2_url = board_file2_url;
		this.board_file3_name = board_file3_name;
		this.board_file3_url = board_file3_url;
		this.board_file4_name = board_file4_name;
		this.board_file4_url = board_file4_url;
		this.board_file5_name = board_file5_name;
		this.board_file5_url = board_file5_url;
		this.search = search;
		this.search_keyword = search_keyword;
		this.board_idx = board_idx;
		this.comment_name = comment_name;
		this.comment_content = comment_content;
		this.comment_reg_date = comment_reg_date;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getBoard_user_id() {
		return board_user_id;
	}

	public void setBoard_user_id(String board_user_id) {
		this.board_user_id = board_user_id;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_handling() {
		return board_handling;
	}

	public void setBoard_handling(String board_handling) {
		this.board_handling = board_handling;
	}

	public String getBoard_dept() {
		return board_dept;
	}

	public void setBoard_dept(String board_dept) {
		this.board_dept = board_dept;
	}

	public String getBoard_dept_com() {
		return board_dept_com;
	}

	public void setBoard_dept_com(String board_dept_com) {
		this.board_dept_com = board_dept_com;
	}

	public String getBbs_contents() {
		return bbs_contents;
	}

	public void setBbs_contents(String bbs_contents) {
		this.bbs_contents = bbs_contents;
	}

	public String getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public String getBoard_mail() {
		return board_mail;
	}

	public void setBoard_mail(String board_mail) {
		this.board_mail = board_mail;
	}

	public String getBoard_file1_name() {
		return board_file1_name;
	}

	public void setBoard_file1_name(String board_file1_name) {
		this.board_file1_name = board_file1_name;
	}

	public String getBoard_file1_url() {
		return board_file1_url;
	}

	public void setBoard_file1_url(String board_file1_url) {
		this.board_file1_url = board_file1_url;
	}

	public String getBoard_file2_name() {
		return board_file2_name;
	}

	public void setBoard_file2_name(String board_file2_name) {
		this.board_file2_name = board_file2_name;
	}

	public String getBoard_file2_url() {
		return board_file2_url;
	}

	public void setBoard_file2_url(String board_file2_url) {
		this.board_file2_url = board_file2_url;
	}

	public String getBoard_file3_name() {
		return board_file3_name;
	}

	public void setBoard_file3_name(String board_file3_name) {
		this.board_file3_name = board_file3_name;
	}

	public String getBoard_file3_url() {
		return board_file3_url;
	}

	public void setBoard_file3_url(String board_file3_url) {
		this.board_file3_url = board_file3_url;
	}

	public String getBoard_file4_name() {
		return board_file4_name;
	}

	public void setBoard_file4_name(String board_file4_name) {
		this.board_file4_name = board_file4_name;
	}

	public String getBoard_file4_url() {
		return board_file4_url;
	}

	public void setBoard_file4_url(String board_file4_url) {
		this.board_file4_url = board_file4_url;
	}

	public String getBoard_file5_name() {
		return board_file5_name;
	}

	public void setBoard_file5_name(String board_file5_name) {
		this.board_file5_name = board_file5_name;
	}

	public String getBoard_file5_url() {
		return board_file5_url;
	}

	public void setBoard_file5_url(String board_file5_url) {
		this.board_file5_url = board_file5_url;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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

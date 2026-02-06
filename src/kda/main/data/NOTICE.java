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
}

package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class BOOKBOARD
{
	private int		board_rownum;
	private int 	oindex;
	private String 	oyear				= "";
	private String 	otitle				= "";
	private int 	oprice1;
	private int 	oprice2;
	private String 	ocontents			= "";
	private String 	oimage				= "";
	private String 	odate				= "";
	private int 	otop;
	private String 	materials_status	= "";
	private int 	bs_category;
	private String 	bs_categorytype		= "";
	private String 	short_title		= "";
	private String 	std_nm		= "";
	private String  bbs_file_url = "";
	private String  file_del_chk = "";
}
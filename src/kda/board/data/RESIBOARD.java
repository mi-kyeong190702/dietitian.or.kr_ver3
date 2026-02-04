package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component 
@Data public class RESIBOARD
{
	private int		board_rownum;
	private int		resi_serial_no;
	private int		resi_depth_no;
	private int		resi_parent_no;
	private String	resi_url		= "";
	private String	resi_address	= "";
	private String	resi_user_name	= "";
	private String	resi_wrt_date	= "";
	private String	resi_wrt_time	= "";
	private String	resi_title		= "";
	private String	resi_content1	= "";
	private String	resi_content2	= "";
	private String	resi_content3	= "";
	private String	resi_content4	= "";
	private int		resi_read_no    = 0;
	private String	resi_password	= "";
	private String  resi_new		= "";
	private String	status			= "";
	private String	check_ip		= "";
}
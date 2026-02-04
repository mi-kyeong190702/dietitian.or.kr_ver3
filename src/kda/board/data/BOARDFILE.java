package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class BOARDFILE
{
	private String bbs_file_name;
	private String bbs_file_url;
	private String bbs_file_type;
	private long   bbs_file_size;
	private int    bbs_file_down;
}
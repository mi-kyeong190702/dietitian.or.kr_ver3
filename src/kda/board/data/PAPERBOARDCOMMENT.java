package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PAPERBOARDCOMMENT 
{
	private int 	bbc_idx;
	private String 	bbc_user_id;
	private String 	bbc_pwd;
	private String 	bbs_idx;
	private String 	bbc_name;
	private String 	bbc_contents;
	private String 	bbc_user_ip;
	private String 	bbc_date;	
}
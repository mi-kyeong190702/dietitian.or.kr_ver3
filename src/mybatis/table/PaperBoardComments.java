package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PaperBoardComments
{
	private int 	bbc_idx;
	private String 	user_id;
	private String 	bbc_name;
	private String 	bbc_contents;
	private String 	bbc_user_ip;
	private String 	bbc_date;   
}
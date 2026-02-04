package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class ActM //ë¹?ë§??? ??ê°?
{
	private int act_seqno;   //?±ë?
	private String act_desc;   //?´ì??
	private String act_index;   //ê°? ?? - decimal(6, 2)
}
package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class ObeM //ë¹?ë§??? ??ê°?01
{
	private int obe_seqno;   //??ë²?
	private int obe_adult;   //?±ì?¸ì?¬ë?
	private String obe_from;   //obe_???? - decimal(4, 0)
	private String obe_to;   //obe_?? - decimal(4, 0)
	private String obe_desc;   //?´ì??

}
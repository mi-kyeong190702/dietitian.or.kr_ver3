package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class OebM //ë¹?ë§??? ??ê°? ê²°ê³¼
{
	private int obe_seqno;   //ë²???
	private int obe_adult;   //?±ì??
	private String obe_from;   //????ê°? - decimal(4, 0)
	private String obe_to;   //??ê°? - decimal(4, 0)
	private String obe_desc;   //?´ì??
}
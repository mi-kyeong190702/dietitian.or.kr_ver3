package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class GreM //ë¹?ë§??? ??ê°?ê²°ê³¼
{
	private int gre_adult;   //êµ¬ë?
	private String gre_fr;   //????ê°? - decimal(4,1)
	private String gre_to;   //??ê°? - decimal(4,1)
	private String gre_desc;   //ê²°ê³¼?´ì??
	private int gre_sex;   //?±ë?
}
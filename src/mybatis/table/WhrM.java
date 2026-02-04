package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class WhrM //ë¹?ë§??? ??ê°?ê²°ê³¼
{
	private String to_max_value;   //ìµ???ê°? - decimal(6, 2)
	private String fr_min_value;   //ìµ???ê°? - decimal(6, 2)
	private String division_sex;   //?±ë?
	private String whr_check;   //ì²´í?¬ì?¬ë?
	private String comment;   //ê²°ê³¼?´ì??
}
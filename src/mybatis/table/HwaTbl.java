package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class HwaTbl //ë¹?ë§??? ??ê°? ê²°ê³¼
{
	private String division_sex;   //?±ë?
	private int age;   //????
	private String exhort_kcal;   //ì²´ì?ë°? - decimal(7, 2)
	private String general_fr_high;   //ì²´ì? - decimal(5, 1)
	private String general_to_high;   //ë¹?ë§??? - decimal(5, 1)
	private String standard_wt;   //??ë¦¬ë???? - decimal(6, 2)
	private String standard_fr_high;   //??ì¤?ì²´ì? - decimal(5, 1)
	private String standard_to_high;   //???? - decimal(5, 1)
	private String kg_exhort_kacl;   //?´ë??ê¶??¥ë?? - decimal(3, 0)

}
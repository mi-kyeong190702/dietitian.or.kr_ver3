package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class BlpM //ë¹?ë§??? ??ê°?ê²°ê³¼
{
	private int blp_adult;   //?±ì??
	private String fr_age;   //???????? - decimal(3,0)
	private String to_age;   //?????? - decimal(3,0)
	private String check_value;   //ì²´í?¬ê? - decimal(3,0)
	private String fr_blp_s;   //????blp_s - decimal(5,1)
	private String to_blp_s;   //??blp_s - decimal(5,1)
	private String fr_blp_e;   //????blp_e - decimal(5,1)
	private String to_blp_e;   //??blp_e - decimal(5,1)
	private String comment;   //?´ì??
}
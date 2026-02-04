package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class RdaM //ë¹?ë§??? ??ê°?ê²°ê³¼
{
	private int rda_sex;   //?±ë?
	private int rda_from;   //rda ????
	private int rda_to;   //rda ??
	private String rda_energy;   //Energy - decimal(6, 0)

}
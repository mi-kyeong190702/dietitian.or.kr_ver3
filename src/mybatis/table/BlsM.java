package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class BlsM //ë¹?ë§??? ??ê°?ê²°ê³¼
{
	private String fr_before_bls;   //ê³µë³µ????bls - decimal(3,0)
	private String to_before_bls;   //ê³µë³µ??bls - decimal(3,0)
	private String fr_after_bls;   //???¬ì??bls - decimal(3,0)
	private String to_after_bls;   //???¬í??bls - decimal(3,0)
	private String division;   //Division
}
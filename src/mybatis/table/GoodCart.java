package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class GoodCart //êµ??¡ì??ë£? ?¥ë?êµ¬ë??
{
	private String sid ;   //??ì§???ê°?
	private String sno;   //ë²??? - decimal(18, 0)
	private int spr  ;   //ê¸???
	private String sale_cnt  ;   //DCê¸??? - decimal(18, 0)
	private int num_su;   //????

}
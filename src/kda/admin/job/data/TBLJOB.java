package kda.admin.job.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class TBLJOB extends KdaAbstractDto{
	
	private int tb_idx;
	private String tb_name;
	private String tb_birth;
	private String tb_zip;
	private String tb_addr;
	private String tb_hp;
	private String tb_email;
	private String tb_date;
	private String member_flag;
	private String school;
	private String major;

}

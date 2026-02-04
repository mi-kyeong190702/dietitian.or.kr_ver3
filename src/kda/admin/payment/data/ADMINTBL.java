package kda.admin.payment.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class ADMINTBL extends KdaAbstractDto{

	
	private String admin_name;
	private String admin_id;
	private String admin_pass;
	private int inx;
	private int num;
	
}

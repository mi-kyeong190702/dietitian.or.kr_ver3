package kda.admin.point.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class IDTBL extends KdaAbstractDto{

	private String code_pers;
	private String id;
	private int point;
	private String pers_name;
	
	private int num;
	
}

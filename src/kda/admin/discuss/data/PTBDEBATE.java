package kda.admin.discuss.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class PTBDEBATE extends KdaAbstractDto{
	
	private int bateIndex;
	private String bateSubject;
	private String bateDate;

}

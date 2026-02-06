package kda.admin.consult.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class PTBCONSULTUSERID extends KdaAbstractDto{
	
	private String cuserId;        
	private String cuserName;

}

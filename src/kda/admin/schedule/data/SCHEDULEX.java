package kda.admin.schedule.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class SCHEDULEX extends KdaAbstractDto{

	
	private int num;
	private int intdd;
	private String id;
	private String yy;
	private String mm;
	private String dd;
	private String title;
	private String content;
	private String s_where;
	private String s_time;
	private String s_tel;
	
	
}

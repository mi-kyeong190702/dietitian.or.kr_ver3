package kda.work.business.clinic.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class KB_C_HABITS_DIAGNOSIS 
{
 	private int hques_no; 
	private String hques_desc;
	private String hques_rmk;
	private int hques_caseno;
	private String hques_cdesc;
	private String hques_comment;
}

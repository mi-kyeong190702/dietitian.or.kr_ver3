package kda.admin.survey.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data 
public class SURVEY_SUBJECT extends KdaAbstractDto {
	private int num;
	private int tms_no;
	private int tms_cnt;
	private int tms_idx;
	private String main_tms_title;
	private String tms_title;
	private String tms_rdate;
	private String tms_mdate;
	private String tms_bigo;
	private int subject_count = 4;
	
	private String[] tmc_titles;
}

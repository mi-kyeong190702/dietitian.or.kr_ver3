package kda.admin.survey.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data 
public class SURVEY_RESPONSE {
	
	public SURVEY_RESPONSE() {
		
	}
	
	public SURVEY_RESPONSE(SURVEY_SUBJECT subject) {
		this.tms_cnt = subject.getTms_cnt();
		this.tms_idx = subject.getTms_idx();
	}
	
	private int tms_cnt;
	private int tms_idx;
	private int tmc_order;
	private String tmc_title;
	private String tmc_rdate;
	private String tmr_etc;
	private int cnt;
	
}

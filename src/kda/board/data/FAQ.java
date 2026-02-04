package kda.board.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class FAQ extends KdaAbstractDto {

	private int idx;
	private int faq_category;
	private String faq_subject;  
	private String faq_contents; 
	private int order_num = 1;
	private String user_id; 
	private String faq_reg_date_dt;
	private String faq_edit_date_dt; 
}

package kda.work.education.data;

import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data
public class KE_EDU_RESULT_PRINT {
	private String code_certifi;
	private String result_no;
	private String code_seq;
	private String print_state;
	private int quarter;
}

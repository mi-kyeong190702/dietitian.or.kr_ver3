package kda.common.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class KDA_MAIL {
	
	public static final String EDU_TO_MAIL = "jjryu@nate.com";
	
	private String from;
	private String fromName;
	private String toEmail;
	private String mailTitle;
	private String mailBody;
	
}

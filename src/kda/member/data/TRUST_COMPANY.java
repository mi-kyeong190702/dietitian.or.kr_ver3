package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class TRUST_COMPANY			
{
	private String trust_code;
	private String trust_name;
	private String trust_post;
	private String trust_addr;
	private String trust_tel;
	
	
}
package kda.member.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class MEMBER 
{	
	private String id;
	private String uname;
	//private String ussn1;
	private String pers_hp;
	private String pers_birth;
	private String pers_state;
}
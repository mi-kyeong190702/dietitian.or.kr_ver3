package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DUES_H_TBL					
{
	private String 	code_pers;
	private String 	dues_gubun;
	private int 	dues_h_seq;
	private String 	regi_dt;
	private String 	code_member;
	private String 	auth_start;
	private String 	auth_end;
	private long 	mem_dues;
	private long 	sum_dues;
	private String 	incom_flag;

}
package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class DUES			
{
	private String yyyymm;
	private String dues_gubun;
	private String code_member;
	private String code_bran;
	private String bran_dues;
	private String bran_dues1;
	private String head_dues;
	private String head_dues2;
	private String sum_dues;
	private String use_yn;
	
	private String detcodename;
	private String tempcd1;
	private String tempcd2;
	private String tempcd3;
}
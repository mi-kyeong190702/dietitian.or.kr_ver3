package kda.member.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class ID_TBL
{
	private String code_pers;
	private String id;
	private String passwd;
	private long point;
	private String use_yn;
}
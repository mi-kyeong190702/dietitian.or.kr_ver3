package kda.common.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class COM_CODE 
{
	private String 	groupCode	= ""; //그룹코드
	private String 	detCode		= ""; //세부코드
	private String 	detCodeName	= ""; //세부코드명
	private String 	tempCD1		= ""; //대응 텍스트 1
	private String 	tempCD2		= ""; //대응 텍스트 2
	private String 	tempCD3		= ""; //대응 텍스트 3
	private int 	CDSeq			; //코드 순서
	private String 	use_yn		= ""; //사용여부
}	

package kda.common.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class GROUPCODE 
{
	private String groupcode ="";
	private String groupname ="";
	private String codelen ="";
	private String detcode ="";
	private String detcodename ="";
	private String tempcd1 ="";
	private String tempcd2 ="";
	private String tempcd3  ="";
	private String use_yn ="";
}

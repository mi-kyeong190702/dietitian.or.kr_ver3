package kda.work.news.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class KN_CALENDAR
{	
	private String num 		= "";
	private String yy 		= ""; 
	private String mm 		= "";
	private String dd 		= "";
	private String title 	= "";
	private String content 	= "";
	private String s_where 	= "";
	private String s_time 	= ""; 
	private String s_tel 	= "";
}
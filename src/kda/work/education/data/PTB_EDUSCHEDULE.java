package kda.work.education.data;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data public class PTB_EDUSCHEDULE
{
	private int ilindex	= 0; 	
	private int ilyear	= 0;
	private int ilmonth	= 0;
	private int ilday	= 0;
	private String ilsponsor	= ""; 		
	private String ileduname	= ""; 		
	private String ilname		= ""; 			
	private String ilsubject	= ""; 		
	private String ilcontents	= ""; 	
	private String illocation	= "";
	private String iltime		= "";
	private String iltel			= ""; 			
	private String ilrecognition 	= ""; 	
	private String ilrecognition_sub= "";
	private String iltype		= ""; 			
	private String ilpoint		= ""; 		

	private String ilurl	= "";
	private String ilregdate	= "";
	

}
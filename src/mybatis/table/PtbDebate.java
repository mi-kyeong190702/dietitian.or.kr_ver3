package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbDebate //??ë¡???
{
	private int bateIndex;   //ì½???
	private String bateSubject;   //ì£¼ì??
	private String bateDate;   //??ì§? - datetime
}
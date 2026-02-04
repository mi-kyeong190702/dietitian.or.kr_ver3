package kda.board.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class CARTBOARD
{
	private int 	ctindex;
	private String 	ctsessionid	= "";
	private int 	oindex;
	private int 	ctea		= 1;
	private String 	ctdate		= "";
	private String 	ctgubun		= "";
	private String 	otitle		= "";
	private int 	oprice1;
	private int 	oprice2;
}
package kda.admin.contents.data;

import org.springframework.stereotype.Component;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

@Component
@Data
public class CONTENTS extends KdaAbstractDto {

	private int num;
	private int idx;
	private String contents_name;
	private String depth1;
	private	String path;
	private String regi_date;
	private String edit_date;
	private String head;
	private String html;
}

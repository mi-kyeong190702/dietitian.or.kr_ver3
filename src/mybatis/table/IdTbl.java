package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class IdTbl
{
	private String code_pers;
	private String id;
	private String passwd;
	private long point;
	private String use_yn;
}
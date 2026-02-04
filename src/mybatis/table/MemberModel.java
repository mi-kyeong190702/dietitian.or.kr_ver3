package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class MemberModel
{
	private String uname;		
	private String ussn1;
	private String pers_hp;
}
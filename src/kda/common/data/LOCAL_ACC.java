package kda.common.data;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class LOCAL_ACC {
	private String local_name   = "";
	private String bank			= "";
	private String account_num	= "";
	private String account_name = "";
	private String tel          = "";
	private String fax			= "";
}

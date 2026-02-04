package kda.admin.signature.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class TBLKNOU extends KdaAbstractDto{
	
	private int kn_Code;
	private int num2;
	private String kn_Name;
	private String kn_Home_Post;
	private String kn_Home_Addr;
	private String kn_Home_Tel;
	private String kn_Contents;
	private String kn_join_Date;
	private String kn_Home_pcs;

}

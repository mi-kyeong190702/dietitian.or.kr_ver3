package kda.admin.purchase.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data public class PTBBUYGOODS extends KdaAbstractDto {
	
	private int eindex;
	private int bindex;
	private int oindex;
	private int eea;
	private int eprice1;
	private int eprice2;
	private String otitle;
	private String ctGoodsName;
	
}

package mybatis.table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PtbBuyGoods
{
	private int eindex;
	private int bindex;
	private int oindex;
	private int eea;
	private int eprice1;
	private int eprice2;
}
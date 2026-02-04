package kda.work.publication.payment.data;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data public class PTB_BUYGOODS
{
	private int eindex;
	private int bindex;
	private int oindex;
	private int eea;
	private int eprice1;
	private int eprice2;
}
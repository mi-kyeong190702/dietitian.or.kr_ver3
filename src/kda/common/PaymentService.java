package kda.common;

import kda.common.data.TBL_ORDER_LIST;

public interface PaymentService {

	public boolean setPaymentComplete(TBL_ORDER_LIST order);
	
	public void setPaymentResult(TBL_ORDER_LIST order);

}

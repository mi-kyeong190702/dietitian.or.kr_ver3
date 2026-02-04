package kda.common;

import javax.annotation.Resource;

import kda.common.data.TBL_ORDER_LIST;

import org.springframework.stereotype.Service;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Resource(name="cardOrderDao")
	private CardOrderDao cardOrderDao;
	
	@Override
	public boolean setPaymentComplete(TBL_ORDER_LIST order) {
		return cardOrderDao.insertOrder(order);
	}

	@Override
	public void setPaymentResult(TBL_ORDER_LIST order) {
		cardOrderDao.updateStatus(order);
	}


}

package kda.event;


import kda.event.data.EventView;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService 
{
	private Log log = LogFactory.getLog(EventServiceImpl.class);
	
	@Autowired
	EventDao dao;
	
	@Override
	public EventView getMyEventview(String code_pers) throws Exception {
		return dao.selectMyEventview(code_pers);
	}
	

	public int eventinsert(EventView row) throws Exception {
		return dao.eventinsert(row);
	}
	
	public int eventinsert_sns(EventView row) throws Exception {
		return dao.eventinsert_sns(row);
	}
	
	
}

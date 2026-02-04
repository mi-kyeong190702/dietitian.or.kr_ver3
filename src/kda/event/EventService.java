package kda.event;

import kda.event.data.EventView;


public interface EventService
{
	EventView getMyEventview(String code_pers) throws Exception;
	int eventinsert(EventView row) throws Exception;  
	int eventinsert_sns(EventView row) throws Exception; 
	
}

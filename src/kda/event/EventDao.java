package kda.event;

import kda.event.data.EventView;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.ibatis.exceptions.PersistenceException;

public interface EventDao
{
	public EventView selectMyEventview(String code_pers) throws PersistenceException;
	int eventinsert(EventView row) throws PersistenceException; 
	int eventinsert_sns(EventView row) throws PersistenceException;
	

	
}
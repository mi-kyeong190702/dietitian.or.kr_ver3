package kda.work.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kda.board.data.PAPERBOARD;
import kda.work.news.data.KN_CALENDAR;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

public interface NewsDao
{
	public List<KN_CALENDAR> get_schedulex_list(HashMap<String, Object> paramMap) throws PersistenceException;
	
	public void insertJob(Map paramMap) throws PersistenceException;
}
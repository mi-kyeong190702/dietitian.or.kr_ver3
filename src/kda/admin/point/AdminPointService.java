package kda.admin.point;

import java.util.List;
import java.util.Map;

import kda.admin.point.data.IDTBL;
import kda.common.data.LIST_HELPER;

public interface AdminPointService {
	
	public List<IDTBL> selectTopPoint() throws Exception;
	
	public LIST_HELPER getPointListHelper(LIST_HELPER listHelper) throws Exception;
	
	public void updatePoint(int point, String id) throws Exception;
	
	public List<Map<String, Object>> excelTopPoint() throws Exception;

}

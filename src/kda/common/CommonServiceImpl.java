package kda.common;

import java.util.List;

import kda.common.data.GROUPCODE;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commonService")
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;
	
	@Override
	public List<GROUPCODE> getGroupCodeList(String groupCode, String tempcd2)
			throws PersistenceException {
		return commonDao.getGroupCodeList(groupCode, tempcd2);
	}
	
	@Override
	public void insertExcel(String prog_name, String create_user, String sheet_name)
			throws PersistenceException {
		commonDao.insertExcel(prog_name, create_user, sheet_name);
	}

}

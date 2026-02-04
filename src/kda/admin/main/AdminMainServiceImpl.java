package kda.admin.main;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	private AdminMainDao adminMainDao;
	
	@Override
	public Map getUserMaster(String strid, String strpwd) throws Exception {
		return adminMainDao.selectUserMaster(strid, strpwd);
	}

	
}

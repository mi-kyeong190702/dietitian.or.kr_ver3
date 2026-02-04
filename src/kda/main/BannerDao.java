package kda.main;

import java.util.List;

import kda.common.data.LIST_HELPER;
import kda.main.data.BANNER;
import kda.spring.abstr.KdaAbstractMapper;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bannerDao")
public class BannerDao extends KdaAbstractMapper {

	private Log log = LogFactory.getLog(BannerDao.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;

	public List<BANNER> selectMainBannerList() {
		return selectList(sqlSessionFactory1, "main.selectMainBannerList", null);
	}
	
	public LIST_HELPER selectBannerListHelper(LIST_HELPER listHelper) 
			throws PersistenceException {
		return selectListHelper(sqlSessionFactory1, "main.selectBannerCount", "main.selectBannerListHelper", listHelper);
	}
	
	public BANNER selectBanner(int idx) throws PersistenceException {
		return (BANNER)selectOne(sqlSessionFactory1, "main.selectBanner", idx);
	}
	
	public void insertBanner(BANNER banner) throws PersistenceException {
		insert(sqlSessionFactory1, "main.insertBanner", banner);
	}
	
	public void updateBanner(BANNER banner) throws PersistenceException {
		update(sqlSessionFactory1, "main.updateBanner", banner);
	}
	
	public void deleteBanner(int idx) throws PersistenceException {
		delete(sqlSessionFactory1, "main.deleteBanner", idx);
	}
}

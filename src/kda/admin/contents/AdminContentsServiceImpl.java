package kda.admin.contents;

import kda.admin.contents.data.CONTENTS;
import kda.common.data.LIST_HELPER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminContentsService")
public class AdminContentsServiceImpl implements AdminContentsService {

	@Autowired
	private AdminContentsDao adminContentsDao;

	@Override
	public void insertContents(CONTENTS contents) throws Exception {
		adminContentsDao.insertContents(contents);
	}

	@Override
	public LIST_HELPER getContentsList(LIST_HELPER listHelper)
			throws Exception {
		return adminContentsDao.selectListHelper(listHelper);
	}

	@Override
	public CONTENTS getContents(int idx) throws Exception {
		
		return adminContentsDao.selectContents(idx);
	}

	@Override
	public void updateContents(CONTENTS contents) throws Exception {
		adminContentsDao.updateContents(contents);
		
	}
	
}

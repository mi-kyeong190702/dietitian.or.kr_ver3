package kda.admin.contents;

import kda.admin.contents.data.CONTENTS;
import kda.common.data.LIST_HELPER;

public interface AdminContentsService {

	public LIST_HELPER getContentsList(LIST_HELPER listHelper) throws Exception;

	public CONTENTS getContents(int idx) throws Exception;
	
	public void insertContents(CONTENTS contents) throws Exception;
	
	public void updateContents(CONTENTS contents) throws Exception;
}

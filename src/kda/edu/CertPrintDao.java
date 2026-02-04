package kda.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.edu.data.CertPrint;
import kda.member.data.MEMBER;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.ibatis.exceptions.PersistenceException;

public interface CertPrintDao
{
		List<Map> selectCertPrintview(Map paramMap) throws PersistenceException;
	
}
package kda.edu;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.edu.data.CertPrint;
import kda.work.publication.data.TBL_NUTRITIONMONITOR;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertPrintServiceImpl implements CertPrintService 
{
	private Log log = LogFactory.getLog(CertPrintServiceImpl.class);
	
	@Autowired
	CertPrintDao dao;
	
	@Override
	public List<Map> getCertPrinttview(Map paramMap) throws Exception {
		

		
		return  dao.selectCertPrintview(paramMap);	
		
		
	}
	
}

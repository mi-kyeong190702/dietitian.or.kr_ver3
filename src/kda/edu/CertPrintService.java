package kda.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kda.edu.data.CertPrint;


public interface CertPrintService
{
	List<Map> getCertPrinttview(Map paramMap) throws Exception;
	
}
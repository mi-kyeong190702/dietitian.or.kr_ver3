package kda.common.data;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kda.utils.KdaStringUtil;

public class LIST_HELPER {

	public static String  PAGE_PARAM_NAME = "curPage";
	
	private int totalCount;
	private int curPage;
	private String curUrl;
	private String urlParam;
	private int totalPage = 0;
	private int startNo = 0;
	
	private double totalPageD = 0;
	
	private List list;
	
	private int startNum 		= 0;
	private int endNum 			= 10;
	private int cntPerPage 		= 10;
	
	private Map paramMap;
	
	public LIST_HELPER() {
		if(  paramMap == null )
			paramMap = new HashMap();
	}
	
	public LIST_HELPER(int curPage) {
		if(  paramMap == null )
			paramMap = new HashMap();
		setPage(curPage);
	}
	


	public LIST_HELPER(int curPage, int cntPerPage) {
		if(  paramMap == null )
			paramMap = new HashMap();
		
		this.cntPerPage = cntPerPage;
		setPage(curPage);
	}
	
	
	public LIST_HELPER(HttpServletRequest request) {	
		this.curPage = 1;
		if( !KdaStringUtil.isEmpty(request.getParameter(PAGE_PARAM_NAME)) ) { 
			this.curPage = Integer.parseInt(request.getParameter(PAGE_PARAM_NAME) );
		}
		initListVO(request, curPage, cntPerPage);
	}
	
	
	/**
	 * 
	 * 
	 * @param request
	 * @param curPage
	 */
	public LIST_HELPER(HttpServletRequest request, int cntPerPage) {
		this.curPage = 1;
		if(  paramMap == null )
			paramMap = new HashMap();
		
		if( !KdaStringUtil.isEmpty(request.getParameter(PAGE_PARAM_NAME)) ) { 
			this.curPage = Integer.parseInt(request.getParameter(PAGE_PARAM_NAME) );
		}
		
		initListVO(request, curPage, cntPerPage);
	}

	/**
	 * 
	 * 
	 * @param request
	 * @param curPage
	 * @param cntPerPage 
	 * @return 
	 */
	public LIST_HELPER(HttpServletRequest request, int cntPerPage, int curPage) {
		initListVO(request, curPage, cntPerPage);
	
	}
	
	private void initListVO(HttpServletRequest request, int curPage, int cntPerPage) {
		
		if(  paramMap == null )
			paramMap = new HashMap();
		
		this.curPage = curPage;
		setCntPerPage(cntPerPage);
		
		
		 
		String url = request.getRequestURI();
		setCurUrl(url);
		
		StringBuffer paramBuf = new StringBuffer();
		Enumeration eParam = request.getParameterNames();
		while (eParam.hasMoreElements()) {
			String pName = (String)eParam.nextElement();
			String pValue = request.getParameter(pName);
			if( !LIST_HELPER.PAGE_PARAM_NAME.equals(pName)) {	
				if( paramBuf.length() > 0 )
					paramBuf.append("&amp;");
				paramBuf.append(pName + "=" + pValue);
				
				paramMap.put(pName, pValue);
			}
		}
		setUrlParam(paramBuf.toString());
	}
	
	
	private void setPage(int curPage) {
		this.curPage = curPage;
	
		startNum = ((curPage-1) * this.cntPerPage ) + 1;
		endNum = startNum + (cntPerPage - 1);
		
		paramMap.put("startNum", startNum);
		paramMap.put("endNum", endNum);
		paramMap.put("startNumMysql", startNum-1);
		paramMap.put("cntPerPage", cntPerPage);
		paramMap.put("curPage", curPage);		
	}
	
	
	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
		setPage(this.curPage);
	}
	

	public int getTotalCount() {
		return totalCount;
	}
	
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getCurPage() {
		return curPage;
	}
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public String getCurUrl() {
		return curUrl;
	}

	public void setCurUrl(String curUrl) {
		this.curUrl = curUrl;
	}

	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String getUrlParam() {
		return urlParam;
	}

	public void setUrlParam(String urlParam) {
		this.urlParam = urlParam;
	}

	public void setParam(String key, String value ) {
		this.paramMap.put(key, value);
	}
	
	
	public void setParam(String key, int value) {
		this.paramMap.put(key, value);
	}
	
	public void setParam(String key, long value){
		this.paramMap.put(key, value);
	}
	
	public String getParam(String key) {
		return (String)this.paramMap.get(key);
	}
	
	public Map getParamMap() {
		return paramMap;
	}

	public void setParamMap(Map paramMap) {
		this.paramMap = paramMap;
	}

	public int getTotalPage() {
		if( totalPage == 0 ) {
			if ( totalCount % cntPerPage == 0) {
				totalPage = (int) ( totalCount / cntPerPage);
			} else {
				totalPage = (int) ( totalCount / cntPerPage) + 1;
			}
		}
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public double getTotalPageD() {
		if( totalPageD == 0 ) {
			if ( totalCount % cntPerPage == 0) {
				totalPageD = (double) ( totalCount / cntPerPage);
			} else {
				totalPageD = (double) ( totalCount / cntPerPage) + 1;
			}
		}
		return totalPageD;
	}

	public void setTotalPageD(double totalPageD) {
		this.totalPageD = totalPageD;
	}
	
	public int getStartNo() {
		return this.totalCount - ( cntPerPage *  (curPage - 1) );
	}
	

}

package kda.tld;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import kda.common.data.LIST_HELPER;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PagingTag extends TagSupport {
	
	private Log log = LogFactory.getLog(PagingTag.class);

	private static final long serialVersionUID = 6176499304190643451L;

	private LIST_HELPER listHelper;
	
	private String cssClass = "paging small mt30";
	
	private String layout = "";
	
	private String firstIcon = "";
	
	private String prevIcon = "";
	
	private String nextIcon = "";
	
	private String lastIcon = "";
	
	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	
	public LIST_HELPER getListHelper() {
		return listHelper;
	}

	public void setListHelper(LIST_HELPER listHelper) {
		this.listHelper = listHelper;
	}

	/** @return the firstIcon */
	public String getFirstIcon() {
		if( KdaStringUtil.isEmpty(firstIcon) ) {
			if( this.layout.equals("admin") ) {
				return "&lt;&lt;<span class=\"ti\">처음</span>";
			} else {
				return "<span class=\"icon\"></span><span class=\"ti\">처음</span>";
			}
		} else {
			return this.firstIcon; 
		}	
	}

	/** @param firstIcon the firstIcon to set */
	public void setFirstIcon(String firstIcon) {
		this.firstIcon = firstIcon;
	}

	/** @return the prevIcon */
	public String getPrevIcon() {
		if( KdaStringUtil.isEmpty(prevIcon) ) {
			if( this.layout.equals("admin") ) {
				return "&lt;<span class=\"ti\">이전</span>";
			} else {
				return "<span class=\"icon\"></span><span class=\"ti\">이전</span>";
			}
		} else {
			return this.prevIcon; 
		}
	}

	/** @param prevIcon the prevIcon to set */
	public void setPrevIcon(String prevIcon) {
		this.prevIcon = prevIcon;
	}

	/** @return the nextIcon */
	public String getNextIcon() {
		if( KdaStringUtil.isEmpty(nextIcon) ) {
			
			if( this.layout.equals("admin") ) {
				return "&gt;<span class=\"ti\">다음</span>";
			} else {
				return "<span class=\"icon\"></span><span class=\"ti\">다음</span>";
			}
			
		} else {
			return this.nextIcon; 
		}
	}

	/** @param nextIcon the nextIcon to set */
	public void setNextIcon(String nextIcon) {
		this.nextIcon = nextIcon;
	}

	/** @return the lastIcon */
	public String getLastIcon() {
		if( KdaStringUtil.isEmpty(lastIcon) ) {
			if( this.layout.equals("admin") ) {
				return "&gt;&gt;<span class=\"ti\">끝</span>";
			} else {
				return "<span class=\"icon\"></span><span class=\"ti\">다음</span>";
			}
		} else {
			return this.lastIcon; 
		}
	}

	/** @param lastIcon the lastIcon to set */
	public void setLastIcon(String lastIcon) {
		this.lastIcon = lastIcon;
	}
	
	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		String contextPath = pageContext.getServletContext().getContextPath();
		ServletRequest request = pageContext.getRequest();

		String baseImgPath = contextPath + "/assets/img";

		int totalCount 	= listHelper.getTotalCount();
		int curPage 	= listHelper.getCurPage();
		int cntPerPage 	= listHelper.getCntPerPage();
		int cntPerblock = 10;
		if(cntPerblock !=listHelper.getCntPerPage()){
			cntPerblock = listHelper.getCntPerPage();
		}
		
		
		String url = "";
		String queryString = "";
		
		url = listHelper.getCurUrl();
		queryString = "";
		if( !KdaStringUtil.isEmpty(listHelper.getUrlParam()) )  {
			queryString = "&amp;" + listHelper.getUrlParam();
		} 

		
		try {
			
			int totalPage = 0;
			int blockNum = 0;
			int totalBlock = 0;

			// 페이지 설정에 필요한 값 연산
			if ( totalCount > 0) {

				if ( totalCount % cntPerPage == 0) {
					totalPage = (int) ( totalCount / cntPerPage);
				} else {
					totalPage = (int) ( totalCount / cntPerPage) + 1;
				}
			
				if ( curPage % cntPerblock == 0) {
					blockNum = (int)(curPage/cntPerblock);
				} else {
					blockNum = (int)(curPage/cntPerblock)+1;
				}
				
				if (totalPage % cntPerblock == 0) {
					totalBlock = (int) (totalPage / cntPerblock);
				} else {
					totalBlock = (int) (totalPage / cntPerblock) + 1;
				}
			}
		
			StringBuffer pageBuf = new StringBuffer();
			pageBuf.append("<div class=\"" + this.cssClass + "\">\n");
			
			if (totalPage > 0) {
			
				pageBuf.append("<a href=\"").append(url).append("?")
						.append( listHelper.PAGE_PARAM_NAME ).append("=1").append(queryString).append("\" ")
						.append("  title=\"처음 페이지\" class=\"p_btn start\">")
						.append( getFirstIcon() + "</a>\n");
				
				if (blockNum > 1) {
					pageBuf.append("<a href=\"").append(url).append("?")
						.append( listHelper.PAGE_PARAM_NAME ).append("=").append( cntPerPage * (blockNum - 1)).append(queryString).append("\" ")
						.append(" title=\"이전  페이지\" class=\"p_btn prev\">")
						.append( getPrevIcon() + "</a>\n");
				} else {
					pageBuf.append("<a href=\"#none\" title=\"이전 페이지\"  class=\"p_btn prev\">");
					pageBuf.append(getPrevIcon());
					pageBuf.append("</a>\n");
				}

			
				for (int i = ((blockNum - 1) * cntPerblock + 1); i <= (blockNum * cntPerblock); i++) {
					if (i > totalPage) {
						break;
					} else {
						if (i != curPage) {
							pageBuf.append("<a href=\"" ).append(url).append("?curPage=").append(i).append(queryString).append("\" ");
							pageBuf.append("  class=\"p_btn\"	title=\"" + i + " 페이지\">" + i + "</a>\n"); 
						} else {
							pageBuf.append("<a href=\"#none\" class=\"p_btn on\">").append(i).append("</a>\n");
						}
					}
				}

				if (blockNum != totalBlock) {
					pageBuf.append("<a href=\"").append(url).append("?")
						.append( listHelper.PAGE_PARAM_NAME )
						.append("=").append((cntPerPage * blockNum + 1))
						.append(queryString).append("\" ")
						.append(" title=\"다음  페이지\"  class=\"p_btn next\">")
						.append( getNextIcon() + "</a>\n");
				} else {
					pageBuf.append("<a href=\"#none\" title=\"다음 페이지\" class=\"p_btn next\">")
						.append( getNextIcon() )
						.append("</a>\n");
				}
				
				pageBuf.append("<a href=\"" ).append(url).append("?curPage=").append(totalPage).append(queryString).append("\" ");
				pageBuf.append(" 	title=\"마지막 페이지\" class=\"p_btn end\">");
				pageBuf.append( getLastIcon() + "</a>\n");
			}
			pageBuf.append("</div>");
			
			out.println(pageBuf.toString());
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
		}
		return SKIP_BODY;
	}

}

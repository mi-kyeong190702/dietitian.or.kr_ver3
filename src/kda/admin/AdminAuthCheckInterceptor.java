package kda.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthCheckInterceptor  extends HandlerInterceptorAdapter {
	
	private Log log = LogFactory.getLog(AdminAuthCheckInterceptor.class);
	
	@Autowired 
	private WebApplicationContext context;      

	@Override 
	public boolean preHandle( HttpServletRequest request
							, HttpServletResponse response
							, Object handler) throws Exception {
		try {
			String reqUri = request.getRequestURI();
		
			HttpSession session = request.getSession();
			
			
			if( !( reqUri.startsWith("/djemals/login") || reqUri.startsWith("/djemals/AdminCheck") ) ) {
				
				
				Object adminSession = session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
				if( adminSession == null) {
					response.sendRedirect("/djemals/login.do");
					return false;
				}
			}
			
			String[] reqUris = reqUri.split("/");
			request.setAttribute("subDir", reqUris[2]);
			
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
		}
		
 		return true;
	} 
}

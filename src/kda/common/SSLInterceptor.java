package kda.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kda.WorkData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SSLInterceptor  extends HandlerInterceptorAdapter {
	
	private Log log = LogFactory.getLog(SSLInterceptor.class);
	
	@Override 
	public boolean preHandle( HttpServletRequest request
							, HttpServletResponse response
							, Object handler) throws Exception {
		try {
			
			String path = request.getRequestURI();
			if( !path.contains("djemals") ) {
				if( !request.getScheme().contains("https") && "N".equals(WorkData.IS_DEV)) {
					
					String redirectUrl = "https://" + request.getServerName()  + request.getRequestURI();
					// System.out.println( "[ to do :  redirect : " +  redirectUrl  + "]");
					response.sendRedirect( redirectUrl );
					return true;
				}
			}
			
		} catch(Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
		}
 		return true;
	} 
}

package kda.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import kda.SessionInfo;

public class LoginCheckFilter implements Filter {

	private Log log = LogFactory.getLog(LoginCheckFilter.class);
	
	@Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException 
    {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); 
          
        String login = null;
        if (session != null) {
            login = (String) session.getAttribute(SessionInfo.LOGIN);
        }
        
        System.out.println("=== LoginCheckFilter HIT ===");
        System.out.println("URI = " + req.getRequestURI());
        
        System.out.println("login::" + login);
         

        if (login == null || "N".equals(login)) {

            res.setContentType("text/html; charset=UTF-8");
            PrintWriter out = res.getWriter();

            String redirect = req.getContextPath() + "/login/kl_login_nor.do";

            out.println("<script>");
            out.println("alert('로그인을 하세요.');");
            out.println("location.href='" + redirect + "';");
            out.println("</script>");

            out.flush();
            return;
        }

        chain.doFilter(request, response);
    }
     

}
package kda.work.research.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.work.research.report.data.ACTULPERSON;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RloginController {

	
	private Log log = LogFactory.getLog(RloginController.class);

	@Autowired
	RloginService rloginService;
	
	@RequestMapping("research_login")
	public String research_login(@RequestParam(required = false) String pers_name,
			@RequestParam(required = false) String lic_no,
			@RequestParam(required = false) String user_pw, HttpSession session,
			Model model,HttpServletRequest request) throws Exception{
		
		log.info("================================ RloginController [research_login]");
		
		String msg 		= "";
		String returnURL 	= "";
		int  n=0;

		try {
			
			ACTULPERSON actulperson = rloginService.passwdCk(pers_name, lic_no, user_pw);
			
			if(actulperson!=null){
				log.info("================================ 111z " +actulperson.getPwchk());
				if("Y".equals(actulperson.getPwchk())){
					
					session.setAttribute("loginVo", actulperson);
					
					n = rloginService.isUser(pers_name, lic_no);
					
					if(n==0){
						rloginService.insertHistory(pers_name, lic_no,request.getRemoteAddr());
					}else{
						rloginService.loginHistory(pers_name, lic_no,request.getRemoteAddr());
					}
					
					returnURL = "/work/research/login/login_ok";
					
				}else if("N".equals(actulperson.getPwchk())){
					msg = "비밀번호를 확인해 주세요.";
					returnURL = "/work/research/login/login_fail";
					model.addAttribute("message", msg);
				}
				
			}else{
				msg = "일치하는 회원정보가 없습니다.";
				returnURL = "/work/research/login/login_fail";
				model.addAttribute("message", msg);
			}
			

		} catch (Exception e) {
			log.info(e);
			throw e;
		}

		return returnURL;
	}
	
	@RequestMapping("research_logout")
	public String research_logout(HttpSession session,Model model) throws Exception{
		
		log.info("================================ RloginController [research_logout]");
		
		try {
			ACTULPERSON vo = (ACTULPERSON) session.getAttribute("loginVo");
			/*rloginService.logoutHistory(vo.getPers_name(), vo.getLic_no()); 20160114  로긍아웃시 로그테이블에 종료시각 업데이트하는것  중지*/
			session.invalidate();
			model.addAttribute("loginVo", "");
			
		} catch (Exception e) {
			log.info(e);
			throw e;
		}
		
		return "/work/research/login/login_ok";
	}
	
}

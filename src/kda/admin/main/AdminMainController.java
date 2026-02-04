package kda.admin.main;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.common.FileUploadService;
import kda.common.data.LIST_HELPER;
import kda.main.MainService;
import kda.main.data.BANNER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

@Controller
public class AdminMainController extends KdaAbstractController {

	private static final String BANNER_PATH =  "/images/banner";
	
	public static final HashMap<Integer, String> BANNER_TY = new LinkedHashMap<Integer, String>() {
		private static final long serialVersionUID = -6545709996424734278L;
		{
			put(1, "[1]메인이미지");
			put(2, "[2]메인아이콘");
			put(3, "[3]중단배너");
			put(4, "[4]대배너");
			put(5, "[5]소배너");
		}
	};
	
	
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private AdminMainService adminMainService;
	
	@Autowired
	private FileUploadService fileUplaodService;
	
	@Autowired 
	private ServletContext servletContext;
	
	@RequestMapping("djemals/login.do") 
	public String login(Model model) throws Exception {
		return "/djemals/login";
	}
	
	@RequestMapping("djemals/loginAction.do")
	public String loginAction(@RequestParam String strID, @RequestParam String strPWD, HttpSession session, Model model) throws Exception {
		Map user = adminMainService.getUserMaster(strID, strPWD);
		if( user == null ) {
			return getHistoryBackPage("관리자가 아니시거나 해당 사이트 사용 권한이 없습니다.", model);
		} else {
			if( !KdaStringUtil.nullToString(user.get("pwchk")).equals("Y") ) {
				return getHistoryBackPage("패스워드가 틀립니다 다시한번 확인인해 주세요", model);
			}
			if( !user.get("progid").toString().contains("905") ) {
				return getHistoryBackPage("홈페이지 관리 사용권한이 없습니다.\\n 다시한번 확인인해 주세요", model);
			}
		}
		
		setSession(session, user);
		return "redirect:/djemals/main.do";
	}
	
	
	@RequestMapping("djemals/AdminCheck.do")
	public String AdminCheck(@RequestParam String strID, @RequestParam String strPWD, @RequestParam( required=false, defaultValue="") String method, HttpSession session, Model model) throws Exception {
		Map user = adminMainService.getUserMaster(strID, strPWD);
		if( user == null ) {
			return getHistoryBackPage("관리자가 아니시거나 해당 사이트 사용 권한이 없습니다.", model);
		} else {
			if( !KdaStringUtil.nullToString(user.get("pwchk")).equals("Y") ) {
				return getHistoryBackPage("패스워드가 틀립니다 다시한번 확인해 주세요", model);
			}
		}
		
		setSession(session, user);
		if( method.equals("payment")  ) {
			if( !user.get("progid").toString().contains("906") ) {
				return goLocation("결제관리 사용권한이 없습니다.\\n 다시 한번 확인해 주세요", "/djemals/login.do", model);
			}
			return "redirect:/djemals/payment/confirmList.do";
		} else if( method.equals("sms") ) {
			if( !user.get("progid").toString().contains("908") ) {
				return goLocation("SMS사용관리 권한이 없습니다.\\n 다시 한번 확인해 주세요", "/djemals/login.do", model);
			}
			return "redirect:/djemals/sms/print.do";
		} else {
			if( !user.get("progid").toString().contains("905") ) {
				return goLocation("SMS사용관리 권한이 없습니다.\\n 다시 한번 확인해 주세요", "/djemals/login.do", model);
			}
			return "redirect:/djemals/main.do";
		}
		
	}
	
	
	@RequestMapping("djemalds/logout.do")
	public String logout(HttpSession session, Model model) throws Exception {
		session.setAttribute(SessionInfo.HOMEPAGE_ADMIN, null);
		session.invalidate();
		return "redirect:/djemdlas/login.do";
	}
	
	
	@RequestMapping("djemals/main.do")
	public String main(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/main/bannerList.do";
	}
	
	@RequestMapping("djemals/main/bannerList.do")
	public String bannerList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = mainService.getBannerListHelper(listHelper);
		
		model.addAttribute("bannerTy", BANNER_TY);
		model.addAttribute("listHelper", listHelper);
		
		return "tiles:admin/main/banner_list";
	}
	
	@RequestMapping("djemals/main/bannerForm.do")
	public String bannerForm(@RequestParam (required=false, defaultValue="0") int idx, HttpServletRequest request, Model model) throws Exception {
		BANNER banner = null;
		if( idx == 0  ) {
			banner = new BANNER();
			banner.setCrud(CRUDValue.C);
		} else {
			banner = mainService.getBanner(idx);
			banner.setCrud(CRUDValue.U);
		}
		model.addAttribute("bannerTy", BANNER_TY);
		model.addAttribute("banner", banner);
		return "tiles:admin/main/banner_form";
	}
	
	@RequestMapping("djemals/main/bannerAction.do")
	public View bannerAction(BANNER banner, HttpSession session, Model model) throws Exception {
		/*
		LOGININFO admin = getUserInfo(session);
		banner.setUser_name(admin.getUser_name());
		banner.setUser_id(admin.getUser_id());
		*/
		
		MultipartFile file = banner.getImage_file();
	
		if( file != null && file.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(banner.getBanner_img()) ) {
				String filePath = servletContext.getRealPath(banner.getBanner_img());
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(BANNER_PATH);
			String imageName = fileUplaodService.uploadImage(file, path);
			banner.setBanner_img(BANNER_PATH + "/" + imageName);
		}
		
		JavaScript javaScript = new JavaScript();
		switch(banner.getCrud()) {
		case C :
			mainService.insertBanner(banner);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			
			mainService.updateBanner(banner);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			if( !KdaStringUtil.isEmpty(banner.getBanner_img()) ) {
				String filePath = servletContext.getRealPath(banner.getBanner_img());
				System.out.println(filePath);
				fileUplaodService.deleteFile(filePath);
			}
			
			mainService.deleteBanner(banner.getIdx());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		javaScript.setLocation("bannerList.do");
		return new JavaScriptView(javaScript);
	}
	
	private void setSession(HttpSession session, Map user) {
		String userbran = user.get("userbran").toString();
		String center_flag = "0";
		String code_bran = "";
		String code_bran_str = "";
		
		switch( Integer.parseInt(userbran) ) {
		case 1 :
			center_flag = "1";
			code_bran = "0";
			code_bran_str = "중앙회";
			break;
		case 2:
			code_bran = "10";
			code_bran_str = "서울지부";
			break;
		case 3:
			code_bran = "20";
			code_bran_str = "부산지부";
			break;
		case 4:
			code_bran = "30";
			code_bran_str = "인천지부";
			break;
		case 5:
			code_bran = "40";
			code_bran_str = "경기지부";
			break;
		case 6:
			code_bran = "50";
			code_bran_str = "강원지부";
			break;
		case 7:
			code_bran = "60";
			code_bran_str = "충북지부";
			break;	
		case 8:
			code_bran = "70";
			code_bran_str = "대전충남지부";
			break;
		case 9:
			code_bran = "80";
			code_bran_str = "전북지부";
			break;		
		case 10:
			code_bran = "90";
			code_bran_str = "광주전남지부";
			break;
		case 11:
			code_bran = "100";
			code_bran_str = "대구경북지부";
			break;
		case 12:
			code_bran = "110";
			code_bran_str = "경남지부";
			break;
		case 13:
			code_bran = "120";
			code_bran_str = "울산지부";
			break;
		case 14:
			code_bran = "130";
			code_bran_str = "제주지부";
			break;	
		}
		user.put("center_flag", center_flag);
		user.put("code_bran", code_bran);
		user.put("code_bran_str", code_bran_str);
		
		session.setAttribute(SessionInfo.HOMEPAGE_ADMIN, user);
	}
}

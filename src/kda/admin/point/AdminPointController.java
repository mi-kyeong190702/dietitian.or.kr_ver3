package kda.admin.point;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.admin.point.data.IDTBL;
import kda.common.CommonService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.ExcelDown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;


@Controller
public class AdminPointController extends KdaAbstractController{
	
	public static final HashMap<String, String> POINT_TY = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = -6545709996424734278L;
		{
			put("pers_name", "이름");
			put("id", "아이디");
		}
	};
	
	@Autowired
	AdminPointService adminPointService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("djemals/point/pointTop.do")
	public String pointTop(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/point/pointTopList.do";
	}
	
	@RequestMapping("djemals/point/pointTopList.do")
	public String pointTopList(HttpServletRequest request, Model model) throws Exception {
		
		List<IDTBL> list = adminPointService.selectTopPoint();
		
		model.addAttribute("list", list);
		
		model.addAttribute("url", "pointTopList.do");
		model.addAttribute("title", "회원 포인트 적립 상위 50인");
		return "tiles:admin/point/point_top_list";
	}
	
	@RequestMapping("djemals/point/point.do")
	public String point(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/point/pointList.do";
	}
	
	@RequestMapping("djemals/point/pointList.do")
	public String pointList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		
		String srch = request.getParameter("srchName");
		
		if(!"".equals(srch) && srch != null){
			listHelper = adminPointService.getPointListHelper(listHelper);
		}
		
		model.addAttribute("listHelper", listHelper);
		
		model.addAttribute("pointTy", POINT_TY);
		
		model.addAttribute("url", "pointList.do");
		model.addAttribute("title", "회원 포인트 관리");
		return "tiles:admin/point/point_list";
	}
	
	@RequestMapping("djemals/point/pointAction.do")
	public View pointAction(IDTBL vo, HttpSession session, Model model) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			//javaScript.setMessage("저장 되었습니다.");
			break;
		case U:
			adminPointService.updatePoint(vo.getPoint(), vo.getId());
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			//javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("pointList.do");
		return new JavaScriptView(javaScript);
		
	}
	
	@RequestMapping("djemals/point/pointTopExcel.do")
	public View pointTopExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		Map user = (Map) session.getAttribute(SessionInfo.HOMEPAGE_ADMIN);
		String userid = (String) user.get("userid");
		commonService.insertExcel("pointTopExcel", userid, "회원포인트적립상위50인");
		
		List<Map<String, Object>> list = null;
		
		String header_e[]={	"id","pers_name","point"}; //헤더 영문
		String header_k[]={"회원ID","이름","적립포인트"}; //헤더 국문			
		list = adminPointService.excelTopPoint();
		
		return new ExcelDown("pointTopExcel", header_k, header_e, list);
	}
	

}

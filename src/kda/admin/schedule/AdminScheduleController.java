package kda.admin.schedule;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.admin.schedule.data.SCHEDULEX;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;


@Controller
public class AdminScheduleController extends KdaAbstractController{
	
	@Autowired
	AdminScheduleService adminScheduleService;
	
	
	@RequestMapping("djemals/schedule/schedule.do")
	public String schedule(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		return "redirect:/djemals/schedule/scheduleList.do";
	}
	
	@RequestMapping("djemals/schedule/scheduleList.do")
	public String scheduleList(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int select_yy,
			@RequestParam (required=false, defaultValue="0") int select_mm) throws Exception {
		
		int pre_year =0;
		int pre_month = 0;
		int next_year = 0;
		int next_month = 0;
		String yy = "";
		String mm = "";
		Calendar cal = Calendar.getInstance();
		
		if(select_yy == 0){
			select_yy = cal.get(Calendar.YEAR);
			select_mm = cal.get ( Calendar.MONTH ) + 1 ;
			
			yy = Integer.toString(select_yy);
			mm = Integer.toString(select_mm);
			
		}else{
			yy = Integer.toString(select_yy);
			mm = Integer.toString(select_mm);
		}
		
		cal.set(Calendar.YEAR, select_yy);
		cal.set(Calendar.MONTH, select_mm-1);
		cal.set(Calendar.DATE, 1);
		
		model.addAttribute("DayOfWeek", cal.get(Calendar.DAY_OF_WEEK));
		model.addAttribute("DayOfMonth", cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		if(mm.length()==1) mm = "0"+mm;
		
		List<SCHEDULEX> scheduleList = adminScheduleService.getScheduleList(yy, mm);
		
		model.addAttribute("scheduleList", scheduleList);
		
		if(select_mm == 1) {
			pre_year = select_yy -1;
			pre_month = 12;
			next_year = select_yy;
			next_month = select_mm +1; 
		}else if(select_mm == 12) {
			pre_year = select_yy;
			pre_month = select_mm -1;
			next_year = select_yy +1;
			next_month = 1;
		}else{
			pre_year = select_yy;
			pre_month = select_mm -1;
			next_year = select_yy;
			next_month = select_mm +1;
		}
		
		model.addAttribute("select_yy", select_yy);
		model.addAttribute("select_mm", select_mm);
		model.addAttribute("pre_year", pre_year);
		model.addAttribute("pre_month", pre_month);
		model.addAttribute("next_year", next_year);
		model.addAttribute("next_month", next_month);
		
		model.addAttribute("url", "scheduleList.do");
		model.addAttribute("title", "메인일정 관리");
		return "tiles:admin/schedule/schedule_list";
	}
	
	
	@RequestMapping("djemals/schedule/scheduleForm.do")
	public String scheduleForm(HttpServletRequest request, Model model,
			@RequestParam (required=false, defaultValue="0") int num,
			@RequestParam (required=true) String select_yy,
			@RequestParam (required=true) String select_mm,
			@RequestParam (required=true) String select_dd) throws Exception {
		
		SCHEDULEX schedule = null;
			
		if(select_mm.length()==1) select_mm = "0"+select_mm;
		if(select_dd.length()==1) select_dd = "0"+select_dd;
		
		if(num == 0){
			schedule = new SCHEDULEX();
			schedule.setCrud(CRUDValue.C);
			schedule.setYy(select_yy);
			schedule.setMm(select_mm);
			schedule.setDd(select_dd);
		}else{
			schedule = adminScheduleService.getSchedule(num);
			schedule.setCrud(CRUDValue.U);
		}
		
		model.addAttribute("schedule", schedule);
		
		model.addAttribute("url", "scheduleList.do");
		model.addAttribute("title", "메인일정 관리");
		return "tiles:admin/schedule/schedule_form";
	}
	
	@RequestMapping("djemals/schedule/scheduleAction.do")
	public View scheduleAction(SCHEDULEX vo, Model model, HttpServletRequest request) throws Exception {
		
		JavaScript javaScript = new JavaScript();
		
		switch(vo.getCrud()) {
		case C :
			adminScheduleService.insertSchedule(vo);
			javaScript.setMessage("등록 되었습니다.");
			break;
		case U:
			adminScheduleService.updateSchedule(vo);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			adminScheduleService.deleteSchedule(vo.getNum());
			javaScript.setMessage("삭제 되었습니다.");
			break;			
		}
		
		javaScript.setLocation("scheduleList.do");
		return new JavaScriptView(javaScript);
	}

}

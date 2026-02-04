package kda.admin.sms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class AdminSmsController {

	@RequestMapping("djemals/sms/print.do")
	public String print() throws Exception {
		return "redirect:/doc_form/sms_print.jsp";
	}
}

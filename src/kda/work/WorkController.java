package kda.work;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse; 

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class WorkController 
{
	private Log log = LogFactory.getLog(WorkController.class);

	@RequestMapping(value="{page1}/{page2}")
	public String kdaViewDepth2(@PathVariable String page1
						, @PathVariable String page2
						, Model model) throws Exception
	{	
		log.info("================================ ViewController [kdaViewDepth2]");
		log.info("page : " + page1 + "/" + page2);
		
		return "tiles" + "/" + page1 + "/"+ page2;		
	}
	 
	@RequestMapping(value="{page1}/{page2}/{page3}")
	public String kdaViewDepth3(@PathVariable String page1
						, @PathVariable String page2
						, @PathVariable String page3
						, Model model) throws Exception
	{	
		log.info("================================ ViewController [kdaViewDepth3]");
		log.info("page : " + page1 + "/" + page2 + "/" + page3);
		
		return "tiles" + "/" + page1 + "/"+ page2 + "/" + page3;
	}
	
	@RequestMapping(value="{page1}/{page2}/{page3}/{page4}")
	public String kdaViewDepth4(@PathVariable String page1
						, @PathVariable String page2
						, @PathVariable String page3
						, @PathVariable String page4
						, Model model) throws Exception
	{	
		log.info("================================ ViewController [kdaViewDepth4]");
		log.info("page : " + page1 + "/" + page2 + "/" + page3 + "/" + page4);
		
		return "tiles" + "/" + page1 + "/"+ page2 + "/" + page3 + "/" + page4;
	}
	
}

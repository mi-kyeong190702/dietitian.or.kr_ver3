package kda.english;

import kda.spring.abstr.KdaAbstractController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnglishController  extends KdaAbstractController{

	@RequestMapping("english/index.html")
	public String englishIndex() {
		System.out.println("english");
		return "redirect:/english/kda-about/ka_about.do";
	}
 	
	@RequestMapping("english/{page}.do")
	public String englishMain(@PathVariable String page, Model model) throws Exception {
		return "tiles:english/" + page;
	}
	
	@RequestMapping("english/{dir}/{page}.do")
	public String english( @PathVariable String dir, @PathVariable String page, Model model) throws Exception {
		model.addAttribute("dir", dir);
		model.addAttribute("page", page);
		return "tiles:english/" + dir + "/" + page ;
	}
}

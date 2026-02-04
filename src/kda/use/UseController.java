package kda.use;

import java.util.List;

import kda.main.MainService;
import kda.main.data.BANNER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UseController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping("use/ku_banner.do")
	public String bannerList(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		
		System.out.println("TEST");
		
		model.addAttribute("bannerList", bannerList);
		return "tiles/use/ku_banner";
	}
	
	@RequestMapping("use/ku_popupzone.do")
	public String popupList(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		
		model.addAttribute("bannerList", bannerList);
		return "tiles/use/ku_popupzone";
	}
}

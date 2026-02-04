package kda.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.board.PaperBoardService;
import kda.common.data.LIST_HELPER;
import kda.main.data.BANNER;
import kda.main.data.NOTICE;
import kda.main.data.SEARCH;
import kda.mypage.MyPageHDao;
import kda.mypage.data.MYMEMBERINFO;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;

@Controller
public class MainController  extends KdaAbstractController {
	@Autowired
	MainDao dao;
	
	@Autowired
	MyPageHDao myPageHDao;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private PaperBoardService paperBoardService;
	
	private Log log = LogFactory.getLog(MainController.class);
	
	@RequestMapping("index2.do")
	public String index2(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		List[] bannerAry = { new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };
		
		for( BANNER banner : bannerList ) {
			bannerAry[banner.getBanner_type() -1].add(banner);
		}
		String date = KdaStringUtil.getTodayString("-");
		String time = "";
		int hour = KdaStringUtil.nullToInt(KdaStringUtil.getCurrentTime().substring(0,2), 0);
		if( hour > 12 ) {
			time = "오후 " + hour;
		} else {
			time = "오전 " + KdaStringUtil.lpad(hour, 2);
		}
		
		mainService.saveLog(date, time);
		model.addAttribute("bannerAry", bannerAry);
		return "index2";
	}
	
	/*iframe index page*/
	@RequestMapping("iframebanner.do")
	public String iframebanner(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		List[] bannerAry = { new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };
		
		for( BANNER banner : bannerList ) {
			bannerAry[banner.getBanner_type() -1].add(banner);
		}
		
		String date = KdaStringUtil.getTodayString("-");
		String time = "";
		int hour = KdaStringUtil.nullToInt(KdaStringUtil.getCurrentTime().substring(0,2), 0);
		if( hour > 12 ) {
			time = "오후 " + hour;
		} else {
			time = "오전 " + KdaStringUtil.lpad(hour, 2);
		}
		
		mainService.saveLog(date, time);
		model.addAttribute("bannerAry", bannerAry);
		return "iframebanner";
	}
	
	/*iframe index bottom page*/
	@RequestMapping("iframebanner_bottom.do")
	public String iframebanner_bottom(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		List[] bannerAry = { new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };
		
		for( BANNER banner : bannerList ) {
			bannerAry[banner.getBanner_type() -1].add(banner);
		}
		
		String date = KdaStringUtil.getTodayString("-");
		String time = "";
		int hour = KdaStringUtil.nullToInt(KdaStringUtil.getCurrentTime().substring(0,2), 0);
		if( hour > 12 ) {
			time = "오후 " + hour;
		} else {
			time = "오전 " + KdaStringUtil.lpad(hour, 2);
		}
		
		mainService.saveLog(date, time);
		model.addAttribute("bannerAry", bannerAry);
		return "iframebanner_bottom";
	}
	
	@RequestMapping("banner.do")
	public String banner(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		List[] bannerAry = { new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };
		
		for( BANNER banner : bannerList ) {
			bannerAry[banner.getBanner_type() -1].add(banner);
		}
		
		model.addAttribute("bannerAry", bannerAry);
		return "banner";
	}
	
	/** 
	 * 디자인 샘플용
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("index.do")
	public String index(Model model) throws Exception {
		List<BANNER> bannerList = mainService.getMainBannerList();
		List<NOTICE> notice = dao.getnoticeList_89();
		
		List[] bannerAry = { new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };
		
		for( BANNER banner : bannerList ) {
			bannerAry[banner.getBanner_type() -1].add(banner);
		}
		
		String date = KdaStringUtil.getTodayString("-");
		String time = "";
		int hour = KdaStringUtil.nullToInt(KdaStringUtil.getCurrentTime().substring(0,2), 0);
		if( hour > 12 ) {
			time = "오후 " + hour;
		} else {
			time = "오전 " + KdaStringUtil.lpad(hour, 2);
		}
		 
		System.out.println(notice);
		
		mainService.saveLog(date, time);
		model.addAttribute("bannerAry", bannerAry);
		model.addAttribute("noticeList4", notice);
		return "index";
	}
	
	
	@RequestMapping(value="main_getNoticeHtml2" , method = RequestMethod.GET )
	public void getNoticeHtml( HttpServletResponse response, Model model ) throws Exception
	{
		log.info("================================ getnoticeHtml");

		// -- notice1
		List<NOTICE> notice1 = dao.getNoticeList();

		String notice_list1 = "<ul id='notice_list1'>";
		String notice_list2 = "<ul id='notice_list2' style='display:none'>";
		String notice_list3 = "<ul id='notice_list3' style='display:none'>";
		
		for(NOTICE row : notice1)
		{
			int bbs_idx = row.getBbs_idx();
			int bbs_board_code = row.getBbs_board_code();
			
			String func = "javascript:doClickNotice(" + bbs_idx + "," + bbs_board_code + ")";
				
			if 		( bbs_board_code == 2 )
				notice_list1 += "<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" + row.getBbs_subject() + "</nobr></div></a></li>";
			else if ( bbs_board_code >= 69 &&  bbs_board_code <= 81 )
				notice_list2 += "<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" +"<span class='cm'>["+ row.getBbs_category() +"]</span>"+ row.getBbs_subject() + "</nobr></div></a></li>";
			else
				notice_list3 += "<li><a href='" + func + "'><div style='width:260; text-overflow:ellipsis; overflow:hidden;'><nobr>" + row.getBbs_subject() + "</nobr></div></a></li>";
	
		}
		
		notice_list1 += "</ul>";
		notice_list2 += "</ul>";
		notice_list3 += "</ul>";
		
	    try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(notice_list1 + notice_list2 + notice_list3);    
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	
	@RequestMapping(value="main_getNoticeHtml" , method = RequestMethod.GET )
	public void getNotceHtml2( HttpServletResponse response, Model model 
		,HttpSession session  ) throws Exception
	{
		log.info("================================ getnoticeHtml2");
		SessionInfo sessionInfo = new SessionInfo ( session );
		
		String userId = sessionInfo.getUserId();
		int userLevel = sessionInfo.getUserLevel();
		String codeBig = sessionInfo.getCodebig();
 
		
		//System.out.println("JAVA userID:::  " + sessionInfo.getUserId());
		// -- notice1
		List<NOTICE> notice1 = dao.getNoticeList();  
		
		String notice_list1 = "";
		String notice_list2 = "";
		String notice_list3 = "";
		String notice_list4 = "<h2 class='ti'>협회 활동 현황</h2><ul class='gallery_list' id='news_slide'>";		 
		
		//String notice_list5 = "<h2 class='ti'>나의 식단 자랑하기</h2><ul class='gallery_list'>";
		String notice_list6 = "<h2 class='ti'>식품ㆍ영양 News </h2><ul class='new_news_list'>";
		String notice_list7 = "<h2 class='ti'>협회 News </h2><ul class='new_news_list'>";
		
		String tmp="";
		
		String bbs_str="";
		
		int i=0, j=0,k=0;
		for(NOTICE row : notice1)
		{ 
			String insDt = row.getBbs_reg_date_dt();
			 
			String year = insDt.substring(0, 4);
			String yy = insDt.substring(2, 4);
			String month = insDt.substring(5, 7);
			String day = insDt.substring(8, 10);
			
			int bbs_idx = row.getBbs_idx();
			int bbs_board_code = row.getBbs_board_code();
			
			String func = "javascript:doClickNotice(" + bbs_idx + "," + bbs_board_code + ")";
			String funcBBS ="" ; 
			String subject = "";
			
			subject = row.getBbs_subject().replaceAll("<[^>]*>", " ");
			if ( bbs_board_code == 2 ){ 
				
				i+=1;
				if(i==1){  
					notice_list1 +="<div class='main_board_first'>";
					notice_list1 +="<p class='date'><strong>"+ day +"</strong>"+yy+"."+month+"</p>";
					notice_list1 +="<p class='content'><a href='" + func + "'>"+ subject;				 
					
					notice_list1 +="</a></p>";
					notice_list1 +="</div>";
				}else{
					
					if( i ==2){
						notice_list1 +="<ul class='list'>";						
					}  
					notice_list1 +=" <li> <a href='" + func + "'>"+ subject ;
					 
					notice_list1 +="</a>";
                    notice_list1 +="<p class='date'>"+year+"-"+month+"-"+day+"</p></li>";
				//System.out.println(notice_list1);	
				}
				
			}else if ( bbs_board_code >= 69 &&  bbs_board_code <= 81 ){
				j+=1; 
				if(j==1){
					notice_list2 +="<div class='main_board_first'>";
					notice_list2 +="<p class='date'><strong>"+ day +"</strong>"+yy+"."+month+"</p>";
					notice_list2 +="<p class='content'><a href='" + func + "'><span>["+ row.getBbs_category() +"]</span>"+ subject;
					 
					notice_list2 +="</a></p>";
					notice_list2 +="</div>";
				}else{
					if( j ==2){
						notice_list2 +="<ul class='list'>";						
					} 					 
					notice_list2 +=" <li> <a href='" + func + "'><span>["+ row.getBbs_category() +"]</span>"+ subject ;					 
					notice_list2 +="</a></p>";
                    notice_list2 +="<p class='date'>"+year+"-"+month+"-"+day+"</p></li>";
					
				}
			}else if(bbs_board_code ==0){
				k+=1;
				if(k==1){
					notice_list3 +="<div class='main_board_first'>";
					notice_list3 +="<p class='date'><strong>"+ day +"</strong>"+yy+"."+month+"</p>";
					notice_list3 +="<p class='content'><a href='" + func + "'>"+ subject;
				 
					notice_list3 +="</a></p>";
					notice_list3 +="</div>";
				}else{
					if( k ==2){
						notice_list3 +="<ul class='list'>";						
					} 
					 
					notice_list3 +=" <li> <a href='" + func + "'>"+ subject;
					 
					notice_list3 +="</a></p>";
                    notice_list3 +="<p class='date'>"+year+"-"+month+"-"+day+"</p></li>";
					
				} 
				
			}else if(bbs_board_code ==92){
				//funcBBS	= "javascript:doClickBBS(\"archive/ka_recipe\","+ bbs_idx + "," + bbs_board_code + ")";
				//notice_list5 +="<li> <a href='" + funcBBS + "'>";
				//notice_list5 +="<p class='photo'><img height='124' src=https://www.dietitian.or.kr"+ row.getBbs_file_url() +" alt=''/></p>";
				//notice_list5 +="<div>";
				//notice_list5 +="<p class='title'>"+ subject +"</p>";
				//notice_list5 +="<p class='date'>"+year+"-"+month+"-"+day+"</p>";
                //notice_list5 +="</div>";
                //notice_list5 +="</a> </li>";
			}else if(bbs_board_code ==91){
				/* 식품영양 핫뉴스 */
				tmp = row.getBbs_contents().replaceAll("<[^>]*>", " ");
				 
				funcBBS	= "javascript:doClickBBS(\"archive/ka_hotnews\","+ bbs_idx + "," + bbs_board_code + ")";
				notice_list6 +="<li><a href='" + funcBBS + "'>";
				if(row.getBbs_file_url().trim().equals("") || row.getBbs_file_url().equals(null)){
					notice_list6 +="<p class='img'><img src='./images/main/no_img.png' /></p>";
				}else{
					notice_list6 +="<p class='img'><img src='"+ row.getBbs_file_url() +"' /></p>";
				} 
				notice_list6 +="<div>";
				notice_list6 +="<p class='title'>"+ subject +"</p>";
				notice_list6 +="<div><p>"+tmp+ "</p>";
				notice_list6 +="<p class='date'>"+year+"-"+month+"-"+day+"</p></div>";				
				notice_list6 +="</div>";
                notice_list6 +="</a> </li>"; 
			}else if(bbs_board_code ==87){
				/* 협회뉴스 */
				tmp = row.getBbs_contents().replaceAll("<[^>]*>", " ");
				  
				funcBBS	= "javascript:doClickBBS(\"archive/ka_hotnews\","+ bbs_idx + "," + bbs_board_code + ")";
				notice_list7 +="<li><a href='" + funcBBS + "'>";
				if(row.getBbs_file_url().trim().equals("") || row.getBbs_file_url().equals(null)){
					notice_list7 +="<p class='img'><img src='./images/main/no_img.png' /></p>";
				}else{
					notice_list7 +="<p class='img'><img src='"+ row.getBbs_file_url() +"' /></p>";
				} 
				notice_list7 +="<div>";
				notice_list7 +="<p class='title'>"+ subject +"</p>";
				notice_list7 +="<div><p>"+tmp+ "</p>";
				notice_list7 +="<p class='date'>"+year+"-"+month+"-"+day+"</p></div>";				
				notice_list7 +="</div>";
                notice_list7 +="</a> </li>";  
			}
        	 
		}  
		
		  
		final String ENC = "UTF-8";
		String uri2 = "/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid="+userId;
		final String result2 = UriUtils.encodeFragment(uri2, ENC); 
		 
		notice_list1 += "</ul><a href='/work/news/kn_notice.do?bbs_board_code=2' class='more' title='공지사항 더보기'><span>공지사항 더보기</span></a>";
		notice_list2 += "</ul><a href='"+ result2 +"' class='more' title='시도영양사회 더보기'><span>시도영양사회 더보기</span></a> ";
		notice_list3 += "</ul><a href='/work/news/kn_organ_news.do?bbs_board_code=0' class='more' title='관련기관소식 더보기'><span>관련기관소식 더보기</span></a> ";
		notice_list4 += "</ul><a href='/work/news/kn_gallery.do?bbs_board_code=89&g_userid=" + userId + "' class='more' title='협회 활동 현황 더보기'><span>협회 활동 현황 더보기</span></a>";
		//notice_list5 += "</ul><a href='/work/archive/ka_recipe.do?bbs_board_code=92&g_userid=" + userId + "' class='more' title='나의 식단 자랑하기 더보기'><span>나의 식단 자랑하기 더보기</span></a>";
		notice_list6 += "</ul><a href='/work/archive/ka_hotnews.do?bbs_board_code=91' class='more' title='식품ㆍ영양 News 더보기'><span>식품ㆍ영양 News 더보기</span></a>";
		notice_list7 += "</ul><a href='/work/archive/ka_hotnews.do?bbs_board_code=87' class='more' title='협회 News 더보기'><span>협회 News 더보기</span></a>";
		try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(notice_list1+"$"+notice_list2+"$"+notice_list3+"$"+notice_list4+"$"+notice_list6+"$"+notice_list7);    
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	/* 분과게시판 산업체 */
	@RequestMapping(value="main_getDepartHtml" , method = RequestMethod.GET )
	public void getDepartHtml( HttpServletResponse response, Model model 
		,HttpSession session  ) throws Exception
	{
		log.info("================================ 분과별게시판 getnoticeHtml");
		SessionInfo sessionInfo = new SessionInfo ( session );
		
		String userId = sessionInfo.getUserId();  
	 	List<NOTICE> notice1 = dao.getNoticeList2();   
		
		//산업체 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_1 = "<h2 class='ti'>산업체 </h2><ul class='part_list'>";
		String depart_1_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_1_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_1_3 = "<li><p class='part'>정보나눔방</p><ul>";
		String depart_1_4 = "<li><p class='part'>식단 및 레시피</p><ul>";
		
	  
		for(NOTICE row : notice1)
		{ 
			 
			int bbs_idx = row.getBbs_idx();
			int bbs_board_code = row.getBbs_board_code();
			
			String funcBBS ="" ; 
			String subject = "";
			
			subject = row.getBbs_subject().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			if ( bbs_board_code == 124 ){ 
				funcBBS	= "javascript:doClickBBS(\"department/ka_industry_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_1_1+="<li><a href=" + funcBBS + ">"+ subject +" </a></li>";
			 		
			}else if ( bbs_board_code == 125 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_industry_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_1_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 126 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_industry_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_1_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 127 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_industry_rcp\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_1_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}
		} 
		depart_1_1 +="</ul><p class='detail_more'><a href='/work/department/ka_industry_notice.do?bbs_board_code=124&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_1_2 +="</ul><p class='detail_more'><a href='/work/department/ka_industry_data.do?bbs_board_code=125&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_1_3 +="</ul><p class='detail_more'><a href='/work/department/ka_industry_info.do?bbs_board_code=126&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_1_4 +="</ul><p class='detail_more'><a href='/work/department/ka_industry_rcp.do?bbs_board_code=127&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		 
		depart_1= depart_1+ depart_1_1 +depart_1_2+depart_1_4+depart_1_3+"</ul>";
	 	 
		try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(depart_1);
	    	System.out.println(depart_1);
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	@RequestMapping(value="main_getDepartHtml2" , method = RequestMethod.GET )
	public void getDepartHtml2( HttpServletResponse response, Model model 
		,HttpSession session  ) throws Exception
	{
		log.info("================================ 분과별게시판 getnoticeHtml 뒤쪽탭");
		SessionInfo sessionInfo = new SessionInfo ( session );
		
		String userId = sessionInfo.getUserId();
		int userLevel = sessionInfo.getUserLevel();
		String codeBig = sessionInfo.getCodebig();
  
		List<NOTICE> notice1 = dao.getNoticeList3();  
		   
		//병원 -공지사항,자료실,정보나눔방,급식운영,질문답하기
		String depart_2 = "<h2 class='ti'>병원 </h2><ul class='part_list'>";
		String depart_2_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_2_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_2_3 = "<li><p class='part'>전문영양사모임</p><ul>";
		String depart_2_4 = "<li><p class='part'>정보나눔방</p><ul>";
		String depart_2_5 = "<li><p class='part'>질문답하기</p><ul>";
		
		//영양교사 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_3 = "<h2 class='ti'>영양교사 </h2><ul class='part_list'>";
		String depart_3_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_3_2 = "<li><p class='part'>급식운영</p><ul>";
		String depart_3_3 = "<li><p class='part'>영양교육</p><ul>";
		String depart_3_4 = "<li><p class='part'>학교식단</p><ul>";
		String depart_3_5 = "<li><p class='part'>시도소식</p><ul>";
		
		
		//영양교사 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_4 = "<h2 class='ti'>학교영양사 </h2><ul class='part_list'>";
		String depart_4_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_4_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_4_3 = "<li><p class='part'>정보 나눔방</p><ul>";
		String depart_4_4 = "<li><p class='part'>식단 및 레시피</p><ul>";
		String depart_4_5 = "<li><p class='part'>시·도소식</p><ul>";
		
		//보건복지시설 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_5 = "<h2 class='ti'>보건복지시설 </h2><ul class='part_list'>";
		String depart_5_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_5_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_5_3 = "<li><p class='part'>정보 나눔방</p><ul>";
		String depart_5_4 = "<li><p class='part'>급식운영</p><ul>";
		String depart_5_5 = "<li><p class='part'>홍보하기</p><ul>";
		
		//보건복지시설 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_6 = "<h2 class='ti'>건강상담 </h2><ul class='part_list'>";
		String depart_6_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_6_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_6_3 = "<li><p class='part'>정보 나눔방</p><ul>";
		String depart_6_4 = "<li><p class='part'>일정표</p><ul>"; 
		
		//보건복지시설 -공지사항,자료실,정보나눔방,식단및레시피
		String depart_7 = "<h2 class='ti'>어린이급식관리지원센터 </h2><ul class='part_list'>";
		String depart_7_1 = "<li><p class='part'>공지사항</p><ul>";
		String depart_7_2 = "<li><p class='part'>자료실</p><ul>";
		String depart_7_3 = "<li><p class='part'>정보나눔방</p><ul>";
		String depart_7_4 = "<li><p class='part'>식단 및 레시피</p><ul>";
		String depart_7_5 = "<li><p class='part'>질문답하기</p><ul>";
		
		String bbs_str="";
		
		int i=0, j=0,k=0;
		for(NOTICE row : notice1)
		{ 
			String insDt = row.getBbs_reg_date_dt();
			 
			String year = insDt.substring(0, 4);
			String yy = insDt.substring(2, 4);
			String month = insDt.substring(5, 7);
			String day = insDt.substring(8, 10);
			
			int bbs_idx = row.getBbs_idx();
			int bbs_board_code = row.getBbs_board_code();
			
			String func = "javascript:doClickNotice(" + bbs_idx + "," + bbs_board_code + ")";
			String funcBBS ="" ; 
			String subject = "";
			
			subject = row.getBbs_subject().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			if ( bbs_board_code == 128 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_hospital_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_2_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 129 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_hospital_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_2_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 130 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_hospital_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_2_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 131 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_hospital_meal\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_2_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 132 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_hospital_question\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_2_5 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			/* 영양교사 */
			}else if ( bbs_board_code == 133 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_kda_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_3_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 134 || bbs_board_code == 135  || bbs_board_code == 184 ){
				if (bbs_board_code==134) bbs_str ="법규및지침";
			    if (bbs_board_code==135)  bbs_str ="자료실";
			    if (bbs_board_code==184)  bbs_str ="급식위생";
				funcBBS	= "javascript:doClickBBS(\"department/ka_kda_meal\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_3_2 +="<li><a href='" + funcBBS + "'><span>[" + bbs_str + "]</span>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 136 || bbs_board_code == 137 ){
				if (bbs_board_code==136) bbs_str ="식단";
			    if (bbs_board_code==137) bbs_str ="레시피";
				funcBBS	= "javascript:doClickBBS(\"department/ka_kda_edu\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_3_4 +="<li><a href='" + funcBBS + "'><span>[" + bbs_str + "]</span>"+ subject +" </a></li>";
			}else if (  bbs_board_code == 138 || bbs_board_code == 139 || bbs_board_code == 185 || bbs_board_code == 186 ){
				if (bbs_board_code==138) bbs_str ="영양수업";
			    if (bbs_board_code==139) bbs_str ="동아리수업";
			    if (bbs_board_code==185) bbs_str ="영양상담";
			    if (bbs_board_code==186) bbs_str ="가정통신문";
				funcBBS	= "javascript:doClickBBS(\"department/ka_kda_diet\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_3_3 +="<li><a href='" + funcBBS + "'><span>[" + bbs_str + "]</span>"+ subject +" </a></li>";
			}else if ( (bbs_board_code >= 140 &&  bbs_board_code <= 152) || (bbs_board_code >= 187 &&  bbs_board_code <= 190)){
				if (bbs_board_code==140) bbs_str ="서울";
			    if (bbs_board_code==141) bbs_str ="부산";
			    if (bbs_board_code==142) bbs_str ="인천";
			    if (bbs_board_code==143) bbs_str ="경기";
			    if (bbs_board_code==144) bbs_str ="강원특별자치도";
			    if (bbs_board_code==145) bbs_str ="충청북도";
			    if (bbs_board_code==146) bbs_str ="대전·충남·세종";
			    if (bbs_board_code==147) bbs_str ="전북특별자치도";
			    if (bbs_board_code==148) bbs_str ="광주·전남";
			    if (bbs_board_code==149) bbs_str ="대구·경북";
			    if (bbs_board_code==150) bbs_str ="경상남도";
			    if (bbs_board_code==151) bbs_str ="울산";
			    if (bbs_board_code==187) bbs_str ="충남"; 
			    if (bbs_board_code==188) bbs_str ="세종"; 
			    if (bbs_board_code==189) bbs_str ="전남"; 
			    if (bbs_board_code==190) bbs_str ="경북";
			    
				funcBBS	= "javascript:doClickBBS(\"department/ka_kda_area\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_3_5 +="<li><a href='" + funcBBS + "'><span>[" + bbs_str + "]</span>"+ subject +" </a></li>";
			
			/* 학교영양사 */	
			}else if ( bbs_board_code == 153 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_school_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_4_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 154 ){ 
				funcBBS	= "javascript:doClickBBS(\"department/ka_school_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_4_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 155 ){ 
				funcBBS	= "javascript:doClickBBS(\"department/ka_school_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_4_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if (  bbs_board_code == 156 ){ 
				funcBBS	= "javascript:doClickBBS(\"department/ka_school_rcp\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_4_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 157  ){ 
			    
				funcBBS	= "javascript:doClickBBS(\"department/ka_school_area\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_4_5 +="<li><a href='" + funcBBS + "'><span>[" + row.getBbs_category() + "]</span>"+ subject +" </a></li>";
			/* 보건복지시설 */
			}else if ( bbs_board_code == 170 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_center_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_5_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 171 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_center_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_5_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 172 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_center_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_5_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 173 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_center_meal\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_5_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 174 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_center_pr\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_5_5 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			/*건강상담*/
			}else if ( bbs_board_code == 175 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_counsel_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_6_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 176 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_counsel_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_6_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 177 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_counsel_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_6_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 178 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_counsel_schedule\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_6_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			/*어린이급식관리지원센터*/
			}else if ( bbs_board_code == 179 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_child_notice\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_7_1 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 180 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_child_data\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_7_2 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 181 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_child_info\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_7_3 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 182 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_child_rcp\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_7_4 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
			}else if ( bbs_board_code == 183 ){
				funcBBS	= "javascript:doClickBBS(\"department/ka_child_question\","+ bbs_idx + "," + bbs_board_code + ")";
				depart_7_5 +="<li><a href='" + funcBBS + "'>"+ subject +" </a></li>";
					
			}else{
				 
			}
		} 
		 
		depart_2_1 +="</ul><p class='detail_more'><a href='/work/department/ka_hospital_notice.do?bbs_board_code=128&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_2_2 +="</ul><p class='detail_more'><a href='/work/department/ka_hospital_data.do?bbs_board_code=129&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_2_3 +="</ul><p class='detail_more'><a href='/work/department/ka_hospital_info.do?bbs_board_code=130&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_2_4 +="</ul><p class='detail_more'><a href='/work/department/ka_hospital_meal.do?bbs_board_code=131&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_2_5 +="</ul><p class='detail_more'><a href='/work/department/ka_hospital_question.do?bbs_board_code=132&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_3_1 +="</ul><p class='detail_more'><a href='/work/department/ka_kda_notice.do?bbs_board_code=133&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_3_2 +="</ul><p class='detail_more'><a href='/work/department/ka_kda_meal.do?bbs_board_code=134&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_3_3 +="</ul><p class='detail_more'><a href='/work/department/ka_kda_diet.do?bbs_board_code=138&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_3_4 +="</ul><p class='detail_more'><a href='/work/department/ka_kda_edu.do?bbs_board_code=136&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_3_5 +="</ul><p class='detail_more'><a href='/work/department/ka_kda_area.do?bbs_board_code=140,141,142,143,144,145,146,147,148,149,150,151,152,187,188,189,190&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_4_1 +="</ul><p class='detail_more'><a href='/work/department/ka_school_notice.do?bbs_board_code=153&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_4_2 +="</ul><p class='detail_more'><a href='/work/department/ka_school_data.do?bbs_board_code=154&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_4_3 +="</ul><p class='detail_more'><a href='/work/department/ka_school_info.do?bbs_board_code=155&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_4_4 +="</ul><p class='detail_more'><a href='/work/department/ka_school_rcp.do?bbs_board_code=156&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		depart_4_5 +="</ul><p class='detail_more'><a href='/work/department/ka_school_area.do?bbs_board_code=157&g_userid=" +userId +"&g_user_level="+userLevel +"&g_code_big="+ codeBig +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_5_1 +="</ul><p class='detail_more'><a href='/work/department/ka_center_notice.do?bbs_board_code=170&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_5_2 +="</ul><p class='detail_more'><a href='/work/department/ka_center_data.do?bbs_board_code=171&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_5_3 +="</ul><p class='detail_more'><a href='/work/department/ka_center_info.do?bbs_board_code=172&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_5_4 +="</ul><p class='detail_more'><a href='/work/department/ka_center_meal.do?bbs_board_code=173&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_5_5 +="</ul><p class='detail_more'><a href='/work/department/ka_center_pr.do?bbs_board_code=174&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_6_1 +="</ul><p class='detail_more'><a href='/work/department/ka_counsel_notice.do?bbs_board_code=175&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_6_2 +="</ul><p class='detail_more'><a href='/work/department/ka_counsel_data.do?bbs_board_code=176&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_6_3 +="</ul><p class='detail_more'><a href='/work/department/ka_counsel_info.do?bbs_board_code=177&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_6_4 +="</ul><p class='detail_more'><a href='/work/department/ka_counsel_schedule.do?bbs_board_code=178&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_7_1 +="</ul><p class='detail_more'><a href='/work/department/ka_child_notice.do?bbs_board_code=179&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_7_2 +="</ul><p class='detail_more'><a href='/work/department/ka_child_data.do?bbs_board_code=180&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_7_3 +="</ul><p class='detail_more'><a href='/work/department/ka_child_info.do?bbs_board_code=181&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_7_4 +="</ul><p class='detail_more'><a href='/work/department/ka_child_rcp.do?bbs_board_code=182&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		depart_7_5 +="</ul><p class='detail_more'><a href='/work/department/ka_child_question.do?bbs_board_code=183&g_userid=" +userId +"' title='더보기'><span>더보기</span></a> </p>";
		
		depart_2= depart_2+ depart_2_1 +depart_2_2+depart_2_3+depart_2_4+depart_2_5+"</ul>";
		depart_3= depart_3+ depart_3_1 +depart_3_2+depart_3_3+depart_3_4+"</ul>";
		depart_4= depart_4+ depart_4_1 +depart_4_2+depart_4_4+depart_4_3+"</ul>";
		depart_5= depart_5+ depart_5_1 +depart_5_2+depart_5_4+depart_5_3+"</ul>";
		depart_6= depart_6+ depart_6_1 +depart_6_2+depart_6_3+"</ul>";
		depart_7= depart_7+ depart_7_1 +depart_7_2+depart_7_4+depart_7_3+"</ul>";
		  
		final String ENC = "UTF-8";
		String uri2 = "/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid="+userId;
		final String result2 = UriUtils.encodeFragment(uri2, ENC); 
		 
		try {
	    	response.setContentType("text/html; charset=utf-8");
	    	response.getWriter().print(depart_2+"$"+depart_3+"$"+depart_4+"$"+depart_5+"$"+depart_6+"$"+depart_7);
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}
	
	
	
	@RequestMapping("banner_click_ajax.do")
	public @ResponseBody String bannerClickAjax(@RequestParam int bannerIdx ) {
		try {
			String date = KdaStringUtil.getTodayString("-");
			String hour = KdaStringUtil.getCurrentHour();
			
			mainService.saveLogBanner(date, hour, bannerIdx);
			
		} catch(Exception e) {
			return "false";
		}
		return "true";
	}
	
	@RequestMapping("ks_result.do")
	public String searchResult(SEARCH search, HttpServletRequest request, Model model) throws Exception {
		
		String[] aryKey = search.getKeyword().split(" ");
		
		search.setAryWord(aryKey);
		
		int totalCount = paperBoardService.getSearchCount(search);
		List<Map> searchList = paperBoardService.getSearchList(search);
		
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper.setTotalCount(totalCount);
		listHelper.setCurPage(search.getCurPage());
		listHelper.setList(searchList);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("search", search);
		
		return "tiles/search/ks_result";
	}
	
	@RequestMapping("/member_log_ajax.do")
	public void setMemberLog( HttpServletRequest request, HttpSession session ) {
		System.out.println("ajax");
		if( checkLogin(session) ) {
			try { 
				String code_pers = getCodePers(session);
				String pers_name = getUserName(session);
				String page_title = KdaStringUtil.nullToString(request.getParameter("page_title"));
				String date = KdaStringUtil.getTodayString("-");
				String time = KdaStringUtil.getCurrentHour();
				if( !page_title.equals("") ) {
					mainService.saveLogMember(code_pers, pers_name, date, time, page_title);
				}
			} catch(Exception e) {
				log.error("member_log_error", e);
			}
		}
	}
	
	@RequestMapping("/send_edu.do")
	public String send_edu(HttpServletRequest request, HttpSession session, Model model
			,@RequestParam String gubun) throws Exception{
		try {
			
			String code_pers = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.CODE_PERS));
			String check = "";
			String s_url = "";
			
			if("1".equals(gubun)) {
				s_url = "http://210.127.55.231:8818";
			}
			else if("2".equals(gubun)) {
				s_url = "http://210.127.55.231:8820";
			}
			
			MYMEMBERINFO vo = null;
			if(!"".equals(code_pers)){
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("code_pers", (String) session.getAttribute(SessionInfo.CODE_PERS)  );
				vo = myPageHDao.getMyMemberInfo(map);
				vo.setPers_hp("");
				
				MYMEMBERINFO vo2 = mainService.getSend_edu(vo.getId(), gubun);
				if(vo2 !=null){
					vo.setPers_hp(vo2.getPers_hp());
					vo.setPers_name(vo2.getPers_name());
					check = "1";
				}
				
			}
			
			model.addAttribute("info", vo);
			model.addAttribute("check", check);
			model.addAttribute("s_url", s_url);
			
		} catch (Exception e) {
			log.error("send_edu_error"+e);
		}
		
		return "/common/send_edu";
	}

}

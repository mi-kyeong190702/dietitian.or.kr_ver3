package kda.work.publication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kda.common.FileUploadService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.values.CRUDValue;
import kda.work.publication.data.KDA_COLUMN;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("work/publication")
public class KdaColumnController extends KdaAbstractController {
	
	public static final String FILE_BASE = "/upload/publication/";
	
	@Autowired
	private PublicationService publicationService;
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	private FileUploadService fileUplaodService;
	
	
	@RequestMapping("kp_m_list.do")
	public String magazineList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request, 8);
		listHelper = publicationService.getKdaColumnListHelper(listHelper);

		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_m_list";
	}
	
/*	@RequestMapping("kp_m_list_view.do")
	public String magazineView(@RequestParam int idx, Model model) throws Exception {
		KDA_COLUMN kdaColumn = publicationService.getKdaColumn(idx);
		model.addAttribute("column", kdaColumn);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_m_list_view";
	}*/
	
	/*20160623 국민영양검색 이북보기시 회원/관리자 세션 체크 추가*/
	@RequestMapping("kp_m_list_view.do")
	public String magazineView(@RequestParam (required=false, defaultValue="0") int idx,
			HttpSession session, Model model) throws Exception {
		
		setDefaultModel(session, model);
		
		if( getUserLevel(session) != 5  && !isAdmin(session)) {
			return goLocation("로그인이 필요합니다.", "/", model);
		}
			
		KDA_COLUMN kdaColumn = publicationService.getKdaColumn(idx);
		model.addAttribute("column", kdaColumn);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_m_list_view";
	}
	
	@RequestMapping("kp_m_list_form.do")
	public String magazineForm(@RequestParam (required=false, defaultValue="0") int idx,
			HttpSession session, Model model) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackPage("올바르지 않은 접근입니다.", model);
		}
		
		KDA_COLUMN kdaColumn = null;
		if( idx == 0 ) {
			kdaColumn = new KDA_COLUMN();
			kdaColumn.setCrud(CRUDValue.C);
		} else {
			kdaColumn = publicationService.getKdaColumn(idx);
			kdaColumn.setCrud(CRUDValue.U);
		}
		
		System.out.println(kdaColumn.getKda_column());
		
		
		model.addAttribute("column", kdaColumn);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_m_list_form";
	}
	
	@RequestMapping("kp_m_list_action.do") 
	public View magazineAction(KDA_COLUMN column, HttpSession session, Model model) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackView("올바르지 않은 접근입니다.");
		}
		
		MultipartFile file = column.getUpload_image();
		
		if( file != null && file.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(column.getImagename()) ) {
				String filePath = servletContext.getRealPath( FILE_BASE + column.getImagename() );
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(FILE_BASE + "sImage/");
			String imageName = fileUplaodService.uploadImage(file, path);
			column.setImagename( "./sImage/" + imageName);
		}
		
		if( column.getTagchecked() == null ) {
			column.setNotag2();		
			column.setTagchecked("0");
		}
		
		JavaScript javaScript = new JavaScript();
		switch(column.getCrud()) {
		case C:
			publicationService.insertKdaColumn(column);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			publicationService.updateKdaColumn(column);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			column = publicationService.getKdaColumn(column.getIdx());
			if( !KdaStringUtil.isEmpty(column.getImagename()) ) {
				String filePath = servletContext.getRealPath( FILE_BASE + column.getImagename() );
				fileUplaodService.deleteFile(filePath);
			}
			
			publicationService.deleteColumn(column.getIdx());
			javaScript.setMessage("삭제 되었습니다.");
			break;
		}
		javaScript.setLocation("kp_m_list.do");
		return new JavaScriptView(javaScript);
	}
	
	/* E-Book 추가 */
	@RequestMapping("kp_ebook_list.do")
	public String ebookmagazineList(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request, 8);
		listHelper = publicationService.getEbookColumnListHelper(listHelper);
		
		List<Map> imageList = listHelper.getList();
		//System.out.println("======================="+kdaColumn.getImagename());
		if(imageList.size() > 0) {
			model.addAttribute("imagename", imageList.get(0).get("imagename"));
		}
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_ebook_list";
	}
	
	/* 국민영양검색 이북보기시 회원/관리자 세션 체크 추가*/
	@RequestMapping("kp_ebook_list_view.do")
	public String ebookmagazineView(@RequestParam (required=false, defaultValue="0") int idx,
			HttpSession session, Model model) throws Exception {
		
		setDefaultModel(session, model);
		
		if( getUserLevel(session) != 5  && !isAdmin(session)) {
			return goLocation("로그인이 필요합니다.", "/", model);
		}
			
		KDA_COLUMN kdaColumn = publicationService.getEbookColumn(idx);
		model.addAttribute("column", kdaColumn);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_ebook_list_view";
	}
	
	@RequestMapping("kp_ebook_list_form.do")
	public String ebookmagazineForm(@RequestParam (required=false, defaultValue="0") int idx,
			HttpSession session, Model model) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackPage("올바르지 않은 접근입니다.", model);
		}
		
		KDA_COLUMN kdaColumn = null;
		if( idx == 0 ) {
			kdaColumn = new KDA_COLUMN();
			kdaColumn.setCrud(CRUDValue.C);
		} else {
			kdaColumn = publicationService.getEbookColumn(idx);
			kdaColumn.setCrud(CRUDValue.U);
		}
		
		System.out.println(kdaColumn.getKda_column());
		
		
		model.addAttribute("column", kdaColumn);
		model.addAttribute("FILE_BASE", FILE_BASE);
		return "tiles/work/publication/kp_ebook_list_form";
	}
	
	@RequestMapping("kp_ebook_list_action.do") 
	public View ebookmagazineAction(KDA_COLUMN column, HttpSession session, Model model) throws Exception {
		if( !isAdmin(session) ) {
			return getHistoryBackView("올바르지 않은 접근입니다.");
		}
		
		MultipartFile file = column.getUpload_image();
		
		if( file != null && file.getSize() > 0 ) {
			// 기존 이미지가 존재할 경우 삭제
			if( !KdaStringUtil.isEmpty(column.getImagename()) ) {
				String filePath = servletContext.getRealPath( FILE_BASE + column.getImagename() );
				fileUplaodService.deleteFile(filePath);
			}
			
			// 신규 파일을 저장하고 Setter처리		
			String path = servletContext.getRealPath(FILE_BASE + "sImage/");
			String imageName = fileUplaodService.uploadImage(file, path);
			column.setImagename( "./sImage/" + imageName);
		}
		
		if( column.getTagchecked() == null ) {
			column.setNotag2();		
			column.setTagchecked("0");
		}
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^"+column.toString());
		
		JavaScript javaScript = new JavaScript();
		switch(column.getCrud()) {
		case C:
			publicationService.insertEbookColumn(column);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			publicationService.updateEbookColumn(column);
			javaScript.setMessage("수정 되었습니다.");
			break;
		case D:
			column = publicationService.getEbookColumn(column.getIdx());
			if( !KdaStringUtil.isEmpty(column.getImagename()) ) {
				String filePath = servletContext.getRealPath( FILE_BASE + column.getImagename() );
				fileUplaodService.deleteFile(filePath);
			}
			
			publicationService.deleteEbookColumn(column.getIdx());
			javaScript.setMessage("삭제 되었습니다.");
			break;
		}
		javaScript.setLocation("kp_ebook_list.do");
		return new JavaScriptView(javaScript);
	}
}

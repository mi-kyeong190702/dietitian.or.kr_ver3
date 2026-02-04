package kda.admin.contents;

import java.io.IOError;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kda.admin.contents.data.CONTENTS;
import kda.common.FileUploadService;
import kda.common.data.LIST_HELPER;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.values.CRUDValue;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
public class AdminContentsController extends KdaAbstractController {

	@Autowired
	private FileUploadService uploadService; 
	
	@Autowired
	private AdminContentsService adminContentsService;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("djemals/contents/list.do")
	public String list(HttpServletRequest request, Model model) throws Exception {
		LIST_HELPER listHelper = new LIST_HELPER(request);
		listHelper = adminContentsService.getContentsList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		return "tiles:admin/contents/list";
	}
	
	@RequestMapping("djemals/contents/form.do")
	public String form(@RequestParam( required=false, defaultValue="0" ) int idx, Model model) throws Exception {
		CONTENTS contents = null;
		if( idx == 0 ) {
			contents = new CONTENTS();
			contents.setCrud(CRUDValue.C);
		} else {
			contents = adminContentsService.getContents(idx);
			contents.setCrud(CRUDValue.U);
			Map result = readPath(contents.getPath());
			contents.setHead(result.get("head").toString());
			contents.setHtml(result.get("html").toString());
		}
		
		model.addAttribute("contents", contents);
		return "tiles:admin/contents/form";
	}
	
	@RequestMapping("djemals/contents/contents_load_ajax.do")
	public @ResponseBody Map loadContents(@RequestParam String path) throws Exception {
		Map result = null;
	
		try {
			result = readPath(path);
		} catch(Exception e) {
			result = new HashMap();
			result.put("error", e.toString());
		}
		return result;
	}
	
	@RequestMapping("djemals/contents/action")
	public View action(CONTENTS contents, Model model) throws Exception {
		String fullPathFile = servletContext.getRealPath(contents.getPath());
		String html = makeHtml(contents);
		
		JavaScript javaScript = new JavaScript();
		switch(contents.getCrud()) {
		case C:
			adminContentsService.insertContents(contents);
			javaScript.setMessage("입력 되었습니다.");
			break;
		case U:
			adminContentsService.updateContents(contents);
			javaScript.setMessage("수정되었습니다.");
			break;	
		}
		
		uploadService.saveFile(fullPathFile, html);
		
		javaScript.setLocation("./list.do");
		return new JavaScriptView(javaScript);
	}
	
	private Map readPath(String path) throws IOException {
		Map result = new HashMap();
		
		path = servletContext.getRealPath(path);
		String contents = uploadService.readFile(path);
	
		Document document = Jsoup.parse(contents);
		Elements bodys = document.getElementsByClass("sp_body");
		String bodyHtml = bodys.get(0).html();
		Elements heads = document.getElementsByClass("sp_head");
		String headHtml = heads.get(0).html();
		
		result.put("html", bodyHtml);
		result.put("head", headHtml);
		return result;
	}
	
	private String makeHtml(CONTENTS contents) {
		StringBuffer buf = new StringBuffer();
		buf.append("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\"%>");
		buf.append("<div class=\"s_page\">\n<div class=\"sp_head\">\n");
		buf.append(contents.getHead());
		buf.append("</div>\n");
		buf.append("<hr />\n<div class=\"sp_body\">\n");
		buf.append(contents.getHtml());
		buf.append("</div>\n</div>");
		return buf.toString();
	}
	
	
}

package kda.spring.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kda.utils.KdaStringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownLoadView extends AbstractView {
		 
		private Log log = LogFactory.getLog(DownLoadView.class);
	
		private String fileUrl;
		private String fileName;
		
		
	    public DownLoadView(String url, String name ){
	    	setContentType("application/octet-stream;charset=utf-8");
	        this.fileUrl = url;
	        this.fileName = name;
	    }
	         
	    @Override
	    protected void renderMergedOutputModel(Map<String, Object> model,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
	    	boolean isValid = true;
	    	String filePath = request.getSession().getServletContext().getRealPath(fileUrl);
	    	File downFile = null;
	    	System.out.println("FILE URL : " + fileUrl + "| FILE NAME : " + fileName + "| FILE PATH : " + filePath );
	    	if(fileUrl.indexOf("../") >=0){
				return;
			}
	    	if(filePath.indexOf("../") >=0){
				return;
			}
	    	if( KdaStringUtil.isEmpty(fileUrl) || !( downFile = new File(filePath)).isFile() ) {
	    		isValid = false;
	    	}
	    	
	    	if( isValid ) {
	    		download(request, response, downFile, fileName);
	    	} else {
	    		errorPage(request, response);
	    	}
	    }
	    
	    private void download(HttpServletRequest request, HttpServletResponse response, File file, String fileName) throws Exception {
	
	    	
	    	String encordedFilename = URLEncoder.encode(fileName,"UTF-8").replace("+", "%20");
	    	
	    	response.setHeader("Content-Disposition", "attachment; filename=\"" + encordedFilename + "\"");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setContentLength((int)file.length());
			
			response.setHeader("Connection", "close");
	    	
	    	
	        OutputStream out = response.getOutputStream();
	        FileInputStream fis = null;
	        try {
	            fis = new FileInputStream(file);
	            FileCopyUtils.copy(fis, out);
	        } catch(FileNotFoundException fe) {
	        	log.info("Exception : " + fe.toString());
	        } catch(Exception e){
	            //e.printStackTrace();
	        	log.info("Exception : " + e.toString());
	        }finally{
	            if(fis != null){
	                try{
	                    fis.close();
	                }catch(Exception e){System.out.println(e.toString());}
	            }
	             
	        }
	        out.flush();
	    }
	    
	    private void errorPage(HttpServletRequest request, HttpServletResponse response) 
	    		throws Exception {
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Type", "text/html");
			
			PrintWriter out = response.getWriter();
			
			out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
			out.println("<script>alert('파일이 존재하지 않습니다');</script>");
			out.println("<script>window.history.back();</script>");
			out.println("</head>");
			out.println("</html>");
			
			out.flush();
	    }
}

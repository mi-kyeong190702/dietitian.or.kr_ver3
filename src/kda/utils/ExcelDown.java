package kda.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

@SuppressWarnings("deprecation")
public class ExcelDown extends AbstractJExcelView{
	
	private Log log = LogFactory.getLog(ExcelDown.class);
	
	private String fileName;
	private String[] header;
	private String[] keys;
	private List<Map<String, Object>> exData;
	private int exDataLen = 0;
	private int exNum = 0;
	
	public ExcelDown(String fileName, String[] header, String[] keys, List<Map<String, Object>> exData){
		this.fileName = fileName;
		this.header = header;
		this.keys = keys;
		this.exData = exData;
		this.exDataLen = exData.size();
	}

	protected void buildExcelDocument(Map<String, Object> model,
			WritableWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		try {
			
			SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd");
    		
    		fileName = new StringBuilder(fileName).append("-").append(fileFormat.format(new Date())).append(".xls").toString();
            String gubun = fileName;
        	setFileNameToResponse(request, response, fileName);
            
            WritableCellFormat format_column = new WritableCellFormat();
            format_column.setBackground(jxl.format.Colour.YELLOW );
            format_column.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN );
            format_column.setWrap(true);
           
            WritableSheet sheet = workbook.createSheet(fileName, 0);
        	
        	for(int rows=0; rows<=exDataLen; rows++){
            	exNum = (exDataLen-rows+1);
            	for(int cols=0; cols<header.length; cols++) {
            		// header set
            		if(rows == 0){
            			sheet.addCell(new Label(cols, rows, header[cols], format_column));
            		}else{
            			if(!exData.get(rows-1).isEmpty()){
            				for(String key : exData.get(rows-1).keySet()){
                				// key, data bind
            					if(keys[cols].equals(key)){
                					if(exData.get(rows-1).get(key) != null){
                						//역순으로 번호 생성
                						if("RNUM".equals(key) || "rnum".equals(key)){
                							sheet.addCell(new Label(cols, rows, String.valueOf(exNum)));
                						}else{
                							if("confirmExcel".equals(gubun)){
                								if(!"order_status_cd".equals(keys[cols])){
                									if(!"00".equals(exData.get(rows-1).get("order_status_cd").toString().replaceAll("\\<.*?\\>", ""))){
                										sheet.addCell(new Label(cols, rows, exData.get(rows-1).get(keys[cols]).toString().replaceAll("\\<.*?\\>", ""),getCellFormat(Colour.YELLOW)));
                									}else{
                										sheet.addCell(new Label(cols, rows, exData.get(rows-1).get(keys[cols]).toString().replaceAll("\\<.*?\\>", "")));
                									}
                								}
                							}else{
                								sheet.addCell(new Label(cols, rows, exData.get(rows-1).get(keys[cols]).toString().replaceAll("\\<.*?\\>", "")));
                							}
                						}
                						
                					}
                				}
                			}
            			}
            			
            		}
                }
            }
        	
    		
			
		} catch (Exception e) {
			//e.printStackTrace();
			log.info("Exception : " + e.toString());
		}
		
	}
	
	
	private void setFileNameToResponse
    (HttpServletRequest request, HttpServletResponse response, String fileName) {
     String userAgent = request.getHeader("User-Agent");
     if (userAgent.indexOf("MSIE 5.5") >= 0) {
         response.setContentType("doesn/matter");
         response.setHeader("Content-Disposition","filename=\""+fileName+"\"");
     } else {
         response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\"");
     }
 }
	
	
	private static WritableCellFormat getCellFormat(Colour colour) throws WriteException {
	    //WritableFont cellFont = new WritableFont(WritableFont.TIMES, 16);
	    WritableCellFormat cellFormat = new WritableCellFormat();
	    cellFormat.setBackground(colour);
	    return cellFormat;
	  }

}

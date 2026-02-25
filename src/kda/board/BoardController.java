package kda.board;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kda.SessionInfo;
import kda.WorkData;
import kda.board.data.BOARDFILE;
import kda.board.data.BOARDPAGE;
import kda.board.data.BOOKBOARD;
import kda.board.data.CARTBOARD;
import kda.board.data.PAPERBOARD;
import kda.board.data.PAPERBOARDCOMMENTS;
import kda.board.data.RESIBOARD;
import kda.spring.abstr.KdaAbstractController;
import kda.spring.view.DownLoadView;
import kda.spring.view.JavaScript;
import kda.spring.view.JavaScriptView;
import kda.utils.KdaStringUtil;
import kda.utils.KdaUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;


@Controller
public class BoardController extends KdaAbstractController
{
	private Log log = LogFactory.getLog(BoardController.class);
	 
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	PaperBoardService paserBoardService;
	
	@Autowired
	StoreBoardService storeBoardService;
	
	@Autowired
	ResiBoardService resiBoardService;	
	
	// ****************************************************************************//
	// *******************************PAPER BOARD**********************************//
	// ****************************************************************************//
	
	@RequestMapping("board_file_download")
	public View board_file_download( @RequestParam int bbs_board_code, 
				  @RequestParam(required=false, defaultValue="0") int bbs_idx
				, @RequestParam(required=false, defaultValue="0") int num 
				, Model model) throws Exception
	{
		JavaScript javaScript = new JavaScript();
		if( bbs_idx == 0  ) {
			javaScript.setMessage("올바른 첨부파일 번호가 아닙니다");
			javaScript.setLocation("");
			return new JavaScriptView(javaScript);
		}
		
		PAPERBOARD board = paserBoardService.selectIdx(bbs_idx);
		String fileUrl = "";
		String fileName = "";
		switch( num ) {
		case 0 :
			fileUrl = board.getBbs_file_url();
			fileName = board.getBbs_file_name();
			break;
		case 2 :
			fileUrl = board.getBbs_file_url2();
			fileName = board.getBbs_file_name2();
			break;
		case 3 : 
			fileUrl = board.getBbs_file_url3();
			fileName = board.getBbs_file_name3();
			break;
		case 4 : 
			fileUrl = board.getBbs_file_url4();
			fileName = board.getBbs_file_name4();
			break;
		case 5 :
			fileUrl = board.getBbs_file_url5();
			fileName = board.getBbs_file_name5();
			break;
		}

        paserBoardService.update_filedown_count(bbs_idx, num);
		return new DownLoadView( fileUrl, fileName );
	}
	
	
	@RequestMapping("paper_board_list")		
	public String paper_board_list( @RequestParam(required=true, defaultValue="0") String bbs_board_code
								  , @RequestParam(required=false, defaultValue="0") String bbs_category
			  					  , @RequestParam(required=false, defaultValue="0") int board_search
			  					  , @RequestParam(required=false) String board_keyword			  														
			  					  , @RequestParam(required=false, defaultValue="1") int board_page
			  					  , @RequestParam(required=false) String g_userid
			  					  , Model model) throws Exception {	
		log.info("bbs_board_code:"+ bbs_board_code);
		log.info("Controller g_userid:"+ g_userid);
		String redirect = "";
		BOARDPAGE boardPage = null;
		String temp_bbs_board_code = "";
		
		try
		{
			int boardCount = paserBoardService.count(bbs_board_code, bbs_category, board_search, board_keyword, g_userid);
			
			if( bbs_board_code.equals("89"))
				boardPage = new BOARDPAGE(board_page, boardCount, 8);
			else
				boardPage = new BOARDPAGE(board_page, boardCount);
			 
				
			if ( bbs_board_code.split(",").length > 1  ){
			   if( bbs_board_code.indexOf("69") >= 0 ){ //시도영양사회 공지사항 69~81 번호, 분류..
					temp_bbs_board_code = "69";
					model.addAttribute("bbs_board_code", 99999);
					
				} else if( bbs_board_code.indexOf("36") >= 0 ){ //시도영양사회 게시판 36~48 번호, 제목..
					temp_bbs_board_code = "36";
					model.addAttribute("bbs_board_code", 88888);
					//model.addAttribute("bbs_board_code", bbs_board_code);
				} else if( bbs_board_code.indexOf("140") >= 0 ){ //시도영양사회 게시판 36~48 번호, 제목..
					temp_bbs_board_code = "140";
					model.addAttribute("bbs_board_code", 991); //영야교사 시도지사
					//model.addAttribute("bbs_board_code", bbs_board_code);
				}
			} else { 
				temp_bbs_board_code = bbs_board_code;
				model.addAttribute("bbs_board_code", bbs_board_code);
			}
			
			model.addAttribute("boardSearch"	, board_search);
			model.addAttribute("boardKeyword"	, board_keyword);
			model.addAttribute("boardCount"		, boardCount);
			model.addAttribute("boardList"		, paserBoardService.list(bbs_board_code , bbs_category , board_search , board_keyword , boardPage.getCurPage(), g_userid));
			model.addAttribute("boardPage"		, boardPage);
			model.addAttribute("boardSettings"	, paserBoardService.settings(temp_bbs_board_code));
			model.addAttribute("bbs_category"	, bbs_category);
			model.addAttribute("g_userid"		, g_userid);
						
			// -- redirect tiles
			if ( bbs_board_code.equals("89") )
				redirect = "gallery_board_list";
			else 
				redirect = "paper_board_list";
		}catch(Exception e)		
		{
			log.info("paper_board_list e:"+ e);
			throw e;
		}
		return redirect;
	}
	
	@RequestMapping("paper_board_write")
	public String paper_board_write( @RequestParam(required=true, defaultValue="0") String bbs_board_code
			 					   , @RequestParam(required=true, defaultValue="0") String bbs_category
			  					   , @RequestParam(required=false) int bbs_idx
								   , @RequestParam(required=false, defaultValue="write") String board_form 
								   , Model model ) throws Exception
	{	
		log.info("================================ BoardController [paper_board_write] board_form" + board_form  );
			
		if ( board_form.equals("modify")) {
			
			PAPERBOARD board = paserBoardService.selectIdx(bbs_idx);
			
			// -- subject
			board.setBbs_subject( board.getBbs_subject().replaceAll("\"", "'") );
			
			// -- contents
			if( board.getBbs_contents().indexOf("&lt;") >= 0 ||
				board.getBbs_contents().indexOf("<X-") >= 0	||
				KdaUtil.isHTML(board.getBbs_contents()))
			{
				board.setBbs_html("on");
			}
			
			model.addAttribute("boardRow",  board);
		}	
		else
			model.addAttribute("boardRow",  new PAPERBOARD());
		
		model.addAttribute("bbs_board_code"	, bbs_board_code);
		model.addAttribute("bbs_category"	, bbs_category);
		model.addAttribute("boardSettings"	, paserBoardService.settings(bbs_board_code));
		

			
		// -- redirect tiles
		String redirect = "";
		if ( bbs_board_code.equals("89") )
			redirect = "gallery_board_write";
		else 
			redirect = "paper_board_write";
		
		return redirect;
	}	
	
	@RequestMapping("paper_board_view")
	public String paper_board_view(	@RequestParam(required=true, defaultValue="0") String bbs_board_code
								  , @RequestParam(required=false) int bbs_idx	
								   ,HttpSession session
								  , Model model ) throws Exception
	{	
		log.info("================================ BoardController [paper_board_view] bbs_board_code:" + bbs_board_code);
		String code_pers = (String)(String) session.getAttribute(SessionInfo.CODE_PERS);
		
		paserBoardService.update_view_count(bbs_idx);
		List<PAPERBOARD> list =  paserBoardService.select(bbs_idx, bbs_board_code);
		int chkTeacher = paserBoardService.getChkTeacher(code_pers); 
		model.addAttribute("ChkTeacher", chkTeacher);		
		
	    //중관관리자 지정된 아이디가 참일경우 1	
		System.out.println("check=="+session.getAttribute("BOARD_ADMIN_"+bbs_board_code));
		 
		for ( int i = 0; i < list.size(); i++ )
		{
			PAPERBOARD board = list.get(i); 
			
			int bbs_idx_temp = board.getBbs_idx();
			
			if( bbs_idx_temp < bbs_idx )
			{
				model.addAttribute("boardRowPrev",  board);	
			}
			else if( bbs_idx_temp == bbs_idx )
			{
				// -- subject
				if( board.getBbs_subject().indexOf("&lt;") >= 0 ||
					board.getBbs_subject().indexOf("<X-") >= 0	||
					KdaUtil.isHTML(board.getBbs_subject()))
				{
					board.setBbs_contents( board.getBbs_subject().replaceAll("&lt;", "<") );
					board.setBbs_contents( board.getBbs_subject().replaceAll("<X-", "<") );
					
					board.setBbs_html("on");
				}
					
				// -- contents
				if( board.getBbs_contents().indexOf("&lt;") >= 0||
					board.getBbs_contents().indexOf("<X-") >= 0	||
					KdaUtil.isHTML(board.getBbs_contents()))
				{
					board.setBbs_contents( board.getBbs_contents().replaceAll("&lt;", "<") );
					board.setBbs_contents( board.getBbs_contents().replaceAll("<X-", "<") );
					
					board.setBbs_html("on");
				}
				else
					board.setBbs_contents( board.getBbs_contents().replaceAll("\r\n", "<br>") );
				
				
				model.addAttribute("boardRow",  board);
				
				/*
				if (   bbs_board_code.equals("25") 
					|| bbs_board_code.equals("26")
					|| bbs_board_code.equals("27")
					|| bbs_board_code.equals("28")
					|| bbs_board_code.equals("29")
					|| bbs_board_code.equals("30")
					|| bbs_board_code.equals("31")
					|| bbs_board_code.equals("32")
					|| bbs_board_code.equals("33")
					|| bbs_board_code.equals("34")
					|| bbs_board_code.equals("89") //gallery
					|| bbs_board_code.equals("95")
					|| bbs_board_code.equals("106")
					|| bbs_board_code.equals("108") )
				{*/
					model.addAttribute("boardComments",  paserBoardService.list_comments(board.getBbs_idx()));
				//}

			}
			else{
				model.addAttribute("boardRowNext",  board);
			}
		}
		model.addAttribute("bbs_board_code", bbs_board_code);
		model.addAttribute("check", session.getAttribute("BOARD_ADMIN_"+bbs_board_code));
		model.addAttribute("boardSettings" , paserBoardService.settings(bbs_board_code));

		
		
		// -- redirect tiles
		String redirect = "";
		if ( bbs_board_code.equals("89") )
			redirect = "gallery_board_view";
		else 
			redirect = "paper_board_view";

		return redirect;		
	}
	
	@RequestMapping("paper_board_view_contents")
	public String paper_board_view_contents(  @RequestParam(required=false) int bbs_idx																	
								  			, Model model ) throws Exception
	{	
		
		try{
			log.info("================================ BoardController [paper_board_view_contents]");
			PAPERBOARD board = paserBoardService.selectIdx(bbs_idx);

			boolean isHTML = false;
			if( board.getBbs_contents().indexOf("&lt;") >= 0 ){
				board.setBbs_contents( board.getBbs_contents().replaceAll("&lt;", "<") );
				isHTML = true;
			}
			
			if ( board.getBbs_contents().indexOf("<X-") >= 0 ) {
				board.setBbs_contents( board.getBbs_contents().replaceAll("<X-", "<") );
				isHTML = true;
			}
			
			if ( KdaUtil.isHTML(board.getBbs_contents()))
				isHTML = true;
			
			if ( !isHTML )
				board.setBbs_contents( board.getBbs_contents().replaceAll("\r\n", "<br>") );
			
			model.addAttribute("boardRow",  board);

		} catch(Exception e){
			log.error("paper_board_view_contents e :"+ e);
		}
	
		return "paper_board_view_contents";		
	}	
	
	private BOARDFILE getBoardFile( MultipartHttpServletRequest multipartRequest, String name, int index ) throws Exception
	{
		log.info("getBoardFile-------------------------------- : " + name);
		
		SimpleDateFormat formatter  = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		
		String filePath = WorkData.UPLOAD;		
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);		
		String bbs_barod_code = multipartRequest.getParameter("bbs_board_code");
		
		// board_cod set real path
		filePath += bbs_barod_code;
		realPath += "/" + bbs_barod_code;		
						
		FileOutputStream fos = null;		
		BOARDFILE boardFile = null;	
		String fileName = "";
		
		if(realPath.indexOf("../") >=0){
			return boardFile;
		}
		
		File dir = new File(realPath); 
		if ( !dir.isDirectory() )
			dir.mkdir();
		
		try
		{		
			MultipartFile multipartFile = multipartRequest.getFile (name);
			log.info("getBoardFile--------------------------------1 : " + KdaStringUtil.nullToString(multipartFile));
			if(!KdaStringUtil.nullToString(multipartFile).equals("")) { //19.06.26 추가
				log.info("getBoardFile--------------------------------2 : " + multipartFile.getOriginalFilename());
				if(!multipartFile.getOriginalFilename().equals(""))
				{
					String orgFileName = multipartFile.getOriginalFilename();
					log.info(orgFileName.endsWith(".wmv")+"getBoardFile--------------------------------3 : " + orgFileName);
					if(orgFileName.endsWith(".wmv")){
						return boardFile;
					}
					boardFile = new BOARDFILE();
					
					// -- 해당 파일은 확장자를 붙여 준다 as-is 기준
					fileName = multipartRequest.getSession().getId() + "_" +  formatter.format(date) + "_" + index;					
					log.info("getBoardFile--------------------------------4 : " + fileName);
					String ext = "";
					String [] exts = multipartFile.getOriginalFilename().split("\\.");		
					log.info("getBoardFile--------------------------------5 : " + exts.length);
					if ( exts.length > 0 )
					{
						ext = exts[ exts.length - 1].toLowerCase();
						
						String check = "jpg,jpeg,gif,bmp,png,swf,tiff,tif,mpg,mpeg,avi,asf,wma,wmv,rm,ra,mp3";
						log.info("getBoardFile--------------------------------5 : " + check.indexOf(ext));
						if ( check.indexOf(ext) >= 0 )
							fileName += "." + ext;
					}
					
					// file name [ session_noewdate ]
					boardFile.setBbs_file_name(orgFileName);
					boardFile.setBbs_file_size(multipartFile.getSize());
					boardFile.setBbs_file_url(filePath + "/" + fileName); 
					boardFile.setBbs_file_type(ext);
					log.info("getBoardFile--------------------------------6 : " + ext);
	
					byte[] fileData = multipartFile.getBytes();
					log.info("getBoardFile--------------------------------7 : " + realPath.indexOf("../"));
					if(realPath.indexOf("../") >=0){
						return boardFile;
					}
					log.info("getBoardFile--------------------------------8 : " + fileName.indexOf("../"));
					if(fileName.indexOf("../") >=0){
						return boardFile;
					}
					fos = new FileOutputStream(realPath + "/" + fileName);					
					fos.write(fileData);
					
					log.info("********************** [FILE][" + name + "]");
					log.info("FILE_NAME      : " + fileName);
					log.info("FILE_NAME_ORG  : " + orgFileName);
					log.info("FILE_SIZE      : " + boardFile.getBbs_file_size());
					log.info("FILE_URL       : " + boardFile.getBbs_file_url());					
					log.info("FILE_SAVE_PATH : " + realPath);
					log.info("********************** [FILE][" + name + "]");					
				}
			}
	
		} catch(FileNotFoundException fe) {
			log.info("file upload error!",fe);
		} catch(Exception e) {
			
			log.info("file upload error!",e);
					
			if ( boardFile != null )
			{
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				File uploadFile = new File(realPath+"/"+fileName);
				if(uploadFile != null)
					uploadFile.delete();
			}
			
		}finally{
			try{
				if(fos != null) fos.close();
			}catch(Exception e){
				log.info("file upload error!",e);					
			}
		}		
		return boardFile;
	}
	
	private void delBoardFiles( PAPERBOARD pageBoard
							  , BOARDFILE boardFile1
							  , BOARDFILE boardFile2
							  , BOARDFILE boardFile3
							  , BOARDFILE boardFile4
							  , BOARDFILE boardFile5
							  , String realPath )
	{
		// -- update file delete
		File deleteFile = null;
					
		String bbs_file_url = pageBoard.getBbs_file_url();
		if ( boardFile1 != null && !bbs_file_url.equals("") )
		{
			deleteFile = new File(realPath+"/"+bbs_file_url);
			if ( deleteFile.isFile() )
				deleteFile.delete();
		}		
		
		String bbs_file_url2 = pageBoard.getBbs_file_url2();
		if ( boardFile2 != null && !bbs_file_url2.equals("") )
		{
			deleteFile = new File(realPath+"/"+bbs_file_url2);
			if ( deleteFile.isFile() )
				deleteFile.delete();
		}
		
		String bbs_file_url3 = pageBoard.getBbs_file_url3();
		if ( boardFile3 != null && !bbs_file_url3.equals("") )
		{
			deleteFile = new File(realPath+"/"+bbs_file_url3);
			if ( deleteFile.isFile() )
				deleteFile.delete();
		}
		
		String bbs_file_url4 = pageBoard.getBbs_file_url4();
		if ( boardFile4 != null && !bbs_file_url4.equals("") )
		{
			deleteFile = new File(realPath+"/"+bbs_file_url4);
			if ( deleteFile.isFile() )
				deleteFile.delete();
		}
		
		String bbs_file_url5 = pageBoard.getBbs_file_url5();
		if ( boardFile5 != null && !bbs_file_url5.equals("") )
		{
			deleteFile = new File(realPath+"/"+bbs_file_url5);
			if ( deleteFile.isFile() )
				deleteFile.delete();
		}		
	}

	private void setBoardFiles( PAPERBOARD pageBoard
							  , BOARDFILE boardFile1
							  , BOARDFILE boardFile2
							  , BOARDFILE boardFile3
							  , BOARDFILE boardFile4
							  , BOARDFILE boardFile5) throws Exception
	{
		// FILE-1
		if ( boardFile1 != null ) 
		{				
			pageBoard.setBbs_file_name(boardFile1.getBbs_file_name());
			pageBoard.setBbs_file_url (boardFile1.getBbs_file_url() );
			pageBoard.setBbs_file_type(boardFile1.getBbs_file_type());
			pageBoard.setBbs_file_size(boardFile1.getBbs_file_size());
			pageBoard.setBbs_file_down(boardFile1.getBbs_file_down());			
		}
		
		// FILE-2
		if ( boardFile2 != null ) 
		{				
			pageBoard.setBbs_file_name2(boardFile2.getBbs_file_name());
			pageBoard.setBbs_file_url2 (boardFile2.getBbs_file_url() );
			pageBoard.setBbs_file_type2(boardFile2.getBbs_file_type());
			pageBoard.setBbs_file_size2(boardFile2.getBbs_file_size());
			pageBoard.setBbs_file_down2(boardFile2.getBbs_file_down());			
		}
		
		// FILE-3
		if ( boardFile3 != null ) 
		{				
			pageBoard.setBbs_file_name3(boardFile3.getBbs_file_name());
			pageBoard.setBbs_file_url3 (boardFile3.getBbs_file_url() );
			pageBoard.setBbs_file_type3(boardFile3.getBbs_file_type());
			pageBoard.setBbs_file_size3(boardFile3.getBbs_file_size());
			pageBoard.setBbs_file_down3(boardFile3.getBbs_file_down());			
		}
		
		// FILE-4
		if ( boardFile4 != null ) 
		{				
			pageBoard.setBbs_file_name4(boardFile4.getBbs_file_name());
			pageBoard.setBbs_file_url4 (boardFile4.getBbs_file_url() );
			pageBoard.setBbs_file_type4(boardFile4.getBbs_file_type());
			pageBoard.setBbs_file_size4(boardFile4.getBbs_file_size());
			pageBoard.setBbs_file_down4(boardFile4.getBbs_file_down());			
		}
		
		// FILE-5
		if ( boardFile5 != null ) 
		{				
			pageBoard.setBbs_file_name5(boardFile5.getBbs_file_name());
			pageBoard.setBbs_file_url5 (boardFile5.getBbs_file_url() );
			pageBoard.setBbs_file_type5(boardFile5.getBbs_file_type());
			pageBoard.setBbs_file_size5(boardFile5.getBbs_file_size());
			pageBoard.setBbs_file_down5(boardFile5.getBbs_file_down());			
		}		
	}	
	
	@RequestMapping("paper_board_insert")
	public String paper_board_insert( @ModelAttribute("paperBoard") PAPERBOARD pageBoard
									, Model model
									, MultipartHttpServletRequest  request) throws Exception
	{	
		log.info("================================ BoardController [paper_board_insert] pageBoard: " + pageBoard);
		
		if( pageBoard.getBbs_category().length() > 0 ){
			pageBoard.setBbs_category(pageBoard.getBbs_category().replaceAll(",", ""));
		}
		
		MultipartHttpServletRequest multipartRequest = request;
		
		BOARDFILE bbs_file1 = this.getBoardFile( multipartRequest, "bbs_file1", 1 );		
		BOARDFILE bbs_file2 = this.getBoardFile( multipartRequest, "bbs_file2", 2 );
		BOARDFILE bbs_file3 = this.getBoardFile( multipartRequest, "bbs_file3", 3 );
		BOARDFILE bbs_file4 = this.getBoardFile( multipartRequest, "bbs_file4", 4 );
		BOARDFILE bbs_file5 = this.getBoardFile( multipartRequest, "bbs_file5", 5 );
		
		this.setBoardFiles(pageBoard, bbs_file1, bbs_file2, bbs_file3, bbs_file4, bbs_file5);
		
		pageBoard.setBbs_user_id( (String) request.getSession().getAttribute(SessionInfo.USER_ID));
		pageBoard.setBbs_user_ip( request.getRemoteAddr() );
		
		//pageBoard.setUpdate_point_pers((String) request.getSession().getAttribute(SessionInfo.CODE_PERS));
		//pageBoard.setUpdate_point_kind("add");
		//pageBoard.setUpdate_point(20);
		
		if ( pageBoard.getBbs_html().equals("on") ) {
			//pageBoard.setBbs_subject( pageBoard.getBbs_subject().replaceAll("<", "<X-") );
			pageBoard.setBbs_contents( pageBoard.getBbs_contents().replaceAll("<", "<X-") );
		}
		
		paserBoardService.insert(pageBoard);
		
		//paserBoardService.pointUpt(pageBoard);
		
		return "paper_board_write_ok";
	}
		
	@RequestMapping("paper_board_update")
	public String paper_board_update( @ModelAttribute("paperBoard") PAPERBOARD pageBoard
									, Model model
									, MultipartHttpServletRequest request) throws Exception
	{
		log.info("================================ paper_board_update pageBoard : " + pageBoard);
		
		
		
		
		MultipartHttpServletRequest multipartRequest = request;
		
		if( pageBoard.getBbs_category().length() > 0 ){
			pageBoard.setBbs_category(pageBoard.getBbs_category().replaceAll(",", ""));
		}
		
		String filePath = WorkData.UPLOAD;		
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);
		
		BOARDFILE bbs_file1 = this.getBoardFile( multipartRequest, "bbs_file1", 1 );		
		BOARDFILE bbs_file2 = this.getBoardFile( multipartRequest, "bbs_file2", 2 );
		BOARDFILE bbs_file3 = this.getBoardFile( multipartRequest, "bbs_file3", 3 );
		BOARDFILE bbs_file4 = this.getBoardFile( multipartRequest, "bbs_file4", 4 );
		BOARDFILE bbs_file5 = this.getBoardFile( multipartRequest, "bbs_file5", 5 );
		
		this.delBoardFiles(pageBoard, bbs_file1, bbs_file2, bbs_file3, bbs_file4, bbs_file5, realPath);
		this.setBoardFiles(pageBoard, bbs_file1, bbs_file2, bbs_file3, bbs_file4, bbs_file5);
		  
		paserBoardService.update(pageBoard);
		
		return "paper_board_write_ok";
	}	
	
	@RequestMapping("paper_board_delete")
	public String paper_board_delete( @RequestParam(required=false) String bbs_board_code
									, @RequestParam(required=false) String bbs_category
	  								, @RequestParam(required=false) int bbs_idx
							  		, @RequestParam(required=false) int board_page
				  					, Model model
				  					, HttpServletRequest request) throws Exception
	{	
		log.info("================================ BoardController [paper_board_delete]");
		
		paserBoardService.delete(bbs_idx);
		
		//PAPERBOARD pageBoard = new PAPERBOARD();
		//pageBoard.setUpdate_point_pers((String) request.getSession().getAttribute(SessionInfo.CODE_PERS));
		//pageBoard.setUpdate_point_kind("sub");
		//pageBoard.setUpdate_point(20);
		//paserBoardService.pointUpt(pageBoard);
		
		BOARDPAGE boardPage = null;
		
		int boardCount = paserBoardService.count(  bbs_board_code
												 , bbs_category
												 , 0
												 , ""
												 , "");
		boardPage = new BOARDPAGE(board_page, boardCount);
		
		model.addAttribute("bbs_board_code", bbs_board_code);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("boardList", paserBoardService.list(bbs_board_code
				 											 , bbs_category
															 , 0
															 , ""
															 , boardPage.getCurPage()
															 , ""
															 ));
		model.addAttribute("boardPage"		, boardPage);
		model.addAttribute("boardSettings"	, paserBoardService.settings(bbs_board_code));
		
		return "paper_board_list";
	}
	
	@RequestMapping("paper_board_comments_insert")
	public String paper_board_comments_insert( @ModelAttribute("paperBoardComments") PAPERBOARDCOMMENTS paperBoardComments
											, HttpServletRequest request
											, Model model) throws Exception
	{	
		log.info("================================ BoardController [paper_board_insert_comments]");
		
		String redirect = "";
		
		String user_id = (String) request.getSession().getAttribute(SessionInfo.USER_ID);
		String user_nm = (String) request.getSession().getAttribute(SessionInfo.PERS_NAME);
		String user_ip = "";
		
		try{
			user_ip = InetAddress.getLocalHost().getHostAddress();			
		}catch(UnknownHostException e){
			e.printStackTrace();
			//log.info("Exception : " + e.toString());
		}
		
		paperBoardComments.setBbc_user_id(user_id);
		paperBoardComments.setBbc_name(user_nm);
		paperBoardComments.setBbc_user_ip(user_ip);
		
		if ( !paserBoardService.insert_comments(paperBoardComments) )
		{
			redirect = "alert";
			model.addAttribute("message", "의견쓰기가 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
			//model.addAttribute("redirect", "/member/km_join.do");				
		}else {
			redirect = "alert";
			model.addAttribute("message", "의견쓰기가 등록되었습니다.");
			
			//PAPERBOARD pageBoard = new PAPERBOARD();
			//pageBoard.setUpdate_point_pers((String) request.getSession().getAttribute(SessionInfo.CODE_PERS));
			//pageBoard.setUpdate_point_kind("add");
			//pageBoard.setUpdate_point(10);
			//paserBoardService.pointUpt(pageBoard);
		}
		
		return "paper_board_write_ok";
	}	
	
	@RequestMapping("paper_board_comments_delete")
	public void paper_board_comments_delete( @RequestParam(required=false) int bbs_idx
										   , @RequestParam(required=false) int bbc_idx											
										   , HttpServletResponse response
										   , HttpServletRequest request) throws Exception
	{	
		log.info("================================ BoardController [paper_board_comments_delete]");
		
		paserBoardService.delete_comments(bbs_idx, bbc_idx);
		
		//PAPERBOARD pageBoard = new PAPERBOARD();
		//pageBoard.setUpdate_point_pers((String) request.getSession().getAttribute(SessionInfo.CODE_PERS));
		//pageBoard.setUpdate_point_kind("sub");
		//pageBoard.setUpdate_point(10);
		//paserBoardService.pointUpt(pageBoard);
		
	    try {
	    	response.getWriter().print("");
	    } catch (IOException e) {
	    	//e.printStackTrace();    
	    	log.info("IOException : " + e.toString());
	    } catch (Exception e) {
	    	log.info("Exception : " + e.toString());
	    }
	}		
	
	// ****************************************************************************//
	// ********************************BOOK BOARD**********************************//
	// ****************************************************************************//
	
	@RequestMapping("book_board_list")	
	public String book_board_list(@RequestParam(required=false, defaultValue="1") int board_page
							  	, @RequestParam(required=false, defaultValue="0") int board_search1
							  	, @RequestParam(required=false, defaultValue="%") String board_search2
							  	, @RequestParam(required=false, defaultValue="") String board_keyword
							  	, Model model ) throws Exception
	{
		log.info("================================ BoardController [book_board_list]");

		BOARDPAGE boardPage = null;
		
		int bookCount = storeBoardService.count_book();

		boardPage = new BOARDPAGE(board_page, bookCount);
		
		log.info("================================ board_search1 : " + board_search1);
		log.info("================================ board_search2 : " + board_search2);
		log.info("================================ board_keyword : " + board_keyword);
		
		model.addAttribute("boardSearch1"	, board_search1);
		model.addAttribute("boardSearch2"	, board_search2);
		model.addAttribute("boardKeyword"	, board_keyword);		
		model.addAttribute("boardCount", bookCount);
		model.addAttribute("boardList" , storeBoardService.list_book(board_search1
																   , board_search2
															 	   , board_keyword
															 	   , boardPage.getCurPage()));
		model.addAttribute("boardPage",boardPage);

		return "book_board_list";
	}

	//교육자료(판매품) 글쓰기/수정
	@RequestMapping("book_board_write")	
	public String book_board_write(  @RequestParam(required=false) int oindex  
								   , @RequestParam(required=false, defaultValue="write") String board_form								   
								   , Model model ) throws Exception
	{	
		try{
			if ( board_form.equals("modify")){
			
				model.addAttribute("boardRow",  storeBoardService.select_book(oindex));
				
			}else
				model.addAttribute("boardRow",  new BOOKBOARD());
			
		
		}catch(Exception e)
		{
			log.info("book_board_write e :"+ e);
		}
				
		return "book_board_write";
	}
	
	@RequestMapping("book_board_view")
	public String book_board_view(	@RequestParam(required=false) int oindex																	
			  					  , Model model ) throws Exception
	{
		log.info("================================ BoardController [book_board_view]");
		
		BOOKBOARD board =  storeBoardService.select_book( oindex);
			
		model.addAttribute("boardRow",  board);
			
		return "book_board_view";
	}
	
	@RequestMapping("book_board_insert")
	public String book_board_insert( @ModelAttribute("bookBoard") BOOKBOARD bookBoard
									, Model model
									, HttpServletRequest request) throws Exception
	{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		log.info("================================ BoardController [book_board_insert]" + bookBoard);
		
		BOARDFILE boardFile = this.getCartBoardFile( multipartRequest, "bbs_file1");
		bookBoard.setOimage( boardFile.getBbs_file_url() );
		
		log.info("bookBoard.setOimage : " + bookBoard.getOimage() );
		
		storeBoardService.insert_book(bookBoard);
		
		return "book_board_write_ok";
		
	}
	
	@RequestMapping("book_board_update")
	public String book_board_update( @ModelAttribute("bookBoard") BOOKBOARD bookBoard
									, Model model
									, HttpServletRequest request) throws Exception
	{
		log.info("================================ BoardController [book_board_update]");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		if( multipartRequest.getFile("bbs_file1").getSize() > 0 ) {
			BOARDFILE boardFile = this.getCartBoardFile( multipartRequest, "bbs_file1");
			bookBoard.setOimage( boardFile.getBbs_file_url() );
		} else {
			if( bookBoard.getFile_del_chk().equals("Y") )
				bookBoard.setOimage("");
			else
				bookBoard.setOimage(bookBoard.getBbs_file_url());
				
		}
		
		storeBoardService.update_book(bookBoard);
		
		return "book_board_write_ok";
	}	
	
	@RequestMapping("book_board_delete")
	public String book_board_delete(  @RequestParam(required=false) int oindex
							  		, @RequestParam(required=false) int board_page
				  					, Model model ) throws Exception
	{	
		log.info("================================ BoardController [book_board_delete]");
		
		storeBoardService.delete_book(oindex);
		
		BOARDPAGE boardPage = null;
		
		int boardCount = storeBoardService.count_book();
		boardPage = new BOARDPAGE(board_page, boardCount);
		
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("boardList", storeBoardService.list_book(0, "%", "", boardPage.getCurPage()));
		model.addAttribute("boardPage",boardPage);
		return "book_board_list";
	}
	
	// ****************************************************************************//
	// ********************************CART BOARD**********************************//
	// ****************************************************************************//

	
	/**
	 * 장바구니 보기
	 * - Page : work/publication/kp_archiveshop_cart.do
	 */
	@RequestMapping("cart_board_list")	
	public String cart_board_list(@RequestParam(required=false, defaultValue="1") int board_page
							  	, @RequestParam(required=false, defaultValue="1") int board_search
							  	, @RequestParam(required=false) String board_keyword
							  	, HttpSession session
							  	, Model model ) throws Exception {
		log.debug("================================ BoardController [cart_board_list]");

		setDefaultModel(session, model);
		
		BOARDPAGE boardPage = null;
		
		int bookCount = storeBoardService.count_cart(session.getId());
		boardPage = new BOARDPAGE(board_page, bookCount);
		
		model.addAttribute("boardCount", bookCount);
		model.addAttribute("boardList" , storeBoardService.list_cart(session.getId()));
		model.addAttribute("boardPage",boardPage);

		return "cart_board_list";
	}
	
	@RequestMapping("cart_board_insert")
	public void cart_board_insert( @ModelAttribute("cartBoard") CARTBOARD cartBoard
								 , HttpSession session
								 , HttpServletResponse response
								 , Model model) throws Exception
	{
		log.info("================================ BoardController [cart_board_insert]");

		String ctsessionid = session.getId();
		int oindex = cartBoard.getOindex();
		CARTBOARD t_cartBoard = storeBoardService.select_cart(ctsessionid, oindex);
		
		cartBoard.setCtsessionid( ctsessionid );
		
		if ( t_cartBoard != null ) {
			
			int ctea = cartBoard.getCtea() + t_cartBoard.getCtea();
			cartBoard.setCtea(ctea);
			storeBoardService.update_cart(cartBoard);
		}
		else
		{
			storeBoardService.insert_cart(cartBoard);
		}
		
	    try 
	    {	
	    	response.getWriter().print("success");    
	    } catch (IOException e) {
	    	e.printStackTrace();
	    	//log.info("Exception : " + e.toString());
	    }
	}
	
	/**
	 * 장바구니 삭제
	 */
	@RequestMapping("cart_board_delete")
	public String cart_board_delete(  @RequestParam(required=false) int ctindex
							  		, @RequestParam(required=false) int board_page
							  		, HttpSession session
				  					, Model model ) throws Exception {	
		log.info("================================ BoardController [cart_board_delete]");
		setDefaultModel(session, model);
		
		storeBoardService.delete_cart(ctindex);
		
		BOARDPAGE boardPage = null;
		
		int boardCount = storeBoardService.count_cart(session.getId());
		boardPage = new BOARDPAGE(board_page, boardCount);
		
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("boardList", storeBoardService.list_cart(session.getId()));
		model.addAttribute("boardPage",boardPage);
		
		return "cart_board_list";
	}
	
	
		
	// ****************************************************************************//
	// ********************************RESI BOARD**********************************//
	// ****************************************************************************//
	
	@RequestMapping("resi_board_list")		
	public String resi_board_list(  @RequestParam(required=false, defaultValue="0") int board_search
			  					  , @RequestParam(required=false) String board_keyword			  														
			  					  , @RequestParam(required=false, defaultValue="1") int board_page
			  					  , HttpSession session, Model model ) throws Exception
	{	
		log.info("================================ BoardController [resi_board_list]");

		setDefaultModel(session, model);
		
		BOARDPAGE boardPage = null;
		
		int boardCount = resiBoardService.count( board_search, board_keyword  );
		boardPage = new BOARDPAGE(board_page, boardCount);
		
		model.addAttribute("boardSearch", board_search);
		model.addAttribute("boardKeyword", board_keyword);
		model.addAttribute("boardCount", boardCount);
		model.addAttribute("boardList", resiBoardService.list( board_search
															 , board_keyword
															 , boardPage.getCurPage() ));
		model.addAttribute("boardPage",boardPage);
		
		return "resi_board_list";
	}
	
	@RequestMapping("resi_board_write")
	public String resi_board_write(  @RequestParam(required=false) int resi_serial_no
								   , @RequestParam(required=false, defaultValue="write") String board_form 
								   , HttpSession session , Model model ) throws Exception {	
		setDefaultModel(session, model);
		
		if ( board_form.equals("modify"))
			model.addAttribute("boardRow",  resiBoardService.select_resi_serial_no(resi_serial_no));
		else
			model.addAttribute("boardRow",  new RESIBOARD());		
		
		return "resi_board_write";
	}	
	
	@RequestMapping("resi_board_view")
	public String resi_board_view(	@RequestParam(required=false) int resi_serial_no	
								  , HttpSession session , Model model ) throws Exception {	
		setDefaultModel(session, model);
		int user_level = KdaStringUtil.nullToInt(getUserLevel(session), 6);
		if( user_level > 5 ) {
			return getHistoryBackPage("글을 보실 권한이 없습니다", model);
		}
		resiBoardService.update_resi_read_no_count(resi_serial_no);	 // 20160411 식단레시피 조회수 update 추가
		List<RESIBOARD> list =  resiBoardService.select(resi_serial_no);
		for ( int i = 0; i < list.size(); i++ )
		{
			RESIBOARD board = list.get(i); 
			
			int serial_no_temp = board.getResi_serial_no();			
			if 		( serial_no_temp < resi_serial_no )
				model.addAttribute("boardRowPrev",  board);
			else if ( serial_no_temp == resi_serial_no ) 
			{
				board.setResi_content1( board.getResi_content1().replaceAll("\r\n", "<br>") );
				model.addAttribute("boardRow",  board);
			}
			else
				model.addAttribute("boardRowNext",  board);
		}
		
		
		return "resi_board_view";		
	}	
	
	@RequestMapping("resi_board_insert")
	public View resi_board_insert( @ModelAttribute("resiBoard") RESIBOARD resiBoard
									, Model model, HttpServletRequest request) throws Exception {	
		
		resiBoard.setCheck_ip(request.getLocalAddr());
		resiBoardService.insert(resiBoard);
	
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("등록 되었습니다.");
		javaScript.setMethod("parent.location.href='/work/archive/ka_recipe.do'");
		return new JavaScriptView(javaScript);
	}	
	
	@RequestMapping("resi_board_update")
	public String resi_board_update( @ModelAttribute("resiBoard") RESIBOARD resiBoard
									, Model model
									, HttpServletRequest request) throws Exception {
		
		resiBoardService.update(resiBoard);
		return "resi_board_write_ok";
	}	
	
	@RequestMapping("resi_board_delete")
	public View resi_board_delete(  @RequestParam(required=true) int resi_serial_no
				  					, Model model ) throws Exception{
		resiBoardService.delete(resi_serial_no);
		JavaScript javaScript = new JavaScript();
		javaScript.setMessage("삭제 되었습니다.");
		javaScript.setMethod("parent.location.href='/work/archive/ka_recipe.do'");
		return new JavaScriptView(javaScript);
	}
	
	private BOARDFILE getCartBoardFile( MultipartHttpServletRequest multipartRequest, String name ) throws Exception
	{
		log.info("getCartBoardFile-------------------------------- : " + name);
		
		SimpleDateFormat formatter  = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		
		String filePath = WorkData.UPLOAD_CART_IMAGE_PATH;
		String realPath = multipartRequest.getSession().getServletContext().getRealPath(filePath);		
		
		FileOutputStream fos = null;		
		BOARDFILE boardFile = null;	
		String fileName = "";
		
		if(realPath.indexOf("../") >=0){
			return boardFile;
		}
		
		File dir = new File(realPath); 
		if ( !dir.isDirectory() )
			dir.mkdir();
						
		
		try
		{		
			MultipartFile multipartFile = multipartRequest.getFile (name);
			
			if(!multipartFile.getOriginalFilename().equals(""))
			{
				String orgFileName = multipartFile.getOriginalFilename();
				if(orgFileName.endsWith(".wmv")){
					return boardFile;
				}
				boardFile = new BOARDFILE();
				
				// -- 해당 파일은 확장자를 붙여 준다 as-is 기준
				fileName = multipartRequest.getSession().getId() + formatter.format(date);					
				
				String ext = "";
				String [] exts = multipartFile.getOriginalFilename().split("\\.");					 
				if ( exts.length > 0 )
				{
					ext = exts[ exts.length - 1].toLowerCase();
					
					String check = "jpg,jpeg,gif,bmp,png,swf,tiff,tif,mpg,mpeg,avi,asf,wma,wmv,rm,ra,mp3";
					if ( check.indexOf(ext) >= 0 )
						fileName += "." + ext;
				}
				
				// file name [ session_noewdate ]
				boardFile.setBbs_file_name(orgFileName);
				boardFile.setBbs_file_size(multipartFile.getSize());
				boardFile.setBbs_file_url(WorkData.CART_SIMAGE + fileName); 
				boardFile.setBbs_file_type(ext);
				
				
				byte[] fileData = multipartFile.getBytes();
				
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				fos = new FileOutputStream(realPath + "/" + fileName);					
				fos.write(fileData);
				
				log.info("********************** [FILE][" + name + "]");
				log.info("FILE_NAME      : " + fileName);
				log.info("FILE_NAME_ORG  : " + orgFileName);
				log.info("FILE_SIZE      : " + boardFile.getBbs_file_size());
				log.info("FILE_URL       : " + boardFile.getBbs_file_url());					
				log.info("FILE_SAVE_PATH : " + realPath);
				log.info("********************** [FILE][" + name + "]");					
			}
	
		} catch(FileNotFoundException fe) {
			log.info("file upload error!",fe);
		} catch(Exception e) {
			
			log.info("file upload error!",e);
					
			if ( boardFile != null )
			{
				if(realPath.indexOf("../") >=0){
					return boardFile;
				}
				if(fileName.indexOf("../") >=0){
					return boardFile;
				}
				File uploadFile = new File(realPath+"/"+fileName);
				if(uploadFile != null)
					uploadFile.delete();
			}
			
		}finally{
			try{
				if(fos != null) fos.close();
			}catch(Exception e){
				log.info("file upload error!",e);					
			}
		}		
		return boardFile;
	}
	
	@RequestMapping("paper_board_top.do")
	public String boardTop(@RequestParam int bbs_board_no, @RequestParam String top_bbs_category, Model model)  {
		try { 
			List<PAPERBOARD> topList = paserBoardService.getBoardTop(bbs_board_no, top_bbs_category);
			model.addAttribute("list", topList);
		} catch(Exception e) {
			e.printStackTrace();
			//log.info("Exception : " + e.toString());
		}
		return "board/paper_board_top";
	}
}
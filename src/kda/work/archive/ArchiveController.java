package kda.work.archive;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kda.SessionInfo;
import kda.board.data.BOARDPAGE;
import kda.spring.abstr.KdaAbstractController;
import kda.utils.KdaStringUtil;
import kda.utils.MailBean;
import kda.work.archive.data.SIN_PAPER_BOARD;
import kda.work.archive.data.SIN_PAPER_BOARD_COMMENT;
import kda.work.archive.data.SIN_PERSON_INFO;

@Controller
public class ArchiveController extends KdaAbstractController {

    private Log log = LogFactory.getLog(ArchiveController.class);
    static String search;
    static String search_keyword;
    static String id;

    @Autowired
    ArchiveDAO dao;

    @RequestMapping(value = { "/ka_sinmungo_check.do", "ka_sinmungo_check.do", "work/archive/ka_sinmungo_check.do" })
    public String ka_sinmungo(HttpSession session, Model model, HttpServletRequest request) throws Exception {
        setDefaultModel(session, model);
        
        /* log.debug(search); */
        /*
         * if((int)request.getSession().getAttribute(SessionInfo.USER_LEVEL)==1){ request.getSession().setAttribute("user_level", request.getSession().getAttribute(SessionInfo.USER_LEVEL)); return "redirect:"+"ka_sinmungo_list.do"; }else
         * if(!checkLoingWithExpire(session)) { return "tiles"+"/work/archive/ka_sinmungo_login"; }else{ List list=dao.select_sin_person_info((String)request.getSession().getAttribute(SessionInfo.USER_ID)); if(list.size()>0){ return
         * "/work/archive/ka_sinmungo_write_move"; }else{ return "tiles"+"/work/archive/ka_sinmungo"; } }
         */
        try{
        	if ((int) request.getSession().getAttribute(SessionInfo.USER_LEVEL) == 1) {
                request.getSession().setAttribute("user_level", request.getSession().getAttribute(SessionInfo.USER_LEVEL));
                return "redirect:" + "ka_sinmungo_list.do";
            } else if (!checkLoingWithExpire(session)) {
                return "tiles" + "/work/archive/ka_sinmungo_login";
            } else {
                return "redirect:" + "ka_sinmungo_list.do";
            }
        }catch(Exception e){
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }
        
    }

    @RequestMapping(value = { "ka_sinmungo.do", "/ka_sinmungo.do", "work/archive/ka_sinmungo.do" }, method = RequestMethod.POST)
    public String ka_sinmungo(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, SIN_PERSON_INFO sin_person_info) throws IOException {
        if (!checkLoingWithExpire(session)) {
            response.setCharacterEncoding("EUC-KR");
            /* response.setContentType("text/html; charset=UTF-8"); */
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('다시 로그인 해주십시오.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }
        sin_person_info.setPers_id((String) request.getSession().getAttribute(SessionInfo.USER_ID));
        sin_person_info.setEmail(request.getParameter("email") + "@" + request.getParameter("email2"));
        int result = dao.insert_sin_person_info(sin_person_info);

        return "tiles" + "/work/archive/ka_sinmungo_write";
    }

    @RequestMapping(value = { "ka_sinmungo_write.do", "/ka_sinmungo_write.do", "work/archive/ka_sinmungo_write.do" }, method = RequestMethod.POST)
    public String ka_sinmungo_write(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, SIN_PERSON_INFO sin_person_info) throws IOException {
        if (!checkLoingWithExpire(session)) {
            response.setCharacterEncoding("EUC-KR");
            /* response.setContentType("text/html; charset=UTF-8"); */
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('다시 로그인 해주십시오.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }

        List list = dao.select_sin_person_info((String) request.getSession().getAttribute(SessionInfo.USER_ID));

        if (list.size() > 0) {
            return "tiles" + "/work/archive/ka_sinmungo_write";
        } else {
            return "tiles" + "/work/archive/ka_sinmungo";
        }

    }

    @RequestMapping(value = { "ka_sinmungo_write_ok", "/ka_sinmungo_write_ok", "work/archive/ka_sinmungo_write_ok.do" })
    public String ka_sinmungo_write_ok(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, SIN_PAPER_BOARD sin_paper_board, MultipartHttpServletRequest multi) throws IOException {
    	try{
    		String id = (String) request.getSession().getAttribute(SessionInfo.USER_ID);
        	if (!checkLoingWithExpire(session) || id.equals("")) {
                response.setCharacterEncoding("EUC-KR");
                /* response.setContentType("text/html; charset=UTF-8"); */
                PrintWriter writer = response.getWriter();
                writer.println("<script type='text/javascript'>");
                writer.println("alert('다시 로그인 해주십시오.');");
                writer.println("history.back();");
                writer.println("</script>");
                writer.flush();
                return "tiles" + "/work/archive/ka_sinmungo_login";
            }
            int max_size = 1024 * 1024 * 100;
            String realPath = multi.getSession().getServletContext().getRealPath("/");
            String savePath = realPath + "upload\\sinmungo\\" + KdaStringUtil.getTodayString() + "\\" + request.getSession().getAttribute(SessionInfo.USER_ID) + "\\";
            File file = new File(savePath);
            if (!file.exists()) {
                file.mkdirs();
            }

            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
            MultipartFile multipartFile = null;
            Map<String, Object> listMap = null;
            while (iterator.hasNext()) {
                multipartFile = multipartHttpServletRequest.getFile(iterator.next());
                if (multipartFile.isEmpty() == false) {
                    log.debug("------------- file start -------------");
                    log.debug("name : " + multipartFile.getName());
                    log.debug("filename : " + multipartFile.getOriginalFilename());
                    log.debug("size : " + multipartFile.getSize());
                    log.debug("-------------- file end --------------\n");

                    if (multipartFile.getName().equals("bbs_file1")) {
                        log.debug(multipartFile.getName() == "bbs_file1");
                        sin_paper_board.setBoard_file1_name(multipartFile.getOriginalFilename());
                        sin_paper_board.setBoard_file1_url(savePath + multipartFile.getOriginalFilename());
                    } else if (multipartFile.getName().equals("bbs_file2")) {
                        sin_paper_board.setBoard_file2_name(multipartFile.getOriginalFilename());
                        sin_paper_board.setBoard_file2_url(savePath + multipartFile.getOriginalFilename());
                    } else if (multipartFile.getName().equals("bbs_file3")) {
                        sin_paper_board.setBoard_file3_name(multipartFile.getOriginalFilename());
                        sin_paper_board.setBoard_file3_url(savePath + multipartFile.getOriginalFilename());
                    } else if (multipartFile.getName().equals("bbs_file4")) {
                        sin_paper_board.setBoard_file4_name(multipartFile.getOriginalFilename());
                        sin_paper_board.setBoard_file4_url(savePath + multipartFile.getOriginalFilename());
                    } else {
                        sin_paper_board.setBoard_file5_name(multipartFile.getOriginalFilename());
                        sin_paper_board.setBoard_file5_url(savePath + multipartFile.getOriginalFilename());
                    }

                    file = new File(savePath + multipartFile.getOriginalFilename());
                    try {
                        multipartFile.transferTo(file);
                    } catch (IllegalStateException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }

            }
            sin_paper_board.setBoard_user_id((String) request.getSession().getAttribute(SessionInfo.USER_ID));
            sin_paper_board.setBoard_handling("신청");
            
            dao.insert_sin_paper_board(sin_paper_board);

            return "tiles" + "/work/archive/ka_sinmungo_write_move";
        }catch(Exception e){
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }
    }

    @RequestMapping(value = { "ka_sinmungo_list.do", "/ka_sinmungo_list.do", "work/archive/ka_sinmungo_list.do" })
    public String ka_sinmungo_list(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false, defaultValue = "1") int cp, @RequestParam(required = false) String board_keyword)
            throws IOException {
        if (!checkLoingWithExpire(session) && (int) request.getSession().getAttribute(SessionInfo.USER_LEVEL) != 1) {
            response.setCharacterEncoding("EUC-KR");
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('다시 로그인 해주십시오.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }
        String search_keyword2 = "";

        if ((String) request.getParameter("search_keyword") != null && request.getParameter("search") != null) {
            id = (String) request.getSession().getAttribute(SessionInfo.USER_ID);
            search = (String) request.getParameter("search");
            search_keyword2 = (String) request.getParameter("search_keyword");
        }

        int totalCount = dao.cnt_select_search_all_sin_paper_board(search_keyword2, search);

        // 페이징 처리
        BOARDPAGE boardPage = null;
        boardPage = new BOARDPAGE(cp, totalCount);

        List<SIN_PAPER_BOARD> list = dao.select_search_all_sin_paper_board2(search, search_keyword2, boardPage.getCurPage());

        model.addAttribute("list", list);
        model.addAttribute("search_keyword", search_keyword2);
        model.addAttribute("search", search);
        model.addAttribute("boardPage", boardPage);
        return "tiles" + "/work/archive/ka_sinmungo_list";

    }

    @RequestMapping(value = { "ka_sinmungo_view.do", "/ka_sinmungo_view.do", "work/archive/ka_sinmungo_view.do" })
    public String ka_sinmungo_view(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("idx") int idx, @RequestParam("user_id") String user_id) throws IOException {
        if (!checkLoingWithExpire(session) && (int) request.getSession().getAttribute(SessionInfo.USER_LEVEL) != 1) {
            response.setCharacterEncoding("EUC-KR");
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('다시 로그인 해주십시오.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }

        if (user_id.equals((String) request.getSession().getAttribute(SessionInfo.USER_ID)) || (int) request.getSession().getAttribute(SessionInfo.USER_LEVEL) == 1) {
            model.addAttribute("list", dao.select_paper_board_view(idx));
            model.addAttribute("lists", dao.select_sin_person_info(user_id));
            log.debug(dao.select_paper_board_view(idx));
            return "tiles" + "/work/archive/ka_sinmungo_view";
        } else {
            response.setCharacterEncoding("EUC-KR");
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('본인의 게시글이 아닙니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "redirect:" + "ka_sinmungo_list.do";
        }
    }

    @RequestMapping(value = { "/ka_sinmungo_download.do", "/ka_sinmungo_download.do", "work/archive/ka_sinmungo_download.do" }, method = RequestMethod.GET)
    public void downloadFile(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            String filepath = (String) request.getParameter("board_file_url");
            log.debug(filepath);
            String filename = (String) request.getAttribute("board_file_name");
            File file = new File(filepath);
            model.addAttribute("file", file);

            response.setContentType("applicaiton/download;charset=utf-8");
            response.setContentLength((int) file.length());
            String filenames = java.net.URLEncoder.encode(file.getName(), "UTF-8");
            filenames = filenames.replaceAll("\\+", "%20");

            response.setHeader("Content-Disposition", "attachment;filename=\"" + filenames + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");

            OutputStream out;

            out = response.getOutputStream();
            // TODO Auto-generated catch block
            FileInputStream fis = null;

            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = { "ka_sinmungo_comment.do", "/ka_sinmungo_comment.do", "work/archive/ka_sinmungo_comment.do" })
    public String ka_sinmungo_view(HttpSession session, Model model, HttpServletRequest request, SIN_PAPER_BOARD_COMMENT sin_paper_board_comment, @RequestParam("idx") int idx, @RequestParam("board_user_id") String user_id) {

        String comments = request.getParameter("comment_content").replace("\r\n", "<br>");
        sin_paper_board_comment.setComment_content(comments);
        dao.insert_sin_paper_board_comment(sin_paper_board_comment);
        dao.update_sin_paper_board_handling(idx);
        model.addAttribute("list", dao.select_paper_board_view(idx));
        model.addAttribute("lists", dao.select_sin_person_info(user_id));

        return "redirect:" + "/work/archive/ka_sinmungo_view.do?idx=" + idx + "&user_id=" + user_id;
    }

    @RequestMapping(value = { "ka_send_mail.do", "/ka_send_mail.do", "work/archive/ka_send_mail.do" })
    public String ka_sinmungo_view(HttpSession session, Model model, HttpServletRequest request, SIN_PAPER_BOARD sin_paper_board, @RequestParam("idx") int idx, @RequestParam("board_subject") String board_subject,
            @RequestParam("board_user_id") String user_id) {
        dao.update_paper_board_mail(idx);
        String dept1 = request.getParameter("chbox1") == null ? "" : "kdanews@kdiet.or.kr";
        String dept2 = request.getParameter("chbox2") == null ? "" : "kdasys@kdiet.or.kr";
        String dept3 = request.getParameter("chbox3") == null ? "" : "kdap@hanmail.net";
        String dept4 = request.getParameter("chbox4") == null ? "" : "kda-safety@hanmail.net";

        String from = "";
        String name = "영양사 신문고";
        try {
            sendMail(name, from, dept1, board_subject, idx);
            sendMail(name, from, dept2, board_subject, idx);
            sendMail(name, from, dept3, board_subject, idx);
            sendMail(name, from, dept4, board_subject, idx);
        } catch (Exception e) {
            // TODO: handle exception
        }

        model.addAttribute("list", dao.select_paper_board_view(idx));
        model.addAttribute("lists", dao.select_sin_person_info(user_id));
        return "redirect:" + "/work/archive/ka_sinmungo_view.do?idx=" + idx + "&user_id=" + user_id;
    }

    @RequestMapping(value = { "ka_sinmungo_search.do", "/ka_sinmungo_search.do", "work/archive/ka_sinmungo_search.do" })
    public String ka_sinmungo_search(HttpSession session, Model model, HttpServletRequest request, @RequestParam(required = false) String search, @RequestParam(required = false) String board_keyword,
            @RequestParam(required = false, defaultValue = "1") int cp) {
        log.debug(request.getSession().getAttribute(SessionInfo.USER_ID));
        log.debug(request.getParameter("search"));
        log.debug(request.getParameter("search_keyword"));

        if (request.getParameter("search_keyword") != null && request.getParameter("search") != null) {
            id = (String) request.getSession().getAttribute(SessionInfo.USER_ID);
            search = (String) request.getParameter("search");
            search_keyword = request.getParameter("search_keyword");
        }

        int totalCount = dao.cnt_select_search_all_sin_paper_board(search_keyword, search);

        // 페이징 처리
        BOARDPAGE boardPage = null;
        boardPage = new BOARDPAGE(cp, totalCount);

        List<SIN_PAPER_BOARD> list = dao.select_search_all_sin_paper_board2(search, search_keyword, boardPage.getCurPage());

        model.addAttribute("list", list);
        model.addAttribute("search_keyword", search_keyword);
        model.addAttribute("search", search);
        model.addAttribute("boardPage", boardPage);

        return "tiles" + "/work/archive/ka_sinmungo_list";
    }

    @RequestMapping(value = { "ka_sinmungo_paper_board_del.do", "/ka_sinmungo_paper_board_del.do", "work/archive/ka_sinmungo_paper_board_del.do" })
    public String ka_sinmungo_paper_board_del(HttpSession session, Model model, HttpServletRequest request, @RequestParam("idx") int idx, @RequestParam(required = false, defaultValue = "1") int cp) {

        dao.delete_sin_paper_board(idx);
        dao.delete_sin_paper_board_comment(idx);

        return "redirect:" + "ka_sinmungo_list.do";
    }

    @RequestMapping(value = { "ka_sinmungo_paper_board_update.do", "/ka_sinmungo_paper_board_update.do", "work/archive/ka_sinmungo_paper_board_update.do" })
    public String ka_sinmungo_paper_board_update(HttpSession session, Model model, HttpServletRequest request, SIN_PAPER_BOARD sin_paper_board, @RequestParam("idx") int idx) {
        List<SIN_PAPER_BOARD> list = dao.select_paper_board_view(idx);
        log.debug(dao.select_paper_board_view(idx));
        model.addAttribute("list", dao.select_paper_board_view(idx));
        return "tiles" + "/work/archive/ka_sinmungo_paper_board_update";
    }
    
    @RequestMapping(value = { "ka_sinmungo_update.do", "/ka_sinmungo_update.do", "work/archive/ka_sinmungo_update.do" })
    public String ka_sinmungo_update(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("idx") int idx, MultipartHttpServletRequest multi, SIN_PAPER_BOARD sin_paper_board) throws IOException {
    	//2024.03.26 수정 시 로그인 새션 없는 경우 처리
    	if (!checkLoingWithExpire(session)) {
            response.setCharacterEncoding("EUC-KR");
            /* response.setContentType("text/html; charset=UTF-8"); */
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('다시 로그인 해주십시오.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return "tiles" + "/work/archive/ka_sinmungo_login";
        }
    	
        int max_size = 1024 * 1024 * 100;
        String realPath = multi.getSession().getServletContext().getRealPath("/");
        String savePath = realPath + "upload\\sinmungo\\" + KdaStringUtil.getTodayString() + "\\" + request.getSession().getAttribute(SessionInfo.USER_ID) + "\\";
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        log.debug(realPath);
        log.debug(savePath);

        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        MultipartFile multipartFile = null;
        Map<String, Object> listMap = null;
        while (iterator.hasNext()) {
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if (multipartFile.isEmpty() == false) {
                log.debug("------------- file start -------------");
                log.debug("name : " + multipartFile.getName());
                log.debug("filename : " + multipartFile.getOriginalFilename());
                log.debug("size : " + multipartFile.getSize());
                log.debug("-------------- file end --------------\n");

                if (multipartFile.getName().equals("bbs_file1")) {
                    log.debug(multipartFile.getName() == "bbs_file1");
                    sin_paper_board.setBoard_file1_name(multipartFile.getOriginalFilename());
                    sin_paper_board.setBoard_file1_url(savePath + multipartFile.getOriginalFilename());
                } else if (multipartFile.getName().equals("bbs_file2")) {
                    sin_paper_board.setBoard_file2_name(multipartFile.getOriginalFilename());
                    sin_paper_board.setBoard_file2_url(savePath + multipartFile.getOriginalFilename());
                } else if (multipartFile.getName().equals("bbs_file3")) {
                    sin_paper_board.setBoard_file3_name(multipartFile.getOriginalFilename());
                    sin_paper_board.setBoard_file3_url(savePath + multipartFile.getOriginalFilename());
                } else if (multipartFile.getName().equals("bbs_file4")) {
                    sin_paper_board.setBoard_file4_name(multipartFile.getOriginalFilename());
                    sin_paper_board.setBoard_file4_url(savePath + multipartFile.getOriginalFilename());
                } else {
                    sin_paper_board.setBoard_file5_name(multipartFile.getOriginalFilename());
                    sin_paper_board.setBoard_file5_url(savePath + multipartFile.getOriginalFilename());
                }

                file = new File(savePath + multipartFile.getOriginalFilename());
                try {
                    multipartFile.transferTo(file);
                } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

        }
        sin_paper_board.setBoard_user_id((String) request.getSession().getAttribute(SessionInfo.USER_ID));
        sin_paper_board.setBoard_handling("신청");
        log.debug(sin_paper_board);
        dao.update_sin_paper_board(sin_paper_board);

        return "tiles" + "/work/archive/ka_sinmungo_write_move";
    }

    @RequestMapping(value = { "ka_handling.do", "/ka_handling.do", "work/archive/ka_handling.do" })
    public String ka_handling(HttpSession session, Model model, HttpServletRequest request, @RequestParam("idx") int idx, @RequestParam("board_handling") String board_handling, @RequestParam("board_user_id") String user_id) {

        List<SIN_PERSON_INFO> lists = dao.select_sin_person_info(user_id);
        model.addAttribute("lists", dao.select_sin_person_info(user_id));
        dao.update_sin_paper_board_After(idx, board_handling);
        List<SIN_PAPER_BOARD> list = dao.select_paper_board_view(idx);
        model.addAttribute("list", dao.select_paper_board_view(idx));
        log.debug(list);

        return "redirect:" + "/work/archive/ka_sinmungo_view.do?idx=" + idx + "&user_id=" + user_id;
    }

    @RequestMapping(value = { "ka_dept_com.do", "/ka_dept_com.do", "work/archive/ka_dept_com.do" })
    public String ka_dept_com(HttpSession session, Model model, HttpServletRequest request, @RequestParam("idx") int idx, @RequestParam("board_dept_com") String board_dept_com, @RequestParam("board_user_id") String user_id) {

        List<SIN_PERSON_INFO> lists = dao.select_sin_person_info(user_id);
        model.addAttribute("lists", dao.select_sin_person_info(user_id));

        dao.update_sin_paper_board_com(idx, board_dept_com);
        List<SIN_PAPER_BOARD> list = dao.select_paper_board_view(idx);
        model.addAttribute("list", dao.select_paper_board_view(idx));

        return "redirect:" + "/work/archive/ka_sinmungo_view.do?idx=" + idx + "&user_id=" + user_id;
    }

    private void sendMail(String fromName, String from, String to, String title, int idx) throws Exception {

        String toMail = to;
        String fromMail = "kdanews@kdiet.or.kr";

        String subject = title;

        String mbody = "영양사 신문고에서 내용이 접수되었습니다. 확인 부탁드립니다.";

        MailBean mail = new MailBean();
        mail.sendMail(fromMail, fromName, toMail, subject, mbody);

    }

    @RequestMapping(value = { "delete_comment.do", "/delete_comment.do", "work/archive/delete_comment.do" })
    public String delete_comment(HttpSession session, Model model, HttpServletRequest request, @RequestParam("idx") int idx, @RequestParam("user_id") String user_id) {

        dao.delete_sin_paper_board_comment(idx);
        model.addAttribute("lists", dao.select_sin_person_info(user_id));
        model.addAttribute("list", dao.select_paper_board_view(idx));

        return "redirect:" + "/work/archive/ka_sinmungo_view.do?idx=" + idx + "&user_id=" + user_id;
    }

    @RequestMapping(value = { "ka_sinmungo_person_update.do", "/ka_sinmungo_person_update.do", "work/arcive/ka_sinmungo_person_update.do" }, method = RequestMethod.POST)
    public String ka_sinmungo_person_update(HttpSession session, Model model, HttpServletRequest request, @RequestParam("userid") String user_id) throws IOException {
        SIN_PERSON_INFO info = dao.select_sin_person_info2(user_id);
        model.addAttribute("info", info);

        List list = dao.select_sin_person_info((String) request.getSession().getAttribute(SessionInfo.USER_ID));

        if (list.size() > 0) {
            return "tiles" + "/work/archive/ka_sinmungo_person_update";
        } else {
            return "tiles" + "/work/archive/ka_sinmungo";
        }

    }

    @RequestMapping("ka_sinmungo_person_update_ok.do")
    public String ka_sinmungo_person_update_ok(@ModelAttribute("info") SIN_PERSON_INFO info, HttpServletRequest request, HttpSession session, Model model) throws Exception {

        String redirect = "tiles" + "/kmp_member_info";

        info.setEmail(request.getParameter("email") + "@" + request.getParameter("email2"));
        int result = dao.ka_sinmungo_person_update(info);
        System.out.println("result  = " + result);
        if (result <= 0) {
            redirect = "alert";
            model.addAttribute("message", "신문고 개인정보 수정이 정상적으로 처리되지 않았습니다.\\r\\n 다시시도해 주세요.");
            model.addAttribute("redirect", "/ka_sinmungo_person_update.do");
        } else {
            redirect = "alert";
            model.addAttribute("message", "신문고 개인정보가 수정되었습니다.");
            model.addAttribute("redirect", "/ka_sinmungo_list.do");
        }

        return redirect;
    }

}

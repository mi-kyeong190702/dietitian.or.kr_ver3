<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%	
	String work_userid = ParamUtils.getParameter(request, "g_userid", "0");

	// 정상적인 값으로 넘옴
	System.out.println("story g_userid : " + work_userid);

	work_userid = work_userid.replace("!", "%21");
	work_userid = work_userid.replace("@", "%40");
	work_userid = work_userid.replace("#", "%23");
	work_userid = work_userid.replace("~", "%7E");

%>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국내외</mark> 문헌정보</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
							<li><a href="/work/archive/ka_archive.do">자료실</a></li>
							<li><a href="/work/archive/ka_literature.do?bbs_board_code=66&g_userid=<%=work_userid%>" class="cm">국내외 문헌정보</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
				
					<div class="box t2 mb10 p20">
						<p class="text s1"><mark class="cm">국내외문헌정보 자료원본은 회원의 경우, 대한영양사협회 회관(서울 영등포구 여의도동 소재) 직접 방문 시 열람가능하시며, 방문 시 사전 전화를 해주시면 감사하겠습니다.</mark></p>
						<p class="text s1 i_b_t4 mt10">문의처 : 교육팀 02) 823-5680 (교)521</p>
					</div>
					<div class="area mb40">
						<div class="fl">
							<div class="box bgs r5 mt20 p5 pl10 w340">
								<p class="text bold cg i_b_t5">ADA</p>
							</div>
							<div class="text ssmall">
								<c:import url="/paper_board_top.do?bbs_board_no=66&top_bbs_category=ADA" />
							</div>
						</div>
						<div class="fr">
							<div class="box bgs r5 mt20 p5 pl10 w340">
								<p class="text bold cg_3 i_b_t5">영양일본</p>
							</div>
							<div class="text ssmall">
								<c:import url="/paper_board_top.do?bbs_board_no=66&top_bbs_category=영양일본" />
								
							</div>
						</div>
						<div class="fl">
							<div class="box bgs r5 mt20 p5 pl10 w340">
								<p class="text bold cg_1 i_b_t5">임상영양</p>
							</div>
							<div class="text ssmall">
								<c:import url="/paper_board_top.do?bbs_board_no=66&top_bbs_category=임상영양" />
							</div>
						</div>
						<div class="fr">
							<div class="box bgs r5 mt20 p5 pl10 w340">
								<p class="text bold cs i_b_t5">학교급식</p>
							</div>
							<div class="text ssmall">
								<c:import url="/paper_board_top.do?bbs_board_no=66&top_bbs_category=학교급식" />
								
							</div>
						</div>
					</div>
					
					
					<%@ include file ="/pages/board/paper_board.jsp"%>
				</div>
			</div>
		

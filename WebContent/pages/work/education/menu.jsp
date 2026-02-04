<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.KdaStringUtil,kda.SessionInfo" %>

<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
	
	String isLogin = KdaStringUtil.nullToString(session.getAttribute(SessionInfo.LOGIN));
	String codePers = KdaStringUtil.nullToString( session.getAttribute( SessionInfo.CODE_PERS));
	int userLevel =  KdaStringUtil.nullToInt(session.getAttribute(SessionInfo.USER_LEVEL), 0);
	
	int curDate = Integer.parseInt(KdaStringUtil.getTodayString());
	
	boolean isStudent = false;
	boolean isMember = false;
	String persState = KdaStringUtil.nullToString( session.getAttribute(SessionInfo.PERS_STATE) );
	if( persState.equals("08") ) {
		isStudent = true;
	}

	if( "Y".equals( isLogin  ) && !"".equals(codePers) &&  userLevel == 5 ) {
		isMember = true;
	}
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>EDUCATION</strong>
					<h2>KDA 교육</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if(file_path.length() >= 10 && file_path.substring(0,10).equals("ke_center_")) {%> class="on" <%}%>><a href="/work/education/ke_center_notice.do?bbs_board_code=2&bbs_category=교육">교육지원센터</a></li>
						<li <% if(file_path.equals("ke_law_edu")
									|| file_path.equals("ke_law_hygiene")
									|| file_path.equals("ke_law_secure")) {%> class="on" <%}%>><a href="/work/education/ke_law_edu.do">영양사 법정교육</a>
							<ul class="sm_depth2">
								<li><a href="/work/education/ke_law_edu.do" <% if(file_path.equals("ke_law_edu")) {%> class="on" <%}%>>영양사 보수교육</a></li>
								<li><a href="/work/education/ke_law_hygiene.do" <% if(file_path.equals("ke_law_hygiene")) {%> class="on" <%}%>>영양사 식품위생교육</a></li>
								<li><a href="/work/education/ke_law_secure.do" <% if(file_path.equals("ke_law_secure")) {%> class="on" <%}%>>맞춤형 건강기능식품 안전위생교육</a></li>
								<%-- <li><a href="/work/education/ke_law_special.do" <% if(file_path.equals("ke_law_special")) {%> class="on" <%}%>>영양사 특별위생교육</a></li> --%>
							</ul>
						</li>
						<li <% if(file_path.equals("ke_elderly_info") || file_path.equals("ke_sport_info")
									|| file_path.equals("ke_manage_info") 	|| file_path.equals("ke_industry_info")
									
									|| file_path.equals("ke_obs_info")		|| file_path.equals("ke_kidn_info")
									
									|| file_path.equals("ke_health_info")	|| file_path.equals("ke_cure_info") 
									|| file_path.equals("ke_heart_info")	|| file_path.equals("ke_diabetes_info") 
									|| file_path.equals("ke_obesity_info")	|| file_path.equals("ke_child_info") 
									|| file_path.equals("ke_kidney_info")	|| file_path.equals("ke_cancer_info")
									|| file_path.equals("ke_advice_info")	|| file_path.equals("ke_support_info")
									|| file_path.equals("ke_stomach_info")	|| file_path.equals("ke_patient_info")
									|| file_path.equals("ke_coach_info") 	|| file_path.equals("ke_kidscooking_info") 
									|| file_path.equals("ke_bady_info") 	|| file_path.equals("ke_leader_info")	
									|| file_path.equals("ke_cooperation") 	|| file_path.equals("ke_online_info") 
									|| file_path.equals("ke_cookieclayleader_info") || file_path.equals("ke_yofermense_info")
									|| file_path.equals("ke_dietary_info")	|| file_path.equals("ke_onlinnew_info") 
									|| file_path.equals("ke_clinical_info")) {%> class="on" <%}%>><a href="/work/education/ke_elderly_info.do">교육과정 안내</a>
							<ul class="sm_depth2">
								<li><a href="/work/education/ke_elderly_info.do" <% if(file_path.equals("ke_elderly_info") || file_path.equals("ke_sport_info")
										|| file_path.equals("ke_manage_info") 	|| file_path.equals("ke_industry_info")
										|| file_path.equals("ke_obs_info") 		|| file_path.equals("ke_kidn_info")
										) {%> class="on" <%}%>>전문교육과정</a></li>
								<li><a href="/work/education/ke_health_info.do" <% if(file_path.equals("ke_health_info") || file_path.equals("ke_cure_info")
										|| file_path.equals("ke_heart_info") 	|| file_path.equals("ke_diabetes_info")
										|| file_path.equals("ke_obesity_info") 	|| file_path.equals("ke_child_info")
										|| file_path.equals("ke_kidney_info") 	|| file_path.equals("ke_cancer_info")
										|| file_path.equals("ke_advice_info") 	|| file_path.equals("ke_support_info")
										|| file_path.equals("ke_bady_info") 	|| file_path.equals("ke_leader_info")
										|| file_path.equals("ke_stomach_info") 	|| file_path.equals("ke_patient_info")) {%> class="on" <%}%>>직무 교육과정 Ⅰ</a></li>
								<li><a href="/work/education/ke_coach_info.do" <% if(file_path.equals("ke_coach_info") || file_path.equals("ke_kidscooking_info") 
										|| file_path.equals("ke_cookieclayleader_info") || file_path.equals("ke_yofermense_info")
										|| file_path.equals("ke_cooperation")) {%> class="on" <%}%>>직무 교육과정 Ⅱ</a></li>
								<li><a href="/work/education/ke_online_info.do" <% if(file_path.equals("ke_online_info") || file_path.equals("ke_dietary_info")
										|| file_path.equals("ke_onlinnew_info") || file_path.equals("ke_clinical_info")) {%> class="on" <%}%>>온라인 교육과정</a></li>
							</ul>
						</li>
						<li <% if(file_path.equals("ke_curriculum")	
									|| file_path.equals("ke_situation")
									|| file_path.equals("ke_trainees") 
									|| file_path.equals("ke_trainees_revision")
									|| file_path.equals("ke_edu_list") 	
									|| file_path.equals("ke_trainees_info")
									|| file_path.equals("ke_edu_login") || file_path.startsWith("ke_edu_pay")
									|| file_path.equals("ke_training_list") 
								) {%> class="on" <%}%>><a href="/work/education/ke_curriculum.do">교육과정 신청</a>
							<ul class="sm_depth2">
								<li><a href="/work/education/ke_curriculum.do" <% if(file_path.equals("ke_curriculum") || file_path.equals("ke_edu_list") ) {%> class="on" <%}%>>교육과정 신청</a></li>
								<li><a href="/work/education/ke_situation.do" <% if(file_path.equals("ke_situation") || file_path.startsWith("ke_edu_pay") ) {%> class="on" <%}%>>교육과정 신청현황</a></li>
								<% if ( !isStudent && !isMember ) { %>
								<!-- <li><a href="/work/education/ke_trainees.do" <% if(file_path.equals("ke_trainees")) {%> class="on" <%}%>>교육생 등록</a></li> --> 
								<% } %>
								<% if( isStudent  ) { %>
								        <li><a href="/work/education/ke_training_list.do" <% if(file_path.equals("ke_training_list") ) {%> class="on" <%}%>>교육생 교육현황</a></li> 
										<li><a href="/work/education/ke_trainees_info.do" <% if(file_path.equals("ke_trainees_info")) {%> class="on" <%}%>>교육생 정보수정</a></li>
										<li><a href="/work/education/ke_trainees_logout.do" <% if(file_path.equals("ke_trainees_info")) {%> class="on" <%}%>>교육생 로그아웃</a></li>		
								<%	} %>	
							</ul>
						</li>
						<%-- <li <% if(file_path.equals("ke_about") 			|| file_path.equals("ke_specialty_01")
								|| file_path.equals("ke_specialty_02") 	|| file_path.equals("ke_schedule")
								|| file_path.equals("ke_exam") 			|| file_path.equals("ke_exam_situation")
								 || file_path.equals("ke_license") 		|| file_path.equals("ke_application")
								 || file_path.equals("ke_verification") || file_path.equals("ke_formboard")
								 || file_path.equals("ke_schedule_detail") || file_path.equals("ke_schedule_form")) {%> class="on" <%}%>><a href="/work/education/ke_about.do">전문영양사 코너</a>
							<ul class="sm_depth2">
								<li><a href="/work/education/ke_about.do" <% if(file_path.equals("ke_about") || file_path.equals("ke_specialty_01")
										|| file_path.equals("ke_specialty_02")) {%> class="on" <%}%>>전문영양사란?</a></li>
								<li><a href="/work/education/ke_schedule.do" <% if(file_path.equals("ke_schedule") 
										|| file_path.equals("ke_schedule_detail") || file_path.equals("ke_schedule_form")) {%> class="on" <%}%>>평점인정 교육일정</a></li>
								<li><a href="/work/education/ke_exam.do" <% if(file_path.equals("ke_exam")) {%> class="on" <%}%>>자격시험 신청</a></li>
								<li><a href="/work/education/ke_exam_situation.do" <% if(file_path.equals("ke_exam_situation")) {%> class="on" <%}%>>자격시험 신청현황</a></li>
								<li><a href="/work/education/ke_license.do" <% if(file_path.equals("ke_license") || file_path.equals("ke_application")
										|| file_path.equals("ke_verification")) {%> class="on" <%}%>>자격증 신청(신규·갱신)</a></li>
								<li><a href="/work/education/ke_formboard.do?bbs_board_code=83" <% if(file_path.equals("ke_formboard")) {%> class="on" <%}%>>관련서식 다운로드</a></li>
							</ul>
						</li> --%>
						<!-- 학술대회 관련 부분 -->
						<li <% if(file_path.equals("ke_contest_info") 			|| file_path.equals("ke_program") 
								|| file_path.equals("ke_program_01") 			|| file_path.equals("ke_document") 
								|| file_path.equals("ke_receipt")				|| file_path.equals("ke_receipt_application")
								|| file_path.equals("ke_receipt_verification") 	|| file_path.equals("ke_receipt_cancel")
								|| file_path.equals("ke_ebook")
								|| file_path.equals("ke_green") || file_path.equals("ke_green_online") || file_path.equals("ke_green_verification")
								|| file_path.equals("ke_green_list") || file_path.equals("ke_green_online") 
								|| file_path.equals("ke_event_info")) {%> class="on" <%}%> ><a href="/work/education/ke_contest_info.do">전국영양사 학술대회</a>
	
							<ul class="sm_depth2">
								<!-- 학술대회 관련 부분 -->
								<li><a href="/work/education/ke_contest_info.do" <% if(file_path.equals("ke_contest_info")) {%> class="on" <%}%>>학술대회 안내</a></li>
								<li><a href="/work/education/ke_program.do" <% if(file_path.equals("ke_program") || file_path.equals("ke_program_01")) {%> class="on" <%}%>>프로그램</a></li>
								<li><a href="/work/education/ke_document.do" <% if(file_path.equals("ke_document")) {%> class="on" <%}%>>공문다운받기</a></li>
								<li><a href="/work/education/ke_receipt.do" <% if(file_path.equals("ke_receipt") || file_path.equals("ke_receipt_application") || file_path.equals("ke_green_list")
											 	|| file_path.equals("ke_receipt_verification") || file_path.equals("ke_receipt_cancel")) {%> class="on" <%}%>>등록</a></li>
								<li><a href="/work/education/ke_green.do" <% if(file_path.equals("ke_green") || file_path.equals("ke_green_online") || file_path.equals("ke_green_verification") ) {%> class="on" <%}%>>초록접수</a></li>
								<li><a href="/work/education/ke_ebook.do" <% if(file_path.equals("ke_ebook")) {%> class="on" <%}%>>e-Book보기</a></li>
								
								<%-- <li><a href="#" <% if(file_path.equals("ke_green")) {%> class="on" <%}%>>초록접수</a></li> --%>
								<%-- <li><a href="#" <% if(file_path.equals("ke_event_info")) {%> class="on" <%}%>>행사장(숙박) 안내</a></li> --%>
								<%-- <li><a href="/work/education/ke_event_info.do" <% if(file_path.equals("ke_event_info")) {%> class="on" <%}%>>행사장(숙박) 안내</a></li> --%>
								
								<!-- 영수증 출력 추가 -->
								<li>
									<%if( curDate > 20250728 ) { %><a href="/xaido/education/2025 학술대회 영수증.xlsx">영수증 출력</a><% } else {  %><a href="#" onclick="alert('영수증 출력은 학술대회 이후 확인 가능합니다.')">영수증 출력</a><% } %>
								</li>
								
								<!-- 이수확인서 출력 추가 -->
								<li>
									<%if( curDate > 20250728 ) { %><a href="/xaido/education/2025_학술대회 직무연수 이수증(홈페이지용).xlsx">이수확인서 출력</a><% } else {  %><a href="#" onclick="alert('이수확인서 출력은 학술대회 이후 확인 가능합니다.')">이수확인서 출력</a><% } %>
								</li>
								
							</ul>
						</li>
					</ul>
				</div>
			</div>

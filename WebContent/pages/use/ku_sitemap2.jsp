			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<%@include file="/pages/common.jsp"%>
			
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">사</mark>이트맵</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/use/ku_sitemap.do">이용안내</a></li>
							<li><a href="/use/ku_sitemap.do" class="cm">사이트맵</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="area">
						<ul class="text cb s1 mb50">
							<li class="mt50 fl">
							<div class="w230 line bw2 bb bcm"><a href="/work/introduction/ki_intro.do" target="_self"><span class="bold middle_1 cm mb10">KDA 소개</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/introduction/ki_intro.do" target="_self"><span class="i_b_t2"><span class="small bold cb pl10">대한영양사협회 소개</span></span></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_intro.do" target="_self">인사말</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_group.do" target="_self">조직 및 연락처</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_activity.do" target="_self">활동</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_location.do" target="_self">찾아오시는 길</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_situation.do" target="_self">협회 현황</a></li>
										</ul>
									</li>
									<li class="mt20 mr20"><a href="/work/introduction/ki_about.do" target="_self"><span class="i_b_t2"><span class="small bold cb pl10">영양사 소개</span></span></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_about.do" target="_self">영양사란</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_dietitian.do" target="_self">영양사가 되려면</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_us_activity.do" target="_self">우리나라 영양사 활동</a></li>
											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_clinical.do" target="_self">임상영양사</a></li>
<!-- 											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_operation.do" target="_self">급식경영양사</a></li> -->
<!-- 											<li class="text_b link i_box_t1"><a href="/work/introduction/ki_industry.do" target="_self">산업보건영양사</a></li> -->
										</ul>	
									</li>
								</ul>		
							</li>
							<li class="mt50 fl ml25 mr25">
							<div class="w230 line bw2 bb bcgr"><a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}" target="_self"><span class="bold middle_1 cg mb10">KDA 소식</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/news/kn_notice.do?bbs_board_code=2&g_userid=${g_encoded_userid}" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">공지사항</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/news/kn_area_main.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">시도영양사회</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/news/kn_area_notice.do?bbs_board_code=69,70,71,72,73,74,75,76,77,78,79,80,81&g_userid=${g_encoded_userid}" target="_self">시도영양사회 공지사항</a></li>
											<li class="text_b link i_box_t1"><a href="/work/news/kn_area_board.do?bbs_board_code=36,37,38,39,40,41,42,43,44,45,46,47,48" target="_self">시도영양사회 게시판</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/news/kn_organ_news.do?bbs_board_code=0" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">관련기관소식</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/news/kn_division.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">학교분과</span></div></a></li>
									<!-- <li class="mt20 mr20"><a href="/work/news/kn_senior.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">시니어 직능클럽</span></div></a></li> -->
									<li class="mt20 mr20"><a href="/work/news/kn_gallery.do?bbs_board_code=89&g_userid=${g_encoded_userid}" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">KDA  Gallery</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/news/kn_re_license.do?g_userid=${g_encoded_userid}" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">영양사면허증 재교부</span></div></a></li>
									
									<!-- 2022.04.01 주석처리
									<li class="mt20 mr20"><a href="/work/news/kn_info_license.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">영양사카드</span></div></a>
									-->
										<!-- 
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/news/kn_info_license.do" target="_self">영양사카드 발급안내</a></li>
											<li class="text_b link i_box_t1"><a href="/work/news/kn_license.do" target="_self">영양사카드 발급신청</a></li>
										</ul>
										 -->	
									</li>
									<li class="mt20 mr20"><a href="/work/news/kn_calendar.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">이달의 일정</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/news/kn_careers.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">채용센터</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/news/kn_careers.do" target="_self">구인</a></li>
										</ul>	
									</li>
								</ul>		
							</li>
							<li class="mt50 fl">
							<div class="w230 line bw2 bb bcp"><a href="/work/business/kb_nutrition.do" target="_self"><span class="bold middle_1 cp mb10">KDA 영양</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/business/kb_nutrition.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">영양의 날</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_nutrition.do" target="_self">개요</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_nutrition_material.do?bbs_board_code=88" target="_self">자료실</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/business/kb_farm.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">우리 농축수산물소비촉진</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_farm.do" target="_self">개요</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_farm_material.do?bbs_board_code=6" target="_self">자료실</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/business/kb_reduction.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">당류·나트륨 저감 홍보</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_reduction.do" target="_self">개요</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/business/kb_safety.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">음식업종 사망사고 예방</span></div></a>
										<!-- <ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_safety.do" target="_self">개요</a></li>
										</ul> -->	
									</li>
<!-- 									<li class="mt20 mr20"><a href="/work/business/kb_waste.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">음식물쓰레기 감량사업</span></div></a> -->
<!-- 										<ul class="p10 ssmall"> -->
<!-- 											<li class="text_b link i_box_t1"><a href="/work/business/kb_waste.do" target="_self">사업소개</a></li> -->
<!-- 											<li class="text_b link i_box_t1"><a href="/work/business/kb_waste_material.do?bbs_board_code=4" target="_self">자료실</a></li> -->
<!-- 										</ul>	 -->
<!-- 									</li> -->
									<li class="mt20 mr20"><a href="/work/business/kb_health.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">국민건강증진사업</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_health.do" target="_self">개요</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_health_material.do?bbs_board_code=11" target="_self">자료실</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/business/kb_clinic.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">영양클리닉</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_info118.do" target="_self">간편영양정보118</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_habits.do" target="_self">올바른 식습관</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_obesity_adult.do" target="_self">비만도 평가</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_diabetes.do" target="_self">당뇨병 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_child_obesity.do" target="_self">소아비만 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_adult_obesity.do" target="_self">성인비만 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_heart.do" target="_self">심혈관계질환 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_kidney.do" target="_self">신장질환 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_liver.do" target="_self">간질환 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_stomach.do" target="_self">위장질환 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_cancer.do" target="_self">암과 영양</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_tubefeeding.do" target="_self">경관급식</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_children.do" target="_self">소아질환 관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_etc_osteoporosis.do" target="_self">기타질환</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_family_baby.do" target="_self">우리가족영양관리</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_c_counsel_intro.do" target="_self">상담영양사 소개</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/business/kb_ko_site.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">관련사이트</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/business/kb_ko_site.do" target="_self">국내사이트</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_fo_site.do" target="_self">국외사이트</a></li>
											<li class="text_b link i_box_t1"><a href="/work/business/kb_fo_nutrition.do" target="_self">외국영양사회</a></li>
										</ul>	
									</li>
								</ul>
							</li>
							<li class="mt50 fl">
							<div class="w230 line bw2 bb bcm"><a href="/work/education/ke_menu.do" target="_self"><span class="bold middle_1 cm mb10">KDA 교육</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/education/ke_center_notice.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">교육지원센터</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/education/ke_law_edu.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">영양사 법정교육</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/education/ke_law_edu.do" target="_self">영양사 보수교육</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_law_hygiene.do" target="_self">영양사 식품위생교육</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/work/education/ke_law_special.do" target="_self">영양사 특별위생교육</a></li> -->
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/education/ke_elderly_info.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">교육과정 안내</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/education/ke_elderly_info.do" target="_self">전문교육과정</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_health_info.do" target="_self">직무 교육과정 Ⅰ</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_coach_info.do" target="_self">직무 교육과정 Ⅱ</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_online_info.do" target="_self">온라인 교육과정</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/education/ke_curriculum.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">교육과정신청</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/education/ke_curriculum.do" target="_self">교육과정 신청</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_situation.do" target="_self">교육과정 신청현황</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/work/education/ke_mySituation.do" target="_self">교육현황</a></li> -->
										</ul>	
									</li>
									<!-- <li class="mt20 mr20"><a href="/work/education/ke_about.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">전문영양사 코너</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/education/ke_about.do" target="_self">전문영양사란?</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_schedule.do" target="_self">평점인정 교육일정</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_exam.do" target="_self">자격시험 신청</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_exam_situation.do" target="_self">자격시험 신청현황</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_license.do" target="_self">자격증 신청(신규&middot;갱신)</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_formboard.do?bbs_board_code=83" target="_self">관련서식 다운로드</a></li>
										</ul>
									</li> -->
									<!-- 학술대회 관련 부분 -->
									<li class="mt20 mr20"><a href="/work/education/ke_contest_info.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">전국영양사 학술대회</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/education/ke_contest_info.do" target="_self">학술대회 안내</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_program.do" target="_self">프로그램</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_document.do" target="_self">공문다운받기</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_receipt.do" target="_self">등록</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_green.do" target="_self">초록접수</a></li>
											<li class="text_b link i_box_t1"><a href="/work/education/ke_ebook.do" target="_self">e-Book보기</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/work/education/ke_event_info.do" target="_self">행사장(숙박) 안내</a></li> -->
										</ul>	
									</li>
								</ul>
							</li>
							<li class="mt50 fl ml25 mr25">
							<div class="w230 line bw2 bb bcgr"><a href="/work/publication/kp_magazine.do" target="_self"><span class="bold middle_1 cg mb10">KDA 출판</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/publication/kp_magazine.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">국민영양</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/publication/kp_participation.do" target="_self">국민영양참여</a></li>
											<li class="text_b link i_box_t1"><a href="/work/publication/kp_m_list.do" target="_self">국민영양검색</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/publication/kp_journal.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">학술지</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/publication/kp_journal_law01.do" target="_self">학술지 규정</a></li>
											<li class="text_b link i_box_t1"><a href="/work/publication/kp_journal_search.do" target="_self">학술지 검색</a></li>
											<li class="text_b link i_box_t1"><a href="/work/publication/kp_ebook_list.do" target="_self">학술지 검색(e-Book)</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/publication/kp_thesis.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">학술지 논문투고</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/publication/kp_archiveshop.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">교육자료(판매품)</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/publication/faq/faq_list.do?faq_category=3" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">출판  FAQ</span></div></a></li>
								</ul>
							</li>
							<li class="mt50 fl h900">
							<div class="w230 line bw2 bb bcp"><a href="/work/archive/ka_archive.do" target="_self"><span class="bold middle_1 cp mb10">KDA 회원자료실</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/work/archive/ka_archive.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">자료실</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_hotnews.do?bbs_board_code=91" target="_self">식품영양핫뉴스</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_management.do?bbs_board_code=63" target="_self">급식경영</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_recipe.do?bbs_board_code=92" target="_self">식단 및 레시피</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_hygiene.do?bbs_board_code=86" target="_self">급식위생</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_education.do?bbs_board_code=65" target="_self">영양교육</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_clinical.do?bbs_board_code=64" target="_self">임상영양</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_form.do?bbs_board_code=85" target="_self">업무서식</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_literature.do?bbs_board_code=66" target="_self">국내외문헌정보</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_legal.do" target="_self">법률정보</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_govt.do?bbs_board_code=122" target="_self">정부지침서</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_story.do?bbs_board_code=22" target="_self">영양관련정보</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/archive/ka_club.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">동호회</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_health.do?bbs_board_code=24" target="_self">건강상담영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_hospital.do?bbs_board_code=25" target="_self">병원영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_company.do?bbs_board_code=26" target="_self">급식전문업체영양사</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/work/archive/ka_specialist.do?bbs_board_code=27" target="_self">전문영양사</a></li> -->
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_center.do?bbs_board_code=28" target="_self">보건소영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_welfare.do?bbs_board_code=29" target="_self">사회복지시설영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_school.do?bbs_board_code=30" target="_self">학교영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_industry.do?bbs_board_code=31" target="_self">산업체영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_counsel.do?bbs_board_code=32" target="_self">상담영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_policestation_group.do?bbs_board_code=106" target="_self">경찰서·소방서영양사 </a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_kindergarten_group.do?bbs_board_code=95" target="_self">유치원·어린이집영양사</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_child_center.do?bbs_board_code=108" target="_self">어린이급식관리지원센터</a></li>
											<li class="text_b link i_box_t1"><a href="/work/archive/ka_christianity.do?bbs_board_code=33" target="_self">기독영양사</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/work/archive/ka_freeboard.do?bbs_board_code=34&g_userid=${g_encoded_userid}" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">회원게시판</span></div></a></li>
									<li class="mt20 mr20"><a href="/work/archive/ka_sinmungo_check.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">영양사신문고</span></div></a></li>
								</ul>
							</li>
							<li class="mt50 fl">
							<div class="w230 line bw2 bb bcm"><a href="/member/km_join.do" target="_self"><span class="bold middle_1 cm mb10">회원가입</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/member/km_join.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">신규회원가입</span></div></a></li>
									<li class="mt20 mr20"><a href="/member/km_deposit.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">기존회원 재가입/입금확인</span></div></a></li>
									<li class="mt20 mr20"><a href="/member/km_condition.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">회원가입안내</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/member/km_condition.do" target="_self">회원의 자격</a></li>
											<li class="text_b link i_box_t1"><a href="/member/km_money.do" target="_self">회비구분 및 금액</a></li>
											<li class="text_b link i_box_t1"><a href="/member/km_period.do" target="_self">회원의 유효기간</a></li>
											<li class="text_b link i_box_t1"><a href="/member/km_benefit.do" target="_self">회원혜택</a></li>
											<li class="text_b link i_box_t1"><a href="/member/km_deposit_manner.do" target="_self">입금방법</a></li>
											<li class="text_b link i_box_t1"><a href="/member/km_account.do" target="_self">입금계좌 및 문의처</a></li>
										</ul>
									</li>
									<li class="mt20 mr20"><a href="/member/km_id_pw.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">아이디/비밀번호 찾기</span></div></a></li>
									<li class="mt20 mr20"><a href="/member/km_member_period.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">회원 유효기간 확인</span></div></a></li>
									<li class="mt20 mr20"><a href="/member/km_member_download.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">회원 가입공문 다운로드</span></div></a></li>
									<li class="mt20 mr20"><a href="/member/faq/faq_list.do" target="_self"><div class="i_b_t2"><span class="small bold cb pl10">회원가입 FAQ</span></div></a></li>
								</ul>
							</li>
							<li class="mt50 fl ml25 mr25">
							<div class="w230 line bw2 bb bcgr"><a href="/kmp_payment.do?doc_code=0105" target="_self"><span class="bold middle_1 cg mb10">마이페이지</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/kmp_member_info.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">회원정보관리</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/kmp_member_info.do" target="_self">기본정보 수정</a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_license_modify.do" target="_self">기타정보 수정</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/kmp_deposit.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">기존회원 재가입/입금확인</span></div></a></li>
									<li class="mt20 mr20"><a href="/kmp_situation.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">MY 교육정보</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/kmp_situation.do" target="_self">교육현황</a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_license.do" target="_self">수료증 교육</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/kmp_elderly.do" target="_self">노인유지 교육</a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_sport.do" target="_self">스포츠유지 교육</a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_feed.do" target="_self">급식경영유지 교육 </a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_health.do" target="_self">산업보건유지 교육</a></li> -->
											<li class="text_b link i_box_t1"><a href="/kmp_hygiene.do" target="_self">위생교육</a></li>
											<li class="text_b link i_box_t1"><a href="/kmp_repair.do" target="_self">보수교육</a></li>
										</ul>	
									</li>
									<li class="mt20 mr20"><a href="/kmp_my_licence.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">MY 수료증정보</span></div></a></li>
									<li class="mt20 mr20"><a href="/kmp_benefit.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">회원혜택</span></div></a></li>
									<li class="mt20 mr20"><a href="/kmp_payment.do?doc_code=0105" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">회비 납입내역</span></div></a></li>
									<li class="mt20 mr20"><a href="/mypage/kmp_magazine.do" target="_self"><div class="i_b_t2_1"><span class="small bold cb pl10">국민영양을 받지 못한 경우</span></div></a></li>
								</ul>
							</li>
							<li class="mt50 fl">
							<div class="w230 line bw2 bb bcp"><a href="/use/ku_sitemap.do" target="_self"><span class="bold middle_1 cp mb10">이용안내</span></a></div>
								<ul>
									<li class="mt20 mr20"><a href="/use/ku_sitemap.do" target="_self"><div class="i_b_t2_3"><span class="small bold cb pl10">이용안내</span></div></a>
										<ul class="p10 ssmall">
											<li class="text_b link i_box_t1"><a href="/use/ku_sitemap.do" target="_self">사이트맵</a></li>
											<li class="text_b link i_box_t1"><a href="/use/faq/faq_list.do?faq_category=4" target="_self">FAQ</a></li>
											<li class="text_b link i_box_t1"><a href="/use/ku_popupzone.do" target="_self">팝업모두 보기</a></li>
											<li class="text_b link i_box_t1"><a href="/use/ku_banner.do" target="_self">배너모두 보기</a></li>
											<!-- <li class="text_b link i_box_t1"><a href="/use/ku_personal.do" target="_self">개인정보처리방침</a></li> -->
											<!-- <li class="text_b link i_box_t1"><a href="#" target="_self">저작권 보호정책</a></li> -->
											<li class="text_b link i_box_t1"><a href="/use/ku_viewer.do" target="_self">뷰어 다운로드</a></li>
										</ul>	
									</li>
								</ul>
							</li>
						</ul>
					</div>

				</div>
			</div>

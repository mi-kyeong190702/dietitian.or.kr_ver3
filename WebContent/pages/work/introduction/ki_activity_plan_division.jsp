			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">활</mark>동</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
							<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
							<li><a href="/work/introduction/ki_activity.do" class="cm">활동</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
				
					<!-- 상단 tab -->
					<jsp:include page="ki_activity_plan_submenu.jsp" flush="false">
					        <jsp:param name="idx" value="1"/>
					</jsp:include>
					
					<h4 class="title bold t2 cm s1 i_b_t2 mt50">사업계획</h4>
					<jsp:include page="activity_select.jsp" flush="false">
					        <jsp:param name="idx" value="5"/>
					</jsp:include>
					<div class="area text s1 mb50">
						<h5 class="title t3 bold i_b_t3 mt50">분과운영</h5>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">산업체분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 전국산업체영양사회장단 및 산업체분과위원회 운영</li>
									<li class="mt5 mb5">(2) 교정분야회 활동 지원</li>
									<li class="mt5 mb5">(3) 산업체 영양사 홍보 및 사회공헌사업 실시를 통한 회원 유대 강화</li>
									<li class="mt5 mb5">(4) 정책 홍보자료 메일링, 문자, 카카오톡채널 소식 발송 서비스</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 집단급식소 영양사 배치 확대</li>
									<li class="mt5 mb5">(2) 군대 급식 개선을 위한 군무원 영양사 배치 확대</li>
									<li class="mt5 mb5">(3) 소방관서 영양사 배치 확대 및 처우 개선</li>
									<li class="mt5 mb5">(4) 경찰서 영양사 고용 안정 및 처우 개선</li>
									<li class="mt5 mb5">(5) 관련법 개정 및 제도 개선에 따른 건의</li>
								</ul>
							</li>
							<li class="pb20">3) 행사 개최
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 전국 산업체영양사 워크숍</li>
									<li class="mt5 mb5">(2) 사랑의 김장김치 나눔 행사</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">병원분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 회원과의 소통 활성화 및 회원배가 추진
										<ol class="ml10 mt5">
											<li class="mb5">① 회원가입 독려</li>
											<li class="mb5">② 전국 영양부서장 네트워크 활성화</li>
											<li class="mb5">③ 전국 병원영양사회 및 시·도병원영양사회 사업 공유</li>
											<li class="mb5">④ 정책 추진 사항 공지 : 분과 정책 추진 및 의료계 최신동향 공유 등</li>
											<li class="mb5">⑤ 예비임상영양사 모임 활성화</li>
											<li class="mb5">⑥ 홈페이지 소모임 관리</li>
											<li class="mb5">⑦ 멘토·멘티 제도 활성화</li>
										</ol>
									</li>
									<li class="mt5 mb5">(2) 의견 수렴 및 회의 활성화
										<ol class="ml10 mt5">
											<li class="mb5">① 병원분과위원회 운영</li>
											<li class="mb5">② 시·도병원영양사회장단 및 병원분과위원회 회의 개최</li>
										</ol>
									</li>
									<li class="mt5 mb5">(3) 분야회 및 영양사 모임 활동 지원</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 보건의료인력으로서의 영양사, 임상영양사 역할 강화
									    <ul class="text small pl15">
                                            <li class="i_b_t7 mt5 mb5">「보건의료인력지원법」,「보건의료기본법」등 의견 개진, 보건의료인력 종합계획 수립 추진 등</li>
                                        </ul>
									</li>
									<li class="mt5 mb5">(2) 임상영양사 배치기준 마련
									    <ul class="text small pl15">
                                            <li class="i_b_t7 mt5 mb5">보건의료인력 적정 인력기준 마련을 위한「보건의료인력 직무 실태조사」실시</li>
                                        </ul>
									</li>
									<li class="mt5 mb5">(3) 입원환자 식대수가 제도 개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">입원환자 식대 수가제도 개선</li>
											<li class="i_b_t7 mt5 mb5">「치료식 영양관리료」수가 기준 개선</li>
										</ul>
									</li>
									<li class="mt5 mb5">(4) 기초영양관리료 수가 신설
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">입원환자에게 제공하는 기초영양관리 행위에 대한「기초영양관리료」신설</li>
										</ul>
									</li>
									<li class="mt5 mb5">(5) 일차의료 만성질환관리 본사업 내 영양사 역할 확대
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">일차의료 만성질환관리사업 내 영양사 케어코디네이터 고용 의무화 및 역할 강화</li>
										</ul>
									</li>
									<li class="mt5 mb5">(6) 특수의료용도식품의 전문인력에 의한 관리방안 마련
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">국민건강권 보호를 위해 특수의료용도식품의 필수 판매·관리인력에 임상영양에 관한 비전문가를 포함하는 제도 반대</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="pb20">3) 행사 개최
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 의료기관 영양부서 관리자 워크숍 개최</li>
									<li class="mt5 mb5">(2) 전국병원영양사 온라인 직무교육 개최</li>
									<li class="mt5 mb5">(3) 의료기관 영양부서 질 향상 활동 우수사례 공모전 및 발표대회</li>
								</ul>
							</li>
							<li class="pb20">4) 의료기관 영양사 역할 홍보 및 유관기관 연계 활동
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 대국민 홍보 : 임상영양사, 의료기관 영양사 역할 홍보 강화</li>
									<li class="mt5 mb5">(2) 유관기관 홍보 및 연계 강화 : 대한병원협회, 대한비만학회, 대한당뇨병학회, 대한당뇨병연합, 의료기관평가인증원, 보건의료단체협의회, 대한병원행정관리자협회, 한국보건사회연구원, 한국장애인보건의료협의회, 한국건강증진개발원 등 관련 단체 행사 및 회의 참여</li>
									<li class="mt5 mb5">(3) 사회봉사활동 참여 : 영양·식생활 교육 및 상담 봉사활동, 건강캠페인 전개 등</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">영양교사분과 </h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 중앙위원회 회의 개최</li>
									<li class="mt5 mb5">(2) 대의원총회 개최</li>
									<li class="mt5 mb5">(3) 전문TF팀 운영</li>
									<li class="mt5 mb5">(4) 시·도교육청 영양교육전문직원, 전국 시·도영양교사회장단 간담회</li>
									<li class="mt5 mb5">(5) 회원 등록률 확대</li>
									<li class="mt5 mb5">(6) 회원 대상 정책 뉴스 홍보 강화 및 정책 추진 안내</li>
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">(사)대한영양사협회 전국영양교사회 회원 대상 문자, SNS, 메일 등 발송</li>
											<li class="i_b_t7 mt5 mb5">『KDA 영양교사 정보관』을 활용한 관련 정책·정보 제공 및 활성화</li>
										</ul>
									<li class="mt5 mb5">(7) (사)대한영양사협회 및 (사)대한영양사협회 전국영양교사회 우수 시·도영양교사회 선정·포상</li>
									<li class="mt5 mb5">(8) 현황, 설문조사 등을 통한 회원 의견 수렴</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진 
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 학교급식 위생 점검 방법 개선</li>
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">사전예고제 전면 시행</li>
											<li class="i_b_t7 mt5 mb5">연 1회 점검(자체점검 1회) 및 점검기관 일원화 등 점검방법 개선</li>
										</ul>
									<li class="mt5 mb5">(2) 과대·과밀학교, 기숙학교 등 급식학교 급식 운영 체계 개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">과대·과밀학교 영양교사 추가 배치</li>
											<li class="i_b_t7 mb5">기숙학교 등 급식학교 영양교사 추가 배치</li>
											<li class="i_b_t7 mb5">공동관리(조리)교, 통합학교 등 운영 체계 개선</li>
											<li class="i_b_t7 mb5">- 방학중 고등학교 급식운영체계 개선</li>
										</ul>
									</li>
									<li class="mt5 mb5">(3) 영양교사 법정정원 확보
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">유치원, 초·중·고등학교 급식학교 1인 이상 영양교사 배치</li>
											<li class="i_b_t7 mb5">신설교, 학교영양사 퇴직교 등에 영양교사 배치</li>
										</ul>
									</li>
									<li class="mt5 mb5">(4) 유치원 급식관리 운영체계 개선 및 방학중 급식 운영체계 개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">100명 이상 신설 유치원, 영양사 퇴직 유치원 영양교사 배치</li>
											<li class="i_b_t7 mb5">소규모 유치원(50~99명) 지원을 위한 교육(지원)청 영양교사 배치</li>
											<li class="i_b_t7 mb5">시·도교육청 유치원 영양교육 전문직원 배치</li>
											<li class="i_b_t7 mb5">병설유치원 겸임수당, 간식 및 방학중 급식운영체계 개선</li>
										</ul>
									</li>
									<li class="mt5 mb5">(5) 영양교사 승진 규정 개선</li>
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">교감의 자격기준에 영양교사 포함하는『초·중등교육법』[별표1. 교장·교감 자격 기준] 개정<br>
												(※『초·중등교육법 일부개정법률안』발의)
											</li>
											<li class="i_b_t7 mb5">승진규정 개선을 위한 정책연구</li>
										</ul>
										
									<li class="mt5 mb5">(6) 시·도교육청 영양교육 전문직 배치기준 개선</li>
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">직무연속성을 통한 전문성 강화를 위해 “일반” 영양교육 전문직 배치</li>
											<li class="i_b_t7 mb5">시·도교육청별 2명 이상의 영양교육 전문직원 배치</li>
										</ul>
									<li class="mt5 mb5">(7) 영양교사 성과상여금 평가 개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">비교과교사 성과상여금 평가 시 교과·비교과 별도 평가 실시 전면 확대</li>
										</ul>
									</li>
									<li class="mt5 mb5">(8) 학교 산업안전보건 관련 업무 전반 업무기관 위탁 및 예산 확보 등</li>
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학교 현장 산업안전보건 관련 업무 전반 안전보건 전문기관에 위탁 및 예산 확보 등</li>
											<li class="i_b_t7 mb5">대체인력 산업안전보건교육 주기 완화</li>
										</ul>
									<li class="mt5 mb5">(9) 시·도교육청 영양·식생활교육 지원 시스템 구축
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학생 영양교육 활성화 조례 제정</li>
											<li class="i_b_t7 mb5">「영양교육체험관」설치·운영 법적 근거 마련</li>
										</ul>
									</li>
									<li class="mt5 mb5">(10) 영양교사 처우개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">지방행정교육기관 영양교사 교직수당 가산금 신설</li>
											<li class="i_b_t7 mt5">영양교사 교직수당 가산금 인상 지급</li>
										</ul>
									</li>
									<li class="mt5 mb5">(11) 영양교사 업무 정상화
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학교급식 관련 법령 및 지침 개정에 따른 의견 개진</li>
											<li class="i_b_t7 mb5">학교 우유 지원 개선(우유바우처 사업 전면 실시)</li>
										</ul>
									</li>
									<li class="mt5 mb5">(12) 유보통합에 따른 대응</li>
									<li class="mt5 mb5">(13) 법률 및 정책 자문
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학교급식 및 영양교사 관련 법령 및 제도 관련 자문 등</li>
										</ul>
									</li>
									<li class="mt5 mb5">(14) 학교급식 및 영양교사 관련 현황 조사</li>
								</ul>
							</li>
							<li class="pb20">3) 영양교사 교육활동 및 업무지원
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 학교 영양·식생활교육 활성화를 위한 기반 마련
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">영양·식생활교육 콘텐츠 개발 및 정보공유</li>
										</ul>
									</li>
									<li class="mt5 mb5">(2) 학교 영양·식생활교육 우수사례 발굴 및 보급
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">시·도 영양·식생활교육 우수자료 및 교구 전시, 발표(전국영양사학술대회)</li>
											<li class="i_b_t7 mt5">학교 영양·식생활교육 및 공모전, 심포지엄 개최</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="pb20">4) 연구 및 교육, 출판
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 영양교육 활성화 및 학교급식 발전을 위한 정책 연구</li>
									<li class="mt5 mb5">(2) 캘린더 제작 등</li>
								</ul>
							</li>
							<li class="pb20">5) 행사 개최, 홍보 및 기타
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 영양·식생활교육 캠페인 추진
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">시·도 단위 우수 대민행사 등 발굴·보급 등</li>
										</ul>
									</li>
									<li class="mt5 mb5">(2) 신규 영양교사 워크숍 개최</li>
									<li class="mt5 mb5">(3) 학생 맞춤형 학교급식박람회 개최</li>
									<li class="mt5 mb5">(4) 홍보
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">영양사신문, 각종 언론매체 등을 통한 기사 게재, KDA 영양교사 정보관 활성화</li>
											<li class="i_b_t7 mb5">(사)대한영양사협회 및 (사)대한영양사협회 전국영양교사회 SNS(카카오톡·유튜브 채널, 인스타   그램, 블로그 등)를 통한 홍보 활성화</li>
										</ul>
									</li>
									<li class="mt5 mb5">(5) 사회공헌사업
									    <ul class="text small pl15">
                                            <li class="i_b_t7 mt5 mb5">‘사랑의 밥차’ 후원금 지원 및 봉사</li>
                                        </ul>
									</li>
									<li class="mt5 mb5">(6) 관련 학회 및 단체 행사 참석 및 관련 위원회 활동</li>
								</ul>
							</li>

						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">학교영양사분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 분과위원회 개최</li>
									<li class="mt5 mb5">(2) 대의원총회 개최</li>
									<li class="mt5 mb5">(3) (사)대한영양사협회 전국학교영양사회 우수활동 회원 선정·포상</li>
									<li class="mt5 mb5">(4)『KDA 학교영양사 정보관』을 활용한 관련 정책 및 정보 제공</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 학교 영양사 처우개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학교영양사 식생활지도수당 지급 실현</li>
											<li class="i_b_t7 mb5">학교영양사 별도 기본급 체계 현행 유지</li>
										</ul>
									</li>
									<li class="mt5 mb5">(2) 학교 산업안전보건 관련 업무 전반 전문기관 위탁 및 예산 확보 등
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">산업안전보건 전문가에 의한 전문적 지원이 이루어지도록 하고 학교 산업안전보건 관련 업무 전반 전문기관 외부 위탁</li>
											<li class="i_b_t7 mb5">학교 음식물쓰레기 처리를 위한 안전보건협의체는 학교별이 아닌 교육청 차원에서 구성·운영</li>
											<li class="i_b_t7 mb5">일용근로자 채용 시 안전보건교육을 이수한 경우 동일 업무 수행 시 일정기간 동안 안전보건교육 이수한 것으로 인정</li>
										</ul>
									</li>
									<li class="mt5 mb5">(3) 학교급식 운영·관리제도 개선
										<ul class="text small pl15">
											<li class="i_b_t7 mt5 mb5">학교급식 관련 법령 및 지침 개정에 따른 의견 개진</li>
											<li class="i_b_t7 mb5">학교 우유 지원 개선(우유바우처 사업 전면 실시)</li>
										</ul>
									</li>
									<li class="mt5 mb5">(4) 학교급식 위생 점검 방법 개선
                                        <ul class="text small pl15">
                                            <li class="i_b_t7 mt5 mb5">사전예고제 전면 시행</li>
                                            <li class="i_b_t7 mb5">연 1회 점검(자체점검 1회) 및 점검기관 일원화 등 점검방법 개선</li>
                                        </ul>
                                    </li>
									<li class="mt5 mb5">(5) 현황조사 </li>
									<li class="mt5 mb5">(6) 관련 기관과의 정책간담회 개최 </li>
									<li class="mt5 mb5">(7) 법률 및 정책 자문 </li>
									<li class="mt5 mb5">(8) 학교급식 및 학교영양사 관련 정책 연구 및 현황 조사</li>
								</ul>
							</li>
							<li class="pb20">3) 연구 및 출판
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 학교영양사 처우 개선 등을 위한 정책 연구</li>
									<li class="mt5 mb5">(2) 캘린더 제작 등</li>
								</ul>
							</li>
							<li class="pb20">4) 행사 개최</li>
							<li class="pb20">5) 기타
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 학교영양사 역할 홍보 및 사회공헌사업 전개</li>
									<li class="mt5 mb5">(2) 관련 단체 행사 참석</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">보건복지시설분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 보건복지시설분과위원회 운영 - 보건소팀, 사회복지팀, 어린이집팀 등 운영</li>
									<li class="mt5 mb5">(2) 정책 홍보자료 메일링 서비스</li> 
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 보건소 영양사 정규직 배치 확대 및 처우 개선</li>
									<li class="mt5 mb5">(2) 보건소 방문건강관리사업 내 전담영양사 배치 확대</li>
									<li class="mt5 mb5">(3) 「노인장기요양보험법」상 방문영양 급여 신설</li>
									<li class="mt5 mb5">(4) 「의료·요양 등 지역 돌봄의 통합지원에 관한 법률」하위법령 제정 시, 영양사에 의한 영양서비스   제공 명시</li>
									<li class="mt5 mb5">(5) 「영유아보육법」상 어린이집 영양사 인건비 지원 근거 마련에 따른 예산 확보 및 「보육사업안내」상 인건비 지원 근거 신설</li>
									<li class="mt5 mb5">(6) 사회복지시설 영양사 임금수준 향상 등 처우개선을 위한 「사회복지시설 종사자 인건비 가이드라인」개선</li>
									<li class="mt5 mb5">(7) 관련 제도 및 법령 개선 건의</li>
								</ul>
							</li>
							<li class="pb20">3) 행사 개최
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 온라인 직무교육 개최</li>
									<li class="mt5 mb5">(2) 영양사 인식 개선 캠페인 진행</li>
									<li class="mt5 mb5">(3) 영양사신문 등 분야별 영양사 활동 홍보</li>
									<li class="mt5 mb5">(4) 교육 및 학술대회 의견 개진</li>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">건강상담분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 분과위원회 운영</li>
									<li class="mt5 mb5">(2) 홈페이지 동호회 운영
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">자료제공 및 정책 홍보 등</li>
										</ul>
									</li>
									<li class="mt5 mb5">(3) 회원등록 확대</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 관련법 및 제도 개정에 따른 건의
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">건강기능식품에 관한 법률 등</li>
										</ul>
									</li>
									<li class="mt5 mb5">(2) 개인 맞춤형 건강기능식품 제도 법제화에 따른 영양사 역할 확대</li>
									<li class="mt5 mb5">(3) 관련 위원회 활동</li>
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">식품의약품안전처 건강기능식품심의위원회 등</li>
										</ul>
								</ul>
							</li>
						</ol>
						<div class="box bgs r5 mt40 ml10 p10 pl20">
							<h6 class="title bold i_b_t6 ">어린이급식관리지원센터분과</h6>
						</div>
						<ol class="bold mt20 ml30">
							<li class="pb20">1) 조직 활성화
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 어린이·사회복지급식관리지원센터분과위원회 운영</li>
									<li class="mt5 mb5">(2) 정책 홍보자료 메일링, 문자, 카카오톡채널 소식 발송 서비스</li>
								</ul>
							</li>
							<li class="pb20">2) 정책 추진
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 어린이·사회복지급식관리지원센터 영양사 처우 개선
									    <ul class="ml10 mt5">
                                            <li class="i_b_t7 mb5">어린이·사회복지급식관리지원센터 영양사 면허수당 지급 실현, 명절수당 인상 등</li>
                                        </ul>
									</li>
									<li class="mt5 mb5">(2) 어린이·사회복지급식관리지원센터 영양사 1인당 관리시설 수 개선</li>
									<li class="mt5 mb5">(3) 노인·장애인 등 사회복지급식관리지원센터 개소 수 증가에 따른 제도 기반 마련</li>
										<ul class="ml10 mt5">
											<li class="i_b_t7 mb5">노인·장애인 등 취약계층에 대한 전문적 지원을 위한 센터 임상영양사 배치 확대</li>
											<li class="i_b_t7 mt5">노인·장애인의 실정에 맞는 맞춤형 급식관리를 위해 사회복지급식관리지원센터의 확충 및 인력확보</li>
											<li class="i_b_t7 mt5">- 노인·장애인의 업무 특성을 고려하여 사회복지급식관리지원센터 보조금 지원 규모 가중치 부여</li>
										</ul>
									<li class="mt5 mb5">(4) 관련 제도 및 법령 개선 건의</li>
								</ul>
							</li>
							<li class="pb20">3) 행사 개최
								<ul class="text small pl15">
									<li class="mt5 mb5">(1) 직무교육 등 워크숍 실시, 학술대회 의견 개진</li>
									<li class="mt5 mb5">(2) 센터 영양사 인식 개선 캠페인 진행</li>
									<li class="mt5 mb5">(3) 영양사신문 등 센터 영양사 활동 홍보</li>
								</ul>
							</li>
						</ol>
					</div>
				</div>
			</div>

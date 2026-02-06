<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
	System.out.println("xx :" +file_path);
%>
			<div class="s_menu">
				<div class="sm_title">
					<strong>Mypage</strong>
					<h2>마이페이지</h2>
				</div>
				<div class="sm_list">
					<ul class="sm_depth1">
						<li <% if( file_path.equals("kmp_member_info") 
								|| file_path.equals("kmp_license_modify")){%> class="on" <%}%>>
						<a href="/kmp_member_info.do">회원정보관리</a>
							<ul class="sm_depth2">
								<li><a href="/kmp_member_info.do" <% if(file_path.equals("kmp_member_info")){%> class="on" <%}%>>기본정보수정</a></li>
								<li><a href="/kmp_license_modify.do" <% if(file_path.equals("kmp_license_modify")){%> class="on" <%}%>>기타정보수정</a></li>
							</ul>
						</li>
						<li <% if(file_path.equals("kmp_deposit")){%> class="on" <%}%>><a href="kmp_deposit.do">기존회원 재가입/입금확인</a></li>
						<li <% if(file_path.equals("kmp_education") || file_path.equals("kmp_situation")
								|| file_path.equals("kmp_license") || file_path.equals("kmp_elderly")
								|| file_path.equals("kmp_sport") || file_path.equals("kmp_feed")
								|| file_path.equals("kmp_health") || file_path.equals("kmp_hygiene")
								|| file_path.equals("kmp_repair")){%> class="on" <%}%>><a href="/kmp_situation.do">MY 교육정보</a>
							<ul class="sm_depth2">
								<li><a href="/kmp_situation.do" <% if(file_path.equals("kmp_situation")){%> class="on" <%}%>>직무교육 현황</a></li>
								<li><a href="/kmp_license.do" <% if(file_path.equals("kmp_license")){%> class="on" <%}%>>전문교육과정 현황</a></li>
								<li><a href="/kmp_elderly.do" <% if(file_path.equals("kmp_elderly")){%> class="on" <%}%>>자격유지 교육</a></li>
								<%-- <li><a href="/kmp_sport.do" <% if(file_path.equals("kmp_sport")){%> class="on" <%}%>>스포츠유지 교육</a></li>
								<li><a href="/kmp_feed.do" <% if(file_path.equals("kmp_feed")){%> class="on" <%}%>>급식경영유지 교육</a></li>
								<li><a href="/kmp_health.do" <% if(file_path.equals("kmp_health")){%> class="on" <%}%>>산업보건유지 교육</a></li> --%>
								<li><a href="/kmp_hygiene.do" <% if(file_path.equals("kmp_hygiene")){%> class="on" <%}%>>식품위생교육</a></li>
								<li><a href="/kmp_repair.do" <% if(file_path.equals("kmp_repair")){%> class="on" <%}%>>보수교육</a></li>
							</ul>
						</li>
						<li <% if(file_path.equals("kmp_my_licence")){%> class="on" <%}%>><a href="/kmp_my_licence.do">MY자격증 정보</a></li>
						<li <% if(file_path.equals("kmp_benefit")){%> class="on" <%}%>><a href="/kmp_benefit.do">회원혜택</a></li>
						<li <% if(file_path.equals("kmp_payment")){%> class="on" <%}%>><a href="/kmp_payment.do?doc_code=0105">회비 납입내역</a></li>
						<li <% if(file_path.equals("kmp_magazine")){%> class="on" <%}%>><a href="/mypage/kmp_magazine.do">국민영양을 받지 못한 경우</a></li>
					</ul>
				</div>
			</div>

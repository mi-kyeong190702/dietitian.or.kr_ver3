<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String pageName = url.substring(url.lastIndexOf("/") + 1, url.length());	
	
	String file_path =  pageName.substring(0, pageName.length()-3);
%>	
	<div class="s_menu">
		<div class="sm_title">
			<strong>MEMBER</strong>
			<h2>회원가입</h2>
		</div>
		<div class="sm_list">
			<ul class="sm_depth1">
				<li <% if( (file_path.length() >= 7 ) && (file_path.substring(0,7).equals("km_join")) 
						|| file_path.equals("member_join_step3") || file_path.equals("member_join_insert") 
						|| file_path.equals("member_join_step4")) {%> class="on" <%}%>><a href="/member/km_join.do">신규회원가입</a></li>
				<li <% if( file_path.equals("km_deposit")
						|| file_path.equals("pre_receipt_card")) {%> class="on" <%}%>><a href="/member/km_deposit.do">기존회원 재가입/입금확인</a></li>
				<li <% if( file_path.equals("km_condition")) {%> class="on" <%}%><% if( file_path.equals("km_money")) {%> class="on" <%}%><% if( file_path.equals("km_period")) {%> class="on" <%}%>
					<% if( file_path.equals("km_benefit")) {%> class="on" <%}%><% if( file_path.equals("km_deposit_manner")) {%> class="on" <%}%>
					<% if( file_path.equals("km_account")) {%> class="on" <%}%>><a href="/member/km_condition.do">회원가입안내</a>
					<ul class="sm_depth2">
						<li><a href="/member/km_condition.do" <% if( file_path.equals("km_condition")) {%> class="on" <%}%>>회원의 자격</a></li>
						<li><a href="/member/km_money.do" <% if( file_path.equals("km_money")) {%> class="on" <%}%>>회비구분 및 금액</a></li>
						<li><a href="/member/km_period.do" <% if( file_path.equals("km_period")) {%> class="on" <%}%>>회원의 유효기간</a></li>
						<li><a href="/member/km_benefit.do" <% if( file_path.equals("km_benefit")) {%> class="on" <%}%>>회원혜택</a></li>
						<li><a href="/member/km_deposit_manner.do" <% if( file_path.equals("km_deposit_manner")) {%> class="on" <%}%>>입금방법</a></li>
						<li><a href="/member/km_account.do" <% if( file_path.equals("km_account")) {%> class="on" <%}%>>입금계좌 및 문의처</a></li>
					</ul>
				</li>
				<li <% if( file_path.equals("km_id_pw")) {%> class="on" <%}%>><a href="/member/km_id_pw.do">아이디/비밀번호 찾기</a></li>
				<li <% if( file_path.equals("km_member_period")) {%> class="on" <%}%>><a href="/member/km_member_period.do">회원 유효기간 확인</a></li>
				<li <% if( file_path.equals("km_member_download")) {%> class="on" <%}%>><a href="/member/km_member_download.do">회원 가입공문 다운로드</a></li>
				<li <% if( file_path.equals("km_faq")) {%> class="on" <%}%>><a href="/member/faq/faq_list.do">회원가입 FAQ</a></li>
			</ul>
		</div>
	</div>

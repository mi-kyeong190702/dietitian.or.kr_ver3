			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<%@ page import="kda.SessionInfo" %>
			<% 
				if( !session.getAttribute(SessionInfo.LOGIN).toString().equals("Y") ) {
					out.println("<script>");
					out.println("alert('로그인이 필요한 페이지입니다.')");
					out.println("location.href='/login/kl_login_nor.do'");
					out.println("</script>");
				} 
			%>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">국민영양</mark>을 받지 못한 경우</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/kmp_member_info.do">마이페이지</a></li>
							<li><a href="/mypage/kmp_magazine.do" class="cm">국민영양을 받지 못한 경우</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t2 bgs mt20 p20 text s1">
						<div class="area">
							<h5 class="title i_b_t6 bold s1"><mark class="cm">국민영양</mark>을 받지 못한 경우</h5>
							<div class="box t1 r5 mt10 p10">
								<div class="area h300 text small">
									<p>우리 협회에서는 회원 대상으로 기관지 「국민영양」 이 연 10회 발행되고 있습니다.</p>
									<p>(학술지는 온라인 4회 발행)</p><br />
									<p>회원정보(자택, 근무처 주소) 업데이트 미흡으로 인한 우편물 사고(타인 습득, 반송함에 투함 등)로</p>
									<p>국민영양을 수령하지 못하신 경우 아래의 방법으로 문의하여 주시면 회신드리겠습니다.</p><br />
									<ul class="p10">
										<li><span class="bold">「국민영양」 발송 및 수령일</span>
											<ul>
												<li class="i_box_t1">발송 : 매월 3일경 (단, 1·2월, 7·8월호는 합본으로 1월, 7월에 발송)</li>
												<li class="i_box_t1">수령 : 매월 10~15일경</li>
											</ul>
										</li>
										<li><span class="bold mt10">국민영양 미수령 신청방법</span>
											<ul>
												<li class="i_box_t1">회원정보(자택 및 근무처 주소) 확인 후 신청(마이페이지→회원정보관리→기본정보수정)</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<p class="text s1 center pb10 ">회원정보(자택 및 근무처 정보)를 확인 하셨습니까?</p>
						<ul>
							<li><a href="/kmp_magazine_y.do" class="btn big t1">예</a></li>
							<li><a href="/kmp_member_info.do" class="btn big">아니오</a></li>
						</ul>
					</div>
				</div>
			</div>

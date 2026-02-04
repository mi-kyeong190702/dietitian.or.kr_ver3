<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
			<c:when test="${null eq loginVo}">
				<script type="text/javascript"> 
					alert("로그인 후 이용해주세요.");
					location.href="/work/research/login/kl_login.do";
				</script>
			</c:when>
			<c:otherwise>
			
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">면허신고</mark> 수정</h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/research_index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/research/mypage/km_report.do">마이페이지</a></li>
							<li><a href="/work/research/mypage/km_update.do" class="cm">면허신고 수정</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text big"><mark class="bold cm"><font color = "red">선생님께서는 ${ReturnStateStr}도 </br>보수교육 이수, 면제, 미대상자 확인이 되지 않습니다.</font></mark></p></br>
							<p class="mt30 text middle" ><mark class="bold cm" style="font-size: 20px">영양사 면허신고는 최근 3년 동안의 보수교육 이수여부를 확인합니다.</mark></br>
																			      예)2021년도 면허신고는 2019년도의 보수교육 이수여부를 확인합니다.
							</p>
							<p class="mt30 text middle"><mark class="bold cm">단, 2015년도 5월24일 이전 영양사 면허발급자 중 <font color = "red">최초신고</font>일 경우</br>
																			  2013년도 보수교육 이수여부부터 확인합니다.</mark>
							</p>

								<p class="mt10 text middle">아래의 내용을 확인 하신 후 다시 면허 신고해 주시기를 부탁 드립니다.</p></br></br>
								
								<p class="mt10 text middle"><mark class="bold">1. 보수교육 미이수자</mark> : 보수교육센터에서 <mark class="bold">보수교육 미이수자 추가교육</mark>을 받은 후 면허신고</p>
						
								<p class="mt10 text middle"><mark class="bold">2. 보수교육 면제 대상자이나 미신고자</mark> : 보수교육센터에서 해당년도 <mark class="bold">보수교육 면제</mark></br>신청 후 면허신고</p>
							
							<div class="area mt30">
								<a href="http://www.kdaedu.or.kr/" target="_blank" class="btn big t1" title="새창으로 열기">보수교육센터 바로가기</a>
							</div>
							<br/><br/>
								<p class="mt10 text middle"><mark class="bold">3. 보수교육 미대상자</mark> : 미취업이나 영양사 보수교육을 받지 않아도 되는 직종에 근무하여 대상자가 아닌 경우 해당연도 <mark class="bold">보수교육 미대상자</mark> 신청 후 면허신고</p>
							
							<div class="area mt30">
								<a href="/work/research/recipient/recipient.do" class="btn big t1" >보수교육 미대상자 등록 바로가기</a>
							</div>
						</div>
					</div>

					<!-- 보수교육 정보가 만족하지 않을 경우 
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text big"><mark class="bold cm"><font color = "red">2013 또는 2015년도 보수교육 이수, 면제, 미대상자<br> 확인이 되지 않습니다.</font> </mark><p>
							<p class="text big"><mark class="bold cm">2016년도 영양사 면허신고는 2013, 2015년도 보수교육<br> 여부를 확인합니다.</mark><p>
							<p class="mt30 text middle"><mark class="bold cm"><font color = "red">(2014년 1월 1일 이후 면허 발급자는 2013년도 보수교육 미대상자를 신청해야 합니다.)</font></mark><p>
							<p class="mt30 text middle">아래의 내용을 확인 하신 후 다시 면허 신고해 주시기를 부탁 드립니다.</p>
							<br/>
								<p class="mt10 text middle">1. 2013년 또는 2015년 보수교육 미이수자 : 보수교육센터에서 추가 보수 교육을 받은 후 면허신고</p>
						
								<p class="mt10 text middle">2. 2013년 또는 2015년 보수교육 면제 대상자이나 미신고자 : 보수교육센터에서 해당년도 보수교육 면제신청</p>
							
							<div class="area mt30">
								<a href="http://www.kdaedu.or.kr/" target="_blank" class="btn big t1" title="새창으로 열기">보수교육센터 바로가기</a>
							</div>
							<br/><br/>
								<p class="mt10 text middle">3. 2013년 또는 2015년 보수교육 미대상자 : 미취업이나 영양사 보수교육을 받지 않아도 되는 직종에 근무하여 대상자가 아닌 경우 해당연도 보수교육 미대상자 신청 후 면허신고</p>
							
							<div class="area mt30">
								<a href="javascript:noti();" class="btn big t1" >보수교육 미대상자 등록 바로가기</a>
							</div>
						</div>
					</div>
					-->
					
				</div>
			</div>	
			</c:otherwise>
</c:choose>
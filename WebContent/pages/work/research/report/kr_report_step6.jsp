<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${finish_yn == '0'}">
		<div class="box t2 p60 pt40 pb40 center">
			<div class="area">
				<p class="text bbig"><strong class="bold cm" >${yy}년도 영양사</strong><font color="red" class="bold"> 면허신고</font><strong class="bold cm" >가</strong><font color="red" class="bold"> 저장되었습니다.</font></p>
				</br></br>
			    <p class="mt30 text middle" style="font-size: 20px"><mark class="bold">면허신고 수정은 마이페이지 > </mark><font class="bold" color="red" >면허신고 수정</font><mark class="bold">에서 가능합니다.<mark class="bold" style="font-size: 20px"></p>
			    </br></br>
				<p class="mt30 text middle"><u><a href="/work/research/mypage/km_update.do"><mark class="bold" style="font-size: 20px">면허신고 수정 바로가기!</mark></a></u>
				</p>
			</div>
		</div>
	</c:when>
	<c:when test="${finish_yn == '1'}">
		<div class="box t2 p60 pt40 pb40 center">
			<div class="area">
				<p class="text bbig"><strong class="bold cm" >${yy}년도 영양사</strong><font color="red" class="bold"> 면허신고 접수</font><strong class="bold cm" >가</strong></br><font color="red" class="bold"> 완료되었습니다.</font></p>
				</br>
				<p class="mt30 text middle"><mark class="bold">제출하신 면허신고서 검토에는 최대 7일이 소요되며,</mark></p>
			    <p class="mt30 text middle" style="font-size: 20px"><mark class="bold">신고결과는 마이페이지 > </mark><font class="bold" color="red" >면허신고 현황</font><mark class="bold">에서 확인 가능합니다.<mark class="bold" style="font-size: 20px"></p>
			    </br></br>
				<p class="mt30 text middle"><u><a href="/work/research/mypage/km_report.do"><mark class="bold" style="font-size: 20px">면허신고 현황 바로가기!</mark></a></u>
				</p>
			</div>
		</div>
	</c:when>
	<c:when test="${finish_yn == '2'}">
		<c:choose>
			<c:when test="${ReturnStateStr == '0'}">
				<div class="box t2 p60 pt40 pb40 center">
					<div class="area">
						<p class="text bbig"><strong class="bold cm" >${yy}년도 영양사</strong><font color="red" class="bold"> 면허신고</font><strong class="bold cm" >가</strong><font color="red" class="bold"> 완료되었습니다.</font></p>
						<p class="mt30 text middle" style="font-size: 20px">선생님께서는 <mark class="bold" style="font-size: 20px">영양사 면허신고</mark>를 <mark class="bold" style="font-size: 20px">모두 완료</mark>하였습니다.</br>
						<mark class="bold" style="font-size: 20px">확인 및 확인서 출력</mark>은 마이페이지 > <mark class="bold" style="font-size: 20px">면허신고 현황</mark>에서 가능합니다.
						</p> </br>
						<p class="mt30 text middle"><mark class="bold" style="font-size: 20px">${pers_name} 선생님의 차기 면허신고 연도는 </mark></p></br>
					    <p class="text bbig"><font class="bold" color="red">${yy+3}년 1월 ~ 12월 </font>까지 입니다.</p></br>
						<p class="mt30 text middle"><u><a href="/work/research/mypage/km_report.do"><mark class="bold" style="font-size: 20px">면허신고 현황 바로가기!</mark></a></u>
						</p>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="box t2 p60 pt40 pb40 center">
					<div class="area">
						<p class="text bbig"><strong class="bold cm" >${yy}년도 영양사</strong><font color="red" class="bold"> 면허신고(실태신고) 대상이 아닙니다.</font></p>
						<p class="mt30 text middle"><mark class="bold" style="font-size: 20px">선생님께서는 ${yy}년도 영양사 면허신고 대상자가 아닙니다.</mark></p> </br>
						<p class="text bbig">
							<mark class="bold" >${pers_name} 선생님의 면허신고 연도는 </br>
						    <font color="red">${ReturnStateStr}년 1월 ~ 12월 까지 </font>입니다.
						    </mark>
						</p>
						<p class="mt30 text middle">*영양사 면허신고는 최초신고 후 3년에 한번씩 하시기 바랍니다.</br>
													(2017년도에 면허신고를 하셨을 경우 다음 면허신고는 2020년도 입니다.)</br>
													</br>
													*2015년 5월 24일 이후 영양사 면허 발급자는 면허발급연도 + 3년이 되는</br>
													  해 1월 ~ 12월 까지 면허신고를 하시기 바랍니다.</br>
													(2018년도에 면허를 발급받으신 경우 최초 면허신고는 2021년도 입니다.)</br>
						</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:when test="${finish_yn == '4'}">
		<div class="box t2 p60 pt40 pb40 center">
			<div class="area">
				<p class="text bbig"><strong class="bold cm" >${yy}년도 영양사</strong><font color="red" class="bold"> 면허신고</font><strong class="bold cm" >가</strong><font color="red" class="bold"> 회송되었습니다.</font></p>
				</br></br>
			    <p class="mt30 text middle" style="font-size: 20px"><mark class="bold">면허신고 수정은 마이페이지 > </mark><font class="bold" color="red" >면허신고 수정</font><mark class="bold">에서 가능합니다.<mark class="bold" style="font-size: 20px"></p>
			    </br></br>
				<p class="mt30 text middle"><u><a href="/work/research/mypage/km_update.do"><mark class="bold" style="font-size: 20px">면허신고 수정 바로가기!</mark></a></u>
				</p>
			</div>
		</div>
	</c:when>
	
</c:choose>
		
		
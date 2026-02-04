<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<c:choose>
				<c:when test="${finish_yn=='0' }">
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고</mark>가 <strong class="bold cm">저장</strong>되었습니다.</p>
							<p class="mt30 text middle">작성중인 면허신고서는 『마이페이지』 면허신고현황에서 수정 및 확인 가능합니다.</p>
						</div>
					</div>
				</c:when>
				<c:when test="${finish_yn=='1' }">	
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고</mark>가 <strong class="bold cm">접수</strong>되었습니다.</p>
							<p class="mt30 text middle">신고서 검토에는 7일이 소요되며, 신고결과는 반드시 『마이페이지』 면허신고현황에서<br />
							확인하셔야 합니다.</p>
						</div>
					</div>
				</c:when>
				<c:when test="${finish_yn=='9' }">
					<div class="box t2 p60 pt40 pb40 center">
						<div class="area">
							<p class="text bbig"><mark class="mark">면허신고</mark>가 <strong class="bold cm">취소</strong>되었습니다.</p>
							<p class="mt30 text middle">처음부터 다시 시작하셔야 합니다.</p>
						</div>
					</div>
				</c:when>
			</c:choose>
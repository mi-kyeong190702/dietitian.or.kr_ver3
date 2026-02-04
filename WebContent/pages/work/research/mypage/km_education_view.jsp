<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

					<table class="table t1 text small s1 ca center">
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="bold cm">이름</th>
								<th scope="col" class="bold cm">면허번호</th>
								<th scope="col" class="bold cm">교육년도</th>
								<th scope="col" class="bold cm">현황</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${dataCount>0 }">
								<c:forEach var="list" items="${dataRow}" varStatus="status">
									<tr>
										<c:if test="${status.index==0}">		
											<td rowspan="${dataCount }">${list.pers_name }</td>
											<td rowspan="${dataCount }">${list.lic_no}</td>
										</c:if>
										<td>${list.cs_con_education }</td>
										<td>
											<c:if test="${list.ar_state=='0'}">이수</c:if>
											<c:if test="${list.ar_state=='2'}">면제</c:if>
											<c:if test="${list.ar_state=='4'}">미대상</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
									<tr>
										<td colspan="4">보수교육 정보가 없습니다.</td>
									</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="box t1 bgs mt10 p10 pl15 text ssmall">
						<div class="area">
							<h4>면허신고시 보수교육 이수, 면제는 자동으로 확인되며, 별도로 보수교육 이수증이나 보수교육 면제확인서가 필요하신 경우 보수교육센터에서 출력이 가능합니다.</h4>						
						</div>
					</div>
					<div class="btn_wrap mt30">
						<ul>
							<li><a href="http://www.kdaedu.or.kr" target="_blank" class="btn big wide t1" title="새창으로 열기">보수교육센터 바로가기</a></li>
						</ul>
					</div>
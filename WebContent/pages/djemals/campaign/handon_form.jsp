<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<table class="table t1 text small center mt10">
				<colgroup>
					<col width="150">
					<col width="*">
				</colgroup>
				<thead>
				<tr>
					<th colspan="2"scope="col" class="bold cm">${handon.bbs_subject }</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="bold">작성자</td>
					<td class="left">${handon.bbs_name }</td>
				</tr>
				<tr>
					<td class="bold">등록일</td>
					<td class="left">${handon.bbs_reg_date_dt }</td>
				</tr>
				<tr>
					<td class="bold">조회</td>
					<td class="left">${handon.bbs_view }</td>
				</tr>
				<tr>
					<td class="bold">내용</td>
					<td><span>${handon.bbs_contents }</span></td>
				</tr>
				<c:if test="${handon.bbs_file_size >0 }">
				<tr>
					<td class="bold">첨부파일 1</td>
					<td class="left">${handon.bbs_file_name } (${handon.bbs_file_size } KByte)</td>
				</tr>
				</c:if>
				<c:if test="${handon.bbs_file_size2 >0 }">
				<tr>
					<td class="bold">첨부파일 1</td>
					<td class="left">${handon.bbs_file_name2 } (${handon.bbs_file_size2 } KByte)</td>
				</tr>
				</c:if>
				<c:if test="${handon.bbs_file_size3 >0 }">
				<tr>
					<td class="bold">첨부파일 1</td>
					<td class="left">${handon.bbs_file_name3 } (${handon.bbs_file_size3 } KByte)</td>
				</tr>
				</c:if>
				<c:if test="${handon.bbs_file_size4 >0 }">
				<tr>
					<td class="bold">첨부파일 1</td>
					<td class="left">${handon.bbs_file_name4 } (${handon.bbs_file_size4 } KByte)</td>
				</tr>
				</c:if>
				<c:if test="${handon.bbs_file_size5 >0 }">
				<tr>
					<td class="bold">첨부파일 1</td>
					<td class="left">${handon.bbs_file_name5 } (${handon.bbs_file_size5 } KByte)</td>
				</tr>
				</c:if>
				</tbody>
			</table>

			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="${url }" class="btn big">목록</a></li>
				</ul>
			</div>
			

		</div>
	</div>
</div>

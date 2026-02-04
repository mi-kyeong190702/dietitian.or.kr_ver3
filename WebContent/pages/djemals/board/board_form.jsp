<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function f_action()	{
	
	document.frmBoard.submit();
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<form:form name="frmBoard" modelAttribute="board" method="post" action="boardAction.do">
		<form:hidden path="crud" />
		<form:hidden path="bs_code" />
		<div class="cp_contents">
			<div class="form line bt bw2 bcm">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_name" class="ff_title"><strong>이름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:input path="bs_name"  class="input t1 w200" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>의견글</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<input type="checkbox" class="mr5" name="bs_Comments" id="bs_Comments" value="1"  <c:if test="${board.bs_Comments==1 }">checked="checked"</c:if> />
								<label for="bs_Comments">사용</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>자료실</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<input type="checkbox" class="mr5" name="bs_pds" id="bs_pds" value="1"  <c:if test="${board.bs_pds==1 }">checked="checked"</c:if> />
								<label for="bs_pds">사용</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_admin" class="ff_title"><strong>관리자지정</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:textarea path="bs_admin"  class="textarea t1" />
							</div>
							<div class="area">
								<p class="text cp">엔터로 구분해주세요.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<div class="ff_title"><strong>카테고리사용</strong></div>
						<div class="ff_wrap ml120 text">
							<div class="area">
								<input type="checkbox" class="mr5" name="bs_Category" id="bs_Category" value="1"  <c:if test="${board.bs_Category==1 }">checked="checked"</c:if> />
								<label for="bs_Category">사용</label>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_CategoryType" class="ff_title"><strong>카테고리분류</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:textarea path="bs_CategoryType" class="textarea t1" />
							</div>
							<div class="area">
								<p class="text cp">엔터로 구분해주세요.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_ListLevel" class="ff_title"><strong>목록보기 권한</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_ListLevel" class="select t2 fl w200">
									<form:options items="${levelName}"/>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_ViewLevel" class="ff_title"><strong>글보기 권한</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_ViewLevel" class="select t2 fl w200">
									<form:options items="${levelName}"/>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_WriteLevel" class="ff_title"><strong>글쓰기 권한</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_WriteLevel" class="select t2 fl w200">
									<form:options items="${levelName}"/>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_sTagLevel" class="ff_title"><strong>제목에 태그권한</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_sTagLevel" class="select t2 fl w200">
									<form:options items="${levelName}"/>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_cTagLevel" class="ff_title"><strong>내용에 태그권한</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_cTagLevel" class="select t2 fl w200">
									<form:options items="${levelName}" />
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_SubMenuIndex" class="ff_title"><strong>서브 메뉴 인덱스</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:select path="bs_SubMenuIndex" class="select t2 fl w200">
									<form:options items="${menuIndex}"/>
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_TopHtml" class="ff_title"><strong>Top html</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:textarea path="bs_TopHtml" class="textarea t1 h250" />
							</div>
						</div>
					</div>
				</div>
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="bs_bottomHtml" class="ff_title"><strong>Bottom html <br/>* 작동안함</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<form:textarea path="bs_bottomHtml" class="textarea t1 h250" disabled="true"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="boardList.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_action();" class="btn big t1">저장</a></li>
				</ul>
			</div>
		</div>

	</form:form>
	</div>
</div>

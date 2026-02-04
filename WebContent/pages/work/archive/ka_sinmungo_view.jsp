<%@page import="kda.SessionInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kda.board.data.PAPERBOARDSETTINGS" %>

<style type="text/css">
	strong, b {font-weight:bold;}
</style>
<script>
</script>
<c:set value="${list}" var="list"/>
<c:forEach var="list" items="${list}" >
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영</mark>양사신문고</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/archive/ka_archive.do">KDA 회원자료실</a></li>
				<li><a href="/work/archive/ka_sinmungo_check.do" class="cm">영양사신문고</a></li>
			</ul>
		</div>
	</div>
	<c:if test="${sessionScope.user_level == 1 }">
	<div style="height: auto; display: inline-block; vertical-align: middle; padding-top: 30px; text-align: left; width: 100%">
	<div class="box t3 text small">
		<ul class="area">
			<li class="line bb bgs">
				<div class="p10 pl15">
					<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${list.board_subject}</h4>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">등록일</strong>
					<span>${list.board_reg_date}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">작성자</strong>
					<span>${list.board_user_id}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">문의유형</strong>
					<span>${list.board_dept}</span>
				</div>
			</li>
			<li class="fl w33p bgw" style="width: 475px;">
			<form id="sendMail" name="sendMail" action="/ka_send_mail.do">
				<div class="p10 pl15" style="width: 450px;">
					<strong class="ib w70 bold cm">부서지정</strong>
					<span style="width: 250px;">
						<input type="checkbox" id="chbox1" name="chbox1" value="조직홍보국">조직홍보국
						<input type="checkbox" id="chbox2" name="chbox2" value="교육국">교육국
						<input type="checkbox" id="chbox3" name="chbox3" value="정책국">정책국
						<input type="checkbox" id="chbox4" name="chbox4" value="사업국">사업국
					</span>
					<input type="hidden" id="idx" name="idx" value="${list.idx }">
					<input type="hidden" id="board_user_id" name="board_user_id" value="${list.board_user_id }">
					<input type="hidden" id="board_subject" name="board_subject" value="${list.board_subject }">
					<span><input type="submit" class="btn t1" value="메일 전송"></span>
				</div>
			</form>
			</li>
			<li class="fl w33p bgw" style="width: 250px;">
			<form id="ka_handling" name="ka_handling" action="/ka_handling.do">
				<div class="p10 pl15" style="width: 250px;">
					<strong class="ib w70 bold cm">처리현황</strong>
					<span >
						<select class="input t1 w100" name="board_handling" id="board_handling">
							<option value="${list.board_handling }">${list.board_handling }</option>
							<option value="접수">접수</option>
							<option value="검토,협의">검토,협의</option>
							<option value="답변완료">답변완료</option>
						</select>
					</span>
					<input type="hidden" id="idx" name="idx" value="${list.idx }">
					<input type="hidden" id="board_user_id" name="board_user_id" value="${list.board_user_id }">
					<span><input type="submit" class="btn t1" value="변경"></span>
				</div>
			</form>
			</li>
			<li class="fl w33p bgw" style="width: 250px;">
			<form id="ka_dept_com" name="ka_dept_com" action="ka_dept_com.do">
				<div class="p10 pl15" style="width: 250px;">
					<strong class="ib w70 bold cm">담당부서</strong>
					<span >
						<select class="input t1 w100" name="board_dept_com" id="board_dept_com">
							<option value="${list.board_dept_com }">${list.board_dept_com }</option>
							<option value="조직홍보국">조직홍보국</option>
							<option value="교육국">교육국</option>
							<option value="정책국">정책국</option>
							<option value="사업국">사업국</option>
						</select>
					</span>
					<input type="hidden" id="idx" name="idx" value="${list.idx }">
					<input type="hidden" id="board_user_id" name="board_user_id" value="${list.board_user_id }">
					<span><input type="submit" class="btn t1" value="부서지정"></span>
				</div>
			</form>
			</li>
			<li class="fl w33p bgw" style="margin-left: 15px;">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">메일 시간</strong>
					<span>${list.board_mail}</span>
				</div>
			</li>
		</ul>
	</div>
	<c:set value="${lists}" var="lists"/>
	<c:forEach var="lists" items="${lists}" >
	<div class="box t3 text small">
		<ul class="area">
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">회원 이름</strong>
					<span>${lists.pers_id}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">성별</strong>
					<span>
						<c:choose>
							<c:when test="${lists.code_sex==1 }">
								남자
							</c:when>
							<c:otherwise>
								여자
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">면허번호</strong>
					<span>${lists.lic_no}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">E-mail</strong>
					<span>${lists.email}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">휴대폰</strong>
					<span>${lists.pers_hp}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">근무처명</strong>
					<span>${lists.company_name}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">소속 지부</strong>
					<span>${lists.code_bran}</span>
				</div>
			</li>
		</ul>
	</div>
	</c:forEach>

	<div id="print_contents" class="line bb p30 text">
		<h4 class="ti"></h4>
			<div name="bbs_contents" style="width: 682; height: auto; overflow:auto;" scrolling="auto" onload="javascript:setIFrameHeight(this)">${list.bbs_contents }</div>
		<br>
	</div>
	<div class=" line bb bw2 text small">
	<form id="filedownload" name="filedownload">
		<div class="pr">
			<h4 class="pa l15 t10 bold cm">첨부파일</h4>
			<ul class="ml100">			
					<c:if test="${list.board_file1_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file1_url}">
								${list.board_file1_name } 
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file2_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file2_url}">
								${list.board_file2_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file3_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file3_url}">
								${list.board_file3_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file4_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file4_url}">
								${list.board_file4_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file5_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file5_url}">
								${list.board_file5_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file1_name eq null && list.board_file2_name eq null && list.board_file3_name eq null && list.board_file4_name eq null && list.board_file5_name eq null }">
						<li class="p10 pl15 link bold line dot bb">					
							첨부파일이 없습니다.
						</li>
					</c:if>
			</ul>
		</div>
	</form>
	</div>
	</div>
	</c:if>
	<c:if test="${sessionScope.user_level != 1 }">
	<div style="height: auto; display: inline-block; vertical-align: middle; padding-top: 30px; text-align: left; width: 100%">
	<div class="box t3 text small">
		<ul class="area">
			<li class="line bb bgs">
				<div class="p10 pl15">
					<h4 class="title i_b_t6"><strong class="ti">제목 </strong>${list.board_subject}</h4>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">등록일</strong>
					<span>${list.board_reg_date}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">작성자</strong>
					<span>${list.board_user_id}</span>
				</div>
			</li>
			<li class="fl w33p bgw">
				<div class="p10 pl15">
					<strong class="ib w70 bold cm">문의유형</strong>
					<span>${list.board_dept}</span>
				</div>
			</li>
		</ul>
	</div>

	<div id="print_contents" class="line bb p30 text">
		<h4 class="ti"></h4>
			<div name="bbs_contents" style="width: 682; height: auto; overflow:auto;" scrolling="auto" onload="javascript:setIFrameHeight(this)">${list.bbs_contents }</div>
		<br>
	</div>
	<div class=" line bb bw2 text small">
	<form id="filedownload" name="filedownload">
		<div class="pr">
			<h4 class="pa l15 t10 bold cm">첨부파일</h4>
			<ul class="ml100">			
					<c:if test="${list.board_file1_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file1_url}">
								${list.board_file1_name } 
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file2_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file2_url}">
								${list.board_file2_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file3_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file3_url}">
								${list.board_file3_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file4_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file4_url}">
								${list.board_file4_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file5_name ne null }">
						<li class="p10 pl15 link bold line dot bb">					
							<a href="/ka_sinmungo_download.do?board_file_url=${list.board_file5_url}">
								${list.board_file5_name }
							</a>
						</li>
					</c:if>
					<c:if test="${list.board_file1_name eq null && list.board_file2_name eq null && list.board_file3_name eq null && list.board_file4_name eq null && list.board_file5_name eq null }">
						<li class="p10 pl15 link bold line dot bb">					
							첨부파일이 없습니다.
						</li>
					</c:if>
			</ul>
		</div>
	</form>
	</div>
	</div>
	</c:if>
	<form id="ka_sinmungo_comment" name="ka_sinmungo_comment" action="ka_sinmungo_comment.do">
	<div class="line bb bw2 text small">
	<c:if test="${sessionScope.user_level==1 }">
		<c:if test="${list.comment_content eq null }">
		<div class="p10 pl15 pr15">
			<label for="textarea1" class="bold cm" style="text-align: left"><h4>의견쓰기</h4></label>
			<div class="area pr mt10">
				<div class="mr95">
					<input type="hidden" id="idx" name="idx" value="${list.idx }">
					<input type="hidden" id="comment_name" name="comment_name" value="관리자">
					<input type="hidden" id="board_user_id" name="board_user_id" value="${list.board_user_id }">
					<textarea id="comment_content" name="comment_content" class="textarea t1 text ssmall"></textarea>
				</div>
				<button type="submit" class="pa r0 t0 btn comment">등록</button>
			</div>
		</div>
		</c:if>
		</c:if>
		<div class="line bt">
			<ul>
				<c:choose>
					<c:when test="${list.comment_name ne null }">
							<li>
								<div class="pr p15 line dot bb" style="text-align: left;">
									<span class="pa l15 t15 bold">${list.comment_name}</span>
									<span class="ssmall ca" style="word-break:break-all; margin-left: 100px; margin-right: 100px;">${ f:replace(list.comment_content, lf, "<br/>")}</span>
									<span class="pa r15 t15">
										${list.comment_reg_date}									
									</span>								
								</div>
							</li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	
	</form>
	<div class="btn_wrap mt20">
	<ul class="fl">
		<li><a href="ka_sinmungo_list.do" class="btn big">목록</a></li>
	</ul>
	
	<ul class="fr">
		<c:choose>
			<c:when test="${sessionScope.user_level==1 }">
				<li><a href="delete_comment.do?idx=${list.idx }&user_id=${list.board_user_id }" class="btn big t2">답글삭제</a></li>
				<li><a href="ka_sinmungo_paper_board_del.do?idx=${list.idx }" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn big t1">삭제</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/work/archive/ka_sinmungo_paper_board_update.do?idx=${list.idx }" class="btn big t2">수정</a></li>
				<li><a href="ka_sinmungo_paper_board_del.do?idx=${list.idx }" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn big t1">삭제</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</div>
</c:forEach>

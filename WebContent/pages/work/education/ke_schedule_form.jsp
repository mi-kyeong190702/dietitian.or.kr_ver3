<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script src="/js/dietitan_calendar.js"></script>
<script type="text/javascript">
function f_Send() {
	var name		= document.frmSch.ilname;
	var subject		= document.frmSch.ilsubject;
	var contents	= document.frmSch.ilcontents;
	
	if(name.value.length == 0) {
		alert("이름을 꼭 써주셔야 합니다.");
		name.focus();
		return;
	}
	
	if(subject.value.length == 0) {
		alert("제목을 꼭 써주셔야 합니다.");
		subject.focus();
		return;
	}
	
	if(contents.value.length == 0) {
		alert("내용을 꼭 써주셔야 합니다.");
		contents.focus();
		return;
	}
	
	document.frmSch.action = "ke_schedule_form_action.do";
	document.frmSch.submit();
}
</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">평점인정</mark> 교육일정</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/education/ke_menu.do">KDA 교육</a></li>
				<li><a href="/work/education/ke_about.do">전문영양사 코너</a></li>
				<li><a href="/work/education/ke_schedule.do" class="cm">평점인정 교육일정</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">					

		
				<h4 class="title bold t2 cm s1 i_b_t2 mt30 mb10">평점인정교육안내</h4>
				<div class="form line bt bcm bw2">
					<form:form name="frmSch" method="post" modelAttribute="schedule">
						<form:hidden path="ilindex" />
							<fieldset>
							<legend><span class="ti">평점인정교육안내</span></legend>
							<div class="f_wrap line bb p8">
								<div class="f_field div1">
										<label for="inputid1" class="ff_title i_b"><strong>날짜</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:select path="ilyear"  class="select t2 fl w100">
												<c:forEach begin="2008" end="2020" step="1" var="year">
													<form:option value="${year}">${year}</form:option>
												</c:forEach>
												</form:select>
												
												
												<form:select path="ilmonth" class="select t2 fl w100 ml10">
												<c:forEach begin="1" end="12" step="1" var="month">
													<form:option value="${month}">${month}</form:option>
												</c:forEach>
												</form:select>
												<p class="fl text s1 ml10 mr20">월</p>
							
												<form:select path="ilday" class="select t2 fl w100 ml10">
												<c:forEach begin="1" end="31" step="1" var="day">
													<form:option value="${day}">${day}</form:option>
												</c:forEach>
												</form:select>
												<p class="fl text s1 ml10 mr20">일</p>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="ilname" class="ff_title i_b"><strong>작성자</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="ilname" maxlength="25" class="input t1 w200" value="담당자" />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="ilsubject" class="ff_title i_b"><strong>제목</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="ilsubject" maxlength="50" class="input t1" />
												
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="ilsponsor" class="ff_title i_b"><strong>주최</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="ilsponsor" maxlength="50" class="input t1" />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="ileduname" class="ff_title i_b"><strong>교육명</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="ileduname" class="input t1"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="ilcontents" class="ff_title i_b"><strong>내용</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<label for="inputid19" class="ti">내용입력</label>
												<form:textarea path="ilcontents" class="textarea t1 h350" />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="illocation" class="ff_title i_b"><strong>장소</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="illocation" class="input t1"  />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="iltime" class="ff_title i_b"><strong>시간</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="iltime"  class="input t1" />
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="iltel" class="ff_title i_b"><strong>문의처</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="iltel"  class="input t1" />
											</div>
										</div>
									</div>
								</div>
									<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<div class="ff_title i_b"><strong>평점종류</strong></div>
										<div class="ff_wrap ml120 text">
											<div class="area">
												<form:radiobutton path="ilrecognition_sub" class="mr5" value="1" /> <label for="ilrecognition_sub1" class="mr20">본회</label>
												<form:radiobutton path="ilrecognition_sub" class="mr5" value="2" /> <label for="ilrecognition_sub2" class="mr20">기타</label>		
												<form:radiobutton path="ilrecognition_sub" class="mr5" value="3" /> <label for="ilrecognition_sub3" class="mr20">봉사</label>					
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<label for="inputid12" class="ff_title i_b"><strong>점수</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<form:input path="ilpoint" class="input t1 w100"/>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div1">
										<label for="inputid13" class="ff_title i_b"><strong>관련 URL</strong></label>
										<div class="ff_wrap ml120">
											<div class="area">
												<span class="fl text ml10 mr10">http://</span>
												<form:input path="ilurl" class="input t1 w550" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="btn_wrap mt40">
								<ul>
									<li><a href="javascript:f_Send();" class="btn big t1">완료</a></li>
									<li><a href="javascript:document.frmSch.reset();" class="btn big">취소</a></li>
								</ul>
							</div>
						</fieldset>
					</form:form>
				</div>
		
	</div>
</div>

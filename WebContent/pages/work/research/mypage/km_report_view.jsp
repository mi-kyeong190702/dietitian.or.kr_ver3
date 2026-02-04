<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
//<a href="javascript:reportView('${pers_name }','${lic_no }','${ar_code_part }','${cs_kitchen_code }','${report_year}','${ar_conform_date}','view');" class="btn middle" >보기</a>
	function reportView(nm,lic,cd1,cd2,yyyy,ar_conform_date,md){
		
		
		var code1 = ['','산업체','병원','학교','사회복지시설','어린이집','유치원','교정','군대','경찰서'];
		var code2 = ['','건강기능식품 판매업소','교육 및 연구기관','식품제조 가공업소','위탁급식전문업체(행정업무)','보건소','행정직 공무원','어린이급식관리지원센터','육아지원종합센터','기타'];
		var code3 = ['','임신,출산,육아','일시적 폐업, 실직','질병, 사고 등','해외체류','기타'];
		
		var job = "";
		
		if(cd1=='1'){
			job = code1[cd2];
		}else if(cd1=='2'){
			job = code2[cd2];
		}else if(cd1=='3'){
			job = code3[cd2];
		}
		
/* 		var dt = new Date();
		var year = dt.getFullYear();
		var month = dt.getMonth()+1;
		var date = dt.getDate(); */
		
		/* 20160217 신고년도 수정 */
		var d = ar_conform_date;
		var year = d.substring(0,4);
		var month = d.substring(5,7) ;
		var date = d.substring(8,10) ;

		var todayTxt = year + "년 " + month + "월 " + date + "일";
		var nextyyyy = (yyyy*1)+3;
		
		var url="";	
		url = "/pages/work/research/mypage/km_report_print_view.jsp";
		window.open("","reportpop","width=740,height=740, scrollbars=yes, resizable=yes");
		
		var f = document.forms["myForm"];	
		
		$("#pers_name").val(nm);
		$("#lic_no").val(lic);
		$("#code_name").val(job);
		$("#yyyy").val(yyyy);
		$("#todayTxt").val(todayTxt);
		$("#nextyyyy").val(nextyyyy);
		$("#view_mode").val(md);
		$("#year").val(year);
		$("#month").val(month);
		$("#date").val(date);
		
		f.method = "POST";
		f.target="reportpop";
		f.action=url;
		f.submit();
			
		
	}

</script>

<form name="myForm">
<input type="hidden" id="pers_name" name="pers_name"/> 
<input type="hidden" id="lic_no"  name="lic_no"/> 
<input type="hidden" id="code_name" name="code_name"/> 
<input type="hidden" id="yyyy" name="yyyy"/> 
<input type="hidden" id="todayTxt" name="todayTxt"/> 
<input type="hidden" id="nextyyyy" name="nextyyyy"/> 
<input type="hidden" id="view_mode" name="view_mode"/>
<input type="hidden" id="year" name="year"/>
<input type="hidden" id="month" name="month"/>
<input type="hidden" id="date" name="date"/> 
<input type="hidden" id="ar_conform_date" name="ar_conform_date" />
</form>

					<table class="table t1 text small s1 ca center">
						<colgroup>
							<col width="110" />
							<col width="110" />
							<col width="110" />
							<col width="110" />
							<col width="110" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="bold cm">이름</th>
								<th scope="col" class="bold cm">신고년도</th>
								<th scope="col" class="bold cm">신청날짜</th>
								<th scope="col" class="bold cm">승인날짜</th>
								<th scope="col" class="bold cm">진행현황</th>
								<th scope="col" class="bold cm">확인서</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${dataCount>0 }">							
								<c:forEach var="list" items="${dataRow}" varStatus="status">
									<tr>
										<c:if test="${status.index==0}">										
										<td rowspan="${dataCount }">${list.pers_name }</td>
										</c:if>

										
										<td>${list.report_year}</td>
										<td>${list.ar_regi_date }</td>
										<td>
											<c:if test="${list.ar_finish_yn=='2'}">
												${list.ar_conform_date }
											</c:if>
										</td>
										<td>
											<c:if test="${list.ar_finish_yn=='0'}">수정중</c:if>
											<c:if test="${list.ar_finish_yn=='1'}">접수중</c:if>
											<c:if test="${list.ar_finish_yn=='2'}">완료</c:if>
											<c:if test="${list.ar_finish_yn=='3'}">보류</c:if>
											<c:if test="${list.ar_finish_yn=='4'}">회송</c:if>
										</td>
										<td>
											<c:if test="${list.ar_finish_yn=='2'}">
												<a href="javascript:reportView('${list.pers_name }','${list.lic_no }','${list.ar_code_part }','${list.cs_kitchen_code }','${list.report_year}','${list.ar_conform_date}','view');" class="btn middle" >보기</a>
												<a href="javascript:reportView('${list.pers_name }','${list.lic_no }','${list.ar_code_part }','${list.cs_kitchen_code }','${list.report_year}','${list.ar_conform_date}','print');" class="btn middle ml5">출력</a>
											</c:if>
										</td>
										
									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">접수중인 면허신고가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					
					<div class="box t1 bgs mt10 p10 pl15 text ssmall">
						<div class="area">
							<h4 class="title i_b_t6">진행현황 안내</h4>
							<ol class="mt10">
								<li><span class="ib w60 bold">1. 접수중</span> : 현재 면허신고 현황 확인중입니다. 제출 후 7일이 소요됩니다.
								<li><span class="ib w60 bold">2. 완   료</span> : 면허신고가 완료되었습니다. 확인서를 출력해 주십시오.
								<li><span class="ib w60 bold">3. 보   류</span> : ‘법령 및 지침’ 외의 사항으로 보건복지부 질의 중입니다.<br />
								<span class="ib w75"></span>보건복지부 질의 시 7일 이상이 소요되며, 별도로 연락 드리겠습니다.
								<li><span class="ib w60 bold">4. 회   송</span> : 면허신고서에 오류가 있어 접수가 거부되었습니다. 면허신고 수정에서 면허신고서를 다시 작성해 주시기 바랍니다. 
							</ol>
						</div>
					</div>
					
					
					
					
					
<div id="km_docu" style="display: none;">
	<div class="km_docu_page">
		<h1 class="title t1 bold s1">면허신고 확인서</h1>
		<ul class="mt30 text middle left">
			<li><strong class="ib w70 bold">성명</strong> : <span id="km_docu_name"></span></li>
			<li><strong class="ib w70 bold">면허번호</strong> : <span id="km_docu_no"></span></li>
			<li><strong class="ib w70 bold">직종</strong> : <span id="km_docu_job"></span></li>
		</ul>
		<p class="mt50 text left" id="text1">
			귀하는 『국민영양관리법 제20조의 2(면허 등의 신고)』 조항에 따라 면허를 받은지 3년마다 신고하여야 하는 영양사 면허신고와 취업상황 등을 년도에 신고 하였음을 확인합니다.
		</p>
		<p class="mt50 text left" id="text2">
			※ 다음 영양사 면허신고 연도는 년입니다.
		</p>
		<p class="mt20 text right" id="text3">
			
		</p>
		<div class="mt50">
			<img src="/images/research/img_km_sign.png" alt="사단법인 대한영양사협회장 직인 이미지" />
		</div>
	</div>
</div>
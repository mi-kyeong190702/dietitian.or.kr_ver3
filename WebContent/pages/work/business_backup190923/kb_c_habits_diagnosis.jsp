<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	$(document).ready(function()
	{
		$("#result").hide();
	});

	function doResult()
	{
		var result_html = "";
		
		for ( var i = 1; i <= 18; i++ )
		{
			var question = $("#question"+i).html();
			var radio_val  = $("input[name=radio" + i + "]:checked").val(); 
			var radio_desc = $("label[name=radio" + i + "_" + radio_val + "_label]").html();
			var radio_result = $("input[name=radio" + i +  "_" + radio_val + "_comment]").val();
			
			result_html += "<div class='mt40 mb10'>" + question + "</div>";
			result_html += "<div class='ff_wrap text mt10'>";
			result_html += 	"<div class='area ml10'>";
			result_html += 	"<p class='text bold cp'>" + radio_desc + " 선택</p>";
			result_html +=  "<p class='text small cb i_b_t8'> A." + i + ". " + radio_result + "</p>";
			result_html += "</div>";
			result_html += "</div>";
		}
		
		$("#question").hide();
		$("#result").show();
		$("#result_html").html(result_html);
	}

</script>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">올바른</mark>식습관</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_c_info118.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_habits.do" class="cm">올바른식습관</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="tab_2 div2">
			<ul>
				<li><a href="/work/business/kb_c_habits.do">올바른 식습관</a></li>
				<li><a href="/kb_c_habits_diagnosis.do" class="on">식습관 평가하기</a></li>
			</ul>
		</div>
		<div id="question">
			<h4 class="title bold t2 cm s1 i_b_t2 mt50">식습관 평가하기</h4>
			<p class="text middle cb s1 mt10">지금부터 여러분은 평소 여러분이 먹는 식사습관을 중심으로 한 총 18개의 문항을 작성하시게 될 것입니다. 이 문항조사가 끝나면 평소의 식습관을 통해 무심코 지나쳤던 식생활의 문제점을 발견하실 수 있을 것이며, 
				여러분의 식습관에 맞는 평가 및 조언을 받으실 수 있습니다. (4세 이상 사용 가능)
			</p>		
			<div class="box t2 text s1 mt30 p40">
			<c:choose>
				<c:when test="${requestScope.list.size() > 0 }">
					<c:forEach var="i" begin="0" end="${requestScope.list.size()-1 }" varStatus="stat">	
						<c:set var="tmp_hques_no_tmp" scope="session" />
						<c:set var="j" scope="session" value="0"/>
						<c:set var="k" scope="session" value="0"/>
						
						<c:if test="${tmp_hques_no_tmp != requestScope.list[i].hques_no}">
							<c:set var="tmp_hques_no_tmp" value="${requestScope.list[i].hques_no}"/>
							<c:set var="j" value="${j+1}"/>
							<c:set var="k" value="1"/>
							<div class="mb10" id="question${j}"> Q${j}. ${requestScope.list[i].hques_desc}</div>
							<div class="ff_wrap text mt10">
							<div class="area ml10">
						</c:if>
						
						<c:choose>
							<c:when test="${k == 1}">
								<input type="radio" class="mr5" name="radio${j}" id="radio${j}_${k}" value="${requestScope.list[i].hques_caseno}" checked/>
							</c:when>
							<c:otherwise>
								<input type="radio" class="mr5" name="radio${j}" id="radio${j}_${k}" value="${requestScope.list[i].hques_caseno}"/>
							</c:otherwise>
						</c:choose>
							
						<label for="radio${j}_${k}" name="radio${j}_${k}_label" class="mr20">${requestScope.list[i].hques_cdesc}</label>
						<input type="hidden" name="radio${j}_${k}_comment" value="${requestScope.list[i].hques_comment}"/>
						
						<c:set var="k" value="${k+1}"/>						
						
						<c:if test="${tmp_hques_no_tmp != requestScope.list[i+1].hques_no}">
							</div>
							</div>
							<br>
						</c:if>
						
					</c:forEach>
				</c:when>
			</c:choose>
			</div>
			<div class="mt30 mb50 right">
				<a href="javascript:doResult();" class="btn bbig t1">결과보기</a>
			</div>
		</div>
		<div id="result" style="display:none;">
			<h4 class="title bold t2 cm s1 i_b_t2 mt50">식습관 평가 결과</h4>
			<div class="area">
				<div class="box t2 text s1 mt30 p40" id="result_html">				
				</div>					
			</div>		
		</div>
	</div>
</div>

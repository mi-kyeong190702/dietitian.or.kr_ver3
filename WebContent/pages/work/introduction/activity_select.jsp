<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");
%>
<script>
var idx ='<%=idx%>';
 $(document).ready(function(){
	 $("#selectBox option:eq("+idx+")").attr("selected", "selected");
 });
</script>

	<div class="ff_wrap mt60 fr">
		<div class="area">
			<form name='form1' method='post'>
				<select id="selectBox" class="select t2 fr w300" name='select' onchange='document.form1.action = this.value; document.form1.submit();'>
					<option value="/work/introduction/ki_activity_plan.do">2025년도 사업계획</option>
					<option value="/work/introduction/ki_activity_plan_group.do">조직</option>
					<option value="/work/introduction/ki_activity_plan_member.do">회원</option>
					<option value="/work/introduction/ki_activity_plan_compute.do">전산</option>
					<option value="/work/introduction/ki_activity_plan_policy.do">정책</option>
					<option value="/work/introduction/ki_activity_plan_division.do">분과운영</option>
					<option value="/work/introduction/ki_activity_plan_education.do">교육</option>
					<option value="/work/introduction/ki_activity_plan_publication.do">출판</option>
					<option value="/work/introduction/ki_activity_plan_business.do">사업</option>
					<option value="/work/introduction/ki_activity_plan_publicity.do">홍보</option>
					<option value="/work/introduction/ki_activity_plan_exchange.do">국제교류</option>
					<option value="/work/introduction/ki_activity_plan_exam.do">영양사 국가시험 지원</option>
<!--					<option value="/work/introduction/ki_activity_plan_senior.do">대한영양사 시니어직능클럽</option> -->
<!--					<option value="/work/introduction/ki_activity_plan_center.do">회관 사업</option> -->
				</select>
			</form>
		</div>
	</div>

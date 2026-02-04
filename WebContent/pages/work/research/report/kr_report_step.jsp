<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kda.utils.ParamUtils"%>

<%

	String include = "";
	String step		= ParamUtils.getParameter(request, "step", "step1");
	
	if ( "step1".equals(step))   include = "/kr_report_step1.do";
	if ( "step2".equals(step))   include = "/kr_report_step2.do";
	if ( "step3".equals(step))   include = "/kr_report_step3.do";
	if ( "step4".equals(step))   include = "/kr_report_step4.do";
	if ( "step5".equals(step))   include = "/kr_report_step5.do";
	if ( "step6".equals(step))   include = "/kr_report_step6.do";
	if ( "step7".equals(step))   include = "/kr_report_step7.do";
	if ( "chk".equals(step))     include = "/kr_report_state_chk.do";
	
	System.out.println("==============================================================");
	System.out.println("||");
	System.out.println("||");
	System.out.println("|| 		step1 : 면허정보 확인 | step2 : 이용약관/아이핀 인증 | step3 : 비밀번호 등록 | 	step4 : 로그인 | step5 : 신고서  작성 | step6 : 신고서 저장/제출 | step7 : 신고서 취소");
	System.out.println("||");
	System.out.println("||		report start_ : " +step);
	System.out.println("||		report include_ : " +include);
	System.out.println("||");
	System.out.println("||");
	System.out.println("||");
	System.out.println("==============================================================");
	
%>


<form name="report">			
	<input type="hidden" name="step" value="<%=step%>">
</form>


<c:import url="<%=include%>"></c:import>



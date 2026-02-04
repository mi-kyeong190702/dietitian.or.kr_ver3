<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String pers_name = request.getParameter("pers_name");
	String lic_no = request.getParameter("lic_no");
	String code_name = request.getParameter("code_name");
	String yyyy = request.getParameter("yyyy");
	String todayTxt = request.getParameter("todayTxt");
	String nextyyyy = request.getParameter("nextyyyy");
	String view_mode = request.getParameter("view_mode");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");

%>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>사단법인 대한영양사협회</title>	
	<style type="text/css">
	body{
		background: #fff;
  		line-height: 100%;
  		font: 150% NanumGothic,NanumGothicBold,verdana,gulim,dotum;
  		color: #282828;
  		margin: 0;
		padding: 0;
		border: 0;
		width: 100%;
		height: 100%;
	}
	.km_docu{
		display: block;
		padding: 40px;
		text-align: center;
	}
	    #print_name {top : 339px;left : 220px;position: absolute; }
		#print_lic {	top : 400px;left : 220px;position: absolute; }
		#print_yyyy {top : 722px;left : 292px;position: absolute; }
		#print_nextyyyy {top : 897px;left : 637px;position: absolute; }
		#print_year {top : 1065px;left : 318px;position: absolute; }
		#print_month {top : 1065px;left : 455px;	position: absolute; }
		#print_date {top : 1065px;left : 535px;position: absolute; }
	
	</style>
	<script type="text/javascript">
		
	</script>
	
</head>

<body>
<div>
	<img src="/images/research/km_report_mark_.jpg" width="1000px;" height="1400px;"/>
	<div class="printDiv" id="print_name"><%=pers_name %></div>
	<div class="printDiv" id="print_lic"><%=lic_no %></div>
	<div class="printDiv" id="print_yyyy"><%=yyyy %></div>
	<div class="printDiv" id="print_nextyyyy"><%=nextyyyy %></div>
	<div class="printDiv" id="print_year"><%=year %></div>
	<div class="printDiv" id="print_month"><%=month %></div>
	<div class="printDiv" id="print_date"><%=date %></div>
</div>
</body>
<%
	if("print".equals(view_mode)){			
%>
<script>
window.print();
</script>
<%
	}			
%>
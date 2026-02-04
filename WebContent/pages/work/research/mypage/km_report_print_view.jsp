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
	<link rel="stylesheet" href="/css/research_common.css">
	<link rel="stylesheet" href="/css/research_layout.css">
	<script type="text/javascript">
		
	</script>
	
</head>
<body>
<!-- 
<div id="km_docu2">
	<div class="km_docu_neme"> &nbsp;  </div>
	<div class="km_docu_outline">
	<div class="km_docu_page3">
        <div class="txt">
            <h1 class="title t1 bold s1 mt30">영양사의 실태 등 신고 확인서</h1>
            <ul class="mt80 text middle left">
                <li><label for="kdp_name" class="ib w70 bold">성　　명</label> : <input type="text" class="ib w100" id="kdp_name" value="<%=pers_name %>" /></li>
                <li><label for="kdp_no" class="ib w70 bold">면허번호</label> : <input type="text" class="ib w100" id="kdp_no" value="<%=lic_no %>" /></li>
            </ul>
            <p class="cont01">
            &nbsp;귀하는 『국민영양관리법 제20조의 2(실태 등의 신고)』<br/>조항에 따라 <%=yyyy %>년도 영양사의 실태 등을 신고하였음을<br/>확인합니다.
            </p>
            <p class="cont02">
            &nbsp;※ 다음 영양사 실태 등 신고연도는  <%=nextyyyy %>년입니다.
            </p>
            <p class="date">
                <input type="text" class="ib w50 right mr5" id="kdp_y" value="<%=year %>" /><label for="kdp_y">년</label> 
                <input type="text" class="ib w30 right ml10 mr5" id="kdp_m" value="<%=month %>" /><label for="kdp_m">월</label> 
                <input type="text" class="ib w30 right ml10" id="kdp_d" value="<%=date %>" /><label for="kdp_d">일</label> 
            </p>
            <div class="bot_asso">
                사단법인 <span>대한영양사협회장</span>
                <img src="/images/research/km_report_mark2.png" class="img_mark" alt="사단법인 대한영양사협회장 직인 이미지" />
            </div>
        </div>
        <img src="/images/research/km_report_mark.jpg" class="img" />
	</div>
    </div>
</div>
-->
<div id="km_docu2">
	<div class="km_docu_neme"> &nbsp;  </div>
	<div class="km_docu_outline">
	<div class="km_docu_page3">
        <div class="txt">
        	<!-- 20180109 수정 -->
            <h1 class="title t1 bold s1 mt40">영양사의 실태 등 신고 확인서</h1>
            <ul class="mem_name">
                <li><label for="kdp_name" class="ib w95 bold">성　　명</label> : <input type="text" class="ib w100" id="kdp_name" value="<%=pers_name %>" /></li>
                <li><label for="kdp_no" class="ib w95 bold">면허번호</label> : <input type="text" class="ib w100" id="kdp_no" value="<%=lic_no %>" /></li>
            </ul>
            <!--// 20180109 수정 -->
            <p class="cont01">
            &nbsp;귀하는 『국민영양관리법 제20조의 2(실태 등의 신고)』<br/>조항에 따라 <%=yyyy %>년도 영양사의 실태 등을 신고하였음을<br/>확인합니다.
            </p>
            <p class="cont02">
            &nbsp;※ 다음 영양사 실태 등 신고연도는  <%=nextyyyy %>년입니다.
            </p>
            <p class="date">
                <input type="text" class="ib w60 right mr5" id="kdp_y" value="<%=year %>" /><label for="kdp_y">년</label> 
                <input type="text" class="ib w30 right ml10 mr5" id="kdp_m" value="<%=month %>" /><label for="kdp_m">월</label> 
                <input type="text" class="ib w30 right ml10" id="kdp_d" value="<%=date %>" /><label for="kdp_d">일</label> 
            </p>
            <div class="bot_asso">
                사단법인 <span>대한영양사협회장</span>
                <img src="/images/research/km_report_mark2.png" class="img_mark" alt="사단법인 대한영양사협회장 직인 이미지" />
            </div>
        </div>
        <img src="/images/research/km_report_mark.jpg" class="img" />
	</div>
    </div>
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
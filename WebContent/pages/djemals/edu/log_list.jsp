<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<link href="/css/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.datepicker-ko.min.js"></script>
<script> 

$(document).ready(function(){
    
	$("#startm").datepicker({
	    dateFormat: "yymmdd",
	    changeMonth: true,
	    changeYear: true,
	    onSelect: function(selectedDate) {
	        $("#endm").datepicker("option", "minDate", selectedDate);
	    }
	});
	$("#endm").datepicker({
	    dateFormat: "yymmdd",
	    changeMonth: true,
	    changeYear: true,
	    onSelect: function(selectedDate) {
	        $("#startm").datepicker("option", "maxDate", selectedDate);
	    }
	});
    
    
    $('#startm').datepicker("option", "maxDate", $("#endm").val());
    $('#startm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#endm").datepicker( "option", "minDate", selectedDate );
    });
    
    $('#endm').datepicker("option", "minDate", $("#startm").val());
    $('#endm').datepicker("option", "onClose", function ( selectedDate ) {
        $("#startm").datepicker( "option", "maxDate", selectedDate );
    });
});

function pick(id){
    $("#"+id).focus();
}

function f_search() { 
	
	const s=$('#startm').val(), e=$('#endm').val();
	  const r=(function(){
	    const sD = s, eD = e;
	    const sOk = /^\d{8}$/.test(sD), eOk = /^\d{8}$/.test(eD);
	    if(!sOk || !eOk) return {ok:false, msg:'출력조회일자를 입력하세요.'};
	    return (function(){ // 재사용
	      const S = new Date(+sD.slice(0,4), +sD.slice(4,6)-1, +sD.slice(6,8));
	      const E = new Date(+eD.slice(0,4), +eD.slice(4,6)-1, +eD.slice(6,8));
	      if(E < S) return {ok:false, msg:'종료일이 시작일보다 빠릅니다.'};
	      const limit = new Date(S.getFullYear(), S.getMonth()+6, S.getDate());
	      if(E > limit) return {ok:false, msg:'조회 기간은 최대 6개월까지 가능합니다.'};
	      return {ok:true};
	    })();
	  })();
	  if(!r.ok){ alert(r.msg); return; }

    document.frmlogList.submit();
}

$(document).on('change', '#startm, #endm', function(){
	
	alert('!!!');
    var r = validate6Months($('#startm').val(), $('#endm').val());
    if(!r.ok){
      alert(r.msg + "\n(시작일 기준 최대 6개월 이내로 선택해주세요)");
      clampEndIfNeeded();
    }
  });
  
function validate6Months(startStr, endStr){
    var s = parseDate(startStr), e = parseDate(endStr);
    if(!s || !e) return { ok:true };                 // 비어있으면 우선 통과
    if(e < s)    return { ok:false, msg:"종료일이 시작일보다 빠릅니다." };
    var limit = addMonths(s, 6);                     // 시작일 + 6개월
    if(e > limit) return { ok:false, msg:"조회 기간은 최대 6개월까지 가능합니다." };
    return { ok:true };
  }
function applyInitialSelection(){
	  var $sel     = $("#selEdutestName");
	  var initDet  = ($.trim($("#initDetcode").val() || ""));
	  var initName = ($.trim($("#initSelEdutestName").val() || ""));
	  var yearVal  = $("#year").val(); // 선택 사항: 같은 이름이 여러 연도에 있을 때 구분용

	  // 1) detcode 우선: 현재 목록에 있을 때만 선택
	  if (initDet) {
	    // jQuery 3+: $.escapeSelector 사용 (하위버전이면 커스텀 이스케이프 필요)
	    var safe = $.escapeSelector ? $.escapeSelector(initDet) : initDet.replace(/([ #;&,.+*~':"!^$[\]()=>|\/@])/g,'\\$1');
	    var $optByCode = $sel.find('option[value="'+ safe +'"]');
	    if ($optByCode.length) {
	      $sel.val(initDet).trigger("change");
	      return;
	    }
	  }

	  // 2) 이름으로 대체 매칭 (정확 일치 + 같은 연도 우선)
	  if (initName) {
	    var $candidates = $sel.find('option').filter(function(){
	      return $.trim($(this).text()) === initName;
	    });
	    if ($candidates.length) {
	      // 같은 연도 우선 선택 (data-year를 세팅해두셨으니 활용)
	      var $byYear = $candidates.filter(function(){ return $(this).attr('data-year') == yearVal; });
	      var $pick = $byYear.length ? $byYear.first() : $candidates.first();
	      $sel.val($pick.val()).trigger("change");
	      return;
	    }
	  }

	  // 3) 둘 다 없으면 초기화 (전체)
	  $sel.val('').trigger('change');
	  $("#detcode").val('');
	}


function fn_setEdu(){
	 $.ajax ( {
         type      : "GET"
       , url       : "/djemals/edu/setEduList.do"
       ,  data: { year: $("#year").val() }
       , dataType  : "json"
       , cache     : false
       , success   : function(list){
    	   
   	   var $sel = $("#selEdutestName");
   	      $sel.empty().append('<option value="">전체</option>');

   	      var seen = {};
   	      $.each(list, function(i, r){
   	        var name = (r.EDUTEST_NAME || "").replace(/^\s+|\s+$/g, "");
   	        if (!name || seen[name]) return;
   	        seen[name] = true;

   	        $("<option/>")
   	          .val(r.DETCODE || "")
   	          .text(name)
   	          .attr("data-year",   r.YYYY || "")
   	          .attr("data-kind",   r.CODE_KIND || "")
   	          .attr("data-season", r.SEASON || "")
   	          .appendTo($sel);
   	      });
   	      applyInitialSelection();
   	    }
       , error     : handleGetNoticeHtmlError              
   });
	 
} 
	 function handleGetNoticeHtmlError(data){}
	 
	 $(document).on("change", "#selEdutestName", function(){
	    var detcode = $(this).val(); 
	    $("#detcode").val(detcode);
	});
	 
	$(function(){
	  fn_setEdu();
	});
</script>
 

<div id="adm_contents">
	<div class="c_page">
	
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		
		<div class="cp_contents">
			<h3 class="title t3 bold s1"><mark class="cm">이수확인서 출력 </mark> 리스트</h3>			
			<form name="frmlogList" method="get" action="logList.do">
			<input type="hidden" id="detcode" name="detcode" >
			<!-- 기존 화면의 검색값을 숨김으로 보관 -->
            <input type="hidden" id="initDetcode" value="${empty search.detcode ? '' : search.detcode}">
            <input type="hidden" id="initSelEdutestName" value="${empty search.selEdutestName ? '' : search.selEdutestName}">
			
			  <div class="box t1 p10 mt10">
			
			    <div class="form">
			      <div class="f_wrap bb p8">
			
			        <!-- 조회일자 -->
			        <div class="f_field div1">
			          <label for="startm" class="ff_title"><strong>출력일자</strong></label>
			          <div class="ff_wrap ml100">
			            <div class="area">
			              <input type="text" class="input t1 fl w150" id="startm" name="startm" readonly="readonly" onclick="this.value='';" value="${search.startm}"/>
			              <a href="#" onclick="pick('startm');return false;" class="btn form t1 fl ml5 p0" id="pick1">달력</a>
			              <span class="fl text ml10 mr10">~</span>
			              <input type="text" class="input t1 fl w150 ml5" id="endm" name="endm" readonly="readonly" onclick="this.value='';" value="${search.endm}"/>
			              <a href="#" onclick="pick('endm');return false;" class="btn form t1 fl ml5 p0" id="pick2">달력</a>
			            </div>
			          </div>
			        </div>
			
			        <!-- 구분2-1 -->
			        <div class="f_field div2">
			          
			          <div class="ff_wrap ml100">
			            <div class="area">
			            <label for="year" class="ff_title"><strong>개설연도</strong></label>
			              <select id="year" name="year" class="input t1 w150" onchange="fn_setEdu();">
			                <option value="" <c:if test="${empty param.year}">selected="selected"</c:if>>전체</option>
			                <c:forEach items="${yearList}" var="y">
			                  <option value="${y.detcode}" <c:if test="${search.year eq y.detcode}">selected="selected"</c:if>>
			                    ${empty y.detcode ? y.detcode : y.detcodename}
			                  </option>
			                </c:forEach>
			              </select>       
			            </div>
			          </div>
			        </div>
			
			        <!-- 구분2-2 -->
			        <div class="f_field div1">
			          
			          <div class="ff_wrap ml100">
			            <div class="area">
			            <label for="edu" class="ff_title"><strong>교육명</strong></label>
			            <select id="selEdutestName" class="select t2 fl w200p form-control" name="selEdutestName"  >
                          </select>  
			            </div>
			          </div>
			        </div>
			        
			        <!-- 이름 3-->
                    <div class="f_field div3">
                      <label for="person_name" class="ff_title"><strong>이름</strong></label>
                      <div class="ff_wrap ml100">
                        <div class="area">
                          <input type="text" class="fl input t1 w70p" id="person_name" size="35" name="person_name" value="${search.person_name}"/>
                        </div>
                      </div>
                    </div>
			
			        <!-- 검색 버튼 오른쪽 끝으로-->
			        <div class="f_field div2">
			          <div class="ff_wrap ml100">
			            <a href="javascript:f_search();" class="btn form t1 ml10">검색</a>
			          </div>
			        </div>
			         
			
			      </div>
			    </div>
			  </div>
			</form>

			<table class="table t1 text small center mt7">
				<colgroup>
					<col width="30">
					<col width="70">
					<col width="110">
					<col width="70">
					<col width="70">
					<col width="70">
					<col width="290"> 
				</colgroup>
				<thead>
				<tr>
					<th scope="col" class="bold cm">번호</th>
					<th scope="col" class="bold cm">출력일</th>
					<th scope="col" class="bold cm">이수확인서 발급번호</th>
					<th scope="col" class="bold cm">이름</th>
					<th scope="col" class="bold cm">면허번호</th>
					<th scope="col" class="bold cm">ID</th>
					<th scope="col" class="bold cm">교육명</th> 
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${listHelper.list}" var="log">
						<tr>
						  <td>${log.num}</td>
						  <td>${log.print_date}</td>
						  <td>${log.print_seq}</td>
						  <td>${log.pers_name}</td>
						  <td>${log.lic_no}</td>
						  <td>${log.id}</td>
						  <td>${log.print_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn_wrap mt20">
				<ul class="fr">
					<li><a href="logExcel.do" class="btn big t1">엑셀로 다운받기</a></li>
				</ul>
			</div>
			
			<kda:paging listHelper="${listHelper}" layout="admin"/>
			
			
		</div>
	</div>
</div>  
<style>
.f_field { margin-bottom: 8px; } 
.area { display:flex; gap:8px; }
</style>

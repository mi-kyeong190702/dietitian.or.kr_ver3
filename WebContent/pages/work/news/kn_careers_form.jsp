<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld"  %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"  %>
<script>
$(function(){
	$("#eclimit_day").datepicker();
	$("#eclimit_tm").timepicker();
	$("#ettime1").timepicker({ 'format': 'h시i분' });
	$("#ettime2").timepicker({ 'format': 'm시d분' });
	
	// 브라우저 캐시 방지 (새로 작성할 때만)
	<c:if test='${employ.crud == "C"}'>
	// 페이지 로드 시 즉시 초기화 (여러 번 시도)
	setTimeout(function(){
		$("#ecemail").val("").attr("autocomplete", "off");
		$("#epwd").val("").attr("autocomplete", "new-password");
	}, 50);
	setTimeout(function(){
		$("#ecemail").val("");
		$("#epwd").val("");
	}, 200);
	setTimeout(function(){
		$("#ecemail").val("");
		$("#epwd").val("");
	}, 500);
	
	// 브라우저 뒤로가기/앞으로가기 시에도 초기화
	window.addEventListener('pageshow', function (event) {
		if (event.persisted) {
			$("#ecemail").val("");
			$("#epwd").val("");
		}
	});
	
	// 포커스 시 즉시 캐시 값 제거
	$("#ecemail, #epwd").on('focus', function(e){
		e.preventDefault();
		var $this = $(this);
		// readonly 해제 후 값 초기화
		$this.removeAttr('readonly');
		$this.val("");
		$this.focus();
	});
	
	// 입력 시작 시에도 한 번 더 확인
	$("#ecemail, #epwd").on('input', function(){
		// 브라우저가 자동완성으로 채운 값인지 확인하고 초기화
		var $this = $(this);
		setTimeout(function(){
			if($this.val() && $this.data('should-be-empty')) {
				$this.val("");
			}
		}, 10);
	});
	</c:if>
});
</script>		

<script type="text/javascript">
function jusoCallBack( roadFullAddr
		 , roadAddrPart1
		 , addrDetail
		 , roadAddrPart2
		 , engAddr
		 , jibunAddr
		 , zipNo) {
	$("#ecpost").val(zipNo);
	$("#ecaddress").val( roadAddrPart1 + " " +  addrDetail + " " + roadAddrPart2  );
} 


//dietitan.js isBoardFile 공통 메소드가 존재하나 본화면에서 해당 js 메소드를 읽어들이지 못해 별도 추가. -> 운영서버에  dietitan.js isBoardFile 반영 안되어 있다.
function isBoardFile2(name){
	var fileName = name;
	var suffix = fileName.substring(fileName.lastIndexOf(".")+1);
	suffix = suffix.toLowerCase();
	if(suffix != "jpg" && suffix != "jpeg" && suffix != "gif" && suffix != "bmp" && suffix != "png" && suffix != "swf"
		&& suffix != "tiff" && suffix != "tif" && suffix != "mpg" && suffix != "mpeg" && suffix != "avi"
		&& suffix != "asf" && suffix != "wma" && suffix != "mp3" && suffix != "xls" && suffix != "xlsx"
		&& suffix != "pdf" && suffix != "ppt" && suffix != "htm" && suffix != "txt" && suffix != "hwp"
		&& suffix != "doc" && suffix != "docx" && suffix != "zip" ){
		return false;
	}
	return true;
}

// 형식 체크 type 체크
function validationCheck(val) {

    var regexp = "";
    
    // 대문자, 숫자만 허용
    regexp = /^[0-9+]*$/;

    if( !regexp.test(val) ) {
        return false;
    }

    return true;
};


function f_sendIt() {
	
	var Chck = "01";
	if( $("#ecname").val() == "" ) {
		alert("회사명을 꼭 써 주세요.");
		$("#ecname").focus();
		return;
	}
	
	//2022.08.12 필수값 해제
	/* if( $("#ecpname").val() == "" ) {
		alert("담당자명을 꼭 써 주세요.");
		$("#ecpname").focus();
		return;
	} */
	
	
	if( $("#ectel1").val() == "" || $("#ectel2").val() == "" || $("#ectel3").val() == "" ){
		alert("전화번호를 을 꼭 써 주세요.");
		return;
	}

    if(!validationCheck( $("#ectel1").val() ) || !validationCheck( $("#ectel2").val() ) || !validationCheck( $("#ectel3").val() )) {
		alert("전화번호를 확인해 주세요.\n(숫자만 입력 가능)");
		return;
    }
	
	if( $("#ecemail").val() == "") {
		alert("이메일 주소를 꼭 써 주세요");
		$("#ecemail").focus();
		return;
	}
	
	
	if ( !C_isCheck("ecpartAry") ) {
		alert("모집 분야를 하나 이상 선택해 주세요");
		return;
	}
	
	// 모집기한 일자/시간
	if($("#eclimit_day").val() == "") {
		alert("모집기한 일자를 입력하여 주세요");
		$("#eclimit_day").focus();
		return;
	}
	
	if($("#eclimit_tm").val() == "") {
		alert("모집기한 시간을 입력하여 주세요");
		$("#eclimit_tm").focus();
		return;
	}
	
	// 모집인원
	if($("#ecnumber").val() == "") {
		alert("모집인원을 입력하여 주세요");
		$("#ecnumber").focus();
		return;
	}

    if(!validationCheck( $("#ecnumber").val() ) ) {
		alert("모집인원을 확인해 주세요.\n(숫자만 입력 가능)");
		return;
    }
	
	if($("#ettime1").val() == "") {
		alert("근무시간을 꼭 입력하여 주세요");
		$("#ettime1").focus();
		return;
	}
	
	if($("#ettime2").val() == "") {
		alert("근무시간을 꼭 입력하여 주세요");
		$("#ettime2").focus();
		return;
	}
	
	if( $("#etprice").val() == 0 || $("#etprice").val() == "" ) {
		alert("급여를 꼭 입력하여 주세요");
		$("#etprice").focus();
		return;
	}

    if(!validationCheck( $("#etprice").val() ) ) {
		alert("급여를 확인해 주세요.\n(숫자만 입력 가능)");
		return;
    }
	
  	//2022.08.12 상여금 주석처리
	/* if( $("#etsprice").val() == "" ) {
		alert("상여금 입력/확인해 주세요.\n(숫자만 입력 가능)");
		$("#etsprice").focus();
		return;
	}

    if(!validationCheck( $("#etsprice").val() ) ) {
		alert("상여금을 확인해 주세요.\n(숫자만 입력 가능)");
		return;
    } */
	
    //2022.08.12 필수값 해제
	/* if( !C_isCheck("etwelAry") ) {
		alert("복리 후생을 하나 이상 선택해 주세요");
		return;
	} */
	
	
	if( !C_isCheck("eppaperAry") ) {
		alert("제출해야할 서류를 하나 이상 선택해 주세요");
		return;
	}

	<c:if test='${employ.crud == "C" }'>
	if($("#epwd").val() == "") {
		alert("비밀번호를 꼭 입력해 주세요. \r\n추후 수정이나 삭제시 꼭 필요합니다.");
		$("#epwd").focus();
		return;
	}
	</c:if>
	
	//2022.08.12 인턴(수련) / 시간제 삭제
	//2023.04.26 상담 추가
	if(  !( C_hasCheck("ecpartAry", "인턴(수련)") ||
			C_hasCheck("ecpartAry", "산휴대체") ||
			C_hasCheck("ecpartAry", "상담") ||
			C_hasCheck("ecpartAry", "시간제") ) ) {
		var etprice =  $("#etprice").val();
		if( etprice < 2800 ) {
			alert('모집분야가 상담, 산휴대체 영양사가 아닐 경우에는 연봉 2,800만원 미만의 구인 공고를 등록할 수 없습니다.');
			return;
		}
	}
	
	if ($("#bbs_file").val() != "") {
		if (!isBoardFile2($("#bbs_file").val())) {
			alert("해당파일은 파일첨부가 불가합니다.");
			return;
		}
	}
	
	document.frmCareer.submit();
}

function f_delete() {
	if( confirm("삭제하시겠습니까?") ) {
		$("#crud").val("D");	
		document.frmCareer.submit();
	}
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">채용</mark>센터</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="./kn_notice.do?bbs_board_code=2">협회 소식</a></li>
				<li><a href="./kn_careers.do">채용센터</a></li>
				<li><a href="./kn_careers.do" class="cm">구인</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	<!-- // 본문 시작 -->
		
			<form:form name="frmCareer" method="post" modelAttribute="employ"  enctype="multipart/form-data" action="./kn_careers_action.do" autocomplete="off">
			<form:hidden path="crud"/>
			<form:hidden path="eindex" />
			<fieldset>
				<legend></legend>
				<div class="box t3 bgs p10 pl15 text small">
					<div class="area">
						<h4 class="title i_b_t6 bold">기본정보</h4>
					</div>
				</div>
				
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="ecname" class="ff_title i_b"><strong>회사명</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									
									<form:input path="ecname"  class="input t1 w200" />
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="ecpname" class="ff_title"><strong>담당자</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="ecpname"  class="input t1 w200"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>연락처</strong></div>
							<div class="ff_wrap ml120">
								<ul>
									<li>
										<div class="area">
											<label for=ectel1 class="fl w80 text bold cm">전화번호</label>
											<form:input type="number" path="ectel1" size="4" class="input t1 fl w100"/>
											<label for="inputid5" class="fl text ml10 mr10">-</label>
											<form:input type="number" path="ectel2" size="4" class="input t1 fl w100" />
											<label for="inputid5" class="fl text ml10 mr10">-</label>
											<form:input type="number" path="ectel3" size="4" class="input t1 fl w100" />
										</div>
									</li>
									<%-- 2022.08.12 주석처리
									<li class="mt5">
										<div class="area">
											<label for="ecfax1" class="fl w80 text bold cm">팩스번호</label>
											<form:input type="number" path="ecfax1" size="4" class="input t1 fl w100" />
											<label for="inputid5" class="fl text ml10 mr10">-</label>
											<form:input type="number" path="ecfax2" size="4" class="input t1 fl w100"/>
											<label for="inputid5" class="fl text ml10 mr10">-</label>
											<form:input type="number" path="ecfax3" size="4" class="input t1 fl w100"/>
										</div>
									</li> --%>
								</ul>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="ecemail" class="ff_title i_b"><strong>이메일</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<c:choose>
										<c:when test='${employ.crud == "C"}'>
											<input type="text" id="ecemail" name="ecemail" class="input t1 fl w300" autocomplete="off" readonly onfocus="this.removeAttribute('readonly');" placeholder="" style="background-color: white !important;"/>
										</c:when>
										<c:otherwise>
											<form:input path="ecemail" class="input t1 fl w300" autocomplete="off"/>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="echome" class="ff_title"><strong>홈페이지</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<label for="echome" class="fl text ml10 mr10">http://</label>
									<form:input path="echome" class="input t1 fl w500"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid14" class="ff_title"><strong>주소</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="ecpost" class="input t1 fl w200" readonly="true" onclick="C_Address();"/>	
									<a href="javascript:C_Address();" class="btn form t1 fl ml5">주소검색</a>
									<p class="fl text cp ml10">주소검색(우편번호) :  - 없이 한 칸으로 만들어주세요. </p>
								</div>
								<div class="area mt5">
									<label for="inputid15" class="ti">상세주소</label>
									<form:input path="ecaddress" class="input t1" onclick="C_Address();"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>모집분야</strong></div>
							<div class="ff_wrap ml120 text">
								<ul class="area">
									<!-- 2022.08.12 인턴(수련), 시간제 주석 처리 -->
									<li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="단체급식" /> <label for="ecpartAry1">단체급식</label></li>
									<li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="영업" /> <label for="ecpartAry2">영업</label></li>
									<li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="상담" /> <label for="ecpartAry3">상담</label></li>
									<%-- <li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="인턴(수련)" /> <label for="ecpartAry4">인턴(수련)</label></li> --%>
									<li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="산휴대체" /> <label for="ecpartAry4">산휴대체</label></li>
									<%-- <li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5" value="시간제" /> <label for="ecpartAry6">시간제</label></li> --%>
									<li class="fl mr20 p3"><form:checkbox path="ecpartAry" class="mr5"  value="임상영양" /> <label for="ecpartAry5">임상영양</label></li>
									<li class="fl p3">
										<form:checkbox path="ecpartAry" class="fl mt5 mr5"  value="기타" /> <label class="fl mr10" for="ecpartAry6">기타</label> 
										<label class="ti" for="ecparttext">메모 </label><form:input path="ecparttext" />  
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>모집기한</strong></div>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="eclimit_day" readonly="true" class="input t1 fl mr10 w100"/>
									<form:input path="eclimit_tm" readonly="true" class="input t1 fl w80"/>
									<div class="text">(모집기한이 지나면 자동삭제됩니다.)</div>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>모집인원</strong></div>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input type="number" path="ecnumber" class="input t1 fl w100"/>
									<label for="inputid21" class="fl text ml10 mr10">명</label>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title"><strong>접수방법</strong></div>
							<div class="ff_wrap ml120 text">
								<ul class="area">
									<li class="fl mr20"><form:checkbox path="ecrtypeAry" class="mr5" value="우편접수"  /> <label for="ecrtypeAry1">우편접수</label></li>
									<li class="fl mr20"><form:checkbox path="ecrtypeAry" class="mr5" value="이메일" /><label for="ecrtypeAry2">이메일</label></li>
									<li class="fl mr20"><form:checkbox path="ecrtypeAry" class="mr5"  value="내사" /><label for="ecrtypeAry3">내사</label></li>
									<li class="fl">
										<form:checkbox path="ecrtypeAry"  class="fl mt5 mr5"  value="기타" /><label class="fl mr10" for="ecrtypeAry4">기타</label>
										<label class="ti" for="checkbox1_12">메모 </label><form:input path="ecrtypetext" class="input t1 fl w200 ml10" />
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="box t3 bgs p10 pl15 text small mt10">
					<div class="area">
						<h4 class="title i_b_t6 bold">자격요건</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="erhistory" class="ff_title i_b"><strong>경력</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:select path="erhistory"  class="select t2 fl w200">
										<form:option value="경력 무관"  >경력 무관 </form:option>
										<form:option value="인턴"  >인턴</form:option>
										<form:option value="신입"  >신입</form:option>
										<form:option value="6개월~1년"  >6개월~1년</form:option>
										<form:option value="1~2년"  >1~2년</form:option>
										<form:option value="2~3년"  >2~3년</form:option>
										<form:option value="3~4년"  >3~4년</form:option>
										<form:option value="4~5년"  >4~5년</form:option>
										<form:option value="5년 이상"  >5년 이상</form:option>
									</form:select>
								</div>
							</div>
						</div>
						<%-- 2022.08.12 주석처리
						<div class="f_field div2">
							<div class="ff_title"><strong>혼인여부</strong></div>
							<div class="ff_wrap ml120 text">
								<div class="area">
									<form:radiobutton path="ermarry"  class="mr5" value="미혼"/>
									<label for="ermarry1" class="mr20">미혼</label>
									<form:radiobutton path="ermarry" class="mr5" value="기혼" />
									<label for="ermarry2" class="mr20">기혼</label>
									<form:radiobutton path="ermarry" class="mr5" value="무관"/>
									<label for="ermarry3" class="mr20">무관</label>
								</div>
							</div>
						</div> --%>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<div class="ff_title"><strong>성별</strong></div>
							<div class="ff_wrap ml120 text">
								<div class="area">
									<form:radiobutton path="ersex"  class="mr5" value="남"  />
									<label for="ersex1" class="mr20">남</label>
									<form:radiobutton path="ersex"  class="mr5" value="여" />
									<label for="ersex2" class="mr20">여</label>
									<form:radiobutton path="ersex" class="mr5" value="무관" />
									<label for="ersex3" class="mr20">무관</label>
								</div>
							</div>
						</div>
						<div class="f_field div2">
							<label for="inputid23" class="ff_title"><strong>식수원수</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input type="number" path="erfamily" class="input t1 fl w100" />
									<label for="inputid23" class="fl text ml10 mr10">명</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box t3 bgs p10 pl15 text small mt10">
					<div class="area">
						<h4 class="title i_b_t6 bold">근무요건</h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div2">
							<label for="inputid24" class="ff_title i_b"><strong>근무시간</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="ettime1"  class="input t1 fl w50"/> 
									<label for="inputid25" class="fl text ml10 mr10">~</label>
									<form:input path="ettime2" class="input t1 fl w50"/>
								</div>
							</div>
						</div>
						
						<div class="f_field div2">
							<label for="inputid31" class="ff_title"><strong>근무시간 특이사항</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="ettimecontents" class="input t1 fl"  />
								</div>
							</div>
						</div>
						
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid28" class="ff_title i_b"><strong>근무지역</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:select path="etlocation" class="select t2 fl w200">
										<form:option value="서울특별시" >서울특별시</form:option>
										<form:option value="부산광역시" >부산광역시</form:option>
										<form:option value="대구광역시" >대구광역시</form:option>
										<form:option value="인천광역시" >인천광역시</form:option>
										<form:option value="광주광역시" >광주광역시</form:option>
										<form:option value="대전광역시" >대전광역시</form:option>
										<form:option value="세종특별자치시" >세종특별자치시</form:option>
										<form:option value="울산광역시" >울산광역시</form:option>
										<form:option value="강원도" >강원도</form:option>
										<form:option value="경기도" >경기도</form:option>
										<form:option value="경상남도" >경상남도</form:option>
										<form:option value="경상북도" >경상북도</form:option>
										<form:option value="전라남도" >전라남도</form:option>
										<form:option value="전라북도" >전라북도</form:option>
										<form:option value="제주도" >제주도</form:option>
										<form:option value="충청남도" >충청남도</form:option>
										<form:option value="충청북도" >충청북도</form:option>
										<form:option value="전국" >전국</form:option>
									</form:select>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid29" class="ff_title i_b"><strong>급여</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<label for="inputid29" class="fl text ml10 mr10">연</label>
									<form:input type="number" path="etprice" class="input t1 fl w100"  />
									<label for="inputid29" class="fl text ml10 mr10">만원</label>
									<label class="fl text ml10 mr10">(기호(~ ,)없이 <font color = "red">숫자</font>만 입력)</label>
								</div>
							</div>
						</div>
						<%-- 2022.08.12 주석처리
						<div class="f_field div2">
							<label for="inputid30" class="ff_title i_b"><strong>상여금</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input type="number" path="etsprice" class="input t1 fl w100" />
									<label for="inputid30" class="fl text ml10 mr10">%</label>
								</div>
							</div>
						</div> --%>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid31" class="ff_title"><strong>업무내용</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="etcontents" class="input t1 fl"  />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title"><strong>복리후생</strong></div>
							<div class="ff_wrap ml120 text">
								<ul class="area">
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="국민연금" /> <label for="etwelAry1">국민연금</label></li>
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="고용보험" /> <label for="etwelAry2">고용보험</label></li>
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="의료보험" /> <label for="etwelAry3">의료보험</label></li>
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="산재보험" /> <label for="etwelAry4">산재보험</label></li>
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="주5일근무" /> <label for="etwelAry5">주 5일근무</label></li>
									<li class="fl mr20 p3"><form:checkbox path="etwelAry" class="mr5" value="주택자금" /> <label for="etwelAry6">주택자금</label></li>
									<li class="fl p3">
										<form:checkbox path="etwelAry" class="fl mt5 mr5" value="기타" /> <label class="fl mr10" for="etwelAry7">기타</label> 
										<label class="ti" for="checkbox1_19">메모 </label> <form:input path="etweltext" class="input t1 fl w500 ml10" />
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="box t3 bgs p10 pl15 text small mt10">
					<div class="area">
						<h4 class="title i_b_t6 bold">입사절차 및 제출서류 </h4>
					</div>
				</div>
				<div class="form">
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="inputid32" class="ff_title"><strong>입사절차</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<label for="epprocess1" class="fl text ml10 mr10">1차</label>
									<form:input path="epprocess1" class="input t1 fl w100"/>
									<label for="epprocess2" class="fl text ml10 mr10">2차</label>
									<form:input path="epprocess2" class="input t1 fl w100" />
									<label for="epprocess3" class="fl text ml10 mr10">3차</label>
									<form:input path="epprocess3"  class="input t1 fl w100" />
									<label for="epprocess4" class="fl text ml10 mr10">기타</label>
									<form:input path="epprocess4" class="input t1 fl w100" />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<div class="ff_title i_b"><strong>제출서류</strong></div>
							<div class="ff_wrap ml120 text">
								<ul class="area">
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="이력서"  class="mr5" /> <label for="eppaperAry1">이력서</label></li>
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="자기소개서" class="mr5" /> <label for="eppaperAry2">자기소개서</label></li>
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="영양사면허증사본" class="mr5" /> <label for="eppaperAry3">영양사면허증사본</label></li>
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="최종학교졸업(예정)증명서" class="mr5" /> <label for="eppaperAry4">최종학교졸업(예정)증명서</label></li>
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="최종학교성적증명서" class="mr5"/> <label for="eppaperAry5">최종학교성적증명서</label></li>
									<li class="fl mr20 p3"><form:checkbox path="eppaperAry" value="주민등록등본" class="mr5" /><label for="eppaperAry6">주민등록등본</label></li>
									<li class="fl p3">
										<form:checkbox path="eppaperAry" value="기타" class="fl mt5 mr5" /> <label class="fl mr10" for="checkbox1_26">기타</label> 
										<label class="ti" for="checkbox1_26">메모 </label> <form:input path="eppapertext"  class="input t1 fl w500 ml10"  />
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="epreport" class="ff_title"><strong>합격통보</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="epreport" class="input t1 fl w200"/>
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="epetc" class="ff_title"><strong>기타</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="epetc" class="input t1 fl" />
								</div>
							</div>
						</div>
					</div>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="bbs_file" class="ff_title"><strong>첨부파일</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<form:input path="bbs_file" type="file"  class="input t1 fl"/>
									<form:hidden path="bbs_file_name" />
									<form:hidden path="bbs_file_url" />
									<br />${employ.bbs_file_name}
									<br />
									<p class="fl text cp ml10">(첨부파일 크기제한 : 10MB)
									<br />첨부파일명이 긴 경우, 오류가 발생할 수 있으니 15글자 내로 작성해주세요.</p>
								</div>
							</div>
						</div>
					</div>
					<c:if test='${employ.crud == "C"}'>
					<div class="f_wrap line bb p8">
						<div class="f_field div1">
							<label for="epwd" class="ff_title i_b"><strong>비밀번호</strong></label>
							<div class="ff_wrap ml120">
								<div class="area">
									<input type="password" id="epwd" name="epwd" class="input t1 fl w200" autocomplete="new-password" readonly onfocus="this.removeAttribute('readonly');" placeholder="" style="background-color: white !important;"/>
									<p class="fl text cp ml10">작성한 내용의 수정, 삭제 시 필요합니다.</p>
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</div>
				
				
				<div class="btn_wrap mt40">
					<ul>
						<li><a href="javascript:f_sendIt()" class="btn big t1">완료</a></li>
						<c:if test='${employ.crud == "U" }'>
						<li><a href="javascript:f_delete()" class="btn big t2">삭제</a></li>
						</c:if>
						<li><a href="./kn_careers.do" class="btn big">취소</a></li>
					</ul>
				</div>
				
				
			</fieldset>
		</form:form>
		

		

		

		<!-- // 본문 끝 -->
	</div>
</div>
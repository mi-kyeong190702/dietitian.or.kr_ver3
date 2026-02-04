<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>대한영양사협회</title>

<script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

	});
	
	function doLogin()
	{
		var f = document.forms["form"];
		f.target = "proc";
		f.action = "com_login_userlogin.do";
		f.submit();
	}

	function doGetBoardList()
	{
		var p = $("#boardlist").val();
		if ( p != "" )
			$("#page").attr("src", "paper_board_list.do?bbsBoardCode="+p);
	}

	function doGetSession()
	{
		$("#sess").attr("src", "session.jsp");
	}

	function doIpin()
	{

	}

	function doPayment()
	{

	}

	function doPageMove()
	{
		var p = $("#pagelist").val();
		if ( p != "" )
			$("#page").attr("src", p);
	}
	
	function findPW()
	{
		var f = document.forms["form"];
		f.method ="POST";
		f.action = "user_findPW.do";
		f.submit();
	}
</script>

</head>

<body>

<iframe name="proc" id="proc" width="0" height="0" style="display:none;"></iframe>
<form name="form">
	<input type="text" size="10" name="userid" value="">
	<input type="button" onclick="javascript:doLogin()" value="로그인" >
	<input type="button" onclick="javascript:findPW()" value="ID/PW찾기" >
	
	<!-- page list -->
	<select id="pagelist" name="pagelist" onChange="javascript:doPageMove()">
		
		<option value="">----------- [ PAGE ] ------------</option>
		<option value="/login/index.do">[login]</option>
		
		<option value="">--------- [ WORK PAGE ] ----------</option>
		<!-- introduction -->
		<option value="">[introduction]</option>
		<option value="/work/introduction/ki_about.do">  >> ki_about</option>
		<!-- business -->
		<option value="/work/business/index.do">[business]</option>
		<!-- news -->
		<option value="/work/news/index.do">[news]</option>
		<!-- news -->
		<option value="/work/publication/index.do">[publication]</option>
		<!-- education -->
		<option value="/work/education/index.do">[education]</option>
		<!-- data -->
		<option value="/work/data/index.do">[data]</option>
		
	</select>

	<!-- board list -->
	<select id="boardlist" name="pagelist" onChange="javascript:doGetBoardList()">
		<option value="">[게시판 리스트]</option>
		<option value="0">새소식</option>
		<option value="2">공지사항</option>
		<option value="3">정책추진</option>
		<option value="4">음식물 쓰레기 자료실</option>
		<option value="5">KDA 토론마당</option>
		<option value="6">우리농산물 자료실</option>
		<option value="7">식품 영양 자료실</option>
		<option value="11">식품영양 모니터게시판</option>
		<option value="12">취업정보</option>
		<option value="13">국민영양</option>
		<option value="14">학술대회자료집</option>
		<option value="15">시청각자료_식생활개선</option>
		<option value="16">시청각자료_영양교육</option>
		<option value="17">시청각자료_위생</option>
		<option value="18">시청각자료_조리식품</option>
		<option value="19">시청각자료_교양환경</option>
		<option value="20">카페_정보공유게시판</option>
		<option value="21">카페_보고싶다친구야</option>
		<option value="22">카페_영양사이야기</option>
		<option value="23">카페_동호회전체공지사항</option>
		<option value="24">카페_동호회_건강상담영양사모임</option>
		<option value="25">카페_병원영양사모임</option>
		<option value="26">카페_급식전문업체 영양사모임</option>
		<option value="27">카페_전문영양사 모임</option>
		<option value="28">카페_보건소영양사모임</option>
		<option value="29">카페_사회복지시설영양사모임</option>
		<option value="30">카페_학교영양사모임</option>
		<option value="31">카페_산업체영양사모임</option>
		<option value="32">카페_상담영양사모임</option>
		<option value="33">카페_기독영양사모임</option>
		<option value="34">카페_회원 게시판</option>
		<option value="35">카페_자유게시판</option>
		<option value="36">카페_서울특별시영양사회</option>
		<option value="37">카페_부산광역시영양사회</option>
		<option value="38">카페_인천광역시영양사회</option>
		<option value="39">카페_경기도영양사회</option>
		<option value="40">카페_강원도영양사회</option>
		<option value="41">카페_충청북도영양사회</option>
		<option value="42">카페_대전충남영양사회</option>
		<option value="43">카페_전라북도영양사회</option>
		<option value="44">카페_광주전남영양사회</option>
		<option value="45">카페_대구경북영양사회</option>
		<option value="46">카페_경상남도영양사회</option>
		<option value="47">카페_울산광역시영양사회</option>
		<option value="48">카페_제주도영양사회</option>
		<option value="49">카페_동호회 신청게시판</option>
		<option value="50">교육과정안내_임상영양교육과정_교육후기</option>
		<option value="51">교육과정안내_산업보건영양사교육과정_교육후기</option>
		<option value="52">교육과정안내_급식경영영양사교육과정_교육후기</option>
		<option value="53">교육과정안내_주제별패키지교육과정_소아비만교육과정_교육후기</option>
		<option value="54">교육과정안내_주제별패키지교육과정_신장전문영양사교육과정_교육후기</option>
		<option value="55">교육과정안내_주제별패키지교육과정_당뇨전문영양사(기초) 교육과정_교육후기</option>
		<option value="56">교육과정안내_주제별패키지교육과정_당뇨전문영양사(고급) 교육과정_교육후기</option>
		<option value="57">교육과정안내_주제별패키지교육과정_영양지원 전문영양사 교육과정 _교육후기</option>
		<option value="58">교육과정안내_주제별패키지교육과정_영양상담 교육과정 _교육후기</option>
		<option value="59">교육과정안내_주제별패키지교육과정_영양상담 교육과정Ⅰ_교육후기</option>
		<option value="60">교육과정안내_주제별패키지교육과정_뇌·심혈관질환 교육과정_교육후기</option>
		<option value="61">교육과정안내_보수교육_교육후기</option>
		<option value="62">교육과정안내_푸드코디네이터교육과정_교육후기</option>
		<option value="63">회원자료실_급식경영</option>
		<option value="64">회원자료실_임상영양</option>
		<option value="65">회원자료실_영양교육</option>
		<option value="66">회원자료실_최신식품영양정보</option>
		<option value="67">KDA영양클리닉_질환별 식단</option>
		<option value="68">KDA영양클리닉_우리가족 영양관리_우리가족영양관리</option>
		<option value="69">서울특별시_공지사항</option>
		<option value="70">부산광역시_공지사항</option>
		<option value="71">인천광역시_공지사항</option>
		<option value="72">경기도_공지사항</option>
		<option value="73">강원도_공지사항</option>
		<option value="74">충청북도_공지사항</option>
		<option value="75">대전충남_공지사항</option>
		<option value="76">전라북도_공지사항</option>
		<option value="77">광주전남_공지사항</option>
		<option value="78">대구경북_공지사항</option>
		<option value="79">경상남도_공지사항</option>
		<option value="80">울산광역시_공지사항</option>
		<option value="81">제주도_공지사항</option>
		<option value="82">주제별 패키지 교육과정_암패키지 교육과정 후기</option>
		<option value="83">교육관련 서식</option>
		<option value="84">교육과정안내_주제별패키지교육과정_건강기능식품의 이해_교육후기</option>
		<option value="85">업무서식</option>
		<option value="86">위생교육</option>
		<option value="87">핫 이슈</option>
		<option value="88">건강증진정보실</option>
		<option value="89">KDA_Gallery</option>
		<option value="90">영양예보제</option>
		<option value="91">식품영양뉴스</option>
		<option value="92">식단및레시피</option>
		<option value="93">영양예보제게시판</option>
		<option value="94">영양교육 자료 회원 공동구매_문의 게시판</option>
		<option value="95">카페_유치원영양사모임</option>
		<option value="96">아동요리지도자교육과정_교육후기</option>
		<option value="97">교육과정안내_주제별패키지교육과정_임상영양사를위한뇌심혈관질환</option>
		<option value="98">교육과정안내_주제별패키지교육과정_임상영양사를위한암과영양관리</option>
		<option value="99">교육과정안내_주제별패키지교육과정_임상영양사를위한노인영양치료</option>
		<option value="100">위탁_단체급식조리</option>
		<option value="101">위탁_한국병과</option>
		<option value="104">건강밥상이벤트</option>
		<option value="105">소문내기 이벤트</option>
		<option value="106">카페_경찰서</option>
		<option value="107">회원자료실_생생 영양.급식 정보</option>
		<option value="108">카페_어린이급식관리지원센터영양사</option>
		<option value="109">교육과정안내_노인영양사교육과정_교육후기</option>
		<option value="110">교육과정안내_스포츠영양사교육과정_교육후기</option>
		<option value="111">월요 한돈요리 레시피</option>
		<option value="112">한돈 정보</option>
	</select>

	<input type="button" onclick="javascript:doGetSession()" value="세션값" >
	<input type="button" onclick="javascript:doIPin()" value="i-pin" >
	<input type="button" onclick="javascript:doPayment()" value="결제" >

	<br>
	<br>
	
	<iframe src="#" name="page" id="page" width="800" height="600"></iframe>
	<iframe src="#" name="sess" id="sess" width="400" height="600"></iframe>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

function f_Send() {
	if (document.join.name.value == ""){
		alert("성명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if (document.join.tel.value == "") {
		document.join.tel.focus();
		alert("연락처를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}


	if (document.join.tel.value == "") {
		document.join.tel.focus();
		alert("연락처를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}


	if(join.email.value.length >= 3) {
		var atsign = document.join.email.value.indexOf('@');
		var period = document.join.email.value.lastIndexOf('.');
		var space  = document.join.email.value.indexOf(' ');
		var length = document.join.email.value.length - 1;
	
		if (( atsign < 1 ) || ( period <= atsign + 1 ) || ( period == length ) ||( space  != -1 )) {
			alert ("이메일 형식이 잘못되었습니다.바르게 기입해 주시길 바랍니다.");
			document.join.email.value='';
			document.join.email.focus();
			return;
		}
	
	}

	if (document.join.school.value == ""){
		document.join.school.focus();
		alert("학교명을 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}
	
	if (document.join.major.value == ""){
		document.join.major.focus();
		alert("학과를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	if (document.join.pers_add.value == ""){
		document.join.pers_add.focus();
		alert("주소를 입력하지 않으셨습니다\n다시 확인하시고 입력해 주시길 바랍니다.");
		return;
	}

	document.join.submit();
}

function openJusoPopup() {
	var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack( roadFullAddr
				 , roadAddrPart1
				 , addrDetail
				 , roadAddrPart2
				 , engAddr
				 , jibunAddr
				 , zipNo
				 , admCd
				 , rnMgtSn
				 , bdMgtSn) {
	document.join.pers_add.value 		= roadAddrPart1 + addrDetail + " " + roadAddrPart2;	
//	document.join.code_post.value 		= zipNo.substring(0,3) + zipNo.substring(4,7);
	document.join.code_post.value 		= zipNo.substring();
}

</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">취업설명회</mark> 신청서</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">KDA 소식</a></li>
				<li><a href="/work/news/kn_job.do" class="cm">취업설명회 신청서</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
	
		<!-- // CONTENT -->
			<form name="join" method="post" action="./kn_job_action.do">
			<div class="form line bt bcm bw2">
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>이 름</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="name" id="name" class="input t1 w150" value="" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>생년월일</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="pers_no" id="pers_no" class="input t1  w150" value="" />
								<em class="ml10">예)1980년 7월 16일 → 800716 </em>
							</div>
						</div>
					</div>
				</div>	
					
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>연락처</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="tel" id="tel" class="input t1  w200"  maxlength="14"/>
							</div>
						</div>
					</div>
				</div>	
		
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>E-mail 주소</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="email" id="email" class="input t1 w200" value="" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid16" class="ff_title i_b"><strong>주소</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input name="code_post" id="code_post" class="input t1 fl w150" onclick="javascript:openJusoPopup();" readonly="readonly" />
								<a href="javascript:openJusoPopup();" class="btn form t1 fl ml5">주소검색</a>
								<p class="fl text cp ml10">주소검색(우편번호) : - 없이 한 칸으로 만들어주세요.</p>
							</div>
							<div class="area mt5">
								<label for="inputid17" class="ti">상세주소</label> 
								<input name="pers_add" id="pers_add" class="input t1"  /> <br />
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>학교명</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="school" id="school" class="input t1 w200" value="" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="f_wrap line bb p8">
					<div class="f_field div1">
						<label for="inputid1" class="ff_title i_b"><strong>학과</strong></label>
						<div class="ff_wrap ml120">
							<div class="area">
								<input type="text" name="major" id="major" class="input t1 w200" value="" />
							</div>
						</div>
					</div>
				</div>
				
			</div>
			</form>
			
			<div class="mt10 mb10 center">※ 최소 기재사항이므로 빠짐없이 기입해주시기 바랍니다</div>
	
			<div class="btn_wrap mt40">
				<ul>
					<li><a href="javascript:f_Send();" class="btn big t1">완료</a></li>
					<li><a href="javascript:document.join.reset();" class="btn big">취소</a></li>
				</ul>
			</div>
								
		<!-- // END OF CONTENT -->			
	</div>
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="func" 		uri="/WEB-INF/tld/kda-func.tld" %>
<script>
function f_changeLic() {
	var licNo = $("#lic_no").val().trim();
	var prev_lic_no = $("#prev_lic_no").val();
	
	if( licNo == "" ) {
		alert("면허번호를 입력하여 주십시요");
		return;
	}
	
	if( licNo == prev_lic_no ) {
		alert("변경할 면허번호를 입력하여 주십시요.");
		return;
	}
	
	
	if( confirm("면허번호를 수정하시겠습니까?") ) {
		$.ajax({
			url : "kn_ajax_license.do",
			method: "POST",
			data : { licNo : licNo },
			success : function(data) {
				if( data == '3') {
					alert("수정 중 오류가 발생하였습니다");
				} else {
					alert(data);
				}
			},
			error:function() {
				alert("처리 중 오류가 발생하였습니다");
			}			
		});
	}
	
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">영양사</mark>카드</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/news/kn_notice.do?bbs_board_code=2">KDA 소식</a></li>
				<li><a href="/work/news/kn_info_license.do">영양사카드</a></li>
				<li><a href="/work/news/kn_license.do" class="cm">영양사카드발급신청</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
						<h4 class="title bold t2 cm s1 i_b_t2">영양사카드 발급 신청</h4>
		</div>

		<form name="frmLic" method="post" action="kn_license.do">
		<fieldset>
							<legend><span class="ti">영양사카드 발급신청 정보입력</span></legend>
							<div class="box t2 bgs mt20 p20 text">
								<div class="area">
									<div class="box t1 r5 p10">
										<div class="mt10 mb20 text small s1 ca">
											<div class="middle cb bold mr10">확인해 주세요</div>
											<span>영양사카드에는 영양사 면허번호가 기재되어 발급됩니다. <br />
											면허번호를 확인하시고 면허번호가 틀린 경우 수정하신 후 발급신청을 해주시기 바랍니다.</span>
										</div>
										<div class="form line bt bcm">
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid1" class="ff_title i_b"><strong>성명</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															${person.pers_name}
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="inputid2" class="ff_title i_b"><strong>생년월일</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															${func:formatDayKo(person.pers_birth)}
														</div>
													</div>
												</div>
											</div>
											<div class="f_wrap line bb p8">
												<div class="f_field div1">
													<label for="lic_no" class="ff_title i_b"><strong>면허번호</strong></label>
													<div class="ff_wrap ml120">
														<div class="area">
															<input type="hidden" name="prev_lic_no" id="prev_lic_no" value="${person.lic_no}"/>
															<input type="text" class="input t1 fl w200" name="lic_no" id="lic_no" onkeypress="onlyNumber()" value="${person.lic_no}" maxlength="6"/>
															<a href="javascript:f_changeLic();" class="btn form p5 t1 fl ml5">수정하기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="btn_wrap mt30">
								<ul>
									<li><a href="http://www.shinhancard.com/servlet/cards/applyStipulationJ?EntryLoc=625" target="_blank" class="btn big t1 wide" title="새창으로 이동">발급신청</a></li>
								</ul>
							</div>
						</fieldset>
		</form>
		
	</div>
</div>

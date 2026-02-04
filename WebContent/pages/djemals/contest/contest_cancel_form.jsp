<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(idx,crud){

	if(crud == "U"){
		location.href="contestCancelAction.do?idx="+idx+"&crud=U";
	}else if(crud == "D"){
		if( confirm("정말 삭제하시겠습니까?") ) {
			location.href="contestCancelAction.do?checkIdx="+idx+"&crud=D";
		}
	}
	
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<div class="area mt15">
				<h4 class="title t3 bold s1"><mark class="cm">예약등록 </mark>취소요청서</h4>
			</div>
			<div class="form box t2 p10 mt10">
				<div class="box t1 p10 mt5">
					<div class="f_wrap">
						<div class="f_field">
							<div class="ff_title pt8"><strong>인적사항</strong></div>
							<div class="ff_wrap ml120">
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w80 text bold">이름</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.name }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w80 text bold">면허번호</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.lic_no }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w80 text bold">근무처명</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.office_name }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w80 text bold">연락처<br>(핸드폰)</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.tel_hp }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w100 text bold">입금액</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.in_payPrice }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w100 text bold">참여방법</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.online_yn }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line p8">
									<div class="f_field div2">
										<strong class="fl w100 text bold">취소일자</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
													${contest.del_date }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w100 text bold">취소금액</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.del_price }
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="f_field line bt ">
							<div class="ff_title pt8"><strong>예금주</strong></div>
							<div class="ff_wrap">
								<div class="f_wrap p8">
									<div class="ff_wrap ml120 text">
										<div class="area">
											 <strong class="cp">  (* 본인명의 통장만 가능)</strong>
											 ${contest.bank_userName }
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="f_field line bt bb">
							<div class="ff_title"><strong>환불계좌</strong></div>
								<div class="ff_wrap ml120">
									<div class="f_field div2">
										<strong class="fl w80 text bold">은행명</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.bank_name }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w80 text bold">계좌번호</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.bank_num}
											</div>
										</div>
									</div>
								</div>
						</div>
						
					</div>
				</div>
			</div>

			<div class="btn_wrap mt40">
				<ul class="fl">
					<li><a href="contestCancelList.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_action(${contest.idx },'U');" class="btn big t1">완료처리</a></li>
					<li><a href="javascript:f_action(${contest.idx },'D');" class="btn big t1">삭제하기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

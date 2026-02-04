<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="kda" 		uri="/WEB-INF/tld/kda.tld" %>
<%@ taglib prefix="kdaFunc" 	uri="/WEB-INF/tld/kda-func.tld" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form" %>
<script>

function	 f_action(idx){
	

	if( confirm("정말 삭제하시겠습니까?") ) {
		location.href="contestAction.do?checkIdx="+idx;
	}
	
}

</script>
<div id="adm_contents">
	<div class="c_page">
		
		<%@ include file ="/pages/djemals/common/common_header.jsp"%>
		<div class="cp_contents">
			<div class="area mt15">
				<h4 class="title t3 bold s1"><mark class="cm">참가</mark>신청서</h4>
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
										<strong class="fl w80 text bold">구분</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												<c:choose>
													<c:when test="${contest.member_flag=='0'}">비회원</c:when>
													<c:when test="${contest.member_flag=='1'}">회원</c:when>
													<c:otherwise>미선택</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w80 text bold">면허번호</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.lic_no }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w80 text bold">생년월일</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.birth }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w100 text bold">근무처명(학교명)</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.office_name }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w100 text bold">전화번호</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.tel }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w100 text bold">핸드폰</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.tel_hp }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<div class="f_field div2">
										<strong class="fl w100 text bold">소속지부</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
													${contest.branch_name }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w100 text bold">소속분과</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.big_name }
											</div>
										</div>
									</div>
									
									<div class="f_field div2">
										<strong class="fl w100 text bold">센터구분</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.sect_name }
											</div>
										</div>
									</div>
								</div>
								<div class="f_wrap line bb p8">
									<ul>
										<li>
											<div class="f_field div2">
												<strong class="fl w80 text bold">운영형태</strong>
												<div class="ff_wrap ml120 mt8">
													<div class="ff_wrap text">
														<c:choose>
															<c:when test="${contest.gtype=='a'}">직영</c:when>
															<c:otherwise>위탁</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="f_field div2">
												<strong class="fl w80 text bold">이메일</strong>
												<div class="ff_wrap ml120">
													<div class="ff_wrap text">
														${contest.email }
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="f_wrap p8">
									<div class="f_field div1">
										<strong class="fl w120 text bold">자택주소</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												(${fn:substring(contest.zip, 0, 3) } - ${fn:substring(contest.zip, 3, 6) }) 
											</div>
											<div class="ff_wrap text">
												${contest.addr }
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="f_field line bt ">
							<div class="ff_title pt8"><strong>참가일자</strong></div>
							<div class="ff_wrap">
								<div class="f_wrap p8">
									<div class="ff_wrap ml120 text">
										<div class="area">
											<c:choose>
												<c:when test="${contest.join_flag=='1'}">7월 24일(목)</c:when>
												<c:when test="${contest.join_flag=='2'}">7월 25일(금)</c:when>
												<c:when test="${contest.join_flag=='3'}">7월 24일(목), 7월 25일(금)</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="f_field line bt ">
							<div class="ff_title pt8"><strong>입금자명</strong></div>
							<div class="ff_wrap">
								<div class="f_wrap p8">
									<div class="ff_wrap ml120 text">
										<div class="area">
											${contest.baccname }
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="f_field line bt bb">
							<div class="ff_title"><strong>입금내역</strong></div>
							<div class="ff_wrap ml120">
									<div class="f_field div2">
										<strong class="fl w80 text bold">입금(예정)일</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												${contest.pay_date }
											</div>
										</div>
									</div>
									<div class="f_field div2">
										<strong class="fl w80 text bold">입금액</strong>
										<div class="ff_wrap ml120">
											<div class="ff_wrap text">
												<fmt:formatNumber value="${contest.pay_amount}" pattern="#,###.##원"/>
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
					<li><a href="contestList.do" class="btn big">목록</a></li>
				</ul>
				<ul class="fr">
					<li><a href="javascript:f_action('${contest.idx }');" class="btn big t1">삭제</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

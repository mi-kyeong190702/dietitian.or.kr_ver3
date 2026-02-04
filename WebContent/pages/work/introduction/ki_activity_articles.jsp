<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">활</mark>동</h3>
		</div>
		
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/introduction/ki_intro.do">협회 소개</a></li>
				<li><a href="/work/introduction/ki_intro.do">대한영양사협회 소개</a></li>
				<li><a href="/work/introduction/ki_activity.do" class="cm">활동</a></li>
			</ul>
		</div>
	</div>
	
	<hr />
	
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
				<div class="tab t2 div5">
					<ul>
						<li><a href="/work/introduction/ki_activity.do">대한영양사협회 활동</a></li>
						<li><a href="/work/introduction/ki_activity_history.do">대한영양사협회 회관</a></li>
						<li><a href="/work/introduction/ki_activity_transition.do">연혁</a></li>
						<li><a href="/work/introduction/ki_activity_plan.do">사업계획</a></li>
						<li><a href="/work/introduction/ki_activity_articles.do" class="on">정관</a></li>
					</ul>
				</div>
				
				<h4 class="title bold t2 cm s1 i_b_t2 mt50">대한영양사협회 정관</h4>
				
				<div class="mt30">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 1 장 총 칙</h5>
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제1조(명칭)
							<mark class="text small cb mb10"> ① 본 회는 사단법인 대한영양사협회(이하 ‘본 회’라 한다)라 칭한다.</mark>								
						</li>
						<li>② 본 회의 영문표기는 THE KOREAN DIETETIC ASSOCIATION으로 하고, 약칭은 KDA라 한다.</li>
						
						<li class="bold cb mt20">제2조(목적)
							<mark class="text small cb mb10"> 본 회는 국민건강과 사회복지 증진에 기여하고, 보건 및 의료 향상에 이바지하며, 영양사 및 식품·영양·보건·의료에 관한 연구, <br /> 홍보활동과 영양사 교육을 통한 자질향상, 회원의 권익옹호를 목적으로 한다.</mark>
						</li>
						
						<li class="bold cb mt20">제3조(사무소) 
							<mark class="text small cb m5 mb10">본 회의 주된 사무소는 서울특별시 영등포구 63로 40, 202호(여의도동)에 둔다.</mark>
						</li>
						
						<li class="bold cb mt20">제4조(지부)
							<mark class="text small cb mb10">
								① 본 회는 각 시·도에 지부를 둘 수 있다.</mark>
						</li>
						<li>② 지부는 본 회의 승인을 받아 분회를 설치할 수 있다.</li>
						
						<li class="bold cb mt20">제5조(사업의 종류) 
							<mark class="text small cb m5 mb10">본 회는 제2조의 목적을 달성하기 위하여 다음과 같은 사업을 수행한다.</mark>
							<ol class="text small m5 mb10 liststyle in decimal">
								<li>국민영양 향상과 식생활 개선을 위한 조사·연구 및 홍보에 관한 사항</li>
								<li>식품영양학의 발전과 식품영양학교육의 향상에 관한 사항</li>
								<li>영양사의 권익 옹호와 지위 향상, 복지에 관한 사항</li>
								<li>영양사 보수교육, 식품위생교육, 직무교육 등 자질향상에 관한 사항</li>
								<li>식품영양관계 기관지·학술지 및 교육매체 발간에 관한 사항</li>
								<li>식품영양관계 대국민 교육·홍보·캠페인 및 사회공헌사업에 관한 사항</li>
								<li>영양관계 업무개선 및 조사·연구에 관한 사항</li>
								<li>영양사 업무 관련 산업 안전 및 보건관계 업무개선 및 조사·연구에 관한 사항</li>
								<li>식품의 품질 향상을 위한 조사·연구에 관한 사항</li>
								<li>식품 및 조리실 위생·안전의 조사·연구·사업에 관한 사항</li>
								<li>영양사 실태등의 신고 등에 관한 사항</li>
								<li>영양사 적정 배치를 위한 조사·연구에 관한 사항</li>
								<li>식품영양학 연구·조사 및 학술발전에 관한 사항</li>
								<li>국제영양사단체와의 협조 및 학술교류에 관한 사항</li>
								<li>평생교육시설 설치 및 운영에 관한 사항</li>
								<li>관계기관과의 상호협조 및 교류, 건의 및 자문에 관한 사항</li>
								<li>주무관청으로부터 위탁받은 사항</li>
								<li>기타 본회의 목적 달성을 위하여 필요한 사업</li>
							</ol>
						</li>
						<li class="bold cb mt20">제5조의2(수익사업)
							<mark class="text small cb mb10">
								① 본 회는 제2조의 목적과 제5조의 사업목적을 달성하기 위하여 필요한 때에는 이사회의 의결을 거쳐 그 본질에 반하지 않는 범위내에서 수익사업을 할 수 있다.</mark>
						</li>
						<li>② 수익사업은 목적사업과 분리하여 운영하고, 이익금은 본회의 목적사업에 충당하거나 이사회의 의결에 따라 특정한 기금으로 적립하여야 하며, 기타 다른 용도로는 사용 할 수 없다.</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 2 장 회 원</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제6조(회원의 구분 및 자격)
						<mark class="text small cb mb10">① 본 회의 회원은 정회원, 학생회원, 특별회원, 명예회원으로 구분한다.</mark>
						</li>
						<li>② 회원의 자격은 다음과 같다.</li>
						<li>1. 정회원 : 대한민국 영양사면허를 취득한 자</li>	
						<li>2. 학생회원 : 식품영양(학)과(영양(학)과 등 영양사 자격시험관련 학과 포함) 재학생으로서 본 회의 활동에 동참하기를 원하는 자</li>
						<li>3. 특별회원 : 본 회의 목적을 같이 하고 식품영양학의 발전을 위해 상호협력이 필요한 연구․교육․기타 실무에 종사하는 자 및 단체로서 이사회의 승인을 얻은 자 및 단체</li>
						<li>4. 명예회원 : 본 회의 발전을 위하여 현저한 공로가 있거나 식품영양학에 관한 학식과 경험이 많은 자로 회장의 추천에 의하여 이사회의 승인을 얻은 자</li>
						<li class="bold cb mt20">제7조(회원의 가입)
						<mark class="text small cb mb10">
								① 본 회의 회원이 되고자 하는 자는 각 회원자격기준에 따라 입회원서를 제출하고 입회절차를 필한 자로 한다.</mark>
						</li>
						<li>② 회원의 가입에 관한 사항은 별도의 규정으로 정한다.</li>
						<li class="bold mt20">제8조(회원의 의무와 권리)
						<mark class="text small cb mb10">
								① 본 회의 회원은 다음 각 호의 의무를 가진다.
										</mark>
						</li>
						<li>1. 회원은 정관 및 관계규정을 준수하여야 한다.</li>
						<li>2. 회원은 입회금(학생회원 제외), 연회비, 기타 부담금을 납부하여야 한다.</li>
						<li>3. 정회원 중 국민영양관리법령 및 식품위생법령에서 정한 교육대상자는 법령에서 정하는 교육을 받아야 한다.</li>
						<li>4. 명예회원은 제2호와 제3호의 의무가 면제된다.</li>
						<li>② 본 회의 회원은 다음 각 호의 권리를 가진다.</li>
						<li>1. 정회원은 임원 및 대의원의 선거권과 피선거권 및 의결권</li>
						<li>2. 특별회원과 명예회원은 위원의 피임명권</li>
						<li>③ 임명직 이사 및 감사는 정회원이 아닌 자로 할 수 있으며, 이에 관하여 필요한 사항은 별도의 규정으로 정한다.</li>
						<li class="bold cb mt20">제9조(회비)
							<mark class="text small cb m5 mb10">본 회의 입회비, 연회비와 기타 부담금의 액수 및 납부방법에 관하여 필요한 사항은 대의원총회의 의결을 거쳐서 별도의 규정으로 정한다.</mark>
						</li>
						<li class="bold cb mt20">제10조(자격 상실과 재취득)
							<mark class="text small cb m5 mb10">회원의 자격 상실과 재취득에 관한 사항은 별도의 규정으로 정한다.</mark>
						</li>
						<li class="bold cb mt20">제11조(평생회원제도)
							<mark class="text small cb m5 mb10">본 회는 필요시 대의원총회의 의결을 거쳐 평생회원제도를 실시할 수 있다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 3 장 임 원</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제12조(임원의 종류와 정수)
							<mark class="text small cb m5 mb10">본 회는 다음의 임원을 둔다.</mark>
						</li>
						<li>1. 회장 : 1명</li>
						<li>2. 부회장 : 6명</li>
						<li>3. 이사 : 29명
							<ol class="text small m5 mb10">
								<li>①  당연직 : 분과위원회 비례대표 7명</li>
								<li>② 선거직 : 20명(회장, 부회장 포함)</li>
								<li>③ 임명직 : 2명</li>
							</ol>
						</li>
						<li>4. 지부장 : 13명 이내</li>
						<li>5. 감사 : 2명</li>
						
						<li class="bold cb mt20">제13조(임원의 선임 및 자격)
							<mark class="text small cb m5 mb10">① 선거직 임원은 대의원총회에서 선출한다. 다만, 대의원총회에서 선출된 임원의 결원시 보궐임원은 이사회에서 선임하며, 차기 대의원총회에 보고한다.</mark></li>
								<li>② 임원의 선거 및 자격에 관하여 기타 필요한 사항은 별도의 규정으로 정한다.</li>
								<li>③ 임원을 선임한 때에는 보건복지부장관에게 보고한다.</li>
						
						<li class="bold cb mt20">제14조(임원의 임기)
							<mark class="text small cb m5 mb10">① 임원의 임기는 2년으로 하며 연임할 수 있다. 단, 본 회, 지부 및 독립적인 운영을 하는 분과위원회의 회장은 1회에 한하여만 연임이 가능하고, 그 이후 다시 동일한 직의 회장이 될 수 없다.</mark></li>
								<li>② 보궐된 임원의 임기는 전임자의 잔임기간으로 하고, 차기임기부터 제1항의 규정을 적용받는다.</li>
								
						<li class="bold cb mt20">제15조(임원의 직무)
							<mark class="text small cb m5 mb10">① 회장은 본 회를 대표하고, 제반사무를 총괄하며, 대의원총회 및 이사회, 대표자회의의 의장이 된다.</mark>
						</li>
								<li>② 부회장은 회장을 보좌하며, 회장 유고시 또는 회장의 위촉에 의하여 그 직무를 대행한다.</li>
								<li>③ 이사는 이사회의 구성원이 되며, 이사회에 출석하여 의결권을 갖는다.</li>
								<li>④ 감사는 다음의 직무를 수행한다.<br /></li>
								<li>1. 본 회의 재산상황과 회계를 감사하는 일</li>
								<li>2. 이사회의 운영과 그 업무에 관한 사항을 감사하는 일</li>
								<li>3. 제1호 및 제2호의 감사결과 부정 또는 불미한 점이 있음을 발견한 때 이를 대의원총회와 주무관청에 보고하는 일</li>
								<li>4. 그 밖에 이사회 운영과 그 업무에 관한 사항에 대하여 이사회에 참석하여 의견을 진술하는 일</li>
								
						<li class="bold cb mt20">제16조(명예회장)
							<mark class="text small cb m5 mb10">① 본 회는 본 회 회장을 역임한 자 중에서 명예회장을 둘 수 있다.</mark>
						</li>
								<li>② 명예회장은 이사회의 추천으로 대의원총회에서 의결한다.</li>
						
						<li class="bold cb mt20">제17조(자문위원)
							<mark class="text small cb m5 mb10">① 본 회는 회장이 본 회의 운영에 관한 자문을 받기 위하여 이사회의 추천으로 약간명의 자문위원을 둘 수 있다.</mark>
						</li>
								<li>② 자문위원은 회장의 자문에 응하며, 이사회에 출석하여 의견을 발표할 수 있다.</li>
						
						<li class="bold cb mt20">제18조(고문)
							<mark class="text small cb m5 mb10">본 회는 본 회의 업무 수행을 위하여 이사회의 의결에 의하여 약간명의 고문을 추대할 수 있다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 4 장 대 의 원 총 회</h5>			
					</div>
					
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제19조(대의원총회의 구성 및 구분)
							<mark class="text small cb m5 mb10">
								① 대의원총회는 대의원으로 구성하며, 대의원총회의 의장은 회장이 된다.</mark></li>
								<li>② 대의원총회는 정기총회와 임시총회로 구분한다.</li>
							
						<li class="bold cb mt20">제20조(정기대의원총회)
							<mark class="text small cb m5 mb10">정기대의원총회는 연 1회 회장이 소집한다.</mark>
						</li>
						
						<li class="bold cb mt20">제21조(임시대의원총회)
							<mark class="text small cb m5 mb10">임시대의원총회는 이사 3분의 2 이상의 소집 요구 또는 대의원 과반수의 소집 요구에 의하여 회장이 소집한다.</mark>
						</li>
						
						<li class="bold cb mt20">제22조(대의원 선임 및 자격)
							<mark class="text small cb m5 mb10">① 본 회의 당연직 대의원은 임원 및 현직과 직전 각 지부장이 자동적으로 된다.</mark>
						</li>
								<li>② 선거직 대의원은 각 지부가 본 회에 보고한 정기대의원총회 개최 예정일 기준 전년도 12월말 회원수 비례로 선출된 자가 된다.</li>
								<li>③ 대의원 선거 및 자격에 관하여 기타 필요한 사항은 별도의 규정으로 정한다.</li>
								<li>④ 각 지부장은 대의원의 명단을 총회 개최 전까지 본 회에 제출하여야 한다.</li>
						
						<li class="bold cb mt20">제23조(대의원의 임기)
							<mark class="text small cb m5 mb10">대의원의 임기는 1년으로 하되, 임기의 기준은 정기대의원총회 개최일로부터 다음 해의 정기대의원총회 전일까지로 하며, 보선된 대의원의 임기는 그 잔여기간으로 한다.
							당연직 대의원은 그 임기가 끝날 때까지 대의원으로 한다.</mark>								
						</li>
						
						<li class="bold cb mt20">제24조(신임장)
							<mark class="text small cb m5 mb10">대의원은 대의원총회 출석시 각기 소속 지부장이 발행한 신임장을 제출하여야 한다.</mark>								
						</li>
						
						<li class="bold cb mt20">제25조(대의원총회의 소집과 절차)
							<mark class="text small cb m5 mb10">대의원총회는 회의 개최 2주전까지 회의 목적사항과 장소 및 일시를 기재하여 서면으로 회장이 소집한다. 단 필요시 서면을 전자우편으로 대체할 수 있다.</mark>								
						</li>
						
						<li class="bold cb mt20">제26조(대의원총회의 개의와 의결 정족수)
							<mark class="text small cb m5 mb10">① 대의원총회는 이 정관에서 따로 정한 바를 제외하고는 재적대의원 과반수의 출석으로 개의하고, 출석대의원 과반수로서 의결한다.</mark>
						</li>
								<li>② 회의에 출석하지 못하는 대의원은 그 출석 및 의결권을 다른 대의원에게 위임할 수 있다.</li>
								<li>③ 대의원이 대리할 수 있는 인원은 1명에 한하며, 대리인은 그 대리를 증명하는 서면을 회장에게 제출하여야 한다.</li>
							
						<li class="bold cb mt20">제27조(대의원총회의 의결사항)
							<mark class="text small cb m5 mb10">대의원총회는 다음 각 호의 사항을 의결한다.</mark>	
						</li>
								<li>1. 정관 변경에 관한 사항</li>
								<li>2. 청산 및 해산에 관한 사항</li>
								<li>3. 사업계획 및 예산·결산에 관한 사항</li>
								<li>4. 임원의 선출 및 해임에 관한 사항</li>
								<li>5. 재산 취득 및 처분에 관한 사항</li>
								<li>6. 이사회, 대표자회의에서 상정하는 사항</li>
								<li>7. 기타 본 회 운영에 중요한 사항</li>
	
						<li class="bold cb mt20">제28조(대의원총회의 회의록)
							<mark class="text small cb m5 mb10">① 대의원총회에 관하여 회의록을 작성하고 비치한다.</mark>
						</li>
								<li>② 대의원총회 회의록에는 의사의 경과, 요령 및 결과를 기재하고, 당해 출석 대의원 중 기명날인    대의원으로 선출된 2명의 대의원이 기명날인 및 간인하여야 한다.</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 5 장 대 표 자 회 의</h5>
					</div>
					
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제29조(대표자회의의 구성) 
							<mark class="text small cb m5 mb10">대표자회의는 이사, 지부장으로 구성하고, 회장이 이를 소집하여 그 의장이 된다.</mark>
						</li>
						
						<li class="bold cb mt20">제30조(대표자회의의 개의와 의결 정족수) 
							<mark class="text small cb m5 mb10">대표자회의는 구성원 과반수 이상의 출석으로 성립하고 출석인원의 과반수로서 의결한다.</mark>
						</li>
						
						<li class="bold cb mt20">제31조(대표자회의의 소집등)
							<mark class="text small cb m5 mb10">① 대표자회의는 정기 및 임시 대표자회의로 구분하고, 회장이 이를 소집한다. 대표자회의의 소집 시기에 관하여 필요한 사항은 별도의 규정으로 정한다.</mark>
						</li>
								<li>② 대표자회의에 참석하지 못하는 임원은 제26조 제2항과 제3항의 규정을 준용한다.</li>
						
						<li class="bold cb mt20">제32조(대표자회의의 의결사항)
							<mark class="text small cb m5 mb10">대표자회의는 다음 각 호의 사항을 의결한다.</mark>	
						</li>
								<li>1. 임원선거규정의 변경에 관한 사항</li>
								<li>2. 선거직임원 후보의 추천 인원 초과시 후보 선정에 관한 사항</li>
								<li>3. 기타 본 회의 임원 선거에 대해 이사회에서 위임한 사항</li>
								<li>4. 기타 필요하다고 인정되는 사항</li>
	
						<li class="bold cb mt20">제33조(대표자회의의 회의록)
							<mark class="text small cb m5 mb10">① 대표자회의 회의에 관하여 회의록을 작성하고 비치한다.</mark>
						</li>
								<li>② 대표자회의 회의록에는 의사의 경과, 요령 및 결과를 기재하고, 당해 출석 이사 중 기명날인 대표자로 선출된 2명의 대표자가 기명날인 및 간인하여야 한다.</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 6 장 이 사 회</h5>
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제34조(이사회의 구성)
							<mark class="text small cb m5 mb10">이사회는 이사로 구성하고, 회장이 이를 소집하여 그 의장이 된다.</mark>
						</li>
						
						<li class="bold cb mt20">제35조(이사회의 개의와 의결 정족수)
							<mark class="text small cb m5 mb10">이사회는 이사 과반수 이상의 출석으로 성립하고 출석 이사 과반수로서 의결한다.</mark>
						</li>	
						
						<li class="bold cb mt20">제36조(이사회의 소집등)
							<mark class="text small cb m5 mb10">① 이사회는 정기 및 임시 이사회로 구분하고, 회장이 이를 소집한다. 이사회의 소집 시기에 관하여 필요한 사항은 별도의 규정으로 정한다.</mark>
						</li>
								<li>② 이사회에 참석하지 못하는 이사는 제26조 제2항과 제3항의 규정을 준용한다.</li>
						
						<li class="bold cb mt20">제37조(이사회의 의결사항)
							<mark class="text small cb m5 mb10">이사회는 다음 각 호의 사항을 의결한다.</mark>	
						</li>
								<li>1. 대의원총회에서 위임된 사항</li>
								<li>2. 사업계획안과 예산안에 관한 사항</li>
								<li>3. 예산의 개정, 사업계획의 수정에 관한 사항</li>
								<li>4. 명예회장, 자문, 고문, 명예회원, 특별회원 추대에 관한 사항</li>
								<li>5. 사무국의 관리에 관한 사항</li>
								<li>6. 임원선거규정외 사무국 제규정 및 지부 회칙 등의 인준에 관한 사항</li>
								<li>7. 상임위원회 및 특별위원회 구성에 관한 사항</li>
								<li>8. 회원의 표창 및 징계에 관한 사항</li>
								<li>9. 재산 취득 및 처분에 관한 사항(차기 대의원총회의 추인을 받아야 함)</li>
								<li>10. 기타 필요하다고 인정되는 사항</li>
	
						<li class="bold cb mt20">제38조(이사회의 회의록)
							<mark class="text small cb m5 mb10">① 이사회 회의에 관하여 회의록을 작성하고 비치한다.</mark>
						</li>
								<li>② 이사회 회의록에는 의사의 경과, 요령 및 결과를 기재하고, 당해 출석 이사 중 기명날인  이사로 선출된 2명의 이사가 기명날인 및 간인하여야 한다.</li>
						
						<li class="bold cb mt20">제39조(이사의 출석 의무)
							<mark class="text small cb m5 mb10">이사가 이사회에 사전 통보없이 연 1/3이상 불참시는 자동적으로 자격을 상실한다. 이 경우 해당 이사에게 이 사실을 서면으로 통보하여야 한다.</mark>
						</li>	
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 7 장 위 원 회</h5>
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제40조(위원회)
							<mark class="text small cb m5 mb10">① 본 회 사업의 효율적인 수행을 위하여 운영위원회, 분과위원회, 윤리위원회, 특별위원회를 둔다.</mark>
						</li>
								<li>② 위원회의 조직과 그 운영에 관하여 필요한 사항은 별도의 규정으로 정한다.</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 8 장 사 무 국</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제41조(사무국)
							<mark class="text small cb m5 mb10">① 본 회의 업무를 수행하기 위하여 회장 책임 하에 사무국을 둔다.</mark>
						</li>
								<li>② 사무국의 직제와 직원의 근로기준에 관하여 필요한 사항은 별도의 규정으로 정한다.</li>
								<li>③ 기타 본회의 사무를 집행하기 위하여 필요한 사항은 별도의 규정으로 정한다.</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 9 장 지 부</h5>
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제42조(회칙)
							<mark class="text small cb m5 mb10">각 지부는 정관 범위 내에서 각기 회칙을 제정하고 본 회의 인준을 받아야 한다.</mark>
						</li>
						
						<li class="bold cb mt20">제43조(명칭)
							<mark class="text small cb m5 mb10">지부의 명칭은 사단법인 대한영양사협회 각 시·도 영양사회라 칭한다.</mark>
						</li>
						
						<li class="bold cb mt20">제44조(회무)
							<mark class="text small cb m5 mb10">지부는 지부 회무에 관한 사항을 본 회에 보고하여야 한다.</mark>
						</li>
						
						<li class="bold cb mt20">제45조(지부총회)
							<mark class="text small cb m5 mb10">① 지부 총회는 본 회 정기대의원총회 개최 전에 개최한다.</mark>
						</li>
								<li>② 지부는 다음 사항을 총회 종료 후 본 회에 제출하여야 한다.</li>
										<li>1. 임원명단</li>
										<li>2. 예산 및 결산서</li>
										<li>3. 사업계획서 및 사업시행 결과</li>
										<li>4. 총회 회의록</li>
										
						<li class="bold cb mt20">제46조(지부감사)
							<mark class="text small cb m5 mb10">각 지부는 재정 및 회무에 대한 지도와 감사를 본 회로부터 받아야 한다.</mark>
						</li>
						
						<li class="bold cb mt20">제47조(운영)
							<mark class="text small cb m5 mb10">지부 운영 및 재정관리에 관하여 필요한 사항은 별도의 규정으로 정한다.</mark>
						</li>
						
						<li class="bold cb mt20">제48조(재산의 명의)
							<mark class="text small cb m5 mb10">지부가 재산을 매입하는 경우, 재산의 명의는 본 회의 명의로 하여야 한다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 10 장 자 산 및 회 계</h5>
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제49조(재정)
							<mark class="text small cb m5 mb10">① 본 회의 경비는 다음 수입으로 한다.</mark>
						</li>
										<li>1. 입회비, 연회비</li>
										<li>2. 사업 또는 재산에서 생기는 수입</li>
										<li>3. 독지가 또는 회원의 찬조금</li>
										<li>4. 국가 또는 기타로부터의 조성금 및 보조금</li>		
								
								<li>② 회원으로부터 징수하는 회비는 이사회의 의결을 거쳐 이를 정한다.</li>
								<li>③ 기타 본회 재정관리에 필요한 사항은 별도의 규정으로 한다.</li>
						
						<li class="bold cb mt20">제50조(회계년도)
							<mark class="text small cb m5 mb10">본 회의 회계년도는 정부회계년도에 준한다.</mark>
						</li>
						
						<li class="bold cb mt20">제51조(재산 목록)
							<mark class="text small cb m5 mb10">본 회 소유의 기본 재산 목록은 [별지 1]과 같다.</mark>
						</li>
						
						<li class="bold cb mt20">제52조(사업 보고)
							<mark class="text small cb m5 mb10">본 회는 매 회계년도의 사업계획 및 전년도 사업실적에 대하여 이사회 및 대의원총회의 의결을 거쳐 보건복지부장관에게 보고하여야 한다.</mark>
						</li>
						
						<li class="bold cb mt20">제53조(재산의 관리)
							<mark class="text small cb m5 mb10">본 회의 재산은 이사회의 의결을 거쳐 회장이 관리한다.</mark>
						</li>
						
						<li class="bold cb mt20">제54조(재산의 취득 및 처분)
							<mark class="text small cb m5 mb10">기본재산을 취득, 매도, 증여, 교환, 임대, 담보제공 또는 채무부담 행위 그 밖의 권리의 포기, 의무의 부담 등의 처분을 하고자 하는 때에는 이사회의 의결을 거쳐 보건복지부장관에게 보고하여야 한다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 11 장 상 벌</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제55조(표창)
							<mark class="text small cb m5 mb10">본 회에 공적이 있는 지부 및 회원에 대하여는 이사회의 의결로써 회장이 이를 표창한다.</mark>
						</li>
						<li class="bold cb mt20">제56조(징계)
							<mark class="text small cb m5 mb10">회원의 자율적 단속과 질서 유지 확립을 기하기 위하여 다음 각 호에 해당하는 자에 대하여는 이사회의 의결로써 훈계, 해임(임직원 박탈에 한함), 권한의 정지(임원의 권한에 한함) 또는 기타 필요한 조치의 징계를 할 수 있다. </mark>
								</li><li>1. 본 회의 정관 및 규약을 위반한 자</li>
								<li>2. 본 회의 결의를 준수하지 아니한 자</li>
								<li>3. 영양사 윤리를 위배하여 본 회의 명예를 훼손한 자</li>
								<li>4. 영양사 보수교육을 받지 않은 자</li>
						
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 12 장 정 관 변 경 및 해 산</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제57(정관 변경)
							<mark class="text small cb m5 mb10">본 회의 정관을 변경하고자 할 때에는 대의원총회의 재적대의원 과반수 출석과 출석대의원 3분의 2 이상의 의결을 거쳐 보건복지부장관의 허가를 받아야 한다.</mark>
						</li>
						<li class="bold cb mt20">제58조(해산)
							<mark class="text small cb m5 mb10">본 회를 해산하고자 할 때에는 대의원총회 재적대의원 과반수 출석과 출석대의원 4분의 3 이상의 의결을 거쳐 해산 등기를 완료한 후 보건복지부장관에게 보고하여야 한다.</mark>
						</li>
						<li class="bold cb mt20">제59조(잔여재산의 귀속)
							<mark class="text small cb m5 mb10">본 회가 해산하는 때의 청산 후 잔여재산은 이사회 및 대의원총회의 의결을 거쳐 보건복지부장관의 허가를 받아 본 회와 유사한 목적을 가진 법인단체에 기부하거나 국가에 귀속한다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">제 13 장 보 칙</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li class="bold cb mt20">제60조(준용규정)
							<mark class="text small cb m5 mb10">이 정관에 규정하지 아니한 사항에 대하여는 민법, 보건복지부 및 질병관리청 소관 비영리법인의 설립 및 감독에 관한 규칙, 기타 관계법령을 준용한다.</mark>
						</li>
						<li class="bold cb mt20">제61조(운용규칙)
							<mark class="text small cb m5 mb10">이 정관의 시행에 관한 필요한 사항은 이사회의 의결에 의하여 규정으로 정한다.</mark>
						</li>
					</ul>
				</div>
				
				
				<div class="mt50">
					<div class="box bw0 center">
						<h5 class="title t3 bold s1">부칙</h5>			
					</div>
					<ul class="text s1 mt10 ">
						<li>① (시행일) 이 정관은 보건복지부장관의 허가를 받은 날로부터 시행한다.</li>
						<li>② 이 정관 개정이전에 소집된 대표자회의 및 이사회와 선임된 임원도 개정정관을 적용한다.</li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
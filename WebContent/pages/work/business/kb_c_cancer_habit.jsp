<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/pages/common.jsp"%>

<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">암</mark>과 영양</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_cancer.do" class="cm">암과 영양</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<c:choose>
			<c:when test="${g_userid == ''}">
				<div class="h900 w600 ac">
					<div class="box t2 p20 mt20">
						<div class="box p50 text big s1 center">
							<p>회원께서는 <mark class="bold cm">로그인 후 확인</mark>해 주세요.</p>
							<a href="/login/kl_login_nor.do" class="btn bbig t1 wide mt20">로그인</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="tab_2 div4 mb10">
					<ul>
						<li><a href="/work/business/kb_c_cancer.do">암의 이해</a></li>
						<li><a href="/work/business/kb_c_cancer_factors.do">식사요인</a></li>
						<li><a href="/work/business/kb_c_cancer_habit.do" class="on">생활습관</a></li>
						<li><a href="/work/business/kb_c_cancer_life.do">식생활지침</a></li>
					</ul>
				</div>
				<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">암 예방을 위한 생활습관</h4><br />
						<p class="middle mt20">세계보건기구 산하 국제암연구소의 보고에 따르면, 암사망의 30%는 식이요인에 의해, 30%는 흡연에 의해, 18%는 만성감염에 기인한다고 하였으며, 그밖에 직업, 유전, 음주, 생식요인 및 호르몬, 방사선, 환경오염 등의 요인도 각각 1-5% 정도 기여 하고 있는 것으로 알려져 있다. 따라서, 일상생활에서 적용할 수 있는 암예방 생활습관 실천과 조기검진만으로도 암질환의 상당 부분은 예방이 가능하다고 할 수 있다. 
						</p>
						<p class="middle mt20">다음은 보건복지부와 국립암센터가 관련 근거자료와 국내 전문가 및 전문기관의 검토를 거쳐 제정 권고하고 있는 ‘국민 암예방 수칙’ 이다(표4).</p>
						<div class="area center mt50 mb50">
							<div class="link ssmall bold ca p10">표4. 국민 암예방 수칙</div>
							<img src="/images/sub/kb_cancer03.png" alt="국민 암예방 수칙" />
							<div class="link small ca mt10">(출처:국가암정보센터 <a href="http://www.cancer.go.kr" target="_blank">http://www.cancer.go.kr</a>)</div>
						</div>
						<p class="middle mt20">국민 암예방 수칙 중에서 식이와 관련된 내용을 정리하면 다음과 같다.</p>
							<h5 class="title bold t3 i_b_t3 mt40">채소와 과일을 충분히 섭취하자</h5><br />
								<p class="mt10 pl15">채소와 과일을 매일 500g 이상을 섭취하면 암 발생을 20% 이상 낮출 수 있다는 연구보고들이 있다. 그러나 어떤 특정한 과일이나 채소가 암 예방에 
								탁월한 것은 아니기 때문에, 다양한 종류의 채소와 과일을 섭취해야 한다. 
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">다채로운 식단으로 균형 잡힌 식사를 하자.</h5><br />
								<p class="mt10 pl15">건강을 위해서는 모든 영양소가 부족함 없이 적당량 포함된 균형 잡힌 식사를 하는 것이 매우 중요하다. 
								식품구성자전거란? 우리가 주로 먹는 식품의 종류와 영양소 함유량, 기능에 따라 비슷한 것 끼리 묶어 6가지 식품군으로 나누고, 자전거 바퀴모양을 이용하여 6가지 식품군의 
								섭취횟수와 분량에 따라 면적을 배분하고 자전거 바퀴에 물잔을 삽입, 균형 잡힌 식사, 수분섭취, 적절한 운동을 통해 알맞은 영양섭취와 건강유지 및 비만을 예방 하자는 메시지를 
								도식화 한 것이다.
								</p>
								<div class="area center mt50 mb50">
									<div class="link ssmall bold ca p10">그림3. 식품구성자전거</div>
									<img src="/images/sub/kb_cancer04.png" alt="식품구성자전거" />
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">음식을 짜지 않게 먹자.</h5><br />
								<p class="mt10 pl15">염분을 너무 많이 섭취하게 되면 고혈압, 중풍, 골다공증, 신장병, 심장병, 당뇨병 등의 질환이 악화될 수 있으며, 소금 섭취가 많은 동양인들이 
								서양인에 비해 위암 발생률이 더 높은 것으로 보고되고 있다. 우리나라의 경우 세계보건기구의 염분 권장량보다 2배 이상 많이 섭취하고 있는 것으로 조사되어,
								2005년부터는 정부 차원에서 소금 섭취 감량사업을 적극적으로 추진하고 있다.
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">탄 음식을 먹지 말자.</h5><br />
								<p class="mt10 pl15">육류나 생선을 높은 온도에서 요리할 때에는 발암물질이 발생할 수 있다. 
								따라서 조리방법이나 온도, 조리시간 등을 조절하여 가능한 발암물질의 생성을 감소시키도록 한다.
								</p>
							<h5 class="title bold t3 i_b_t3 mt40">술은 하루 두 잔 이내로만 마시자. 과하지 않게 적당히 마시자.</h5><br />
								<p class="mt10 pl15">과도한 알코올 섭취는 뇌기능 저하, 식도암, 인두암, 후두암의 발생위험을 높이며, 최근에는 위암, 췌장암, 대장암, 직장암, 유방암 등과의 관련성도 대두되고 있다. 
								미국에서는 적정음주를 ‘남성은 하루 2잔, 여성은 하루 1잔까지'라고 정의하고 있다. 우리나라의 경우 아직 명확한 가이드라인은 없으나, 서양인과 다른 음주문화와 체질 등을 감안하여 
								남성은 하루 2잔 이하, 여성은 하루 1잔 이하까지 고려할 수 있다. 그러나 이는 개인의 감수성 및 질병유무 등에 따라 잘라질 수 있다. 술의 종류에 따라 1잔의 크기는 다르다(그림4). 
								</p>
								<div class="area center mt30 mb30">
									<div class="link ssmall bold ca p10">그림4. 술의 종류에 따른 알코올 함량</div>
									<img src="/images/sub/kb_cancer05.png" alt="술의 종류에 따른 알코올 함량" />
								</div>
							<h5 class="title bold t3 i_b_t3 mt40">자신의 체격에 맞는 건강 체중을 유지하자.</h5><br />
								<p class="mt10 pl15">비만의 원인 중 하나는 서구화된 식생활로 인한 고에너지, 고지방 식품 섭취의 증가이며, 또 다른 하나는 활동량의 감소이다.
								따라서 표준체중을 유지하기 위해서는 지방섭취를 줄이고, 활동량을 늘리는 것이 필요하다.
								</p>
					</div>
			</c:otherwise>
    	</c:choose>
	</div>
</div>

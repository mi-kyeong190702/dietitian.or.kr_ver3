<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">당뇨병</mark>관리</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_clinic.do">영양클리닉</a></li>
				<li><a href="/work/business/kb_c_diabetes.do" class="cm">당뇨병관리</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		
		<%@ include file="inc/diabetes.jsp" %>
		
		<div class="text s1 mb50">
						<h4 class="title bold cm t2 i_b_t2 mt50">당뇨의 진단</h4><br />
						<h5 class=" title bold t3 i_b_t3 mt40">요당검사</h5>
						<p class="mt10 pl15">소변에서 당의 존재를 알아보는 방법으로 피를 뽑지 않아도 되므로 편리하기는 하나 정확하지는 않다. <br />
							보통 혈당이 180mg/㎗ (피 100cc에 포도당이 180mg)이상인 경우에만 소변으로 당이 나오므로 초기의 심하지 않은 당뇨병 환자는 놓치는 수가 있다. 한편 사람에 따라서는 혈당이 높지 않으면서도 
							소변에 당이 나오는 경우도 있으므로 혈당검사를 받아 정확한 진단을 받아야 한다.<br />
							혈중 포도당 농도가 200mg/㎗ 이상이고 당뇨병의 전형적인 임상증상이 있는 경우
						</p>
						<h5 class=" title bold t3 i_b_t3 mt40">혈당검사</h5>
						<p class="mt10 pl15">당뇨병의 진단 검사는 선별검사에서 양성일 때, 당뇨병의 증상 및 증후(다음, 다뇨, 다식, 체중감소)가 있을 때,
							요당의 출현 또는 무작위 혈당 검사시 애매하게 혈당이 상승되어 있을 때 시행한다. 임신부 이외의 성인에서는 다음 중의 하나를 만족하면 당뇨병으로 진단된다.
						</p>
						<div><span class="mt10 pl20 ">· ADA 진단기준, 1997</span>
							<ul class="small pl20">
								<li class="i_b_t7">혈중 포도당 농도가 200mg/㎗ 이상이고 당뇨병의 전형적인 임상증상이 있는 경우</li>
								<li class="i_b_t7">8시간 공복 후 혈당이 126mg/㎗ 이상인 경우</li>
								<li class="i_b_t7">경구 당부하 검사시 식후 2시간 혈당이 200mg/㎗ 이상인 경우</li>
							</ul>
						</div>
						<h5 class=" title bold t3 i_b_t3 mt40">표준포도당 부하</h5>
						<p class="mt10 pl15">아침 공복시에 혈액을 채취한 후 포도당을 75g 경구 투여하고 1시간, 2시간후의 혈당을 측정한다.</p>
						<div class="p20"><span class="mt10 bold">· 전혈 포도당 농도(mg/㎗)</span>
							<table class="table t3 text small s1 ca center mt20">
								<colgroup>
									<col width="*" />
									<col width="200" />
									<col width="200" />
									<col width="200" />
								</colgroup>
								<thead>
								<tr>
									<th scope="col" class="bold cm">시간</th>
									<th scope="col" class="bold cm">정상</th>
									<th scope="col" class="bold cm">내기능장애</th>
									<th scope="col" class="bold cm">당뇨병</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td scope="row" class="bgf7">공복</td>
									<td>109이하</td>
									<td>110∼125</td>
									<td>126이상 </td>
								</tr>
								<tr>
									<td scope="row" class="bgf7">1시간</td>
									<td>180이하</td>
									<td>200이상</td>
									<td>200이상</td>
								</tr>
								<tr>
									<td scope="row" class="bgf7">2시간</td>
									<td>140이하</td>
									<td>140∼199</td>
									<td>200이상</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					
	</div>
</div>

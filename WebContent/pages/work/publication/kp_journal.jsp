			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="s_page">
				<div class="sp_head">
					<div class="sp_title">
						<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">학술지</mark></h3>
					</div>
					<div class="sp_navi">
						<ul>
							<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
							<li><a href="/work/publication/kp_magazine.do">KDA 출판</a></li>
							<li><a href="/work/publication/kp_journal.do" class="cm">학술지</a></li>
						</ul>
					</div>
				</div>
				<hr />
				<div class="sp_body">
					<div class="box t2 mb10 p20">
						<div class="area mt10">
							<div class="text center">
								<h4 class="title t2 bold s1"><mark class="cm">대한영양사협회 </mark>학술지</h4><br />
								<span class="ssmall ca">Journal of the Korean Dietetic Association</span><span class="ssmall cs s1 ml5">ISSN 1225-9861, e-ISSN 2383-966X</span><br>
							</div>
						</div>
					</div>
					
				    <div class="mt30">
						<div class="fl w160">
							<img class="ml20" src="/images/sub/kp_journal_201606.jpg" alt="학술지" width="120" />
						</div>
						<div class="w340 fl text">
							<span class="small"><mark class="middle bold cm">「대한영양사협회 학술지」</mark>는 연 4회 발행되며,<br />
							2006년 <mark class="bold">한국연구재단</mark>에 등재, 2007년 <mark class="bold">KoreaMed</mark>에<br>등재되었습니다.</span>
							<ul class="text ssmall ca mt10">
								<li class="i_box_t1">1995년 7월 창간</li>
								<li class="i_box_t1">현재 연 4회(2월 2일, 5월 2일, 8월 2일, 11월 2일) 발간</li>
								<li class="i_box_t1">판형 : B5 size</li>
							</ul>
					    </div>
					    
					    <div class="w230 fl">
                             <form  name = "koar_search_form"  method = "POST"  target = "koar_search_form" action = "" >
                               <div style="background:#fff; border-radius: 5px; box-shadow: 0 1px 1px 0 #999, 0 1px 1px 0 transparent;padding: 10px 0 0 0; border:1px solid #e5e5e5;box-sizing:border-box;margin: 0 0 0 0;"  id="koar_journal_area">
                                 <h3 style="text-indent: -9999px; overflow: hidden; width:192px; height: 24px; background: url(https://safe.accesson.kr/images/api/safe_logo.png) no-repeat 0 0;    margin: 0 10px 12px 10px;box-sizing:border-box;">건전학술활동지원시스템</h3>
                                 <div style="box-sizing:border-box;margin: 0;padding: 0;">
                                   <ul style="box-sizing:border-box;margin: 0; padding: 0;  overflow: hidden;  background:#f1eeee url(https://safe.accesson.kr/images/api/safe_tab_line.png) repeat-x 0 bottom;">
                                     <li style=" box-sizing:border-box;float: left;   width: 50%;  list-style: none; margin: 0; padding: 0; position: relative;">
                                       <a href="javascript://" style=" box-sizing:border-box;display: block; text-align: center;   text-decoration: none; font-size: 12px; color: #919191;line-height: 36px; background:#fff url(https://safe.accesson.kr/images/api/safe_tab_on.png) repeat-x 0 top;color: #de7b11; border-right:1px solid #ddd;">학술지</a></li>
                                     <li style="box-sizing:border-box;float: left;width: 50%;  list-style: none; margin: 0; padding: 0; position: relative;">
                                       <a href="javascript://" onclick="document.querySelector('#koar_journal_area').style.display='none';document.querySelector('#koar_conference_area').style.display='';" style="box-sizing:border-box;display: block; text-align: center;   text-decoration: none; font-size: 12px; color: #919191; line-height: 36px;background:url(https://safe.accesson.kr/images/api/safe_shadow_r.png) no-repeat left 0;">부실 학술행사</a></li>
                                   </ul>
                                   <div style="padding: 17px 14px;margin:0;box-sizing:border-box;">
                                     <p style="box-sizing:border-box;margin: 0; padding: 2px 28px 0 6px; border:1px solid #d3d3d3; background: #fff; position:relative;  height: 28px; border-radius: 3px;">
                                     <input type="text" onkeypress="event.keyCode == 13?document.querySelector('#jsearch').onclick():''" name="jkeywords" title="검색" style="width: 100%;height: 20px; background: #fff;border:0px;" placeholder="ISSN, 출판사, 학술지명">
                                     <a href="javascript://" id="jsearch" onclick="document.querySelector('input[name=keywords]').value=document.querySelector('input[name=jkeywords]').value;document.querySelector('input[name=type]').value='J';document.querySelector('form[name=koar_search_form]').action='https://safe.accesson.kr/koar/api/searchForm.do';document.querySelector('form[name=koar_search_form]').submit()" style="box-sizing:border-box;position: absolute; right:0; top:0;  width: 26px;height: 26px;  text-indent: -9999px; overflow: hidden;  background: url(https://safe.accesson.kr/images/api/safe_search_icon.png) no-repeat 6px 5px; ">검색</a></p>
                                   </div>
                                 </div>
                               </div>
                               <div style="display: none; background:#fff; border-radius: 5px; box-shadow: 0 1px 1px 0 #999, 0 1px 1px 0 transparent;padding: 10px 0 0 0; border:1px solid #e5e5e5;box-sizing:border-box;margin: 0 0 0 0;" id="koar_conference_area">
                                 <h3 style="text-indent: -9999px; overflow: hidden; width:192px; height: 24px; background: url(https://safe.accesson.kr/images/api/safe_logo.png) no-repeat 0 0;    margin: 0 10px 12px 10px;box-sizing:border-box;">건전학술활동지원시스템</h3>
                                 <div style="box-sizing:border-box;margin: 0;padding: 0;">
                                   <ul style="box-sizing:border-box;margin: 0; padding: 0;  overflow: hidden;  background:#f1eeee url(https://safe.accesson.kr/images/api/safe_tab_line.png) repeat-x 0 bottom;">
                                     <li style="box-sizing:border-box;float: left;width: 50%;  list-style: none; margin: 0; padding: 0; position: relative;">
                                       <a href="javascript://" onclick="document.querySelector('#koar_journal_area').style.display='';document.querySelector('#koar_conference_area').style.display='none';" style="box-sizing:border-box;display: block; text-align: center;   text-decoration: none; font-size: 12px; color: #919191; line-height: 36px;background:url(https://safe.accesson.kr/images/api/safe_shadow_l.png) no-repeat right 0;">학술지</a></li>
                                     <li style=" box-sizing:border-box;float: left;   width: 50%;  list-style: none; margin: 0; padding: 0; position: relative;">
                                       <a href="javascript://" style=" box-sizing:border-box;display: block; text-align: center;   text-decoration: none; font-size: 12px; color: #919191;line-height: 36px; background:#fff url(https://safe.accesson.kr/images/api/safe_tab_on.png) repeat-x 0 top;color: #de7b11; border-right:1px solid #ddd;">부실 학술행사</a></li>
                                   </ul>
                                   <div style="padding: 17px 14px;margin:0;box-sizing:border-box;">
                                     <p style="box-sizing:border-box;margin: 0; padding: 2px 28px 0 6px; border:1px solid #d3d3d3; background: #fff; position:relative;  height: 28px; border-radius: 3px;">
                                     <input type="text" onkeypress="event.keyCode == 13?document.querySelector('#csearch').onclick():''" name="ckeywords" title="검색" style="width: 100%;height: 20px; background: #fff;border:0px;" placeholder="학술행사명">
                                       <a href="javascript://" id="csearch" onclick="document.querySelector('input[name=keywords]').value=document.querySelector('input[name=ckeywords]').value;document.querySelector('input[name=type]').value='C';document.querySelector('form[name=koar_search_form]').action='https://safe.accesson.kr/koar/api/searchForm.do';document.querySelector('form[name=koar_search_form]').submit()" style="box-sizing:border-box;position: absolute; right:0; top:0;  width: 26px;height: 26px;  text-indent: -9999px; overflow: hidden;  background: url(https://safe.accesson.kr/images/api/safe_search_icon.png) no-repeat 6px 5px; ">검색</a></p>
                                   </div>
                                 </div>
                               </div>
                               <input type = "hidden"  name="keywords"  value="" />
                               <input type = "hidden"  name="type"  value="" />
                               <input type = "hidden"  name="code"  value="DrAdFdKfMy"/>
                             </form>
                        </div>
					   
					    <div class="text w500 left">
                            <a href="https://www.e-jkda.or.kr/index.do" class="btn t2 big mt20 w290" target="_blank">학술지 홈페이지 바로가기</a>
                        </div>
				    </div>
				    
				
				    <table class="table t2 text small s1 ca center mt20">
						<colgroup>
							<col width="*" />
							<col width="200" />
							<col width="200" />
							<col width="200" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="4" scope="col" class="bold cm">대한영양사협회 학술지편집위원회 (임기 : 2024~2025년)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td scope="row">위원장</td>
								<td scope="row">박은주(경남대)</td>
								<td scope="row"></td>
								<td scope="row"></td>
							</tr>
							<tr>
								<td rowspan="5" scope="row">위 원</td>
								<td scope="row">김우경(단국대)</td>
								<td scope="row">노정옥(전북대)</td>
								<td scope="row">박유경(경희대 동서의학대학원)</td>
							</tr>
							<tr>
								<td scope="row">배윤정(한국교통대)</td>
								<td scope="row">배현주(대구대)</td>
								<td scope="row">신다연(인하대)</td>
							</tr>
							<tr>
								<td scope="row">윤정미(전남대)</td>
								<td scope="row">이승민(성신여대)</td>
								<td scope="row">이지현(부산대)</td>
							</tr>
							<tr>
								<td scope="row">이해영(상지대)</td>
								<td scope="row">임윤숙(경희대)</td>
								<td scope="row">채인숙(제주대)</td>
							</tr>
							<tr>
								<td scope="row">최성은(Queens College)</td>
								<td scope="row">현태선(충북대)</td>
								<td scope="row"></td>
							</tr>
						</tbody>
					</table>
					
					<div class="box bga r10 mt30 p30">
						<div class="area">
							<h5 class="title i_b_t6 bold s1"><mark class="cm">대한영양사협회</mark> 연구윤리규정</h5>
								<div class="text small s1 m10m mt20">
									<p>대한영양사협회는 학술지의 질적 수준과 연구윤리 강화를 위해 「연구윤리규정」을 제정하여 시행하고 있습니다. 논문을 투고하시기에 앞서 [연구윤리규정] 세부사항을 잘 숙지하신 후 
									위반행위가 발생하지 않도록 각별하게 주의하여 주시기 바랍니다. <br />아울러 '생명윤리 및 안전에 관한 법률' 등 관련 법령에 의거하여 인간대상연구 및 동물대상연구 논문의 경우 저자기관의
									생명윤리위원회(IRB)의 심의를 받고 연구대상자로부터 서면동의를 받아야 합니다. 해당 논문투고 시 IRB의 승인은 필수사항이며, 연구대상자의 동의를 받았음을 IRB 승인번호와 함께 
									논문에 명시하여야 합니다. </p>
									<p class="mt10 ml10">자세한 [연구윤리규정]은 대한영양사협회 홈페이지 → 학술지 → 학술지 규정에서 확인 가능합니다.</p>
									<p class="mt10 ml10">연구부정행위에 대한 제보는 아래의 문의처를 참고해주시기 바랍니다.<br />
									<span class="i_b_t5">문의처 : TEL. 02-823-5680(교환 522)  FAX. 02-823-5990  E-mail. kdabook@kdiet.or.kr</span></p>
								</div>
						</div>
					</div>
					
					<div class="box bga r10 mt30 p30">
						<div class="area">
							<h5 class="title i_b_t6 bold s1"><mark class="cm">대한영양사협회</mark>  학술지 논문표절, 중복게재 금지</h5>
								<div class="text small s1 m10m mt20">
									(사)대한영양사협회에서는 우리 협회 학술지의 우수성과 독창성을 저해하는 논문표절 및 중복게재를 금하고 있사오니, <br />논문 투고 시 다음과 같은 사항을 유의해주시기 바랍니다.
										<ul class="m10">
											<li class="mb10 i_box_t1"><mark class="bold">대한영양사협회 학술지의 투고 범위</mark><span>영양사와 관련한 연구 논문, 종설, 연구단보, 사례연구 등으로 타 학회지에 게재되었거나 
												투고 중인 논문은 투고 할 수 없으며, 아울러 본 학술지에 게재되었거나 투고 중인 논문은 타 학회지에 게재할 수 없음.</span>
											</li>
											<li class="mb10 i_box_t1"><mark class="bold">중복게재의 판정 기준</mark><span>다른 언어, 일부 혹은 전부, 인쇄 혹은 전자매체, 학술지의 등록 및 등재 여부를 막론하고 게재된 적이 없어야 함.</span>
											</li>
											<li class="mb10 i_box_t1">논문표절 및 중복게재로 판명되면 우리 협회 홈페이지에 공지하고, 해당 투고자는 향후(최소 3년간) 우리 협회 학술지 논문 투고를 금할 예정임.</li>
										</ul>
								</div>
						</div>
					</div>
					
				</div>
			</div>

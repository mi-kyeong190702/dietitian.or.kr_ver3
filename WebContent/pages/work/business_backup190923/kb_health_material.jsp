<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">


function openBogun() {
	var win = window.open("/assets/ver2/bogun_online_2016/html/bogun_2016.html", "Bogun", "width=1090,height=750,scrollbars=yes");
	win.focus();
}

function openRainbow() {
	var win = window.open("/assets/ver2/media/rainbow/start.html", "milk", "width=1090,height=740,scrollbars=no");
	win.focus();
}

function openBanner() {
	var win = window.open("/main_popup/popup_banner.html", "milk", "width=1000,height=600,scrollbars=yes");
	win.focus();
	
}
</script>
<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자</mark>료실</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="#" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양사업</a></li>
				<li><a href="/work/business/kb_nutrition.do">국민건강증진사업</a></li>
				<li><a href="/work/business/kb_health_material.do" class="cm">자료실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<ul>
				<li class="box fl mr10 mb20 p14"><a href="javascript:openBogun()" title="보건복지부지원사업 이동"><img src="/images/sub/bn_kb_health_03.png"  alt="보건복지부지원사업"></a></li>
				<li class="box fl mr10 mb20 p14"><a href="javascript:openRainbow()" title="위투레인보우스쿨 이동"><img src="/images/sub/bn_kb_health_01.png"  alt="위투레인보우스쿨"></a></li>
				<li class="box fl mb20 p14"><a href="javascript:openBanner()" title="비만예방 및 관리를 위한 교육자료로 이동">
					<img src="/images/sub/bn_kb_health_02.png"  alt="비만예방 및 관리를 위한 교육자료"></a>
				</li>
			</ul>
		</div>
		<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>

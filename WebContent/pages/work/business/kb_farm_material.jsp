<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kda.utils.ParamUtils"%>
<%@ page import="java.util.*" %>
<%	
	String work_userid = ParamUtils.getParameter(request, "g_userid", "0");

	// 정상적인 값으로 넘옴
	System.out.println("story g_userid : " + work_userid);

	work_userid = work_userid.replace("!", "%21");
	work_userid = work_userid.replace("@", "%40");
	work_userid = work_userid.replace("#", "%23");
	work_userid = work_userid.replace("~", "%7E");

%>

<script type="text/javascript">

function openMilk() {
	var win = window.open("/main_popup/popup_banner_milk_2025.html", "milk", "width=900,height=700,scrollbars=yes");
	win.focus();
}

function openFoodEdu() {
	var win = window.open("/assets/ver2/food_online/html/food_2019.html", "foodedu", "width=880,height=800,scrollbars=yes");
	win.focus();
} 

function openHandon() {
	var win = window.open("/assets/ver2/handon_online/popup_banner_handon3.html", "handon", "width=850,height=800,scrollbars=yes");
	win.focus();
}

function openHandonStory() {
	var win = window.open("/assets/ver2/handon_online/popup_banner2025.html", "handonStory", "width=900,height=700,scrollbars=yes");
	win.focus();
}

function openCookingTime() {
	//var win = window.open("/assets/ver2/etc/kb_farm_material_06.jsp?bbs_board_code=113", "cookingTime", "width=850,height=700,scrollbars=yes");
	var win = window.open("/assets/ver2/handon_online/main_popup3/kb_farm_material_06.jsp?bbs_board_code=113", "cookingTime", "width=900,height=700,scrollbars=yes");
	win.focus();
}

/* function openCookingClass() {
	var win = window.open("/assets/ver2/kda/KDA4/index.html", "handonClass", "width=900,height=700,scrollbars=yes");
	win.focus();
} */

/* function openDoong() {
	var win = window.open("/assets/ver2/doong/popup_doong.html", "Doong", "width=800,height=600,scrollbars=yes");
	win.focus();
} */

/* function openAllLife() {
	var win = window.open("/assets/ver2/alllifeAllgood/html/201507_page01.html", "AlllifeAllgood","width=900,height=700,scrollbars=yes");
	win.focus();
} */

function openkfish() {
	var win = window.open("/assets/ver2/k_fish/html/popup_banner_K-fish01.html", "k_fish","width=900,height=700,scrollbars=yes");
	win.focus();
}

function openAp() {
	var win = window.open("/main_popup/popup_banner9.html", "ap",'width=1000, height=600,resizable=yes, scrollbars=no');
	win.focus();
}

function articleSave (gbn, optWin, passYn){
	var f = document.form2;

	//VER : REG_2015.03 , REFID : REQ392, AUTHOR : SungYongJe
    //[REQ392] 2014-12-17 결재 본문 내용 유실 건 
	//에디터가 로딩이 완료되지 않은 경우 alert을 띄워 처리하지 않도록 함. 2015.02.16 by SungYongJe
	if(document.getElementById("editor1") && !isEditorLoadComplete){
		alert(jQuery.getMessage("COMMON-000354"));
		return false;
	}
	
	try {
		if( window.validBbs ) {
			if(validBbs()==false) return false;
		}
	}catch(e) {}
	
	//VER : REG_2015.11, REFID : REQ890, AUTHOR : SungYongJe
	//게시글 작성 시 게시판 옵션 변조로 인하여 저장 시 한번더 체크하도록 함.
	if(!validateBBSConf()){
		alert(jQuery.getMessage("BBS-000277"));
		return false;
	}
	
	//DBG/2016.01.22/파일게시-제목에 파일명 처리/ejdreams ----------> Start
	if(isNullStr(f.title.value)){
		var obj = document.getElementById("articleFile").contentWindow.InnoInterface?document.getElementById("articleFile").contentWindow.InnoInterface : document.getElementById("articleFile").contentWindow.document.InnoAP;
		var cnt = 0;
		var name = "";

		var len = 0;
		if(obj != null){
			if((typeof obj.GetCount) == "number"){
				len = obj.GetCount;
			}else{
				len = obj.GetFileCount();
			}
		}
 		for(var i = 0; i < len; i++){
 			cnt ++;
 			if(i == 0){
 				name = obj.GetFileName(i);
 				
 				var fileObjLen = name.length;
 				var posIdx = name.lastIndexOf("\\");
 				var posIdx2 = name.lastIndexOf("\/");
 				var fileName = name.substring(posIdx+1,fileObjLen);
 				name = fileName.substring(posIdx2+1,fileObjLen);
 				break;
 			}
 		}
		if(cnt > 0){
			// 파일목록을 받고 첫번째 파일명을 구해서 f.title.value에 setting
			f.title.value = name;
		}
		else{
			$(f.title).addClass('validate[required]');
		}
	}
	//----------> End
	
	// 수정시 초기화 옵션처리
	if(WRITE_EDIT == f.writeGbn.value && isUndefined(optWin) && ARTICLE_STATUS_OK == f.status.value){
		
		var url = _webapp + "/XClickController?";
		var popHeight = 180;
		var readHistoryYn = document.getElementById("readHistoryYn").value;
		if("Y" == readHistoryYn)popHeight += 30;
		var recommYn = document.getElementById("recommYn").value;
		if("Y" == recommYn)popHeight += 30;
		var pointYn = document.getElementById("pointYn").value;
		if("Y" == pointYn)popHeight += 30;
		var anonymousYn = document.getElementById("anonymousYn").value;
		
		var adminYn = "N";
		if(isBBSAdmin || isBBSArticleAdmin){
			popHeight += 30;
			adminYn = "Y";
			if("Y" == anonymousYn)popHeight -= 30;
		}
		var params = {
				facade : "",
				command : "",
				nextpage : "/bbs/pop/articleInitOptionPop.jsp",
				readHistoryYn : readHistoryYn,
				recommYn : recommYn,
				pointYn : pointYn,
				adminYn : adminYn,
				anonymousYn : anonymousYn,
				msgId : "BBS-000246"
		};
		
		url += jQuery.param(params); // serialize & encode
		
		initOptPop = openPopupWindowInCenter(url, 'initOptPOP', 400, popHeight, true);
		initOptPop.focus();
		return ;
	}
	if(initOptPop && !initOptPop.closed){
		initOptPop.blur();
		initOptPop.close();
		initOptPop = null;
		window.focus();
	}
	
	// 권한 처리 (Validation 체크 이전에 권한 Data를 생성한다.)
	f.dtAuthListDataArr.value = "";

	if (jQuery('input[id="publicYn"]:checked').val() == 'N') {
		var writerData = jQuery.parseJSON("{\"idType\":\"USER\",\"authId\":\""+ _userId +"\",\"companyId\":\""+ _companyId +"\",\"deptId\":\""+ _deptId+"\",\"target\":\"authTrgtList\",\"subIncludeYn\":\"N\"}");
		var dtAuthData = jQuery.parseJSON(document.getElementById("_dtAuthListDataArr").value);
		var chkAuthTrgtList = new Array();
		var isPosition = 0;
		var isExist = false;
		
		// 비공개, 상담형 일때는 읽기자에 본인이 없으면 자동으로 추가할 수 있도록 체크한다.
		//DBG/2016.03.02/게시판권한-게시글 작성시 비공개형을 기본으로 하고 권한은 전체를 디폴트로 설정/ejdreams
		//전체 권한(authAssgnMeth이 'ALL')의 경우, 읽기자에 본인 자동으로 추가하는 체크 로직 X
		if(dtAuthData.authAssgnMeth != 'ALL'){
			if ( !isNullStr(dtAuthData.authTrgtList) ) {
				chkAuthTrgtList = jQuery.parseJSON(dtAuthData.authTrgtList);
				isPosition = chkAuthTrgtList.length;
				for (var z = 0; z < chkAuthTrgtList.length; z++) {
					var authTrgt = jQuery.parseJSON(JSON.stringify(chkAuthTrgtList[z]));
					if (authTrgt.authId == writerData.authId) {
						isExist = true;
					}
				}
			}
			if ( !isExist ) {  
				dtAuthData.authAssgnMeth = 'TGT';
				chkAuthTrgtList[isPosition] = writerData;	
			}
		}
		
		dtAuthData.authTrgtList = JSON.stringify(chkAuthTrgtList);
		f.dtAuthListDataArr.value = JSON.stringify(dtAuthData);
	}
	if( jQuery(f).validationEngine({returnIsValid:true}) ){
		var _backupWriteGbn = f.writeGbn.value;
		//VER : REG_2015.05, REFID : DEV150511_45, AUTHOR : jhhan
        //메일, 전자결재 게시하기일때(임시저장) 기존 구분값 유지 위한 변수
		f.backupWriteGbn.value = _backupWriteGbn;
		
		if (gbn != null || gbn != undefined) {
			//_backupWriteGbn = f.writeGbn.value;
			f.writeGbn.value = gbn;
		}
		if(gbn == 'TEMP' && f.articleId.value != ''){
			f.command.value = "editArticle";
		}
		else if (f.writeGbn.value == WRITE_EDIT) {
			f.command.value = "editArticle";
		} 
		else {
			f.command.value = "addArticle";
		}
		f.nextpage.value="/bbs/bbsResult.jsp";
		
		//[FIS]게시글 수정시 confirm창이 뒤로가는 현상 수정 
		if("Y" == passYn){
			;;
		}else{
			if (cefMessagePop('BBS-000136', 'CONFIRM', 300, 150) != 'OK') {
				f.writeGbn.value = _backupWriteGbn;
				return;
			}
		}
		
		f.transaction_yn.value="Y";
		// submit 직전 본문은 base64 encode 한다. img tag 등 parameter xss filter 방지. hyungyu, Song 2014.1
		var content = document.getElementById("editor1").contentWindow.getContent();
		if(content.indexOf("MIME-Version: 1.0") != 0){
			content = jQuery.Base64.encode(content, true);
		}
		f.editorContent.value = content;
		
		document.getElementById("articleFile").contentWindow.startUpload(saveArticle);
	}// end validation if
};


</script>


<div class="s_page">
	<div class="sp_head">
		<div class="sp_title">
			<h3 class="title bold t1 s1 i_b_t1"><mark class="cm">자</mark>료실</h3>
		</div>
		<div class="sp_navi">
			<ul>
				<li class="start"><a href="/index.jsp" class="icon_home"><span class="ti">HOME</span></a></li>
				<li><a href="/work/business/kb_nutrition.do">KDA 영양</a></li>
				<li><a href="/work/business/kb_farm.do">우리농축수산물소비촉진</a></li>
				<li><a href="/work/business/kb_farm_material.do?bbs_board_code=6&g_userid=<%=work_userid%>" class="cm">자료실</a></li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="sp_body">
		<div class="area">
			<ul>
				<li class="box fl mr7 mb7 h48"><a href="javascript:openFoodEdu()" title="지속가능한 식생활 교육관"><img src="/images/sub/food.png" alt="바른 식생활 교육관"></a></li>
				<li class="box fl mr7 mb7 h48"><a href="javascript:openMilk()" title="2025우유 온라인관"><img src="/images/sub/bn_kb_milk_2025.png" alt="2025우유 온라인관"></a></li>
				<li class="box fl mr7 mb7 h48"><a href="javascript:openHandon()" title="한돈 온라인 교육관"><img src="/images/sub/online_finbnn.png" alt="한돈 온라인 교육관"></a></li>  
				<li class="box fl mb7 h48"><a href="javascript:openHandonStory()" title="한돈 영양이야기 교실"><img src="/images/sub/story_finbnn2.png" alt="한돈 영양이야기 교실"></a></li>
				
				<li class="box fl mr7 mb7 h48"><a href="javascript:openCookingTime()" title="한돈 쿠킹타임"><img src="/images/sub/bn_kb_farm_04.png" alt="한돈 쿠킹타임"></a></li>
				<!--<li class="box fl mr7 mb7 h48"><a href="javascript:openAllLife()" title="AlllifeAllgood"><img src="/images/sub/AllLifeAllGood_banner_s.png" alt="AlllifeAllgood"></a></li>
				<li class="box fl mr7 mb7 h48"><a href="javascript:openCookingClass()" title="KDA 우리 축산물 쿠킹클래스"><img src="/images/sub/bn_kb_farm_05.png" alt="KDA 우리 축산물 쿠킹클래스"></a></li>
				<li class="box fl mb7 h48"><a href="javascript:openDoong()" title="둥이의 신나는 영양교실"><img src="/images/sub/bn_kb_farm_07.png" alt="둥이의 신나는 영양교실"></a></li> -->
				
				<li class="box fl mr7 mb7 h48"><a href="javascript:openkfish()" title="우리수산물DAY홍보관" ><img src="/images/sub/banner_fish.png" alt="images/sub/bn_kb_farm_07.png"></a></li>
				<li class="box fl mr7 mb7 h48"><a href="javascript:openAp()" title="우리농산물정보관"><img src="/images/sub/farm_2025.png" width="178" height="48" alt="우리농산물정보관"></a></li>
			</ul>
		</div>
	<%@ include file ="/pages/board/paper_board.jsp"%>
	</div>
</div>

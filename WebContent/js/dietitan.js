var nowZoom = 100; // 현재비율
var maxZoom = 150; // 최대비율(500으로하면 5배 커진다)
var minZoom = 80; // 최소비율

function zoomInOut(value) 
{
	var browser = navigator.userAgent.toLowerCase();
	//if(browser.indexOf('msie') == -1){ alert("익스플로러에서만 동작합니다. \n브라우저 메뉴의 확대축소 기능을 이용하세요.") }
	//else {

		if(value == "in") {
			if (nowZoom < maxZoom) {
				nowZoom += 10;
			} else {
				alert("더이상 커지지 않습니다.");
				return;
			}
		}
		else if(value == "out") {
			if (nowZoom > minZoom) {
				nowZoom -= 10;
			} else {
				alert("더이상 작아지지 않습니다.");
				return;
			}
		}
		else if(value == "base") {
			nowZoom = 100;
		}
		else {
			return;
		}

		document.getElementsByTagName("body").item(0).style.position = "relative";
		document.getElementsByTagName("body").item(0).style.zoom = nowZoom + "%";
	//}
}

function getTotalByteLen( str )
{
	var onechar;
	var tcount = 0;

	for ( var k = 0; k < str.length; k++ ){
		onechar = str.charAt( k );
		if ( escape( onechar ).length > 4 )
			tcount += 2;
		else if ( onechar != '\r' )
			tcount++;
	}
	return tcount
}

function isImage(name)
{
	var fileName = name;
	var suffix = fileName.substring(fileName.lastIndexOf(".")+1);
	suffix = suffix.toLowerCase();
	if(suffix != "jpg" && suffix != "png" && suffix != "gif" && suffix != "bmp"){
		return false;
	}	
	return true;
}

function isMovie(name)
{
	var fileName = name;
	var suffix = fileName.substring(fileName.lastIndexOf(".")+1);
	suffix = suffix.toLowerCase();
	if(suffix != "mov" && suffix != "avi" && suffix != "mp4" && suffix != "mov" && suffix != "mpeg" && suffix != "wmv"){
		return false;
	}	
	return true;
}

function isBoardFile(name)
{
	var fileName = name;
	var suffix = fileName.substring(fileName.lastIndexOf(".")+1);
	suffix = suffix.toLowerCase();
	if(suffix != "jpg" && suffix != "jpeg" && suffix != "gif" && suffix != "bmp" && suffix != "png" && suffix != "swf"
		&& suffix != "tiff" && suffix != "tif" && suffix != "mpg" && suffix != "mpeg" && suffix != "avi"
		&& suffix != "asf" && suffix != "wma" && suffix != "mp3" && suffix != "xls" && suffix != "xlsx"
		&& suffix != "pdf" && suffix != "ppt" && suffix != "htm" && suffix != "txt" && suffix != "hwp"
		&& suffix != "doc" && suffix != "docx" && suffix != "zip" ){
		return false;
	}	
	return true;
}

function isKorean(str) 
{
    var i;
    var ch;
    for (i=0;i<str.length;i++) {
        ch = escape(str.charAt(i));        //ISO-Latin-1 문자셋으로 변경
        if (strCharByte(ch) == 2) 
            return false;
    }
    return true ;
}

function strCharByte(chStr) {
    var y = "%u";
    var z = "%";

    if (chStr == null)
        chStr = "";

        if (chStr.indexOf(y) != -1) {
            if (chStr.substring(2,4) == '00') {
                return 1;
            }else{
                return 2;        //한글
            }
        }else if (chStr.indexOf(z) != -1) {
            if (parseInt(chStr.substring(1,3), 16) > 127) {
                return 2;        //한글
        }else {
            return 1;
        }
    } else {
        return 1;
    }
}

function isEmail (strEmail)
{
	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
	var bChecked = pattern.test(strEmail);    
	return bChecked;
}

function printDiv(target, options) 
{
	$("#"+target).printElement(options);
}

function digit_check(evt)  //숫자만을 기입받게 하는 방법
{
	var code = evt.which?evt.which:event.keyCode;
	if(code < 48 || code > 57){
	return false;
	}
}


//나이는 숫자만 입력가능하게

function onlyNumber() {

	if(event.keyCode<48 || event.keyCode>57){ // keyCode 아스키코드 값을 리턴해주느 함수

		if(navigator.appName=="Netscape")

			event.preventDefault(); //FF(이벤트를 무효화시킴) -> 숫자외에 입력을 불가능하게 한다는 말
		else
			event.returnValue=false; // IE(이벤트를 무효화시킴)

	}

}
//iframe 자동 resize
//function reSizeFrame( win ){
//  try{
//
//        var objBody1= win.document.body;
//        var ifrmHeight1 = objBody1.scrollHeight + (objBody1.offsetHeight - objBody1.clientHeight);
//        var ifrmWidth1  = objBody1.scrollWidth + (objBody1.offsetWidth - objBody1.clientWidth);
//        win.resizeTo( ifrmWidth1 , ifrmHeight1 );
//    }catch(e){
//    	alert(e);
//
//    }
//}

function setIFrameHeight(obj){
	
    if(obj.contentDocument){
        obj.height = obj.contentDocument.body.offsetHeight + 50;
    } else {
        obj.height = obj.contentWindow.document.body.scrollHeight;
    }
}

function CheckWordNumber(str,word){
	
	
	for (i=0;i<str.length;i++){
		check_str=str.substring(i,i+1)
		var fl = false;
		for (j=0;j<word.length;j++)	{
			check_word = word.substring(j,j+1)
			if (check_str == check_word) {
				fl = true
				break;
			}
		}
		
		if(!fl) return false;
	}
	
	return true;
}

function C_Address() {
	var pop = window.open("/pages/juso/jusoPopup.jsp","jusopop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	pop.focus();
}

function C_isCheck(checkName) {
	return $("input[name='" + checkName + "']").is(":checked");
}


function C_hasCheck(checkName, value)  {
	var checked = false;
	$("input[name='" + checkName + "']:checked").each(function (index) {  
		if( $(this).val() == value ) {
			checked = true;
		}
	});  
	return checked;
}

function C_getCheckVal(checkName) {
	var value = "";
	$("input[name='" + checkName + "']:checked").each(function(index) {
		if( $(this).val() ) {
			value += $(this).val();
		}
	});
	return value;
	
	
}


function openEnglishWindow() {
	window.open("/english/index.jsp", "english");
}


function checkPassword(id) {
	var pw = $("#" + id).val();

	// 암호화 체크
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@#$%^&*()]/;
	
	if( pw.length < 8 ) {
		alert("비밀번호의 길이는 8자 이상이어야 합니다");
		return false;
	}
	
	var cnt = 0; 
	if ( pattern1.test(pw) ) cnt++;
	if ( pattern2.test(pw) ) cnt++;
	if ( pattern3.test(pw) ) cnt++;

	if( cnt < 2 ) {
		alert("비밀번호는 영문, 숫자, 특수문자를 최소한 2개이상 포함하여야 합니다.");
		return false;
	}
	return true;
}


function checkDigit(obj, len) {
	var iVal = $(obj).val();
	iVal = iVal.replace(/[^0-9]/gi,"");
	
    if (!( event.keyCode >= 48 && event.keyCode <= 57 ) && !( event.keyCode >= 96 && event.keyCode <= 105 ) 
    		&& event.keyCode != 13 && event.keyCode != 8 ) { //숫자키만 입력
    	event.returnValue = false;
    }
  
	if( len > 0 && $(obj).val().length >= len ) { 
		$(obj).val(iVal.substring(0, len) );
		event.returnValue = false;
	}
	$(obj).val(iVal);
}


function initEmail( selectId, targetId ) {
	$.ajax ({
	      url		: "/common_groupcode_option.do?groupCode=025"
		, dataType  : "text"
		, success	: function(html) {
			$("#" + selectId).html(html);
		}
	});
	
	$("#" + selectId).change(function(obj){
		var code = $("#" + selectId + " option:selected").val();
		 
		if( code != '01') {
			var email_comp = $("#email_code option:selected").text();
			$("#" + targetId).val(email_comp);
		} else {
			$("#" + targetId).val("");
		} 	
	});
}

function f_CommonSearch() {
	var search = $("#top_search").val();
	var keyword = $("#top_keyword").val();
	location.href="/ks_result.do?search=" + search + "&keyword=" + keyword;
	
}





jQuery(function ($) {
/* *********************** 드롭다운 ************************ */
  $(".cm-drop-menu-box-JS").each(function () {
    var $dropBox = $(this);
    var $dropOpenBtn = $(this).find(".cm-drop-open-btn-JS");
    var $dropList = $(this).find(".cm-drop-list-JS");
    var eventState = $dropBox.data("drop-event");

    if (eventState === "click") {
      $dropOpenBtn.click(function () {
        $dropList.slideToggle(500);
        $dropBox.toggleClass("open");
        $dropBox.on("mouseleave", function () {
          dropClose();
        });
        return false;
      });
      $("body").click(function () {
        dropClose();
      });
    } else if (eventState === "hover") {
      $dropBox.hover(function () {
        $dropList.slideDown(500);
        $dropBox.addClass("open");
      }, function () {
        dropClose();
      });
    }

    function dropClose() {

      $dropList.slideUp(500);
      $dropBox.removeClass("open");

    }
    $(window).resize(function () {
      $dropList.hide();
    });
  });
	
});

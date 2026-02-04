var nowZoom = 100; 
var maxZoom = 150; 
var minZoom = 80; 

function zoomInOut(value) {
	var browser = navigator.userAgent.toLowerCase();

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

function CalendarControl() 
{
	var calendarId = 'CalendarControl';
	var currentYear = 0;
	var currentMonth = 0;
	var currentDay = 0;

	var months = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	var dateField = null;

	function getProperty(p_property){
		var p_elm = calendarId;
		var elm = null;
	
		if(typeof(p_elm) == "object"){
			elm = p_elm;
		} else {
			elm = document.getElementById(p_elm);
		}
	
		if (elm != null){
			if(elm.style){
				elm = elm.style;
				if(elm[p_property]){
					return elm[p_property];
				} else {
					return null;
				}
			} else {
				return null;
			}
		}
	}

	function setElementProperty(p_property, p_value, p_elmId){
		var p_elm = p_elmId;
		var elm = null;

		if(typeof(p_elm) == "object"){
			elm = p_elm;
		} else {
			elm = document.getElementById(p_elm);
		}
		if((elm != null) && (elm.style != null)){
			elm = elm.style;
			elm[ p_property ] = p_value;
		}
	}

	function setProperty(p_property, p_value) {
		setElementProperty(p_property, p_value, calendarId);
	}

	function getDaysInMonth(year, month) {
		return [31,((!(year % 4 ) && ( (year % 100 ) || !( year % 400 ) ))?29:28),31,30,31,30,31,31,30,31,30,31][month-1];
	}

	function getDayOfWeek(year, month, day) {
		var date = new Date(year,month-1,day)
		return date.getDay();
	}

	this.clearDate = clearDate;
	function clearDate() {
		dateField.value = '';
		hide();
	}

	this.setDate = setDate;
	function setDate(year, month, day) {
		if (dateField) {
			if (month < 10) {month = "0" + month;}
			if (day < 10) {day = "0" + day;}
			var dateString = year+"/"+month+"/"+day;
			dateField.value = dateString;
			hide();
		}
		return;
	}

	this.changeMonth = changeMonth;
	function changeMonth(change) {
		currentMonth += change;
		currentDay = 0;

		if(currentMonth > 12) {
			currentMonth = 1;
			currentYear++;
		} else if(currentMonth < 1) {
			currentMonth = 12;
			currentYear--;
		}

		calendar = document.getElementById(calendarId);
		calendar.innerHTML = calendarDrawTable();
	}

	this.changeYear = changeYear;
	function changeYear(change) {
		currentYear += change;
		currentDay = 0;
		calendar = document.getElementById(calendarId);
		calendar.innerHTML = calendarDrawTable();
	}

	function getCurrentYear() {
		var year = new Date().getYear();
		if(year < 1900) year += 1900;
		return year;
	}

	function getCurrentMonth() {
		return new Date().getMonth() + 1;
	} 

	function getCurrentDay() {
		return new Date().getDate();
	}

	function calendarDrawTable() 
	{
		var dayOfMonth = 1;
		var validDay = 0;
		var startDayOfWeek = getDayOfWeek(currentYear, currentMonth, dayOfMonth);
		var daysInMonth = getDaysInMonth(currentYear, currentMonth);
		var css_class = null; //CSS class for each day

		var table = "<table class='table t2 text small s1 ca center mt20 mb20'>";
		table = table + "<colgroup><col width='42'><col width='42'><col width='42'><col width='42'><col width='42'><col width='42'><col width='42'></colgroup>";
		table = table + "<thead><tr><th colspan='7' scope='col' class='bold cm'><div class='paging small left'>";
		table = table + "<a href='javascript:handleChangedMonth(-1);' class='p_btn prev left fl test'><span class='icon'></span><span class='ti'>지난달</span></a>";
		table = table + "<span class='text middle bold'>" + currentYear +"년 " + months[currentMonth-1] + "</span>";
		table = table + "<a href='javascript:handleChangedMonth(1);' class='p_btn next right fr'><span class='icon'></span><span class='ti'>다음달</span></a>";
		table = table + "</div></th></tr></thead>";
		table = table + "<tbody><tr><td class='cp'>S</td><td>M</td><td>T</td><td>W</td><td>T</td><td>F</td><td class='cs'><a href='' class='exbold cs'>S</a></td></tr>";

		for(var week=0; week < 6; week++) {
		table = table + "<tr>";
		for(var dayOfWeek=0; dayOfWeek < 7; dayOfWeek++) {
			if(week == 0 && startDayOfWeek == dayOfWeek) {
			validDay = 1;
			} else if (validDay == 1 && dayOfMonth > daysInMonth) {
			validDay = 0;
			}

			if(validDay) {
			if (dayOfWeek == 0) {
				table = table + "<td class='cp' name='dd_" + dayOfMonth+ "'>"+dayOfMonth+"</td>";
			} else if (dayOfWeek == 6) {
				table = table + "<td class='cs' name='dd_" + dayOfMonth+ "' >"+dayOfMonth+"</td>";
			} else {
				table = table + "<td name='dd_" + dayOfMonth+ "'>"+dayOfMonth+"</td>";
			}
			dayOfMonth++;
			} else {
			table = table + "<td></td>";
			}
		}
		table = table + "</tr>";
		}
		table = table + "</tbody>";
		table = table + "</table>";
		return table;
	}

	this.show = show;
	function show(yy,mm,dd)
	{
		if (yy != undefined) 
			currentYear = yy;
		else
			currentYear  = getCurrentYear();
		
		if (mm != undefined) 
			currentMonth = mm;
		else
			currentMonth = getCurrentMonth();
		
		if (dd != undefined) 
			currentDay = dd;
		else
			currentDay 	 = getCurrentDay();
		
		calendar = document.getElementById(calendarId);
		calendar.innerHTML = calendarDrawTable(currentYear, currentMonth);
	}

	this.hide = hide;
	function hide() {
		if(dateField) {
			setProperty('display', 'none');
			dateField = null;
		}
	}

	this.visible = visible;
	function visible() {
		return dateField
	}
}


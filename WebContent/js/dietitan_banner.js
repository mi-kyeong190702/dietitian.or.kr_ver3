var iedom=document.all||document.getElementById

var sliderwidth="700px";
var sliderheight="40px";
var slidespeed="1";
var slidebgcolor="#ffffff";

var slideshowgap=0;
var copyspeed=slidespeed;

var actualwidth='';
var cross_slide, ns_slide;
var righttime,lefttime;



// ***************************************************** BANNER LIST ***************************************************** //



// ***************************************************** BANNER LIST ***************************************************** //

bannerlist='<nobr>'+bannerlist.join("")+'</nobr>'

initBbannerScroll();

function initBbannerScroll()
{
	if (iedom)
		document.write('<span id="temp" style="visibility:hidden;position:absolute;top:-100px;left:-9000px">'+bannerlist+'</span>')

	if (iedom||document.layers)
	{
		with (document)
		{
			if (iedom)
			{
				write('<div style="position:relative;width:'+sliderwidth+';height:'+sliderheight+';overflow:hidden">')
				write('<div style="position:absolute;width:'+sliderwidth+';height:'+sliderheight+';background-color:'+slidebgcolor+'" onMouseover="copyspeed=0" onMouseout="copyspeed=1">')
				write('<div id="cross_slide" style="position:absolute;left:0px;top:0px"></div>')
				write('<div id="cross_slide2" style="position:absolute;left:-1000px;top:0px"></div>')
				write('</div></div>')
			}
			else if (document.layers)
			{
				write('<ilayer width='+sliderwidth+' height='+sliderheight+' name="ns_slidemenu" bgColor='+slidebgcolor+'>')
				write('<layer name="ns_slidemenuorange" left=0 top=0 onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
				write('<layer name="ns_slidemenu3" left=0 top=0 onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
				write('</ilayer>')
			}
		}
	}

	startBannerScroll();
}

function startBannerScroll()
{
	if (iedom)
	{
		cross_slide=document.getElementById? document.getElementById("cross_slide") : document.all.cross_slide
		cross_slide2=document.getElementById? document.getElementById("cross_slide2") : document.all.cross_slide2
		cross_slide.innerHTML=cross_slide2.innerHTML=bannerlist
		actualwidth=document.all? cross_slide.offsetWidth : document.getElementById("temp").offsetWidth
		cross_slide2.style.left=actualwidth+slideshowgap+"px"
	}
	else if (document.layers)
	{
		ns_slide=document.ns_slidemenu.document.ns_slidemenuorange
		ns_slide2=document.ns_slidemenu.document.ns_slidemenu3
		ns_slide.document.write(bannerlist)
		ns_slide.document.close()
		actualwidth=ns_slide.document.width
		ns_slide2.left=actualwidth+slideshowgap
		ns_slide2.document.write(bannerlist)
		ns_slide2.document.close()
	}
	lefttime=setInterval("slideleft()",30)
}

function slideleft()
{
	if (iedom)
	{
		if (parseInt(cross_slide.style.left)>(actualwidth*(-1)+8))
			cross_slide.style.left=parseInt(cross_slide.style.left)-copyspeed+"px"
		else
			cross_slide.style.left=parseInt(cross_slide2.style.left)+actualwidth+slideshowgap+"px"
		if (parseInt(cross_slide2.style.left)>(actualwidth*(-1)+8))
			cross_slide2.style.left=parseInt(cross_slide2.style.left)-copyspeed+"px"
		else
			cross_slide2.style.left=parseInt(cross_slide.style.left)+actualwidth+slideshowgap+"px"
	}
	else if (document.layers)
	{
		if (ns_slide.left>(actualwidth*(-1)+8))
			ns_slide.left-=copyspeed
		else
			ns_slide.left=ns_slide2.left+actualwidth+slideshowgap
		if (ns_slide2.left>(actualwidth*(-1)+8))
			ns_slide2.left-=copyspeed
		else
			ns_slide2.left=ns_slide.left+actualwidth+slideshowgap
	}
}

function slideright()
{
	if (iedom)
	{
		if (parseInt(cross_slide.style.left)<(actualwidth+8))
			cross_slide.style.left=parseInt(cross_slide.style.left)+copyspeed+"px"
		else
			cross_slide.style.left=parseInt(cross_slide2.style.left)+actualwidth*(-1)+slideshowgap+"px"
		if (parseInt(cross_slide2.style.left)<(actualwidth+8))
			cross_slide2.style.left=parseInt(cross_slide2.style.left)+copyspeed+"px"
		else
			cross_slide2.style.left=parseInt(cross_slide.style.left)+actualwidth*(-1)+slideshowgap+"px"
	}
	else if (document.layers)
	{
		if (ns_slide.left>(actualwidth*(-1)+8))
			ns_slide.left-=copyspeed
		else
			ns_slide.left=ns_slide2.left+actualwidth+slideshowgap
		if (ns_slide2.left>(actualwidth*(-1)+8))
			ns_slide2.left-=copyspeed
		else
			ns_slide2.left=ns_slide.left+actualwidth+slideshowgap
	}
}

function right()
{
	if(lefttime)
	{
		clearInterval(lefttime)
		clearInterval(righttime)
		righttime=setInterval("slideright()",30)
	}
}

function left()
{
	if(righttime)
	{
		clearInterval(lefttime)
		clearInterval(righttime)
		lefttime=setInterval("slideleft()",30)
	}
}
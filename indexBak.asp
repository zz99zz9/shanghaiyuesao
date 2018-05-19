<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type" />
<title><%=SiteTitle%></title>
<meta name="keywords" content="<%=siteKey%>">
<meta name="description" content="<%=SiteCont%>" />
<link href="/styles/lib.min.css?t=1363940085795.css" rel="stylesheet" type="text/css" />
<link href="/styles/page_index.min.css?t=1363940085795.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/publicScripts/lib.min.js"></script>
<script src="/publicScripts/components/??FrontColumns_navigation01.min.js,FrontPublic_slideShow01.min.js,FrontNews_list01.min.js,FrontProducts_list01.min.js,FrontLinks_list01.min.js"></script>
<script src="/scripts/i18n/FrontNews_list01.js"></script>
<script type="text/javascript" src="/js/jquery.pack.js"></script>
<script type="text/javascript" src="/js/jQuery.blockUI.js"></script>
<script type="text/javascript" src="/js/jquery.SuperSlide.js"></script>
<link href="/styles/default.css" rel="stylesheet" type="text/css">
<link href="/styles/demo.css" rel="stylesheet" type="text/css">
<!------------------------------------>
<LINK rel=stylesheet type=text/css href="css/lanrentuku.css">
<SCRIPT type=text/javascript>
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}

var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
	}
}

var Tween = {
	Quart: {
		easeOut: function(t,b,c,d){
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
	},
	Back: {
		easeOut: function(t,b,c,d,s){
			if (s == undefined) s = 1.70158;
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		}
	},
	Bounce: {
		easeOut: function(t,b,c,d){
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
	}
}


//容器对象,滑动对象,切换数量
var SlideTrans = function(container, slider, count, options) {
	this._slider = $(slider);
	this._container = $(container);//容器对象
	this._timer = null;//定时器
	this._count = Math.abs(count);//切换数量
	this._target = 0;//目标值
	this._t = this._b = this._c = 0;//tween参数
	
	this.Index = 0;//当前索引
	
	this.SetOptions(options);
	
	this.Auto = !!this.options.Auto;
	this.Duration = Math.abs(this.options.Duration);
	this.Time = Math.abs(this.options.Time);
	this.Pause = Math.abs(this.options.Pause);
	this.Tween = this.options.Tween;
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	var bVertical = !!this.options.Vertical;
	this._css = bVertical ? "top" : "left";//方向
	
	//样式设置
	var p = CurrentStyle(this._container).position;
	p == "relative" || p == "absolute" || (this._container.style.position = "relative");
	this._container.style.overflow = "hidden";
	this._slider.style.position = "absolute";
	
	this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
};
SlideTrans.prototype = {
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Vertical:	true,//是否垂直方向（方向不能改）
		Auto:		true,//是否自动
		Change:		0,//改变量
		Duration:	50,//滑动持续时间
		Time:		10,//滑动延时
		Pause:		4000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){},//完成转换时执行
		Tween:		Tween.Quart.easeOut//tween算子
	};
	Extend(this.options, options || {});
  },
  //开始切换
  Run: function(index) {
	//修正index
	index == undefined && (index = this.Index);
	index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
	//设置参数
	this._target = -Math.abs(this.Change) * (this.Index = index);
	this._t = 0;
	this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
	this._c = this._target - this._b;
	
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	//未到达目标继续移动否则进行下一次滑动
	if (this._c && this._t < this.Duration) {
		this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
		this._timer = setTimeout(Bind(this, this.Move), this.Time);
	}else{
		this.MoveTo(this._target);
		this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
	}
  },
  //移动到
  MoveTo: function(i) {
	this._slider.style[this._css] = i + "px";
  },
  //下一个
  Next: function() {
	this.Run(++this.Index);
  },
  //上一个
  Previous: function() {
	this.Run(--this.Index);
  },
  //停止
  Stop: function() {
	clearTimeout(this._timer); this.MoveTo(this._target);
  }
};
</SCRIPT>
<!----------------------------------->
</head>
<body  id="index">
<div class="pageWidth" id="box_root">
  <div id="index_all">
    <div id="top">
      <div id="dh">
        <div id="box_dh">
          <div xmlns="" class="columnSpace" id="elem-FrontColumns_navigation01-1355119869244" name="栏目导航"> 
            <script type="text/javascript"> 
	//<![CDATA[
	/***********************************************
	* All Levels Navigational Menu- (c) Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
	* This notice MUST stay intact for legal use
	* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
	***********************************************/
	FrontColumns_navigation01['FrontColumns_navigation01-1355119869244_init'] = function (){
		FrontColumns_navigation01.d2ddlevelsmenu.init("d2menubar_FrontColumns_navigation01-1355119869244", "topbar");
	}
	$(FrontColumns_navigation01['FrontColumns_navigation01-1355119869244_init']);
	// ]]>
</script>
            <div id="FrontColumns_navigation01-1355119869244" class="FrontColumns_navigation01-d2_c1">
                <!--#include virtual="dh.asp"-->
            </div>
          </div>
        </div>
      </div><!-------------------------->
      <div style="position:absolute;width:850px; margin-left:10px;z-index:5;margin-top:430px;height:120px;">
      <!--//向左滚动代码开始-->
<style type="text/css">

ul,li{margin:0px; padding:0px;list-style:none;}
.sqBorder {width:620px; height:210px; padding:10px; }
.scroll_div {width:620px; height:210px;margin:0 auto; overflow: hidden; white-space: nowrap; }
.scroll_div img {width:180px;height:150px;border: 0;margin: auto 8px;}
#scroll_begin, #scroll_end, #scroll_begin ul, #scroll_end ul, #scroll_begin ul li, 

#scroll_end ul li{display:inline;}/*设置ul和li横排*/
</style>
<script language="javascript">
function ScrollImgLeft(){
var speed=20
var scroll_begin = document.getElementById("scroll_begin");
var scroll_end = document.getElementById("scroll_end");
var scroll_div = document.getElementById("scroll_div");
scroll_end.innerHTML=scroll_begin.innerHTML
function Marquee(){
if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0)
scroll_div.scrollLeft-=scroll_begin.offsetWidth
else
scroll_div.scrollLeft++
}
var MyMar=setInterval(Marquee,speed)
scroll_div.onmouseover=function() {clearInterval(MyMar)}
scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
}
</script>

<div style="text-align:center">
<div class="sqBorder">
<!--#####滚动区域#####-->
<div id="scroll_div" class="scroll_div">
<div id="scroll_begin">
<%set rs=server.CreateObject("adodb.recordset")
sql="select * from prod where kid_id=1 order by Prod_Id"
rs.open sql,conn,3,3%>
<ul>
<%do while not rs.eof%>
<li><img src="<%=rs("prod_pic")%>" width="120" height="150" /></li>
 <%
rs.movenext
loop
rs.close
set rs=nothing
%>
</ul>
</div>
<div id="scroll_end"></div>
</div>
<!--#####滚动区域#####-->
</div>
<script type="text/javascript">ScrollImgLeft();</script>
</div>
<!--//向左滚动代码结束-->
      <style type="text/css"> 
<!--
#demo {

overflow:hidden;

width: 780px;
}
#demo img {
border: 1px solid #E2CB7D;
margin-left:5px;
height:150px;
width:120px;
}
#indemo {
float: left;
width: 800%;
}
#demo1 {
float: left;
}
#demo2 {
float: left;padding-left:7px;
}
-->
</style>
<div id="demo">
<div id="indemo">
<div id="demo1">
<%sql="select  articleId,Title,BigclassId,Spec,SmallclassId,DefaultPicUrl,bigclassName,smallclassName,Product_Id,passed,Product_Id,Memo from [table_product] where passed=true and SmallClassID=87 order by Product_Id,articleId "
Set rs=Server.CreateObject("ADODB.Recordset")
rs.PageSize = 20 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.Open sql,conn,0,2,1 '这里执行你查询SQL并获得结果记录集
pre = true
last = true
page = trim(Request.QueryString("page"))

if len(page) = 0 then
intpage = 1
pre = false
else
if cint(page) =< 1 then
intpage = 1
pre = false
else
if cint(page) >= rs.PageCount then
intpage = rs.PageCount
last = false
else
intpage = cint(page)
end if
end if
end if
if not rs.eof then
rs.AbsolutePage = intpage
end if 
for i=1 to rs.PageSize/10
if rs.EOF or rs.BOF then exit for
%>

            <%
		  for j=1 to 10
		  if Not Rs.eof then%>
<a href="Nurses_view.asp?id=<%=rs("articleid")%>&BigclassId=<%=BigclassId%>&smallclassid=<%=smallclassid%>" ><img  src="<%=Rs("DefaultPicUrl")%>" alt="<%=Rs("Memo")%>" border="0" /></a>
            <%
		Rs.Movenext
		End if
		Next%>  <%
NExt
%><%
rs.close
set rs=nothing
%>
</div>
<div id="demo2"></div>
</div>
</div>
<script> 
<!--
var speed=10;
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
-->
</script>
      
      </div>
      <!------------------------->
      <div id="banner">
        <div id="box_banner">
          <div xmlns="" class="columnSpace" id="elem-FrontPublic_slideShow01-1355120787138" name="公用幻灯"> 
           
            <div id="FrontPublic_slideShow01-1355120787138" class="FrontPublic_slideShow01-d1_c1"> 
          
              
<!--FrontPublic_slideShow01 start-->
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="1002" height="450">
                <param name="movie" value="flash/d3.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="opaque" />
                <embed src="flash/d3.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="1002" height="450"></embed>
              </object>
<!--              <div class="slide-contente">
        
           
      
		<div class="effect">
				<div id="slideBox" class="slideBox">
					<div class="hd" >
						<ul ><li STYLE="color:#333;">1</li><li STYLE="color:#333;">2</li><li STYLE="color:#333;">3</li></ul>
					</div>
					<div class="bd">
						<ul>
							<li><img src="images/pic2.jpg" width="1002" height="315" /></li>
							<li><img src="images/pic3.jpg" /></li>
							<li><img src="images/pic1.jpg" /></li>
						</ul>
					</div>
				</div>
				<script type="text/javascript">jQuery(".slideBox").slide( { mainCell:".bd ul",autoPlay:false} );</script>
		</div>
            
              </div>
              <!--ce_slide_contente end-->
    
              <!--FrontPublic_slideShow01 end--> 
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="middle">
      <div id="lanlan">  </div>
      <div id="logo" style="margin-top:-115px;">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="305" height="195">
          <param name="movie" value="/flash/logo.swf" />
          <param name="wmode" value="transparent" />
          <param name="quality" value="high" />
          <param name="title" value="LOGO" />
          <embed src="/flash/logo.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="305" height="195" wmode="transparent"></embed>
        </object>
      </div>
      <div id="logo" style="margin-top:-105px;margin-left:920px;">
<a href="http://t.qq.com/zhang600808" target="_blank"><img src="/images/weibo.gif" border="0" /></a>
      </div>
      <div id="middle_left">
        <div id="middle01">
          <div id="middle01_011"> <img alt="left01" src="/images/pic/left_01.jpg" /> </div>
          <div id="middle01_012">
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="27%" height="202"><DIV id=idContainer2 class=container>
<TABLE id=idSlider2 border=0 cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
  <%set rs=server.CreateObject("adodb.recordset")
sql="select * from prod where kid_id=3 order by Prod_Id desc"
rs.open sql,conn,3,3%>

<%do while not rs.eof%>

    <TD class=td_f><A href="<%=rs("prod_detail")%>" target="_blank"><IMG src="<%=rs("prod_pic")%>"></A></TD>
 <%
rs.movenext
loop

rs.close
set rs=nothing

%>



   </TR></TBODY></TABLE>
<UL id=idNum class=num></UL>
</DIV>

<SCRIPT>
	var forEach = function(array, callback, thisObject){
		if(array.forEach){
			array.forEach(callback, thisObject);
		}else{
			for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
		}
	}
	
	var st = new SlideTrans("idContainer2", "idSlider2", 5, { Vertical: false });
	
	var nums = [];
	//插入数字
	for(var i = 0, n = st._count - 1; i <= n;){
		(nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
	}
	
	forEach(nums, function(o, i){
		o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
		o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
	})
	
	//设置按钮样式
	st.onStart = function(){
		forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
	}
	st.Run();
</SCRIPT></td>
    <td width="73%" valign="middle" style="padding-left:15px;line-height:220%;"><%call sHowInfo("首页公司地址")%></td>
  </tr>
</table>

          </div>
        </div>
        <div id="middle02">
          <div id="middle02_01"> <img alt="left_02" src="/images/pic/left_02.jpg" />
            <div id="box_middle02_01">
              <div xmlns="" class="columnSpace" id="elem-FrontNews_list01-1355124265229" name="资讯列表" style="height:142px;"> 
                <script type="text/javascript">	
	// <![CDATA[
	FrontNews_list01['FrontNews_list01-1355124265229_init'] = function(){
		var showDegree=0;
		var showQuestionTag=0;
		var showMessageCount=0;
		var otherShowDegree=0;
		var otherShowMessageCount=0;
		var otherShowQuestionTag=0;

			if(showDegree == '1' || showQuestionTag == '1' || showMessageCount == '1' ){
				
					FrontNews_list01.getAjaxValueByNewsId("61","false",showDegree,showMessageCount,showQuestionTag,"FrontNews_list01-1355124265229_VisitedCount_1","FrontNews_list01-1355124265229_CommentCount_1","FrontNews_list01-1355124265229_showQuestionTag_1");
				
			}
			if(otherShowDegree == '1' || otherShowQuestionTag == '1' || otherShowMessageCount == '1'){		
				
					FrontNews_list01.getAjaxValueByNewsId("60","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355124265229_VisitedCount_2","FrontNews_list01-1355124265229_CommentCount_2","FrontNews_list01-1355124265229_showQuestionTag_2");
				
					FrontNews_list01.getAjaxValueByNewsId("59","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355124265229_VisitedCount_3","FrontNews_list01-1355124265229_CommentCount_3","FrontNews_list01-1355124265229_showQuestionTag_3");
				
			}
		
	}
 
	function setVisited(id,linkUrl,detailOpenStyle){	
		//读取资讯的浏览次数！
		$.get("/FrontNews.do", "method=getVisitedCountByAjax&newsId="+id, function(data){
			var linkUrl1 = linkUrl;
			var OpenStyle = detailOpenStyle
			var url = '/FrontNews.do?method=setVisitedCountByAjax&newsId='+id+'&times='+data;
			//保存资讯的浏览次数！
			$.post(url, function(data){
				window.open(linkUrl1,OpenStyle);
				});
		},'html');
	}
	
	$(FrontNews_list01['FrontNews_list01-1355124265229_init']);
	// ]]>
</script>
                <div id="FrontNews_list01-1355124265229" class="FrontNews_list01-d2_c2">

                  <ul class="comstyle newslist-02">
                  <%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=6	
set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='早期教育' order by NEwsId desc"
rs.open sql,conn,3,3
if rs.eof then
else
rs.pagesize=pagesize
totalfilm=rs.recordcount
pgnum=rs.pagecount
if page="" or clng(page)<1 then page=1
if clng(page) > pgnum then page=pgnum
if pgnum>0 then rs.AbsolutePage=page
count=0
do while not rs.eof and count<rs.PageSize %>
                    <li class="content column-num1">
                      <div class="main">
                        <div class="newstitle">
                          <ul>
                            <li class="title">
                              <h3><a href="Knowledge_view.asp?id=<%=rs("newsid")%>&amp;Action=<%=Rs("NewsKinds")%>" style="color:#FFF8B7;" target="_blank"><%=rs("newstitle")%></a></h3>
                            </li>
                            <li class="date"><span></span><%=replace(FormatDateTime(rs("newsdate"),2),"-","/")%> </li>
                          </ul>
                        </div>
                      </div>
                    </li>
          

        <%
rs.movenext
count=count+1
loop
end if

%><%
rs.close
set rs=nothing
%>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div id="middle02_02"> <img alt="right_01" src="/images/pic/right_01.jpg" />
            <div id="box_middle01_02">
              <div xmlns="" class="columnSpace" id="elem-FrontSpecifies_show01-1355124110119" name="说明页">
                <div id="FrontSpecifies_show01-1355124110119" class="FrontSpecifies_show01-d3_c1">
                  <div class="describe htmledit">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="48%"><img src="images/4.jpg" width="141" height="141" /></td>
                        <td width="52%" style="line-height:150%;"><%call sHowInfo_1("雯红简介",120)%><br />[<a href="about.asp" style="color:#fff8b7;">更多</a>]</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="clearBoth"></div>
        </div>
      </div>
      <div id="middle_right"> <img alt="index_hj" src="/images/pic/index_hj.jpg" />
        <div id="middle_right_all">
          <div id="box_hj">
            <div xmlns="" class="columnSpace" id="elem-FrontProducts_list01-1355130831775" name="商品列表"> 
              
              <!-- 装饰器样式开始 -->
              <div class="border_00">
                <div class="border_00-topr">
                  <div class="border_00-topl"> </div>
                </div>
                <div class="border_00-mid">
                  <div class="borderContent">
                    <div id="FrontProducts_list01-1355130831775" class="FrontProducts_list01-d1_c1">
                      <div class="comptitle_00"><strong class="titlestyle_00">商品列表展示</strong></div>
                      <form id="FrontProducts_list01-1355130831775_Form" name="FrontProducts_list01-1355130831775_Form" action="/FrontProducts.do?method=submit" method="post" >
                        <input type="hidden" name="action_page"	value="/products_list01.html"/>
                        <input type="hidden" name="pmcId" value="19"/>
                        <input type="hidden" name="pmscId" value="23"/>
                        <input type="hidden" name="keyword" value=""/>
                        <input type="hidden" name="propertyId" value=""/>
                        <input type="hidden" name="searchType" value=""/>
                        <input type="hidden" name="brandId" value=""/>
                        <input type="hidden" name="beginValue" value=""/>
                        <input type="hidden" name="endValue" value=""/>
                        <input type="hidden" name="orderby" value="8"/>
                        <input type="hidden" name="spType" value=""/>
                        <input type="hidden" name="pageNo_FrontProducts_list01-1355130831775" value="1"/>
                        <input type="hidden" name="pageSize_FrontProducts_list01-1355130831775" value="6"/>
                      </form>
                      <div class="type"> <span class="sort"> </span> </div>
                      <ul class="mainul productlist-02">
                      <%set rs=server.CreateObject("adodb.recordset")
sql="select * from prod where kid_id=2 order by Prod_Id"
rs.open sql,conn,3,3%>

<%do while not rs.eof%>
          <li class="content column-num2">
                          <div class="pic-module">
                            <div class="pic"><a href="<%=rs("prod_detail")%>" ><img  src="<%=rs("prod_pic")%>"  height="125" border="0" /></a></div>
                          </div>
                          <div class="pro-module">
                            <ul class="basic">
                            </ul>
                            <p class="buttonP"> </p>
                          </div>
                        </li>
 <%
rs.movenext
loop

rs.close
set rs=nothing

%>

                        <li class="clearBoth"></li>
                      </ul>
                      <script type="text/javascript"> 
//<![CDATA[
	FrontProducts_list01['FrontProducts_list01-1355130831775_init'] = function() {
		jQuery(".specChangeImg").click(function(){
			var data = $(this).metadata();
			var srcStr=data.smallImgUrl;
			var defaultImg=data.defaultImg;
			$(this).parent().find(".specChangeImg").removeClass("click");
			$(this).addClass("click")
			if(srcStr!=""){
				jQuery("#FrontProducts_list01-1355130831775_"+data.id).attr("src",srcStr);
			}else{
				if(defaultImg!=""){
					jQuery("#FrontProducts_list01-1355130831775_"+data.id).attr("src",defaultImg);
				}else{
					jQuery("#FrontProducts_list01-1355130831775_"+data.id).attr("src","/images/common/noimage.jpg");
				}
			}
		});
	};
	
	jQuery(document).ready(FrontProducts_list01['FrontProducts_list01-1355130831775_init']);
 
//]]>
</script> 
                    </div>
                    <div class="clearBoth"></div>
                  </div>
                </div>
              </div>
              <!-- 装饰器样式结束 --> 
              
              <script type="text/javascript"> 
	
	
	
</script> 
            </div>
          </div>
        </div>
      </div>
      <div class="clearBoth"></div>
    </div>
    <div id="middle_03">
      <div id="middle_03_01"> <img alt="middle03_01" src="/images/pic/middle03_01.jpg" />
        <div id="box_middle_03_01" style="height:220px;">
          <div xmlns="" class="columnSpace" id="elem-FrontSpecifies_show01-1355133013040" name="说明页">
            <div id="FrontSpecifies_show01-1355133013040" class="FrontSpecifies_show01-d3_c1">
              <div class="describe htmledit">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="460">
                  <tbody>
                    <tr>
                      <td valign="middle" width="188"><img alt="" src="/images/3.jpg" /></td>
                      <td valign="top" width="10">&nbsp;</td>
                      <td width="262" height="207" align="left" valign="top"><span style="line-height:150%;"><%call sHowInfo_1("首页专业团队",300)%></span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="middle_03_02"> <img alt="middle03_02" src="/images/pic/middle03_02.jpg" />
        <div id="box_middle_03_02">
          <div xmlns="" class="columnSpace" id="elem-FrontNews_list01-1355133121552" name="资讯列表" style="height:220px;"> 
            <script type="text/javascript">	
	// <![CDATA[
	FrontNews_list01['FrontNews_list01-1355133121552_init'] = function(){
		var showDegree=0;
		var showQuestionTag=0;
		var showMessageCount=0;
		var otherShowDegree=0;
		var otherShowMessageCount=0;
		var otherShowQuestionTag=0;

			if(showDegree == '1' || showQuestionTag == '1' || showMessageCount == '1' ){
				
					FrontNews_list01.getAjaxValueByNewsId("62","false",showDegree,showMessageCount,showQuestionTag,"FrontNews_list01-1355133121552_VisitedCount_1","FrontNews_list01-1355133121552_CommentCount_1","FrontNews_list01-1355133121552_showQuestionTag_1");
				
			}
			if(otherShowDegree == '1' || otherShowQuestionTag == '1' || otherShowMessageCount == '1'){		
				
					FrontNews_list01.getAjaxValueByNewsId("51","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355133121552_VisitedCount_2","FrontNews_list01-1355133121552_CommentCount_2","FrontNews_list01-1355133121552_showQuestionTag_2");
				
					FrontNews_list01.getAjaxValueByNewsId("50","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355133121552_VisitedCount_3","FrontNews_list01-1355133121552_CommentCount_3","FrontNews_list01-1355133121552_showQuestionTag_3");
				
					FrontNews_list01.getAjaxValueByNewsId("49","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355133121552_VisitedCount_4","FrontNews_list01-1355133121552_CommentCount_4","FrontNews_list01-1355133121552_showQuestionTag_4");
				
					FrontNews_list01.getAjaxValueByNewsId("47","false",otherShowDegree,otherShowMessageCount,otherShowQuestionTag,"FrontNews_list01-1355133121552_VisitedCount_5","FrontNews_list01-1355133121552_CommentCount_5","FrontNews_list01-1355133121552_showQuestionTag_5");
				
			}
		
	}
 
	function setVisited(id,linkUrl,detailOpenStyle){	
		//读取资讯的浏览次数！
		$.get("/FrontNews.do", "method=getVisitedCountByAjax&newsId="+id, function(data){
			var linkUrl1 = linkUrl;
			var OpenStyle = detailOpenStyle
			var url = '/FrontNews.do?method=setVisitedCountByAjax&newsId='+id+'&times='+data;
			//保存资讯的浏览次数！
			$.post(url, function(data){
				window.open(linkUrl1,OpenStyle);
				});
		},'html');
	}
	
	$(FrontNews_list01['FrontNews_list01-1355133121552_init']);
	// ]]>
</script>
            <div id="FrontNews_list01-1355133121552" class="FrontNews_list01-d2_c2">
<!--              <ul class="comstyle newslist-01">
                <li class="content column-num1">
                  <div class="pic"> <a href="/news_detail/newsId=62.html" title="养育优秀宝宝培养6个好习惯" target="_self"> <img src="/imageRepository/6ba2d2be-cf24-4d92-8b53-362bc40337bb.jpg" title="养育优秀宝宝培养6个好习惯" alt="养育优秀宝宝培养6个好习惯"/> </a> </div>
                  <div class="main">
                    <div class="newstitle">
                      <ul>
                        <li class="title">
                          <h3> <a href="/news_detail/newsId=62.html" title="养育优秀宝宝培养6个好习惯" target="_self"> 养育优秀宝宝培养6个... </a> </a> </h3>
                        </li>
                      </ul>
                    </div>
                    <div class="newslist">
                      <ul>
                        <li class="summary">
                          <h3>概要：</h3>
                          <p> <a  class="detail" href="/news_detail/newsId=62.html" title="详细" target="_self">详细&gt;&gt;</a> </p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </li>
                <li class="clearBoth"></li>
              </ul>-->
              <ul class="comstyle newslist-02">
              <%
if request("page")="" then
page=0 
else
page=request("page")
end if
pagesize=8	
set rs=server.CreateObject("adodb.recordset")
sql="select * from news where newskinds='家政常识' order by NEwsId desc"
rs.open sql,conn,3,3
if rs.eof then
else
rs.pagesize=pagesize
totalfilm=rs.recordcount
pgnum=rs.pagecount
if page="" or clng(page)<1 then page=1
if clng(page) > pgnum then page=pgnum
if pgnum>0 then rs.AbsolutePage=page
count=0
do while not rs.eof and count<rs.PageSize %>
                <li class="content column-num1">
                  <div class="main">
                    <div class="newstitle">
                      <ul>
                        <li class="title">
                          <h3> <a href="Knowledge_view.asp?id=<%=rs("newsid")%>&amp;Action=<%=Rs("NewsKinds")%>" style="color:#FFF8B7;" target="_blank"><%=rs("newstitle")%></a> </h3>
                        </li>
                        <li class="date"><span></span><%=replace(FormatDateTime(rs("newsdate"),2),"-","/")%> </li>
                      </ul>
                    </div>
                  </div>
                </li>
                <li class="clearBoth"></li>
<%
rs.movenext
count=count+1
loop
end if

rs.close
set rs=nothing

%>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="clearBoth"></div>
    </div>
    <div id="middle04">
      <div id="box_middle04">
        <div xmlns="" class="columnSpace" id="elem-FrontProducts_list01-1355133781449" name="商品列表"> 
          <script type="text/javascript"> 
jQuery(document).ready(function() {
	var ul = jQuery("#FrontProducts_list01-1355133781449 ul.product-scroll");
	if(ul.length == 0){
		ul = jQuery("#FrontProducts_list01-1355133781449 > ul:first");
	}
	if(ul.length == 1){
		
		ul.wrap("<div></div>");
		var div = ul.parent("div");
		
		
			div.addClass("scrollable scrollliner")
			
		
		ul.addClass("scrollitems");
		ul.children("li").addClass("content1");
	}	
});
</script> 
          <script>$(function(){$("#FrontProducts_list01-1355133781449 .scrollable").scrollable({effect:'liner'}).circular().liner({scrollDirection:'left',speed:30});});</script> 
          
          <!-- 装饰器样式开始 -->
          <div class="border_00">
            <div class="border_00-topr">
              <div class="border_00-topl"> </div>
            </div>
            <div class="border_00-mid">
              <div class="borderContent">
                <div id="FrontProducts_list01-1355133781449" class="FrontProducts_list01-d1_c1_01">
                  <div class="comptitle_00"><strong class="titlestyle_00">商品列表展示</strong></div>


<!------>

<!--//向左滚动代码开始-->
<style type="text/css">

ul,li{margin:0px; padding:0px;list-style:none;}
.sqBorder {width:620px; height:210px; padding:10px; }
.scroll_div {width:620px; height:210px;margin:0 auto; overflow: hidden; white-space: nowrap; }
.scroll_div img {width:180px;height:150px;border: 0;margin: auto 8px;}
#scroll_begin, #scroll_end, #scroll_begin ul, #scroll_end ul, #scroll_begin ul li, 

#scroll_end ul li{display:inline;}/*设置ul和li横排*/
</style>
<script language="javascript">
function ScrollImgLeft(){
var speed=20
var scroll_begin = document.getElementById("scroll_begin");
var scroll_end = document.getElementById("scroll_end");
var scroll_div = document.getElementById("scroll_div");
scroll_end.innerHTML=scroll_begin.innerHTML
function Marquee(){
if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0)
scroll_div.scrollLeft-=scroll_begin.offsetWidth
else
scroll_div.scrollLeft++
}
var MyMar=setInterval(Marquee,speed)
scroll_div.onmouseover=function() {clearInterval(MyMar)}
scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
}
</script>

<div style="text-align:center">
<div class="sqBorder">
<!--#####滚动区域#####-->
<div id="scroll_div" class="scroll_div">
<div id="scroll_begin">
<%set rs=server.CreateObject("adodb.recordset")
sql="select * from prod where kid_id=1 order by Prod_Id"
rs.open sql,conn,3,3%>
<ul>
<%do while not rs.eof%>
<li><img src="<%=rs("prod_pic")%>" width="120" height="150" /></li>
 <%
rs.movenext
loop
rs.close
set rs=nothing
%>
</ul>
</div>
<div id="scroll_end"></div>
</div>
<!--#####滚动区域#####-->
</div>
<script type="text/javascript">ScrollImgLeft();</script>
</div>
<!--//向左滚动代码结束-->
<!------>

                </div>
                <div class="clearBoth"></div>
              </div>
            </div>
          </div>
          <!-- 装饰器样式结束 --> 

        </div>
      </div>
    </div>
  </div>
  <div class="clearBoth"></div>
</div>
<!--#include virtual="bottom.asp"-->
</body>
</html>

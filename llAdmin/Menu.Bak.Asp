<%
Response.Buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
%>
<script language="JavaScript">
var isInternetExplorer = navigator.appName.indexOf("Microsoft") != -1;
function Menu_DoFSCommand(command, args) {
	var MenuObj = isInternetExplorer?document.all.Menu:document.Menu;
	top.ChangeURL(args);
}
</script>
<!--#include File="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理后台 </title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="2" class="Leftback" style="margin:0px;" scroll=yes>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="2"></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" class="leftframetable">
  <tr classid="VoteManage"> 
    <td width="2%" height="21"><img src="Images/Folder/main_sys.gif" width="15" height="17"></td>
    <td width="98%"><table width="120" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="titledaohang" id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(Menuid_main);"  language=javascript><font style="font-size:12px">系统参数管理</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" class="leftframetable" Id="Menuid_main" style="display:none;">
  <tr> 
    <td colspan="2">
	<table width="95%" border="0" align="left" cellpadding="2" cellspacing="0">

        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
          <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="WebInfo.asp" onMouseOver="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>通用参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by Simpwind.Xie</font></div>')" target="ContentFrame" class="lefttop">基本信息管理</a></td>
        </tr>
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
          <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="Admin.asp" onMouseOver="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>通用参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by Simpwind.Xie</font></div>')" target="ContentFrame" class="lefttop">管理员管理</a></td>
        </tr>
		
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="AdsManage" style="display:;"> 
          <td valign="top"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="/Space.Asp"  onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>系统配置设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by Simpwind.Xie</font></div>')"
		  target="ContentFrame">空间使用信息</a></td>
        </tr>
		
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="AdsManage" style="display:;"> 
          <td valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="SiteInfo.Asp" 	  onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>子系统维护<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by Simpwind.Xie</font></div>')"
		  target="ContentFrame" class="lefttop">服务器情况</a></td>
        </tr>
		
      </table></td>
  </tr>
</table>


<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  
	onmouseup="opencat(sub_news);"  language=javascript>公司概况管理</td>
  </tr>
  <tr>
  <td colspan="2">
  <table width="100%" border="0" cellspacing="0" cellpadding="2" id="sub_news" style="display:;">
    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=公司简介" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">公司简介</a></td>
  </tr>   
    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=En公司简介" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">公司简介(英文)</a></td>
  </tr>   
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=联系我们" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">联系我们</a></td>
  </tr>   
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=En联系我们" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">联系我们(英文)</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=服务项目" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">服务项目</a></td>
  </tr>   
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=En服务项目" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">服务项目(英文)</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=产品展示" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">产品展示</a></td>
  </tr>   
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=En产品展示" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">产品展示(英文)</a></td>
  </tr>     
 </table></td>
  </tr>
</table>

<!--集团动态管理start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_down);"  language=javascript>新闻资讯管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="sub_down" style="display:none;">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=行业动态" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">行业动态管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=行业动态" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">填加行业动态</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=公司新闻" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>参数设置<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">公司新闻管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=公司新闻" 	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>栏目管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>张文</font></div>')"
	target="ContentFrame" class="lefttop">填加公司新闻</a></td>
  </tr>  
  </table></td>
  </tr>
</table>
<!--集团动态管理End-->

<!--企业荣誉start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Jy);"  language=javascript>企业荣誉管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Jy" style="display:none;"> 
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Prod.Asp?Prod_Type=1"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>商品管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame" class="lefttop">企业荣誉信息</a></td>
	  </tr>
	   <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="AddProd.Asp?Prod_type=1"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>我的目录<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame">添加企业荣誉</a></td>
	  </tr>
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Prod.Asp?Prod_Type=2"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>商品管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame" class="lefttop">企业荣誉信息(英)</a></td>
	  </tr>
	   <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="AddProd.Asp?Prod_type=2"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>我的目录<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame">添加企业荣誉(英)</a></td>
	  </tr>	  
	</table></td>
  </tr>
</table>
<!--企业荣誉End-->

<!--产品信息start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_news);"  language=javascript>产品展示管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_news" style="display:none;">
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_Class.Asp"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>商品管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame" class="lefttop">产品类别设置</a></td>
	  </tr>	 
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_List.Asp"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>商品管理<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame" class="lefttop">产品信息管理</a></td>
	  </tr>
	   <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_Add.Asp"	onmouseover="this.T_BGCOLOR='#FFFFC4';this.T_FONTCOLOR='#000000';this.T_BORDERCOLOR='#000000';this.T_TEMP=2000;this.T_WIDTH='120px';return escape('<div align=\'left\'>我的目录<br> <font style=\'font-size:9px;font-family:Georgia\'>Code by </font><font style=\'font-size:9pt;font-family:宋体\'>刘南兵</font></div>')"
		target="ContentFrame">添加产品展示</a></td>
	  </tr>
	</table></td>
  </tr>
</table>
<!--产品信息End-->

<!--人才招聘start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_user);"  language=javascript>招聘信息管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0" id="sub_user" style="display:none;">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
    <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
    <td><a href="JobList.Asp" 	target="ContentFrame" class="lefttop">招聘信息</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%" valign="top"><div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
    <td><a href="AddJobs.Asp" 	target="ContentFrame" class="lefttop">添加招聘信息</a></td>
  </tr>
</table></td>
  </tr>
</table>
<!--人才招聘End-->

<!--会员start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_Ht);"  language=javascript>会员信息管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0" id="sub_Ht" style="display:none;">
  		<tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
   		  <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
    		<td><a href="UserList.Asp" 	 target="ContentFrame" class="lefttop">会员信息管理</a></td>
		</tr>
	</table>
	</td>
  </tr>
</table>
<!--会员End-->

<!--订单start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_lY);"  language=javascript>订单信息管理</td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="0" id="sub_lY" style="display:none;">
      <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
        <td width="2%" valign="top"><div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
        <td><a href="oRderList.Asp" 	 target="ContentFrame" class="lefttop">订单信息管理</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--订单End-->
<!--留言板start-->
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_KHcx);"  language=javascript>留言信息管理</td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellpadding="2" cellspacing="0" id="sub_KHcx" style="display:none;">
      <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
        <td width="2%" valign="top"><div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
        <td><a href="LYList.Asp" 	 target="ContentFrame" class="lefttop">留言板信息</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--留言板End --->

<!--合作伙伴管理start-->
<!--
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_AzBz);"  language=javascript>链接信息管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0" id="sub_AzBz" style="display:none;">
  		<tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
   		  <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
    		<td><a href="Link.Asp?Action=合作伙伴" 	 target="ContentFrame" class="lefttop">合作伙伴信息</a></td>
		</tr>
		<tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
   		  <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif" ></div></td>
    		<td><a href="Link.Asp?Action=友情链接" 	 target="ContentFrame" class="lefttop">友情链接信息</a></td>
		</tr>
	</table>
	</td>
  </tr>
</table>
-->
<!--合作伙伴管理End-->
</td>
</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang">系统信息</td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td height="105" colspan="2">版权所有：<a href="http://Www.Web024.cn" target="_blank">逐日科技</a><br>
      设计制作：<a href="http://Www.Web024.cn" target="_blank">逐日 Inc.</a><br>
      技术支持：<a href="http://Www.Web024.cn" target="_blank">逐日科技</a><br>
      帮助中心：<a href="http://Www.Web024.cn" target="_blank">逐日帮助</a> <br>
      系统版本：Y08.0.1</td>
  </tr>
</table>
<table width="95%" height="115" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript" src="../FS_Inc/wz_tooltip.js"></script>
<script language="JavaScript" type="text/JavaScript">
function opencat(cat)
{
	  if(cat.style.display=="none")
	  {
		 cat.style.display="";
	  }
	  else
	  {
		 cat.style.display="none"; 
	  }
}
</script>
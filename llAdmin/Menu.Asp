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
          <td width="98%"><a href="WebInfo.asp"  target="ContentFrame" class="lefttop">基本信息管理</a></td>
        </tr>
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage"> 
          <td width="2%" valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="Admin.asp"  target="ContentFrame" class="lefttop">管理员管理</a></td>
        </tr>
		
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="AdsManage" style="display:;"> 
          <td valign="top"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="../Site-space.Asp" target="ContentFrame" class="lefttop">空间使用信息</a></td>
        </tr>
		
		
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="AdsManage" style="display:;"> 
          <td valign="top"> <div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
          <td width="98%"><a href="SiteInfo.Asp" 	target="ContentFrame" class="lefttop">服务器情况</a></td>
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
  <table width="100%" border="0" cellspacing="0" cellpadding="2" id="sub_news" style="display:none;">
  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=雯红简介" target="ContentFrame" class="lefttop">雯红简介</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=服务承诺" target="ContentFrame" class="lefttop">服务承诺</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=服务流程" target="ContentFrame" class="lefttop">服务流程</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=服务内容" target="ContentFrame" class="lefttop">服务内容</a></td>
  </tr>
    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=招聘培训" target="ContentFrame" class="lefttop">招聘培训</a></td>
  </tr> 

    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=温馨报价" target="ContentFrame" class="lefttop">温馨报价</a></td>
  </tr>
      <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td width="2%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=友情加盟" target="ContentFrame" class="lefttop">友情加盟</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=联系我们" 	target="ContentFrame" class="lefttop">联系我们</a></td>
  </tr>
    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=内左" 	target="ContentFrame" class="lefttop">内左联系方式</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=首页公司地址" 	target="ContentFrame" class="lefttop">首页公司地址</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;">
    <td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td><a href="QyJJ.Asp?Type_wj=首页专业团队" 	target="ContentFrame" class="lefttop">首页专业团队</a></td>
  </tr>
 </table>
 </td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Jy);"  language=javascript>员工信息管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Jy" style="display:none;"> 
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_Class.Asp"	target="ContentFrame" class="lefttop">员工类别设置</a></td>
	  </tr>	 
	 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_List.Asp"	target="ContentFrame" class="lefttop">员工信息管理</a></td>
	  </tr>
	   <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
		<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
		<td height="22"><a href="Pro_Add.Asp"	target="ContentFrame">添加员工信息</a></td>
	  </tr>  
	</table></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Gcxm22);"  language=javascript>最新视频管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Gcxm22" style="display:none;">  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=最新视频" target="ContentFrame" class="lefttop">最新视频管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=最新视频" 	target="ContentFrame" class="lefttop">填加最新视频</a></td>
  </tr> 
	</table></td>
  </tr>
</table>

<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Gcxm222);"  language=javascript>首页三图广告</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Gcxm222" style="display:none;">  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="Prod3.Asp?Prod_Type=3"	target="ContentFrame" class="lefttop">三图广告</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="AddProd3.Asp?Prod_type=3" target="ContentFrame">添加广告</a></td>
  </tr>  
	</table></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(sub_down);"  language=javascript>家政知识管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellspacing="0" cellpadding="2" id="sub_down" style="display:none;">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=家政常识" target="ContentFrame" class="lefttop">家政常识管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=家政常识" 	target="ContentFrame" class="lefttop">填加家政常识</a></td>
  </tr> 
    <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=服务内容" target="ContentFrame" class="lefttop">服务内容管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=服务内容" 	target="ContentFrame" class="lefttop">填加服务内容</a></td>
  </tr> 
      <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=服务承诺" target="ContentFrame" class="lefttop">服务承诺管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=服务承诺" 	target="ContentFrame" class="lefttop">填加服务承诺</a></td>
  </tr> 
        <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=月子问答" target="ContentFrame" class="lefttop">月子问答管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=月子问答" 	target="ContentFrame" class="lefttop">填加月子问答</a></td>
  </tr> 
          <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=育婴常识" target="ContentFrame" class="lefttop">育婴常识管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=育婴常识" 	target="ContentFrame" class="lefttop">填加育婴常识</a></td>
  </tr> 
   <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=早期教育" target="ContentFrame" class="lefttop">早期教育管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=早期教育" 	target="ContentFrame" class="lefttop">填加早期教育</a></td>
  </tr> 
     <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=健康指导" target="ContentFrame" class="lefttop">健康指导管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=健康指导" 	target="ContentFrame" class="lefttop">填加健康指导</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=月子食谱" target="ContentFrame" class="lefttop">月子食谱管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=月子食谱" 	target="ContentFrame" class="lefttop">填加月子食谱</a></td>
  </tr>
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="News.Asp?Ty=孕期美容" target="ContentFrame" class="lefttop">孕期美容管理</a></td>
  </tr>
 <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
    <td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
    <td height="22" colspan="2"><a href="AddNews.Asp?Ty=孕期美容" 	target="ContentFrame" class="lefttop">填加孕期美容</a></td>
  </tr>
  </table></td>
  </tr>
</table>

<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Gcxm);"  language=javascript>生活剪影管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Gcxm" style="display:none;">  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="Prod.Asp?Prod_Type=1"	target="ContentFrame" class="lefttop">生活剪影信息</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="AddProd.Asp?Prod_type=1" target="ContentFrame">添加生活剪影</a></td>
  </tr>  
	</table></td>
  </tr>
</table>

<!--<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_Gcxm1);"  language=javascript>软件下载管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_Gcxm1" style="display:none;">  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="Prod.Asp?Prod_Type=2"	target="ContentFrame" class="lefttop">软件下载信息</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="AddProd.Asp?Prod_type=2" target="ContentFrame">添加软件</a></td>
  </tr>  
	</table></td>
  </tr>
</table>-->

<!--
<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" class="leftframetable">
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="RecyleManage">
    <td width="2%"><img src="Images/Folder/sub_sys.gif" width="15" height="17"></td>
    <td width="98%" class="titledaohang"  id=item$pval[CatID]) style="CURSOR: hand"  onmouseup="opencat(mall_cpzz);"  language=javascript>产品资质管理</td>
  </tr>
  <tr>
    <td colspan="2">
	<table width="100%" border="0" cellpadding="2" cellspacing="0"  id="mall_cpzz" style="display:none;">  
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td width="3%"><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="Prod.Asp?Prod_Type=2"	target="ContentFrame" class="lefttop">产品资质信息</a></td>
  </tr> 
  <tr allparentid="OrdinaryMan" parentid="OrdinaryMan" classid="VoteManage" style="display:;"> 
	<td><div align="center"><img src="Images/Folder/folderclosed.gif"></div></td>
	<td height="22"><a href="AddProd.Asp?Prod_type=2" target="ContentFrame">添加产品资质</a></td>
  </tr>  
	</table></td>
  </tr>
</table>

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
-->
<!--人才招聘start-->
<!--
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
-->
<!--人才招聘End-->
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
    <td height="105" colspan="2">版权所有：<a href="http://Www.Web024.cn" target="_blank">兴刚网络</a><br>
      设计制作：<a href="http://Www.Web024.cn" target="_blank">兴刚 Inc.</a><br>
      技术支持：<a href="http://Www.Web024.cn" target="_blank">兴刚网络</a><br>
      帮助中心：<a href="http://Www.Web024.cn" target="_blank">兴刚帮助</a> <br>
      系统版本：Y08.0.1</td>
  </tr>
</table>
<table width="95%" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
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
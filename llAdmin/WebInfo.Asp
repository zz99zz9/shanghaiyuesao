<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--
********************************************************************
网站基本配置信息
********************************************************************
-->
<scRipt type="text/JavaScRipt">
<!--
function MM_displayStatusMsg(msgStR) { //v1.0
  status=msgStR;
  document.MM_RetuRnValue = tRue;
}
//-->
</scRipt>
<body leftmaRgin="0" topmaRgin="0" maRginwidth="0" maRginheight="0">
  <%
  Dim action
  action=Trim(Request.QueryString("Action"))
  select case action
  case ""
  set oRs=Server.CreateObject("ADODB.Recordset")
  oRs.Open "select * From Table_SiteInfo ",conn,1,3
  %>
<foRm method="POST" action="WebInfo.Asp?action=Upda"  name="form1">
<table width="98%" boRdeR="0" align="centeR" cellpadding="2" cellspacing="1" bgcoloR="#097B88" class="table">
        <tr class="hback">
          <td height="25" colspan="4" align="center" class="xingmu"><stRong>网 站 配 置 信 息</stRong></td>
    </tR>
        <tr class="hback">
          <td width="103" height="25" class="xingmu"><stRong>网站名称：</stRong></td>
          <td width="653" height="25" colspan="3" class="back">
          <input name="SiteName" type="text" id="SiteName2" value="<%=oRs("SiteName")%>" style="width:95%;height:18px;" maxlength="255">          </td>
        </tR>
        <tr class="hback">
          <td width="103" height="25" class="xingmu"><stRong>网站标题：</stRong></td>
          <td height="25" colspan="3" class="back">
            <input name="SiteTitle" type="text" id="SiteTitle2" value="<%=oRs("SiteTitle")%>" style="width:95%;height:18px;" maxlength="255">          </td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>网站关键字：</strong></td>
          <td height="25" colspan="3" class="back"><input name="SiteKey" type="text" id="SiteKey" value="<%=oRs("SiteKey")%>" style="width:95%;height:18px;" maxlength="255"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>网站描述信息：</strong></td>
          <td height="25" colspan="3" class="back">
            <textarea name="SiteCont" id="SiteCont" style="width:95%;height:60px;"><%=oRs("SiteCont")%></textarea></td>
        </tR>
        <tr class="hback">
          <td width="103" height="25" class="xingmu"><stRong>网站地址：</stRong><bR>
          请添写完整URL地址</td>
          <td height="25" colspan="3" class="back">
            <input name="SiteURl" type="text" id="SiteURl" value="<%=oRs("SiteURl")%>" style="width:95%;height:18px;" maxlength="255">
            <br>
            <br>
            例：Http://www.Klqb.com          </td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>网站版权信息：</strong></td>
          <td height="25" colspan="3" class="back"><input name="SiteCopyRight" type="text"  value="<%=oRs("SiteCopyRight")%>" style="width:95%;height:18px;" maxlength="255"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>网站备案信息：</strong></td>
          <td height="25" colspan="3" class="back"><input name="Sitebeian" type="text"  value="<%=oRs("Sitebeian")%>" style="width:95%;height:18px;" maxlength="255"></td>
        </tR>
		
        <tr class="hback">
          <td width="103" height="25" class="xingmu"><stRong>网站公告：</stRong></td>
          <td height="25" colspan="3" class="back">
            <input name="WebmasteRName" type="text"  value="<%=oRs("WebmasteRName")%>" style="width:95%;height:18px;">          </td>
        </tR>
      <tr class="hback">
          <td width="103" height="25" class="xingmu"><stRong>手机号码：</stRong></td>
          <td height="25" colspan="3" class="back">
            <input name="WebmasteREmail" type="text"  value="<%=oRs("WebmasteREmail")%>" style="width:95%;height:18px;" maxlength="100">          </td>
        </tR>
	
        <tr class="hback">
          <td height="25" class="xingmu"><strong>公司名称：</strong></td>
          <td height="25" colspan="3" class="back"><input name="CoName" type="text"  value="<%=oRs("CoName")%>" style="width:95%;height:18px;" maxlength="100"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>公司电话：</strong></td>
          <td height="25" colspan="3" class="back"><input name="CoTel" type="text"  value="<%=oRs("CoTel")%>" style="width:95%;height:18px;" maxlength="100"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>公司传真：</strong></td>
          <td height="25" colspan="3" class="back"><input name="CoFax" type="text"  value="<%=oRs("CoFax")%>" style="width:95%;height:18px;" maxlength="100"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>公司地址：</strong></td>
          <td height="25" colspan="3" class="back"><input name="Coaddr" type="text"  value="<%=oRs("Coaddr")%>" style="width:95%;height:18px;" maxlength="100"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><strong>公司邮编：</strong></td>
          <td height="25" colspan="3" class="back"><input name="CoCode" type="text"  value="<%=oRs("CoCode")%>" style="width:95%;height:18px;" maxlength="100"></td>
        </tR>
        <tr class="hback">
          <td height="25" class="xingmu"><stRong>企业邮局：</stRong><bR></td>
          <td height="25" colspan="3" class="back">
            <input name="CoMail" type="text"  value="<%=oRs("CoMail")%>" style="width:95%;height:18px;" maxlength="255"></td>
        </tR>		
        <tr class="hback">
          <td height="25" class="xingmu">&nbsp;</td>
          <td height="25" colspan="3" class="back">
		  <input type="hidden" Name="id" Value="<%=oRs("id")%>">
		  <input type="submit" name="Submit" value="提交">
		  <input type="button" name="Submit2" value="返回" onClick="history.back();"></td>
        </tR>
        <tr class="hback">
          <td height="25" colspan="4" align="left" class="back">注：网站名称、标题、关键字、描述信息确定后，请不要随意更改！以免影响搜索引擎的收录！</td>
        </tR>
  </table>
</foRm>

<%oRs.close
set oRs=Nothing
case "Upda"
id=Trim(Request.Form("id"))
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from Table_SiteInfo where id="&id,conn,1,3
oRs("sitename")=Trim(Request.Form("Sitename"))
oRs("siteTitle")=Trim(Request.Form("SiteTitle"))
oRs("siteKey")=Trim(Request.Form("SiteKey"))
oRs("siteCont")=Trim(Request.Form("SiteCont"))
oRs("siteUrl")=Trim(Request.Form("SiteUrl"))
oRs("siteCopyRight")=Trim(Request.Form("SiteCopyRight"))
oRs("sitebeian")=Trim(Request.Form("Sitebeian"))
oRs("WebMasterName")=Trim(Request.Form("WebMasterName"))
oRs("WebMasterEmail")=Trim(Request.Form("WebMasterEmail"))
oRs("Comail")=Trim(Request.Form("Comail"))
oRs("CoName")=Trim(Request.Form("CoName"))
oRs("CoTel")=Trim(Request.Form("CoTel"))
oRs("CoFax")=Trim(Request.Form("CoFax"))
oRs("CoAddr")=Trim(Request.Form("CoAddr"))
oRs("CoCode")=Trim(Request.Form("CoCode"))
oRs.Update
Set oRs=Nothing
call showPop("信息修改成功！","WebInfo.Asp",1)
case Else
call showPop("错误的参数信息！","-1",2)
End select
%>
</body>
</html>


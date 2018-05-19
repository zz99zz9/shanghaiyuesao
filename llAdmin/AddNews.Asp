<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
	if (document.form1.title.value=='')
		{
			alert("标题不能为空，请您填写！");
			document.form1.title.focus();
			return false;
		}
	return true;
}
</script>
<body>
<%
kinds=request("ty")
act=request("act")
if act="add" then
title=request("title")
text=replace(replace(request("Content"),",","，"),"'","’")
newsfrom=request("newsfrom")
EnNewsTitle=Trim(Request.Form("EnNewsTitle"))
EnNewsText=replace(replace(Trim(Request.Form("EnContent")),",","，"),"'","’")
EnNewsFrom=Trim(Request.Form("EnNewsFrom"))
'添加新闻
 set news=server.CreateObject("adodb.recordset")
     sql="select * from news "
	 news.open sql,conn,3,3	 
	 news.addnew	 
	 news("newstitle")=title
	 news("newstext")=text
	 news("newskinds")=kinds
	 news("newsfrom")=newsfrom  
	 News("EnNewsTitle")=EnNewsTitle
	 News("EnNewsFrom")=EnNewsFrom
	 News("EnNewsText")=EnNewsText
     news.update
	 news.close
	 set news=nothing
response.write "<script language='javascript'>alert('提交成功');location.href('news.asp?ty="&kinds&"');</script>"
else
%>
<form name="form1" method="post" action="" onsubmit="return checkform();">
  <table width="98%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td height="31" colspan="2" align="center" class="xingmu"><strong>添加<%=kinds%>信息</strong></td>
    </tr>
    <tr class="hback">
      <td width="97" align="right" class="back"><%=kinds%>标题： </td>
      <td width="647" class="ischeck"><input name="title" type="text" id="title" size="40">
      <input name="ty" type="hidden" id="ty" value="<%=kinds%>">
      *</td>
    </tr>
<!--    
    <tr class="hback">
      <td height="30" align="center">标题(英文)</td>
      <td>　 
      <input name="EnNewstitle" type="text" id="EnNewstitle" size="40"></td>
    </tr>
	-->
    <tr class="hback">
      <td width="97" height="30" align="right" class="back"><%=kinds%>来源： </td>
      <td><input name="newsfrom" type="text" id="newsfrom" value="本站整理" size="40"></td>
    </tr>
<!--	
    <tr class="hback">
      <td align="center" valign="top">来源(英文)</td>
      <td valign="top">　 
      <input name="EnNewsfrom" type="text" id="EnNewsfrom" size="40"></td>
    </tr>
	-->
    <tr class="hback">
      <td width="97" height="462" align="right" valign="middle" class="back"><%=kinds%>内容：
      </td>
      <td valign="top">
	  
<textarea name="Content" style="display:none"></textarea> 
 <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>
 </td>
    </tr>
<!--	
    <tr class="hback">
      <td align="center">内容(英文)</td>
      <td align="left">
	  <textarea name="EnContent" style="display:none"></textarea> 
      <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=Encontent&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>
 </td>
    </tr>
-->	
    <tr class="hback">
      <td colspan="2" align="center"><input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="重置">
        <input type="button" name="Submit3" value="返回" onClick="history.back();">
        <input name="act" type="hidden" id="act" value="add"></td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>

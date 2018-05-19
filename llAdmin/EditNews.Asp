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
newsid=request("id")
act=request("act")
if act="edit" then
kinds=request("kinds")
title=request("title")
text=replace(replace(request("Content"),",","，"),"'","’")
newsfrom=request("newsfrom")
EnNewsTitle=Trim(Request.Form("EnNewsTitle"))
EnNewsText=replace(replace(Trim(Request.Form("EnContent")),",","，"),"'","’")
EnNewsFrom=Trim(Request.Form("EnNewsFrom"))
 '修改新闻
set news=server.CreateObject("adodb.recordset")
     sql="select * from news where newsid="&newsid
	 news.open sql,conn,3,3
	 news("newstitle")=title
	 news("newstext")=text
	 news("newsfrom")=newsfrom
	 News("EnNewsTitle")=EnNewsTitle
	 News("EnNewsFrom")=EnNewsFrom
	 News("EnNewsText")=EnNewsText
news.update
newskinds=news("newskinds")
news.close
set news=nothing
response.write "<script language='javascript'>alert('提交成功');location.href('news.asp?ty="&newskinds&"');</script>"
else
set  rs=server.CreateObject("adodb.recordset")
     sql="select * from news  where newsid="&newsid
	 rs.open sql,conn,3,3
	 if rs.eof then
	 response.write "<script language='javascript'>alert('该信息不存在');history.go(-1);</script>"
	 else
%>
<form name="form1" method="post" action="" onSubmit="return checkform();">
  <table width="98%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td height="28" colspan="2" align="center" class="xingmu">修改<%=rs("newskinds")%>信息</td>
    </tr>   
    <tr class="hback">
      <td width="98" height="30" align="right" class="back"><%=rs("newskinds")%>标题： </td>
      <td width="646"><input name="title" type="text" id="title" value="<%=rs("newstitle")%>" size="40"></td>
    </tr>
<!--	
    <tr class="hback">
      <td height="30" align="center">标题(英文)</td>
      <td>　
      <input name="EnNewstitle" type="text" id="EnNewstitle" value="<%=rs("EnNewstitle")%>" size="40"></td>
    </tr>
	-->
    <tr class="hback">
      <td width="98" height="30" align="right" class="back"><%=rs("newskinds")%>来源： </td>
      <td><input name="newsfrom" type="text" id="newsfrom" value="<%=rs("newsfrom")%>" size="40"></td>
    </tr>
<!--	
    <tr class="hback">
      <td align="center" valign="top">来源(英文)</td>
      <td valign="top">　
      <input name="EnNewsFrom" type="text" id="EnNewsFrom" value="<%=rs("EnNewsFrom")%>" size="40"></td>
    </tr>
-->
    <tr class="hback">
      <td width="98" align="right" valign="middle" class="back"><%=rs("newskinds")%>内容：</td>
      <td valign="top">
	  <textarea name="Content" style="display:none"><%=rs("newstext")%></textarea> 
	  <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>	  </td>
	</tr>
<!--	
    <tr class="hback">
      <td align="center">内容(英文)</td>
      <td align="left">
<textarea name="EnContent" style="display:none"><%=rs("Ennewstext")%></textarea> 
 <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=Encontent&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe></td>
    </tr>
-->	
    <tr class="hback">
      <td colspan="2" align="center"><input type="submit" name="Submit" value="提交">
        <input type="button" name="Submit3" value="返回" onClick="history.back();">
      <input name="act" type="hidden" id="act" value="edit">
      <input name="id" type="hidden" id="id" value="<%=newsid%>"></td>
    </tr>
</table>
</form>
<%
end if
end if
%>
</body>
</html>

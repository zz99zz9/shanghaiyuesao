<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
act=request("act")
type_wj=request("type_wj")
if act="add" then
text=replace(replace(request("Content"),"'","’"),",","，")
conn.execute"update gsjs set gsjstext='"&text&"' where type_wj='"&type_wj&"'"
response.write "<script language='javascript'>alert('提交成功');location.href('qyjj.asp?type_wj="&type_wj&"');</script>"
else
set rs=server.createobject("adodb.recordset")
    sql="select * from gsjs where type_wj='"&type_wj&"'"
	rs.open sql,conn,3,3	
	if rs.eof then
	else
	text=rs("gsjstext")	
	end if	
	rs.close
	set rs=nothing
%>
<form name="form1" method="post" action="">
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td height="31" align="center" class="xingmu"><strong><%=type_wj%></strong></td>
    </tr>
    <tr class="hback">
      <td align="center" valign="middle"><textarea name="Content" style="display:none;background:#6C2600;"><%=text%></textarea> 
       <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe></td>
    </tr>
    <tr class="hback">
      <td align="center"><input type="submit" name="Submit" value="提交">
      <input name="act" type="hidden" id="act" value="add">
      <input name="type_wj" type="hidden" id="type_wj" value="<%=type_wj%>"></td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>

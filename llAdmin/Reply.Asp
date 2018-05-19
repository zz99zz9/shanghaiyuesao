<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" method="post" action="reply.asp">
<%
 id=request("id")
if request("act")="reply" then
lyreply=replace(replace(request("replys"),",","，"),"'","’")
conn.execute  "update lyb set  lyreply='"&lyreply&"' where lyid="&id 
response.redirect "lylist.asp"
else
set rs=server.createobject("adodb.recordset")
sql="select * from lyb where lyid="&id
rs.open sql,conn,3,3
if rs.eof then
else
lytext=rs("lytext")
end if
%> <br>
<br>
<br>
<br>
  <table width="60%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td width="28%" height="25" align="center" bgcolor="#076B76">留言信息</td>
      <td width="72%" height="25" style="line-height:150%;"><%=lytext%></td>
    </tr>
    <tr class="hback">
      <td height="25" align="center" bgcolor="#076B76">留言回复</td>
      <td height="25"><textarea name="replys" cols="40" rows="6" id="replys"><%=rs("lyreply")%></textarea></td>
    </tr>
    <tr class="hback">
      <td colspan="2" align="center"><input type="submit" name="Submit" value="提交"> <input type="button" onClick="history.back();" name="Submit" value="返回">
      <input name="act" type="hidden" id="act" value="reply">
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>

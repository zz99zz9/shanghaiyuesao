<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	background-color: #eeeeee;
}
-->
</style>
<link href="../css/hhcss.css" rel="stylesheet" type="text/css">
</head>

<body>


<%
if session("adminname")="" then

response.write"<script language='javascript'>alert('用户名或密码错误，请重新登录');top.location.href('login.asp');</script>"

end if

%>
<p>
  <%
act=request("act")

if act="edit" then

kidname=request("kidname")

id=request("id")

conn.execute "update kids set kid_name='"&kidname&"' where kid_id="&id

conn.execute "update twoclass set kid_name='"&kidname&"' where kid_id="&id

conn.execute "update thrclass set kid_name='"&kidname&"' where kid_id="&id

conn.execute "update prod set kid_name='"&kidname&"' where kid_id="&id

response.write"<script language='javascript'>alert('修改成功');location.href('prodkind.asp');</script>"



end if
%>
  
  
  
  
  
  
</p>

<br>
<br>
<table width="60%" height="45" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#C0C0C0" bordercolordark="#FFFFEC">
  <tr>
   <form name="form1" method="post" action="">
 <td>产品类别名称
   <input name="kidname" type="text" id="kidname" value="<%=request("kid_name")%>">
   <input type="submit" name="Submit" value="提交">
   <input name="act" type="hidden" id="act" value="edit">
   <input name="id" type="hidden" id="id" value="<%=request("id")%>"></td> 
   </form>
    
  </tr>
</table>
</body>
</html>

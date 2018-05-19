<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
if request("act")="del" then
id=request("id")
conn.execute "delete from lyb where lyid="&id
response.redirect"lylist.asp"
end if
%>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr>
      <td align="center" class="xingmu">留言中心管理</td>
    </tr>
  </table>
<%
dim intPage,page,pre,last,filepath 
set rs=server.CreateObject("adodb.recordset")
    sql="select * from lyb order by lydate desc"
rs.PageSize = 10 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.open sql,conn,3,3

	
if rs.eof then
			
else
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
	do while not rs.eof and count<rs.PageSize
%>
  <table width="98%" height="132" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td colspan="4" bgcolor="#076974"><a href="reply.asp?id=<%=rs("lyid")%>">回复</a>　　　<a href="lylist.asp?act=del&id=<%=rs("lyid")%>">删除</a></td>
    </tr>
    <tr class="hback">
      <td bgcolor="#076974">留言人：</td>
      <td><%=Rs("LyName")%><%=Rs("LySex")%></td>
      <td width="15%" align="center" valign="middle" bgcolor="#076974">QQ：</td>
      <td width="38%"><%=rs("lyQQ")%></td>
    </tr>
    <tr class="hback">
      <td bgcolor="#076974">联系电话：</td>
      <td><%=rs("lyTel")%></td>
      <td align="center" valign="middle" bgcolor="#076974">Msn：</td>
      <td><%=rs("lyMsn")%></td>
    </tr>
    <tr class="hback">
      <td bgcolor="#076974">留言时间：</td>
      <td><%=rs("lyDate")%></td>
      <td align="center" valign="middle" bgcolor="#076974">Email：</td>
      <td><a href="mailto:<%=rs("lyEmail")%>"><%=rs("lyEmail")%></a></td>
    </tr>
    <tr class="hback">
      <td bgcolor="#076974">联系地址：</td>
      <td><%=rs("lyadder")%></td>
      <td align="center" bgcolor="#076974">IP地址：</td>
      <td><%=rs("lyIp")%></td>
    </tr>
    <tr class="hback">
    <td bgcolor="#076974">留言标题：</td>
    <td width="35%"><%=rs("lytitle")%></td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr class="hback">
    <td width="12%" bgcolor="#076974">留言内容：</td>
    <td colspan="3"><%=rs("lytext")%></td>
  </tr>
  
  <tr class="hback">
    <td bgcolor="#076974">管理员回复：</td>
    <td colspan="3"><%=rs("lyreply")%></td>
  </tr>
</table>
<%
rs.movenext
count=count+1
loop
end if
%>
  <table width="98%" height="25" border="0" align="center" cellpadding="5" cellspacing="1" borderColorLight=#808080 borderColorDark=#ffffff class="table">
  <tr >
    <%if rs.pagecount > 0 then%>
    <td width="15%" align="center" valign="middle" class="back"  >当前页<%=intpage%>/<%=rs.PageCount%></td>
    <%else%>
    <td width="15%" align="center" valign="middle" class="back" >当前页0/0</td>
    <%end if%>
    <td width="70%" align="right" class="back" ><a href="?page=1">首页</a>|</span>
        <%if pre then%>
        <a href="?page=<%=intpage -1%>">上页</a>|</span>
        <%end if%>
        <%if last then%>
        <a href="?page=<%=intpage +1%>">下页</a> |</span>
        <%end if%>
        <a href="?page=<%=rs.PageCount%>">尾页</a>|转到第
      <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
          <%
for i = 1 to rs.PageCount
if i = intpage then%>
          <option value="?page=<%=i%>" selected><%=i%></option>
          <%else%>
          <option value="?page=<%=i%>"><%=i%></option>
          <%
end if
next
rs.close
set rs=nothing
%>
        </select>
    页</td>
  </tr>
</table>
</body>
</html>

<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>

<body>
<%
prod_type=request("prod_type")
'删除
selectid=request("selectid")
if  selectid<>"" then
conn.execute "delete from prod where prod_id in ("&selectid&")"
response.Redirect"prod2.asp?prod_type="&prod_type
end if	  
%>
  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="hback"> 
    <td colspan="2" align="center" class="xingmu"> 
信息管理</td>
    </tr>
  <tr class="hback">
    <td align="left"><a href="addprod2.asp?prod_type=<%=prod_type%>">添加信息</a></td>
    <td width="96">&nbsp;</td>
  </tr>
</table>
<form name="form1" method="post" action="prod2.asp">
  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td width="32" align="center" class="back"><strong>选择</strong></td>
      <td width="39" height="32" align="center" class="back"><strong>序 号</strong><font color="#FFFFFF"><strong>
      <input name="prod_type" type="hidden" id="prod_type" value="<%=prod_type%>">
      </strong></font></td>
      <td width="572" align="center" class="back"><strong>名称</strong></td>
	<%if prod_type=100  then%>
      <td width="47" align="center" bgcolor="#096A75"><strong>推荐</strong></td>
	<%end if%>  
      <td width="38" align="center" bgcolor="#096A75" ><strong>修改</strong></td>
    </tr>
<%
dim intPage,page,pre,last,filepath 
set rs=server.createobject("adodb.recordset")
sql="select * from prod  where kid_id="&prod_type&" order by Prod_id desc"
rs.PageSize = 10 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.open sql,conn,3,3
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
%> <tr class="hback">
  <td align="center" class="hback_1"><input name="selectid" type="checkbox"  id="selectid" value="<%=rs("prod_id")%>"></td> 
      <td align="center" class="hback_1"><%=rs("prod_id")%></td>
      <td align="left" class="hback_1">■<%=rs("prod_name")%></td>
	  <%if prod_type=100  then%>
      <td align="center" class="hback_1"><input name="IsTj" type="checkbox" disabled <%if Rs("IsTj")=1 then%>checked<%end if%>></td>
	  <%End if%>
      <td align="center" class="hback_1"><a href="editprod3.asp?id=<%=rs("prod_id")%>">修改</a></td>
      </tr>  
<%
 rs.movenext
 count=count+1
 loop
 %>  
	<tr class="hback">
		<td colspan="5">
    		<input type="submit" name="Submit" value="删除选中的信息" onClick="return test();">
		</td>
	</tr> 
  </table>  
</form>
 <table width="98%" height="25" border="0" align="center" cellpadding="5" cellspacing="1" borderColorLight=#808080 borderColorDark=#ffffff class="table">
  <tr >
    <%if rs.pagecount > 0 then%>
    <td width="15%" align="center" valign="middle" class="back"  >当前页<%=intpage%>/<%=rs.PageCount%></td>
    <%else%>
    <td width="15%" align="center" valign="middle" class="back" >当前页0/0</td>
    <%end if%>
    <td width="70%" align="right" class="back" ><a href="?page=1&prod_type=<%=prod_type%>">首页</a>|</span>
        <%if pre then%>
        <a href="?page=<%=intpage -1%>&prod_type=<%=prod_type%>">上页</a>|</span>
        <%end if%>
        <%if last then%>
        <a href="?page=<%=intpage +1%>&prod_type=<%=prod_type%>">下页</a> |</span>
        <%end if%>
        <a href="?page=<%=rs.PageCount%>&prod_type=<%=prod_type%>">尾页</a>|转到第
      <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
          <%
for i = 1 to rs.PageCount
if i = intpage then%>
          <option value="?page=<%=i%>&prod_type=<%=prod_type%>" selected><%=i%></option>
          <%else%>
          <option value="?page=<%=i%>&prod_type=<%=prod_type%>"><%=i%></option>
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
<script language=javascript>
function test()
{
  if(!confirm('确认删除吗？')) return false;
}
</script>
</body>
</html>

<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的产品吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}

</SCRIPT>
<body>
<%
news_type=Request("ty")
if request("act")="del" and Request.Form("selectid")<>"" then
conn.execute "delete from [News] where Newsid in ("&Trim(Request.Form("selectid"))&")"
response.redirect"News.asp?ty="&Trim(Request.QueryString("Ty"))
end if
if request("act")="del" and Request.QueryString("Id")<>"" then
conn.execute "delete from [News] where Newsid ="&Trim(Request.QueryString("Id"))
response.redirect"News.asp?ty="&Trim(Request.QueryString("Ty"))
end if
%>

  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
    <td align="center" class="xingmu"><%=news_type%>管理 </td>
  </tr>
  <tr class="hback">
    <td><a href="addnews.asp?ty=<%=news_type%>">添加<%=news_type%>信息</a></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
 <form name="from1" action="News.Asp?act=del&ty=<%=News_type%>" method="post">  
    <tr class="hback">
      <td width="28" align="center">选择</td>
      <td width="24" align="center">ID</td>
      <td width="555" height="34" align="center">文章标题</td>
    <td width="83" align="center" valign="middle">添加时间 </td>
    <td width="38" align="center">操 作 </td>
  </tr> 
<%  
'开始分页
dim intPage,page,pre,last,filepath 
'打开数据库  
set rs=server.createobject("adodb.recordset")
sql="select * from news where newskinds='"&news_type&"' order by NewsId desc"
rs.PageSize = 10 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.open sql,conn,3,3
if err.number<>0 then
				response.write "数据库中暂时无数据"
				end if
				if rs.eof And rs.bof then
       				Response.Write "<p align='center' > 对不起，没有查询到您需要的信息！</p>"
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
<tr class="hback">
  <td align="center"><input name="selectid" type="checkbox" onClick="unselectall()" id="selectid" value="<%=cstr(rs("NewsID"))%>"></td>
    <td align="center"><%=rs("NewsId")%></td>
    <td height="25" align="left">■ <%=rs("newstitle")%></td>
    <td align="center"><%=rs("newsdate")%></td>
    <td align="center"><a href="editnews.asp?id=<%=rs("newsid")%>">修改</a></td>
  </tr>
<%
 rs.movenext
 count=count+1
 loop

%>   
<tr class="hback">
  <td height="25" colspan="5" align="left"><input name="chkAll" type="checkbox" id="chkAll" onClick="CheckAll(this.form)" value="checkbox">选中本页显示的所有信息<input name="submit" type='submit' value='删除选定的信息' onclick="return ConfirmDel();"></td>
  </tr> 
</form>
</table>
 <table width="98%" height="25" border="0" align="center" cellpadding="5" cellspacing="1" borderColorLight=#808080 borderColorDark=#ffffff class="table">
  <tr >
    <%if rs.pagecount > 0 then%>
    <td width="15%" align="center" valign="middle" class="back"  >当前页<%=intpage%>/<%=rs.PageCount%></td>
    <%else%>
    <td width="15%" align="center" valign="middle" class="back" >当前页0/0</td>
    <%end if%>
    <td width="70%" align="right" class="back" ><a href="?page=1&ty=<%=news_type%>">首页</a>|</span>
        <%if pre then%>
        <a href="?page=<%=intpage -1%>&ty=<%=news_type%>">上页</a>|</span>
        <%end if%>
        <%if last then%>
        <a href="?page=<%=intpage +1%>&ty=<%=news_type%>">下页</a> |</span>
        <%end if%>
        <a href="?page=<%=rs.PageCount%>&ty=<%=news_type%>">尾页</a>|转到第
      <select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
          <%
for i = 1 to rs.PageCount
if i = intpage then%>
          <option value="?page=<%=i%>&ty=<%=news_type%>" selected><%=i%></option>
          <%else%>
          <option value="?page=<%=i%>&ty=<%=news_type%>"><%=i%></option>
          <%
end if
next
end if
rs.close
set rs=nothing
%>
        </select>
    页</td>
  </tr>
</table>
</body>
</html>

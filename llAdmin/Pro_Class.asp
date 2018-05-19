<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
if  session("adminname")="" then
response.write"<script language='javascript'>alert('请先登录');location.href('login.asp');</script>"
end if
%>
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * from [Table_ProBigClass] order by Orderid",conn,1,3
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("大类名称不能为空！");
    document.form1.BigClassName.focus();
    return false;
  }
}
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("请先添加大类名称！");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("小类名称不能为空！");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("确定要删除此大类吗？删除此大类同时将删除所包含的小类，并且不能恢复！"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("确定要删除此小类吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}
</script>
<BR>
<table cellpadding="2" cellspacing="1" border="0" width="510" align="center" class="table">
	<tr class="back">
		<td  height="25" align="center" class="xingmu"><strong > 类 别 设 置</strong></td>
	</tr>
	<tr class="back">
		<td align="center" class="back">
      <br>
      管理选项：<a href="Pro_Class_Add_Big.Asp">添加大类</a><br>
      <br>
      <table width="500" border="0" cellpadding="0" cellspacing="2" class="table">
        <tr bgcolor="#999999" class="title"> 
          <td width="290" height="25" align="center" class="hback_1"><strong>栏目名称</strong></td>
          <td width="210" height="25" align="center" class="hback_1"><strong>操作选项</strong></td>
        </tr>
<%
do while not rsBigClass.eof
%>
        <tr class="back"> 
          <td width="290" height="25" bgcolor="#C0C0C0" class="back"><img src="Images/+.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
          <td height="25" align="center" bgcolor="#C0C0C0" class="back"><a href="Pro_Class_Add_Small.asp?BigClassId=<%=rsBigClass("BigClassId")%>">添加子栏目</a> 
            | <a href="Pro_Class_Big_edit.asp?BigClassID=<%=rsBigClass("BigClassID")%>">修改</a> 
            | <a href="Pro_Class_Del_Big.asp?BigClassId=<%=rsBigClass("BigClassId")%>" onClick="return ConfirmDelBig();">删除</a></td>
        </tr>
<%
set rsSmallClass=server.CreateObject("adodb.recordset")
rsSmallClass.open "Select * from [Table_ProSmallclass] Where BigClassId="&rsBigClass("BigClassID")&" order by orderid",conn,1,3
if not(rsSmallClass.bof and rsSmallClass.eof) then
do while not rsSmallClass.eof
%>
        <tr class="back"> 
          <td width="290" height="25" class="hback_1">&nbsp;&nbsp;<img src="Images/-.gif" width="15" height="15"><%=rsSmallClass("SmallClassName")%></td>
          <td height="25" align="center" class="hback_1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <a href="Pro_Class_Small_edit.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&BigclassId=<%=rsSmallClass("BigClassId")%>">修改</a> 
            | <a href="Pro_Class_Del_Small.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>" onClick="return ConfirmDelSmall();">删除</a></td>
        </tr>
<%
rsSmallClass.movenext
loop
end if
rsSmallClass.close
set rsSmallClass=nothing	
rsBigClass.movenext
loop
%>
      </table><BR>
	  </td>
	</tr>
</table>
<BR>
<%
rsBigClass.close
set rsBigClass=nothing
call CloseConn()
%>

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
dim Action,BigClassName,EnBigClassName,SmallClassName,EnSmallClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
Orderid=trim(Request("Orderid"))
BigclassId=Trim(Request("BigCLassId"))
BigClassName=trim(request("BigClassName"))
SmallClassName=trim(request("SmallClassName"))
EnSmallClassName=trim(request("EnSmallClassName"))

sqlBig="select * from [Table_ProBigClass] where BigClassId="& BigClassId
Set rsBig= Server.CreateObject("ADODB.Recordset")
rsBig.open sqlBig,conn,1,1
BigclassName=RsBig("BigClassName")
EnBigClassName=rsBig("EnBigClassName")
rsBig.close

if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>大类名不能为空！</li>"
	end if
	if SmallClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>小类名不能为空！</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		if yzcv<>zcv then response.end
		rs.open "Select * from [Table_ProSmallclass] Where BigClassName='" & BigClassName & "' AND SmallClassName='" & SmallClassName & "'",conn,1,3
		if not rs.EOF then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>“" & BigClassName & "”中已经存在小类“" & SmallClassName & "”！</li>"
		else
     		rs.addnew
			rs("BigClassName")=BigClassName
			rs("EnBigClassName")=EnBigClassName
    	 	rs("SmallClassName")=SmallClassName
    	 	rs("EnSmallClassName")=EnSmallClassName
			Rs("BigCLassId")=BigCLassId
			rs("Orderid")=int(orderid)
     		rs.update
	     	rs.Close
    	 	set rs=Nothing
     		call CloseConn()
			Response.Redirect "Pro_Class.asp"  
		end if
	end if
end if
if FoundErr=True then
	call WriteErrMsg()
else
%>
<script language="JavaScript" type="text/JavaScript">
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
</script>
<BR>

			
			<table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
			<form name="form2" method="post" action="Pro_Class_Add_Small.asp" onSubmit="return checkSmall()">
				<tr class="back"> 
					<td height="25" colspan="2" align="center" class="xingmu"><strong>添加小类</strong></td>
				</tr>
				<tr class="back"> 
					<td width="126" height="22" align=right class="back"><strong>所属大类：</strong></td>
					<td width="218" class="back"> 
<select name="BigClassId">
<%
dim rsBigClass
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * from [Table_ProBigClass]",conn,1,1
if rsBigClass.bof and rsBigClass.bof then
	response.write "<option>请先添加文章大类</option>"
else
	do while not rsBigClass.eof
		if rsBigClass("BigClassId")-BigClassId=0 then
			response.write "<option value='"& rsBigClass("BigClassId") & "' selected>" & rsBigClass("BigClassName") & "</option>"
		else
			response.write "<option value='"& rsBigClass("BigClassId") & "'>" & rsBigClass("BigClassName") & "</option>"
		end if
		rsBigClass.movenext
	loop
end if
rsBigClass.close
set rsBigClass=nothing
%>
</select>				  </td>
				</tr>
				<tr class="back"> 
					<td width="126" height="22" align=right class="back"><strong>小类名称：</strong></td>
				  <td class="back"><input name="SmallClassName" type="text" size="20" maxlength="30"></td>
				</tr>
				<tr class="back">
				  <td height="22" align="right" class="back"><strong>排序ID：</strong></td>
				  <td height="22" align="left" class="back"><input name="OrderID" type="text" id="OrderID" onKeyUp="if(event.keyCode !=37 && event.keyCode != 39) value=value.replace(/\D/g,'');" value="0" size="20" maxlength="30"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"></td>
			  </tr>
				<tr class="back"> 
					<td height="22" align="center" class="back">&nbsp; </td>
				  <td height="22" align="center" class="back">
				  <input name="Action" type="hidden" id="Action3" value="Add">
				  <input name="Add" type="submit" value=" 添 加 "></div></td>
				</tr>
				</form>
			</table>

<%
end if
call CloseConn()
%>

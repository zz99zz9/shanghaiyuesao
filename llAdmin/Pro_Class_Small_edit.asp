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
dim SmallClassID,Action,BigClassName,EnBigClassName, SmallClassName,EnSmallClassName, OldSmallClassName,EnOldSmallClassName,rs,FoundErr,ErrMsg

SmallClassID=trim(Request("SmallClassID"))
Action=trim(Request("Action"))
OrderId=trim(Request("OrderId"))
BigClassId=trim(Request("BigClassId"))
BigClassName=trim(Request("BigClassName"))
SmallClassName=trim(Request("SmallClassName"))
EnSmallClassName=trim(Request("EnSmallClassName"))
OldSmallClassName=trim(request("OldSmallClassName"))
EnOldSmallClassName=trim(request("EnOldSmallClassName"))

sqlBig="select * from [Table_ProBigClass] where BigClassId="&BigClassId
Set rsBig= Server.CreateObject("ADODB.Recordset")
rsBig.open sqlBig,conn,1,1
EnBigClassName=rsBig("EnBigClassName")
BigClassName=rsBig("BigClassName")
rsBig.close

if SmallClassID="" then
	response.Redirect("Pro_Class.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from [Table_ProSmallclass] where SmallClassID="&SmallClassID&"",conn,1,3
if rs.Bof or rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此文章小类不存在！</li>"
else
	if Action="Modify" then
		if SmallClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>文章小类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("SmallClassName")=SmallClassName
			rs("EnSmallClassName")=EnSmallClassName
			rs("OrderID")=int(OrderID)
     		rs.update
			rs.Close
    	 	set rs=Nothing
			'if SmallClassName<>OldSmallClassName then
				conn.execute "Update [Table_Product] set SmallClassName='" & SmallClassName & "',EnSmallClassName='"&EnSmallClassName&"' where BigClassName='" & BigClassName & "' and EnBigClassName='" & EnBigClassName & "' and SmallClassName='" & OldSmallClassName & "' and EnSmallClassName='" & EnOldSmallClassName & "'"
	     	'end if	
			call CloseConn()
    	 	Response.Redirect "Pro_Class.asp"
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
%>
<br />
<br />
<table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
				<form name="form1" method="post" action="Pro_Class_Small_edit.asp">
				<tr class="back"> 
					<td height="25" colspan="2" align="center" class="xingmu"><strong>修改小类名称</strong></td>
				</tr>
				<tr class="back"> 
					<td width="126" height="25" align=right class="back"><strong>所属大类：</strong></td>
					<td width="204" height="25" class="back"><%=rs("BigClassName")%> 
					<input name="SmallClassID" type="hidden" id="SmallClassID" value="<%=rs("SmallClassID")%>"> 
					<input name="OldSmallClassName" type="hidden" id="OldSmallClassName" value="<%=rs("SmallClassName")%>"> 
					<input name="EnOldSmallClassName" type="hidden" id="EnOldSmallClassName" value="<%=rs("EnSmallClassName")%>"> 
				  <input name="BigClassName" type="hidden" id="BigClassName" value="<%=rs("BigClassName")%>">
				  <input name="BigClassId" type="hidden" id="BigClassId" value="<%=rs("BigClassId")%>">				  </td>
				</tr>
				<tr class="back"> 
					<td height="25" align=right class="back"><strong>小类名称：</strong></td>
					<td height="25" class="back">
				  <input name="SmallClassName" type="text" id="SmallClassName" value="<%=rs("SmallClassName")%>" size="20" maxlength="30"></td>
				</tr>
				
				<tr class="back">
                  <td height="22" align="right" class="back"><strong>排序ID：</strong></td>
				  <td height="22" align="left" class="back"><input name="OrderID" type="text" id="OrderID" value="<%=rs("Orderid")%>" size="20" maxlength="30" onKeyUp="if(event.keyCode !=37 && event.keyCode != 39) value=value.replace(/\D/g,'');" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"></td>
				  </tr>
				<tr class="back"> 
					<td height="25" colspan="2" align="center" class="back"> 
					<input name="Action" type="hidden" id="Action4" value="Modify">
					<input name="Save" type="submit" id="Save" value=" 修 改 ">
					<input name="Save2" type="button" id="Save2" value=" 返 回  " onClick="Javascript:history.back();" />				  </td>
				  </tr>
				</form>
</table>  
			
<BR>

<%
end if
end if
rs.close
set rs=nothing
call CloseConn()
%>
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
dim BigClassID,Action,rs,NewBigClassName,EnNewBigClassName,OldBigClassName,FoundErr,ErrMsg
BigClassID=trim(Request("BigClassID"))
Action=trim(Request("Action"))
Orderid=trim(Request("Orderid"))
NewBigClassName=trim(Request("NewBigClassName"))
EnNewBigClassName=trim(Request("EnNewBigClassName"))
OldBigClassName=trim(Request("OldBigClassName"))
pic_url=request("DefaultPicUrl")
mess=request("mess")

if BigClassID="" then
  response.Redirect("Pro_Class.asp")
end if
Set rs=Server.CreateObject("Adodb.RecordSet")
rs.Open "Select * from [Table_ProBigClass] where BigClassID=" & CLng(BigClassID),conn,1,3
if rs.Bof and rs.EOF then
	FoundErr=True
	ErrMsg=ErrMsg & "<br><li>此产品大类不存在！</li>"
else
	if Action="Modify" then
		if NewBigClassName="" then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>产品大类名不能为空！</li>"
		end if
		if FoundErr<>True then
			rs("BigClassName")=NewBigClassName
			rs("EnBigClassName")=EnNewBigClassName
			rs("Admin")=Admin
			rs("Orderid")=Orderid
			rs("pic_url")=pic_url
			rs("mess")=mess
    	 	rs.update
			rs.Close
	     	set rs=Nothing
			'if NewBigClassName<>OldBigClassName then
				conn.execute "Update [Table_ProSmallclass] set BigClassName='" & NewBigClassName & "',EnbigclassName='" & EnNewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
				conn.execute "Update [Table_Product] set BigClassName='" & NewBigClassName & "',EnbigclassName='" & EnNewBigClassName & "' where BigClassName='" & OldBigClassName & "'"
     		'end if		
			call CloseConn()
     		Response.Redirect "Pro_Class.asp" 
		end if
	end if
	if FoundErr=True then
		call WriteErrMsg()
	else
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
</script>
<BR>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
				<form name="form1" method="post" action="Pro_Class_Big_edit.asp">
				<tr class="back"> 
					<td height="25" colspan="2" align="center" class="xingmu"><strong>修改大类名称</strong></td>
				</tr>
				<tr class="back"> 
					<td width="123" height="25" align=right class="back"><strong>大类ID：</strong></td>
					<td width="369" height="25" class="back"> 
					<%=rs("BigClassID")%><input name="BigClassID" type="hidden" id="BigClassID" value="<%=rs("BigClassID")%>">
				  <input name="OldBigClassName" type="hidden" id="OldBigClassName" value="<%=rs("BigClassName")%>"></td>
				</tr>
				<tr class="back"> 
					<td width="123" height="25" align=right class="back"><strong>大类名称：</strong></td>
					<td height="25" class="back">
				  <input name="NewBigClassName" type="text" id="NewBigClassName" value="<%=rs("BigClassName")%>" size="20" maxlength="30"></td>
				</tr>
				 <tr>
      <td width="123" height="25" align="right" class="back"><strong>图片：</strong>        </td>
      <td width="369" height="25" class="back" valign="middle">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35" value="<%=rs("pic_url")%>">
        <input type="button" name="Submit12" value="上传图片" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></td>
    </tr>
		         <tr class="back">
                   <td height="22" align="right" class="back"><strong>排序ID：</strong></td>
		           <td height="22" align="left" class="back"><input name="OrderID" type="text" id="OrderID" size="20" value="<%=rs("Orderid")%>" maxlength="30" onkeyup="if(event.keyCode !=37 && event.keyCode != 39) value=value.replace(/\D/g,'');"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"></td>
	              </tr>
		         <tr class="back"> 
					<td width="123" height="111"  align=right class="back"><strong>简单描述：</strong></td>
					<td  class="back">
					  <textarea name="mess" cols="55" rows="7"><%=rs("mess")%></textarea>					 </td>
				</tr>
				<tr class="back"> 
					<td height="25" align="center" class="back">&nbsp;</td>
					<td height="25" align="center" class="back">
					<input name="Action" type="hidden" id="Action" value="Modify">
					<input name="Save" type="submit" id="Save" value=" 修 改 "></td>
				</tr>
				</form>	
</table> 
<%
end if
end if
rs.close
set rs=nothing
call CloseConn()
%>
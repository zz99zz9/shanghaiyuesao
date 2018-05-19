<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkform()
{
	if (document.Form1.prod_name.value=='')
		{
			alert("名称不能为空，请您填写！");
			document.Form1.prod_name.focus();
			return false;
		}
	return true;
}
</script>
<body>
<%
if  session("adminname")="" then
response.write"<script language='javascript'>alert('请先登录');top.location.href('login.asp');</script>"
end if

action=request("action")
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from prod where prod_id="&id
rs.open sql,conn,3,3

if action="edit" then	

IsTj=Trim(Request.Form("IsTj"))
if IsTj="" then
IsTj=0
Else
isTj=Trim(Request.Form("IsTj"))
End if

if Trim(Request.Form("smallclassId"))<>"" then
safeRequest(Trim(Request.Form("smallclassId")))
smallclassId=Trim(Request.Form("smallclassId"))
set ToRs=Server.CreateObject("ADODB.Recordset")
ToRs.Open "select * From [Table_Smallclass] where Id="&Trim(Request.Form("smallclassId")),conn,1,1
if ToRs.eof then
call showPop("错误的参数信息","-1",2)
Else
TwoClassName=ToRs("TwoClassName")
SmallclassName=ToRs("smallclassName")
End if
ToRs.close
set ToRs=nothing
Else
smallclassId=0
SmallclassName=""
TwoClassName=""
End if
kid_name=Request.Form("kid_name")

rs("prod_name")=request("prod_name")
if Request("DefaultPicUrl")<>"" then
rs("prod_pic")=request("DefaultPicUrl")
End if
rs("prod_detail")=replace(replace(request("Content"),",","，"),"'","’")
Rs("smallclassId")=smallclassId
Rs("smallclass")=smallclassName
rs("kid_name")=kid_name
Rs("TwoClassName")=TwoClassName
Rs("IsTj")=IsTJ
rs("prod_GuiGe")=replace(replace(Request("prod_GuiGe"),",","，"),"'","’")
rs.update
response.write "<script language='javascript'>alert('修改成功');location.href('prod2.asp?prod_type="&rs("kid_id")&"');</script>"
else	  
%>
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
    <td align="center" class="xingmu">信息修改</td>
  </tr>
</table>
<form action="editprod2.asp" method="post" name="myform" id="Form1" onSubmit="return checkform();">
<table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
      <td width="80" height="23" align="center" bgcolor="#07626B">标题</td>
      <td width="663"><input name="prod_name" type="text" id="prod_name" value="<%=rs("prod_name")%>" size="50"></td>
    </tr>	
    <tr class="hback">
      <td width="80" align="center" bgcolor="#07626B">图片</td>
      <td>
	  <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35" value="<%=rs("prod_pic")%>">
	  <input type="button" name="Submit12" value="上传图片" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=txtcontent&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
	  注：图片类型:.Jpg.Gif。	134*125px  </td>
    </tr>	


    <tr class="hback">
      <td width="80" height="25" align="center" bgcolor="#07626B">链接</td>
      <td height="25"><input name="Content" type="text" id="Content"  value="<%=rs("prod_detail")%>" size="50"></td>
    </tr>

    <tr class="hback">
      <td height="40" colspan="2" align="center"><input type="submit" name="Submit" value="提交">
        <input type="button" name="Submit3" value="返回" onClick="history.back();">
      <input name="action" type="hidden" id="action" value="edit">
      <input name="id" type="hidden" id="id" value="<%=id%>"></td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>

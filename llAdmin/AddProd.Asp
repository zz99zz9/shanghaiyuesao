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
action=request("action")
prod_type=request("prod_type")
if prod_type="" then
response.Write "<script language='javascript'>alert('请先选择分类！');history.go(-1);</script>"
end if
set rs1=server.CreateObject("adodb.recordset")
        sql="select * from kids where kid_id="&prod_type
		rs1.open sql,conn,3,3		
		if rs1.eof then
		else
		kid_name=rs1("kid_name")
		end if
if action="add" then
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

set rs=server.CreateObject("adodb.recordset")
sql="select * from [prod]"
rs.open sql,conn,3,3
rs.addnew
rs("prod_name")=request("prod_name")
if Request("DefaultPicUrl")<>"" then
rs("prod_pic")=request("DefaultPicUrl")
End if
rs("prod_detail")=replace(replace(Request("Content"),",","，"),"'","’")
rs("kid_id")=request("prod_type")
rs("kid_name")=kid_name
Rs("smallclassId")=smallclassId
Rs("smallclass")=smallclassName
Rs("TwoClassName")=TwoClassName
Rs("IsTj")=IsTJ
rs("prod_GuiGe")=replace(replace(Request("prod_GuiGe"),",","，"),"'","’")
rs.update
response.Redirect"prod.asp?prod_type="&prod_type	  
else	  
%>
  <table width="98%" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
    <td height="30" align="center" class="xingmu">信息添加</td>
  </tr>
</table>
<form action="addprod.asp?action=add" method="post" name="myform" id="Form1" onSubmit="return checkform();">
  <table width="98%" height="183" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
	  <td width="80" height="25" align="center" bgcolor="#07626B">名&nbsp;&nbsp;&nbsp;&nbsp;称</td>
      <td height="25"><input name="prod_name" type="text" id="prod_name" size="50"></td>
    </tr>
    <tr class="hback">
      <td width="80" height="25" align="center" bgcolor="#07626B"><%if prod_type=2 then %>软&nbsp;&nbsp;&nbsp;&nbsp;件<%else%>图&nbsp;&nbsp;&nbsp;&nbsp;片<%end if%></td>
      <td height="25">
	  <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35" >
	  <input type="button" name="Submit12" value="上传" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=txtcontent&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">	  
	  <%if prod_type=2 then %>注：文件类型exe pdf rar zip<%else%>注：图片类型:.Jpg.Gif。<%end if%>	  </td>
    </tr>
	<%if prod_type=20  then%>	
    <tr class="hback">
      <td height="25" align="center" bgcolor="#07626B">选择分类</td>
      <td height="25">
	  <select name="smallclassId" >
	  <%
	  set BoRs=Server.CreateObject("ADODB.Recordset")
	  BoRs.Open "select * from [Table_smallclass] where bigclassId="&prod_type,conn,1,1
	  if boRs.eof then%>
	  <option value="" selected>暂无分类信息</option>
	  <%
	  Else
	  do while Not boRs.eof %>
	  <option value="<%=boRs("Id")%>" selected><%=boRs("smallClassName")%></option>
	  <%boRs.Movenext
	  Loop
	  End if
	  boRs.close
	  set boRs=Nothing
	  %>
	  </select>	  </td>
    </tr>
<!--	
    <tr class="hback">
      <td height="25" align="center" bgcolor="#07626B">是否推荐</td>
      <td height="25" class="tx"><select name="isTj" >
      <option value="0" selected>暂不推荐</option>
      <option value="1" >设为推荐</option>
      </select>
      选择&quot;设为推荐&quot;,则在推荐区显示.</td>
    </tr>
-->
	<%End if%>
<%if prod_type="31"  then%>	
    <tr class="hback">
      <td width="80" height="25" align="center" bgcolor="#07626B">购&nbsp;买&nbsp;人</td>
      <td height="25"><input name="prod_guige" type="text" id="prod_guige"  size="50"></td>
    </tr>
<%End if%>		
    <tr class="hback">
      <td width="80" height="25" align="center" bgcolor="#07626B">添加日期</td>
      <td height="25"><input name="prod_date" type="text" id="prod_date" value="<%=Date()%>" size="50">
      格式：2009-1-1</td>
    </tr>
    
    <tr class="hback">
      <td width="80" height="25" align="center" bgcolor="#07626B">描述内容</td>
      <td height="25">
	 <textarea name="Content" style="display:none"></textarea> 
	 <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>	  </td>
    </tr>
    <tr class="hback">
      <td height="25" colspan="2" align="center">
	  <input type="submit" name="Submit" value="提交">
      <input type="reset" name="Submit2" value="重置">
      <input type="button" name="Submit3" value="返回" onClick="history.back();">
      <input name="action" type="hidden" id="action" value="add">
      <input name="prod_type" type="hidden" id="prod_type" value="<%=prod_type%>">	  
	  </td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>

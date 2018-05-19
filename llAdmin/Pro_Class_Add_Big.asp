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
dim Action,BigClassName,EnBigClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
EnBigClassName=trim(request("EnBigClassName"))
pic_url=request("pic_url")
Orderid=request("Orderid")
mess=request("mess")
if yzcv<>zcv then response.end
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>文章大类名不能为空！</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * from [Table_ProBigClass] Where BigClassName='" & BigClassName & "'",conn,1,3
		if not (rs.bof and rs.EOF) then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>文章大类“" & BigClassName & "”已经存在！</li>"
		else
    	 	rs.addnew
     		rs("BigClassName")=BigClassName
     		rs("EnBigClassName")=EnBigClassName
			rs("pic_url")=pic_url
			rs("mess")=mess
			rs("Orderid")=int(Orderid)
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
<br />
<br />
<table width="381" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
          <form name="form1" method="post" action="Pro_Class_Add_Big.asp" onSubmit="return checkBig()">
		  <tr > 
            <td height="25" colspan="2" align="center" class="xingmu" ><strong>添加大类</strong></td>
          </tr>
          <tr > 
            <td width="74" height="25" class="back"> 
              <strong>大类名称：</strong></td>
            <td width="299" height="25" class="back"> 
            <input name="BigClassName" type="text" size="20" maxlength="30">            </td>
          </tr>
		  <tr > 
            <td width="74" height="25" class="back"> 
              <strong>图片：</strong></td>
            <td width="299" height="25" class="back"> 
              <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35">
        <input type="button" name="Submit12" value="上传图片" onClick="window.open('Yr_UpFile.Asp?formname=form1&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">            </td>
          </tr>
		  <tr class="back">
            <td height="22" align="left" class="back"><strong>排序ID：</strong></td>
		    <td height="22" align="left" class="back"><input name="OrderID" type="text" id="OrderID"  onkeyup="if(event.keyCode !=37 && event.keyCode != 39) value=value.replace(/\D/g,'');" value="0" size="20" maxlength="30"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\D/g,''))"> </td>
		    </tr>
		  <tr > 
            <td width="74" height="25" class="back"> 
              <strong>简单描述：</strong></td>
            <td width="299" height="25" class="back"> 
            <textarea name="mess" cols="40" rows="7"></textarea>            </td>
          </tr>
       <tr > 
            <td height="25" colspan="2" align="center" class="back"> 
			  <input name="Action" type="hidden" id="Action" value="Add">
			  <input name="Add" type="submit" value=" 添 加 ">
			  <input name="Add2" type="reset" value=" 重 添  " />			</td>
            </tr>
		 </form>
</table>

<%
end if
call CloseConn()
%>

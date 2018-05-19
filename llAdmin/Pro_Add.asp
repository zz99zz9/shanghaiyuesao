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
dim rs
dim sql
dim count

set rs=server.createobject("adodb.recordset")
sql = "select * from [Table_ProSmallclass] order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    

function CheckForm()
{
  if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

  if (Eneditor.EditMode.checked==true)
	  document.myform.EnContent.value=Eneditor.HtmlEdit.document.body.innerText;
  else
	  document.myform.EnContent.value=Eneditor.HtmlEdit.document.body.innerHTML; 

  if (document.myform.Title.value=="")
  {
    alert("文章标题不能为空！");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("产品编号不能为空！");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Key.value=="")
  {
    alert("关键字不能为空！");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Content.value=="")
  {
    alert("文章内容不能为空！");
	editor.HtmlEdit.focus();
	return false;
  }
  return true;  
}
function loadForm()
{
  editor.HtmlEdit.document.body.innerHTML=document.myform.Content.value;
  Eneditor.HtmlEdit.document.body.innerHTML=document.myform.EnContent.value;
  return true
}
</script>

<BR>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="2" class="table">
  <form method="POST" name="myform" onSubmit="return CheckForm();" action="Pro_Save.asp?action=Save" >
    <tr>
      <td height="30" colspan="2" align="center" class="xingmu"><strong>添 加 信 息</strong></td>
    </tr>
    <tr>
      <td width="100" height="22" align="right" class="back">类别：</td>
      <td width="500" class="hback_1"><%
sql = "select * from [Table_ProBigClass]"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "请先添加栏目。"
else
%>
<select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
            <option selected value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
<%
dim selclass
	selclass=rs("BigClassName")
		rs.movenext
	do while not rs.eof
%>
            <option value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
            <%
			rs.movenext
		loop
end if
	rs.close
%>
        </select>
          <select name="SmallClassName">
            <option value="" selected>不指定小类</option>
            <%
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "'"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
            <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
            <%
rs.movenext
do while not rs.eof
%>
            <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
            <%
rs.movenext
loop
end if
rs.close
Dim ranNum
ranNum = month(Now())&day(Now())&hour(Now())&minute(Now())&second(Now())
%>
      </select>      </td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">编号：</td>
      <td class="hback_1"><input name="Product_Id" type="text" id="Product_Id2" value="<%=ranNum%>" size="15" maxlength="15">
      <font color="#FF0000">*编号不可以相同，如你不能确定会重复，请勿改动他！</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">名称：</td>
      <td class="hback_1"><input name="Title" type="text" id="Title2" size="50" maxlength="80">
      <font color="#FF0000">*</font>带星号的要填入</td>
    </tr>	
    <tr>
      <td height="22" align="right" class="back">价格：</td>
      <td class="hback_1"><input name="Spec" type="text" id="Spec2" size="50" maxlength="80" value=""></td>
    </tr>	
<!--	
    <tr>
      <td height="22" align="right" class="back">English价格：</td>
      <td class="back"><input name="EnSpec" type="text" id="EnSpec2" size="50" maxlength="80" value=""></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">English名称：</td>
      <td class="back"><input name="EnTitle" type="text" id="EnTitle2" size="50" maxlength="80">
      <font color="#FF0000">*</font>带星号的要填入      </td>
    </tr>	
    <tr>
      <td height="22" align="right" class="back">产品尺寸：</td>
      <td class="back">
	  <input name="Size" type="text" id="Size2" size="50" maxlength="80" value=""></td>
    </tr>
-->	
    <tr> 
	<td height="22" align="right" bgcolor="#C0C0C0" class="back">备注：</td>
	<td bgcolor="#E3E3E3" class="hback_1"> <input name="Memo" type="text" id="Memo2" size="50" maxlength="80">
	  在编号上面显示</td>
	</tr>
<!--	
	<tr> 
	<td height="22" align="right" bgcolor="#C0C0C0" class="back">English备注：</td>
	<td bgcolor="#E3E3E3" class="hback_1"> <input name="EnMemo" type="text" id="EnMemo2" size="50" maxlength="80">
	  在编号上面显示</td>
	</tr> 
    <tr>
      <td height="22" align="right" class="back">关键字：</td>
      <td class="back"><input name="Key" type="text" id="Key2" size="50" maxlength="80">
          <font color="#FF0000">*</font><br>
        用来查找相关文章，可输入多个关键字，中间用空格分开。不能出现&quot;&quot;'*?,.()等字符。</td>
    </tr>
	-->
	
    <tr>
      <td height="21" align="right" valign="middle" class="back">说明：</td>
      <td class="hback_1"><font color="#FF0000">*</font></td>
    </tr>

    <tr bgcolor="#E3E3E3">
      <td colspan="2" align="center" valign="middle" class="back">
        <textarea name="Content" style="display:none"></textarea> 
 <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>      </td>
    </tr>
<!--	
    <tr>
      <td height="22" align="right" valign="middle" class="back">English说明：</td>
      <td class="back"><font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="#E3E3E3">
      <td colspan="2" align="right" valign="middle">
        <textarea name="EnContent" style="display:none" rows="1" cols="20"></textarea>
        <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=Encontent&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>      </td>
    </tr>
-->	
    <tr>
      <td width="100" height="25" align="right" class="back">图片：
        <input name="IncludePic" type="hidden" id="IncludePic" value="yes"></td>
      <td width="500" height="25" class="hback_1">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35">
        <input type="button" name="Submit12" value="上传图片" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
</td>
    </tr>
	<!--	
    <tr>
      <td height="22" align="right" class="back">大图片：</td>
      <td class="back">
        <input name="DefaultPicUrl2" type="text" id="DefaultPicUrl2" size="35">
        <input type="button" name="Submit12" value="上传图片" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl2&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
</td>
    </tr>
	-->
    <tr>
      <td height="22" align="right" class="back">已通过审核：</td>
      <td class="hback_1"><input name="Passed" type="checkbox" id="Passed2" value="yes" checked>
      是<font color="#0000FF">（如果选中的话将直接发布）</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">推荐显示：</td>
      <td class="back"><input name="Elite" type="checkbox" id="Elite" value="yes">
      是<font color="#0000FF">（如果选中的话将在推荐产品显示）</font></td>
    </tr>	
<!--	
    <tr>
      <td height="22" align="right" class="back">En首页显示：</td>
      <td class="back"><input name="EnElite" type="checkbox" id="EnElite" value="yes">
      是<font color="#0000FF">（如果选中的话将在英文首页做为新产品显示）</font></td>
    </tr>
-->	
    <tr>
      <td height="22" align="right" class="back">录入时间：</td>
      <td class="hback_1"><input name="UpdateTime" type="text" id="UpdateTime2" value="<%=now()%>" maxlength="50">
      当前时间为：<%=now()%> 注意不要改变格式。</td>
    </tr>
    <tr>
      <td height="22" colspan="2" align="center" class="back">
	  <input	name="Add" type="submit"  id="Add" value=" 添 加 " >&nbsp; 
	  <input	name="Add2" type="reset"  id="Add2" value=" 重 写 " >&nbsp;
      <input	name="Add3" type="button"  id="Add3" value=" 返 回 " onClick="Javascript:history.back();"></td>
    </tr>
  </form>
</table>
<BR>


<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
if  session("adminname")="" then
response.write"<script language='javascript'>alert('���ȵ�¼');location.href('login.asp');</script>"
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
    alert("���±��ⲻ��Ϊ�գ�");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("��Ʒ��Ų���Ϊ�գ�");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Key.value=="")
  {
    alert("�ؼ��ֲ���Ϊ�գ�");
	document.myform.Key.focus();
	return false;
  }
  if (document.myform.Content.value=="")
  {
    alert("�������ݲ���Ϊ�գ�");
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
      <td height="30" colspan="2" align="center" class="xingmu"><strong>�� �� �� Ϣ</strong></td>
    </tr>
    <tr>
      <td width="100" height="22" align="right" class="back">���</td>
      <td width="500" class="hback_1"><%
sql = "select * from [Table_ProBigClass]"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "���������Ŀ��"
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
            <option value="" selected>��ָ��С��</option>
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
      <td height="22" align="right" class="back">��ţ�</td>
      <td class="hback_1"><input name="Product_Id" type="text" id="Product_Id2" value="<%=ranNum%>" size="15" maxlength="15">
      <font color="#FF0000">*��Ų�������ͬ�����㲻��ȷ�����ظ�������Ķ�����</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">���ƣ�</td>
      <td class="hback_1"><input name="Title" type="text" id="Title2" size="50" maxlength="80">
      <font color="#FF0000">*</font>���Ǻŵ�Ҫ����</td>
    </tr>	
    <tr>
      <td height="22" align="right" class="back">�۸�</td>
      <td class="hback_1"><input name="Spec" type="text" id="Spec2" size="50" maxlength="80" value=""></td>
    </tr>	
<!--	
    <tr>
      <td height="22" align="right" class="back">English�۸�</td>
      <td class="back"><input name="EnSpec" type="text" id="EnSpec2" size="50" maxlength="80" value=""></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">English���ƣ�</td>
      <td class="back"><input name="EnTitle" type="text" id="EnTitle2" size="50" maxlength="80">
      <font color="#FF0000">*</font>���Ǻŵ�Ҫ����      </td>
    </tr>	
    <tr>
      <td height="22" align="right" class="back">��Ʒ�ߴ磺</td>
      <td class="back">
	  <input name="Size" type="text" id="Size2" size="50" maxlength="80" value=""></td>
    </tr>
-->	
    <tr> 
	<td height="22" align="right" bgcolor="#C0C0C0" class="back">��ע��</td>
	<td bgcolor="#E3E3E3" class="hback_1"> <input name="Memo" type="text" id="Memo2" size="50" maxlength="80">
	  �ڱ��������ʾ</td>
	</tr>
<!--	
	<tr> 
	<td height="22" align="right" bgcolor="#C0C0C0" class="back">English��ע��</td>
	<td bgcolor="#E3E3E3" class="hback_1"> <input name="EnMemo" type="text" id="EnMemo2" size="50" maxlength="80">
	  �ڱ��������ʾ</td>
	</tr> 
    <tr>
      <td height="22" align="right" class="back">�ؼ��֣�</td>
      <td class="back"><input name="Key" type="text" id="Key2" size="50" maxlength="80">
          <font color="#FF0000">*</font><br>
        ��������������£����������ؼ��֣��м��ÿո�ֿ������ܳ���&quot;&quot;'*?,.()���ַ���</td>
    </tr>
	-->
	
    <tr>
      <td height="21" align="right" valign="middle" class="back">˵����</td>
      <td class="hback_1"><font color="#FF0000">*</font></td>
    </tr>

    <tr bgcolor="#E3E3E3">
      <td colspan="2" align="center" valign="middle" class="back">
        <textarea name="Content" style="display:none"></textarea> 
 <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=content&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>      </td>
    </tr>
<!--	
    <tr>
      <td height="22" align="right" valign="middle" class="back">English˵����</td>
      <td class="back"><font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="#E3E3E3">
      <td colspan="2" align="right" valign="middle">
        <textarea name="EnContent" style="display:none" rows="1" cols="20"></textarea>
        <iframe ID="eWebEditor1" src="Southidceditor/ewebeditor.asp?id=Encontent&style=s_coolblue" frameborder="0" scrolling="no" width="600" HEIGHT="450"></iframe>      </td>
    </tr>
-->	
    <tr>
      <td width="100" height="25" align="right" class="back">ͼƬ��
        <input name="IncludePic" type="hidden" id="IncludePic" value="yes"></td>
      <td width="500" height="25" class="hback_1">
        <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" size="35">
        <input type="button" name="Submit12" value="�ϴ�ͼƬ" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
</td>
    </tr>
	<!--	
    <tr>
      <td height="22" align="right" class="back">��ͼƬ��</td>
      <td class="back">
        <input name="DefaultPicUrl2" type="text" id="DefaultPicUrl2" size="35">
        <input type="button" name="Submit12" value="�ϴ�ͼƬ" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl2&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')">
</td>
    </tr>
	-->
    <tr>
      <td height="22" align="right" class="back">��ͨ����ˣ�</td>
      <td class="hback_1"><input name="Passed" type="checkbox" id="Passed2" value="yes" checked>
      ��<font color="#0000FF">�����ѡ�еĻ���ֱ�ӷ�����</font></td>
    </tr>
    <tr>
      <td height="22" align="right" class="back">�Ƽ���ʾ��</td>
      <td class="back"><input name="Elite" type="checkbox" id="Elite" value="yes">
      ��<font color="#0000FF">�����ѡ�еĻ������Ƽ���Ʒ��ʾ��</font></td>
    </tr>	
<!--	
    <tr>
      <td height="22" align="right" class="back">En��ҳ��ʾ��</td>
      <td class="back"><input name="EnElite" type="checkbox" id="EnElite" value="yes">
      ��<font color="#0000FF">�����ѡ�еĻ�����Ӣ����ҳ��Ϊ�²�Ʒ��ʾ��</font></td>
    </tr>
-->	
    <tr>
      <td height="22" align="right" class="back">¼��ʱ�䣺</td>
      <td class="hback_1"><input name="UpdateTime" type="text" id="UpdateTime2" value="<%=now()%>" maxlength="50">
      ��ǰʱ��Ϊ��<%=now()%> ע�ⲻҪ�ı��ʽ��</td>
    </tr>
    <tr>
      <td height="22" colspan="2" align="center" class="back">
	  <input	name="Add" type="submit"  id="Add" value=" �� �� " >&nbsp; 
	  <input	name="Add2" type="reset"  id="Add2" value=" �� д " >&nbsp;
      <input	name="Add3" type="button"  id="Add3" value=" �� �� " onClick="Javascript:history.back();"></td>
    </tr>
  </form>
</table>
<BR>


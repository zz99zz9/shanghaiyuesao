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
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * from [Table_ProBigClass] order by Orderid",conn,1,3
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("�������Ʋ���Ϊ�գ�");
    document.form1.BigClassName.focus();
    return false;
  }
}
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("������Ӵ������ƣ�");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("С�����Ʋ���Ϊ�գ�");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("ȷ��Ҫɾ���˴�����ɾ���˴���ͬʱ��ɾ����������С�࣬���Ҳ��ָܻ���"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("ȷ��Ҫɾ����С����һ��ɾ�������ָܻ���"))
     return true;
   else
     return false;
	 
}
</script>
<BR>
<table cellpadding="2" cellspacing="1" border="0" width="510" align="center" class="table">
	<tr class="back">
		<td  height="25" align="center" class="xingmu"><strong > �� �� �� ��</strong></td>
	</tr>
	<tr class="back">
		<td align="center" class="back">
      <br>
      ����ѡ�<a href="Pro_Class_Add_Big.Asp">��Ӵ���</a><br>
      <br>
      <table width="500" border="0" cellpadding="0" cellspacing="2" class="table">
        <tr bgcolor="#999999" class="title"> 
          <td width="290" height="25" align="center" class="hback_1"><strong>��Ŀ����</strong></td>
          <td width="210" height="25" align="center" class="hback_1"><strong>����ѡ��</strong></td>
        </tr>
<%
do while not rsBigClass.eof
%>
        <tr class="back"> 
          <td width="290" height="25" bgcolor="#C0C0C0" class="back"><img src="Images/+.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
          <td height="25" align="center" bgcolor="#C0C0C0" class="back"><a href="Pro_Class_Add_Small.asp?BigClassId=<%=rsBigClass("BigClassId")%>">�������Ŀ</a> 
            | <a href="Pro_Class_Big_edit.asp?BigClassID=<%=rsBigClass("BigClassID")%>">�޸�</a> 
            | <a href="Pro_Class_Del_Big.asp?BigClassId=<%=rsBigClass("BigClassId")%>" onClick="return ConfirmDelBig();">ɾ��</a></td>
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
            <a href="Pro_Class_Small_edit.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&BigclassId=<%=rsSmallClass("BigClassId")%>">�޸�</a> 
            | <a href="Pro_Class_Del_Small.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>" onClick="return ConfirmDelSmall();">ɾ��</a></td>
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

<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from [Table_oRder] where ord_id="&id
rs.open sql,conn,3,3
if rs.eof then
else
%>

  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
    <td colspan="4" align="center"><strong><%=rs("ord_num")%> �Ķ�����Ϣ </strong></td>
  </tr>
  <tr class="hback">
    <td width="24%" align="center">��Ʒ����</td>
    <td width="30%"><strong><%=rs("prod_name")%></strong></td>
    <td width="10%">��Ʒ�۸�</td>
    <td width="36%"><strong><%=rs("prod_price")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">�� �� ��</td>
    <td><strong><%=rs("ord_lxr")%></strong></td>
    <td>���֤��</td>
    <td><strong><%=rs("ord_uid")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">��ϵ�绰</td>
    <td><strong><%=rs("ord_tel")%></strong></td>
    <td>��ϵ��ַ</td>
    <td><strong><%=rs("ord_addr")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">��ע��Ϣ</td>
    <td colspan="3"><strong><%=rs("ord_text")%></strong></td>
  </tr>
</table>
<%end if%>
</body>
</html>

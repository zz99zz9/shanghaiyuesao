<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
    <td colspan="4" align="center"><strong><%=rs("ord_num")%> 的订单信息 </strong></td>
  </tr>
  <tr class="hback">
    <td width="24%" align="center">产品名称</td>
    <td width="30%"><strong><%=rs("prod_name")%></strong></td>
    <td width="10%">产品价格</td>
    <td width="36%"><strong><%=rs("prod_price")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">订 单 人</td>
    <td><strong><%=rs("ord_lxr")%></strong></td>
    <td>身份证号</td>
    <td><strong><%=rs("ord_uid")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">联系电话</td>
    <td><strong><%=rs("ord_tel")%></strong></td>
    <td>联系地址</td>
    <td><strong><%=rs("ord_addr")%></strong></td>
  </tr>
  <tr class="hback">
    <td align="center">备注信息</td>
    <td colspan="3"><strong><%=rs("ord_text")%></strong></td>
  </tr>
</table>
<%end if%>
</body>
</html>

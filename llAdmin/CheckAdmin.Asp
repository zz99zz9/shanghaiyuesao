<%
if  session("adminname")="" then
response.write "<script language='javascript'>alert('���ȵ�¼');location.href('Login.asp');</script>"
Response.End
end if
%>
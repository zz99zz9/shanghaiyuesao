<%
if  session("adminname")="" then
response.write "<script language='javascript'>alert('ÇëÏÈµÇÂ¼');location.href('Login.asp');</script>"
Response.End
end if
%>
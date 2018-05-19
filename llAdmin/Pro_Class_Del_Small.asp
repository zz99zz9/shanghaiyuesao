<!--#include file="HHconn.asp"-->
<%
dim SmallClassID,sql

SmallClassID=trim(Request("SmallClassID"))
if SmallClassID<>"" then
	sql="delete from [Table_ProSmallclass] where SmallClassID="&Cint(SmallClassID)&""
	conn.Execute sql
end if
call CloseConn()      
response.redirect "Pro_Class.asp"
%>



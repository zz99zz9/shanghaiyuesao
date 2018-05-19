<!--#include file="hhconn.asp"-->
<%
dim BigClassId,sql

BigClassId=trim(Request("BigClassId"))
if BigClassId<>"" then
	sql="delete from [Table_ProBigClass] where BigClassId=" & BigClassId & ""
	conn.Execute sql
	sql="delete from [Table_ProSmallclass] where BigClassId=" & BigClassId & ""
	conn.Execute sql
end if
call CloseConn()      
response.redirect "Pro_Class.asp"
%>



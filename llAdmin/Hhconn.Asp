<%
if  session("adminname")="" then
response.write "<script language='javascript'>alert('出错啦！\n\n您尚未登录或身份已过期！\n\n可能是您长时间没有操作造成的！\n\n请您重新登录！');location.href('Login.asp');</script>"
Response.End
end if
%>
<!--#Include File="Conn.Asp"-->
<!--#Include File="Function.Asp"-->
<%
'db="../%#Data%#Base%#/#hh$lisa.mdb"
'Set conn = Server.CreateObject("ADODB.Connection")
'connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
'conn.open connstr
%>
<%
sub CloseConn()
	conn.close
	set conn=nothing
end sub

Sub closeoRs()
oRs.close
set oRs=Nothing
End sub
%>
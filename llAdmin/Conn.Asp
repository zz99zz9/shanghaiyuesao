<%
db="../%#Data$%Ba#se%%/%#Data$%Ba#se%%.mdb"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")
conn.open connstr
%>

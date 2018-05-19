<%
dim sql_injdata,SQL_inj,SQL_Get,SQL_Data
SQL_injdata = "'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare" 
SQL_inj = split(SQL_Injdata,"|") 

If Request.QueryString<>"" Then 
For Each SQL_Get In Request.QueryString 
For SQL_Data=0 To Ubound(SQL_inj) 
if instr(ucase(Request.QueryString(SQL_Get)),ucase(Sql_Inj(Sql_DATA)))>0 Then 
Response.Write "<Script Language=javascript>alert('请不要在参数中包含非法字符尝试注入！');history.back(-1)</Script>" 
Response.end 
end if 
next 
Next 
End If 

dim IsSqlDataBase

dim conn,connstr



   
'''''''''''''''''''''''''''access数据库'''''''''''''''''''''''

dim db

db="%#Data$%Ba#se%%/%#Data$%Ba#se%%.mdb"
connstr="Provider=Microsoft.Jet.OLEDB.4.0;data source="&Server.MapPath(db)



'On Error Resume Next
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open connstr

'if err then
'Err.clear
'conn.close
'set conn=nothing
'Response.Write "数据库连接出错，请检查连接字串。"
'Response.End
'end if

sub CloseConn()
	conn.close
	set conn=nothing
end sub

Sub CloseoRs()
oRs.close
set oRs=nothing
End sub


%>
<!--#include File="Hhconn.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
Dim Action
Action=Trim(Request.QueryString("Action"))
select case Action
case "Save"
if Trim(Request.Form("smallclassName"))="" then
call sHowPop("名称不能为空","-1",2)
End if
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_smallClass] ",conn,1,3
oRs.Addnew
oRs("bigclassId")=Trim(Request.Form("BigClassId"))
oRs("bigClassName")=Trim(Request.Form("BigClassName"))
oRs("SmallclassName")=Trim(Request.Form("smallclassName"))
oRs("TwoClassName")=Trim(Request.Form("TwoClassName"))
oRs.Update
call closeoRs()
Response.Write "<script Languege=Javascript>alert('操作成功');location.href='KindProd.Asp?bigclassName="&Trim(Request.Form("BigClassName"))&"';</script>"
Response.End
'Response.Redirect "KindProd.Asp?BigClassname="&Trim(Request.Form("BigClassName"))

case "Upda"

id=Trim(Request.Form("id"))
if Trim(Request.Form("smallclassName"))="" then
call sHowPop("名称不能为空","-1",2)
End if

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_smallClass] where id="&id,conn,1,3
oRs("SmallclassName")=Trim(Request.Form("smallclassName"))
oRs("TwoClassName")=Trim(Request.Form("TwoClassName"))
oRs.Update
call closeoRs()
Response.Write "<script Languege=Javascript>alert('操作成功');location.href='KindProd.Asp?bigclassName="&Trim(Request.Form("BigClassName"))&"';</script>"
Response.End


case "Del"
Id=Trim(Request.QueryString("id"))
BigclassName=Trim(Request.QueryString("BigClassName"))
conn.execute "Delete * From [Table_SmallClass] where id="&id
Response.Write "<script Languege=Javascript>alert('删除成功');location.href='KindProd.Asp?bigclassName="&Trim(Request.QueryString("BigClassName"))&"';</script>"
Response.End
'Response.Redirect "KindProd.Asp?BigClassname="&Trim(Request.QueryString("BigClassName"))
end select

%>
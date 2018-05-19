<!--#include File="HHconn.Asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
Dim Action
BigClassName=Trim(Request.Form("BigClassName"))
SmallClassName=Trim(Request.Form("SmallClassName"))

set BoRs=Server.CreateObject("ADODB.Recordset")
BoRs.Open "select * from [Table_ProBigClass] where BigClassName='"&BigClassName&"'",conn,1,1
if Not boRs.Eof then
BigclassId=BoRs("BigClassid")
EnBigClassName=BoRs("EnBigClassName")
End if
BoRs.Close
set BoRs=nothing

set soRs=Server.CreateObject("ADODB.Recordset")
soRs.Open "select * from [Table_ProSmallclass] where smallclassName='"&smallClassName&"'",conn,1,1
if Not soRs.Eof then
smallclassId=soRs("smallClassid")
EnsmallClassName=soRs("EnsmallClassName")
End if
soRs.Close
set soRs=nothing

Product_Id=Trim(Request.Form("Product_Id"))
Title=Trim(Request.Form("Title"))
EnTitle=Trim(Request.Form("EnTitle"))

Spec=Trim(Request.Form("Spec"))
EnSpec=Trim(Request.Form("EnSpec"))

Memo=Trim(Request.Form("Memo"))
EnMemo=Trim(Request.Form("EnMemo"))

Content=replace(replace(Trim(Request.Form("Content")),"'","’"),",","，")
EnContent=replace(replace(Trim(Request.Form("EnContent")),"'","’"),",","，")

IncludePic=Trim(Request.Form("IncludePic"))
DefaultPicUrl=Trim(Request.Form("DefaultPicUrl"))
DefaultPicUrl2=Trim(Request.Form("DefaultPicUrl2"))

Elite=Trim(Request.Form("Elite"))
EnElite=Trim(Request.Form("EnElite"))
passed=Trim(Request.Form("Passed"))
UpdateTime=Trim(Request.Form("UpdateTime"))

if Elite="yes" then
Elite="True"
Else
Elite="False"
End if

if EnElite="yes" then
EnElite="True"
Else
EnElite="False"
End if


if Passed="yes" then
Passed="True"
Else
Passed="False"
End if

Action=Trim(Request.QueryString("Action"))
select case Action
case "Save"
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * From [Table_Product] ",conn,1,3
oRs.Addnew
oRs("Product_id")=Product_id

oRs("bigClassId")=BigClassId
oRs("BigClassName")=BigClassName
oRs("EnBigClassName")=EnBigClassName

oRs("smallClassId")=SmallclassId
oRs("smallclassName")=SmallclassName
oRs("EnsmallClassName")=EnSmallClassName

oRs("Title")=Title
oRs("EnTitle")=EnTitle

oRs("Content")=Content
oRs("EnContent")=EnContent

oRs("spec")=spec
oRs("Enspec")=Enspec

oRs("Memo")=Memo
oRs("EnMemo")=EnMemo

oRs("Elite")=Elite
oRs("EnElite")=EnElite

oRs("Passed")=Passed
oRs("DefaultPicUrl")=DefaultPicUrl
oRs("DefaultPicUrl2")=DefaultPicUrl2
oRs("updateTime")=UpdateTime

oRs("Hits")=0
oRs.Update
oRs.close
set oRs=Nothing
call sHowPop("信息添加成功！","Pro_List.Asp",1)

case "Upda"
ArticleID=Trim(Request.Form("ArticleID"))
safeRequest(ArticleID)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * From [Table_Product] where ArticleID="&ArticleID,conn,1,3
if oRs.Eof then
call sHowPop("错误的ID信息","-1",2)
End if
oRs("Product_id")=Product_id

oRs("bigClassId")=BigClassId
oRs("BigClassName")=BigClassName
oRs("EnBigClassName")=EnBigClassName

oRs("smallClassId")=SmallclassId
oRs("smallclassName")=SmallclassName
oRs("EnsmallClassName")=EnSmallClassName

oRs("Title")=Title
oRs("EnTitle")=EnTitle

oRs("Content")=Content
oRs("EnContent")=EnContent

oRs("spec")=spec
oRs("Enspec")=Enspec

oRs("Memo")=Memo
oRs("EnMemo")=EnMemo

oRs("Elite")=Elite
oRs("EnElite")=EnElite

oRs("Passed")=Passed
oRs("DefaultPicUrl")=DefaultPicUrl
oRs("DefaultPicUrl2")=DefaultPicUrl2
oRs("updateTime")=UpdateTime

oRs.Update
oRs.close
set oRs=Nothing
call sHowPop("信息修改成功！","Pro_List.Asp",1)
End select
%>



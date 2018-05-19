<%
Response.Buffer = True
%>
<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
if  session("adminname")="" then
response.write"<script language='javascript'>alert('请先登录');location.href('login.asp');</script>"
end if
%>
<%
dim totalPut,CurrentPage,TotalPages
dim i
dim ArticleID
dim Title
dim sql,rs
dim BigClassName,SmallClassName,SpecialName
dim PurviewChecked
dim strAdmin,arrAdmin
const MaxPerPage=20
PurviewChecked=false

Title=Trim(request("Title"))
ArticleID=Request("ArticleID")
BigClassName=Trim(request("BigClassName"))
SmallClassName=Trim(request("SmallClassName"))
SpecialName=trim(request("SpecialName"))
dim strFileName
strFileName="Pro_List.Asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "&SpecialName=" & SpecialName

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * From [Table_Product] where ArticleID>0"
if session("purview")>4 then
	sql=sql & " and Editor='" & Session("admin") & "' and Passed=false"
end if
if Title<>"" then
	sql=sql & " and title like '%" & Title & "%' "
end if
if BigClassName<>"" then
	sql=sql & " and BigClassName='" & BigClassName & "' "
	if SmallClassName<>"" then
		sql=sql & " and SmallClassName='" & SmallClassName & "' "
	end if
else
	if SpecialName<>"" then
		sql=sql & " and SpecialName='" & SpecialName & "' "
	end if
end if
sql=sql & " order by Product_Id desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
%>
<SCRIPT language=javascript>
function unselectall()
{
	if(document.del.chkAll.checked)
	{
		document.del.chkAll.checked = document.del.chkAll.checked;
	} 	
}
function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
		if (e.Name != "chkAll")
			e.checked = form.chkAll.checked;
	}
}
function ConfirmDel()
{
   if(confirm("确定要删除选中的产品吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
}
</SCRIPT>
<BR>
<table cellpadding="2" cellspacing="1" border="0" width="95%" align="center" class="table">
	<tr class="back">
		<td class="xingmu" height="25" align="center"><strong>信 息 管 理</strong></td>
	</tr>
	<tr class="back">
		<td align="center">
      <table width="98%" border="0" align="center" cellpadding="5" cellspacing="2" class="table">
        <tr class="back"> 
          <td height="25" class="back">|&nbsp;   
          <%
dim sqlBigClass,sqlSmallClass,rsBigClass,rsSmallClass,sqlSpecial,rsSpecial
sqlBigClass="select * From [Table_ProBigClass] order by BigclassName asc"
Set rsBigClass= Server.CreateObject("ADODB.Recordset")
rsBigClass.open sqlBigClass,conn,1,1
if rsBigClass.eof then 
	response.Write("还没有任何栏目，请首先添加栏目。")
end if
do while not rsBigClass.eof
	if rsBigClass("BigClassName")=BigClassName then
		response.Write("<a href='Pro_List.Asp?BigClassName=" & rsBigClass("BigClassName") & "'><font color='red'>" & rsBigClass("BigClassName") & "</font></a> | ")
		if session("purview")=3 then
			strAdmin=rsBigClass("Admin")
			if Instr(strAdmin,"|")>0 then
				arrAdmin=split(strAdmin)
				for i=0 to ubound(arrAdmin)
					if trim(arrAdmin(i))=session("admin") then
						PurviewChecked=True
						exit for
					end if
				next
			else
				if trim(strAdmin)=session("Admin") then
					PurviewChecked=True
				end if
			end if
		end if
	else
		response.Write("<a href='Pro_List.Asp?BigClassName=" & rsBigClass("BigClassName") & "'>" & rsBigClass("BigClassName") & "</a> | ")
	end if
	rsBigClass.movenext
loop
rsBigClass.close
set rsBigClass=nothing
%>          </td>
        </tr>
        <%
if BigClassName<>"" then
	sqlSmallClass="select * From [Table_ProSmallclass] where BigClassName='" & BigClassName & "'"
	Set rsSmallClass= Server.CreateObject("ADODB.Recordset")
	rsSmallClass.open sqlSmallClass,conn,1,1
	if not (rsSmallClass.bof and rsSmallClass.eof) then
		response.write "<tr class='hack'><td >"
		do while not rsSmallClass.eof
			if rsSmallClass("SmallClassName")=SmallClassName then
				response.Write("&nbsp;<a href='Pro_List.Asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'><font color='red'>" & rsSmallClass("SmallClassName") & "</font></a>&nbsp;&nbsp;")
				if session("purview")=4 then
					strAdmin=rsSmallClass("Admin")
					if Instr(strAdmin,"|")>0 then
						arrAdmin=split(strAdmin)
						for i=0 to ubound(arrAdmin)
							if trim(arrAdmin(i))=session("admin") then
								PurviewChecked=True
								exit for
							end if
						next
					else
						if trim(strAdmin)=session("Admin") then
							PurviewChecked=True
						end if
					end if
				end if
			else
				response.Write("&nbsp;<a href='Pro_List.Asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'>" & rsSmallClass("SmallClassName") & "</a>&nbsp;&nbsp;")
			end if
			rsSmallClass.movenext
		loop
		response.write "</td></tr>"
	end if
	rsSmallClass.close
	set rsSmallClass=nothing
end if
%>
      </table>
      <form name="del" method="Post" action="Pro_Product_Del.asp" onSubmit="return ConfirmDel();">
        <table width="98%" border="0" cellpadding="0" cellspacing="2" class="table">
          <tr class="back"> 
            <td height="25"><a href="Pro_List.Asp">&nbsp;信息管理</a> 
              &gt;&gt;   
              <%
if request.querystring="" then
	response.write "所有产品"
else
	if request("Query")<>"" then
		if Title<>"" then
			response.write "名称中含有“<font color=blue>" & Title & "</font>”的产品"
		else
			response.Write("所有产品")
		end if
 	else
		if BigClassName<>"" then
			response.write "<a href='Pro_List.Asp?BigClassName=" & BigClassName & "'>" & BigClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
			if SmallClassName<>"" then
				response.write "<a href='Pro_List.Asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "'>" & SmallClassName & "</a>"
			else
				response.write "所有小类"
			end if
		end if
		if SpecialName<>"" then
			response.write "<font color=red>[专题]</font> " & SpecialName
		end if
	end if
end if
%>            </td>
            <td width="150" >&nbsp;  
            <%
  	if rs.eof and rs.bof then
		response.write "共找到 0 个产品</td></tr></table>"
	else
    	totalPut=rs.recordcount
		if currentpage<1 then
       		currentpage=1
    	end if
    	if (currentpage-1)*MaxPerPage>totalput then
	   		if (totalPut mod MaxPerPage)=0 then
	     		currentpage= totalPut \ MaxPerPage
		  	else
		      	currentpage= totalPut \ MaxPerPage + 1
	   		end if

    	end if
		response.Write "共找到 " & totalPut & " 个产品"
%>
            </td>
          </tr>
        </table>
        <%		
	    if currentPage=1 then
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
        	else
	        	currentPage=1
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
	    	end if
		end if
	end if
%>
        <%  
sub showContent()
   	dim i
    i=0
%>
        <table class="table" border="0" cellspacing="2" width="98%" cellpadding="0" style="word-break:break-all">
          <tr  class="back"> 
            <td width="28" height="25" align="center" class="xingmu"><strong>选中</strong></td>
            <td width="30"  height="25" align="center" class="xingmu"><strong>ID</strong></td>
            <td width="104" align="center" class="xingmu"><strong>编号</strong></td>
            <td width="409" align="center" class="xingmu" ><strong>名称</strong></td>
            <td width="101" align="center" class="xingmu" ><strong>加入时间</strong></td>
            <td width="48" align="center" class="xingmu" ><strong>操作</strong></td>
          </tr>
          <%do while not rs.eof%>
          <tr class="back"> 
            <td width="28" height="22" align="center" class="hback_1"> <input name='ArticleID' type='checkbox' onClick="unselectall()" id="ArticleID" value='<%=cstr(rs("articleID"))%>'>            </td>
            <td width="30" align="center" class="hback_1"><%=rs("articleid")%></td>
            <td width="104" align="center" class="hback_1"><%=rs("Product_Id")%></td>
            <td class="hback_1">&nbsp;<%=rs("title")%></td>
            <td width="101" align="center" class="hback_1"><%= FormatDateTime(rs("UpdateTime"),2) %></td>
            <td width="48" align="center" class="hback_1"> 
              <a href="Pro_Edit.asp?ArticleID=<%=rs("articleid")%>">修改</a> 
              <a href="Pro_Del.asp?ArticleID=<%=rs("ArticleID")%>&Action=Del" onClick="return ConfirmDel();"></a>            </td>
          </tr>
          <%
	i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	loop
%>
        </table>
        <table width="98%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="250" height="30"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox">
              选中本页显示的所有信息</td>
            <td><input name="submit" type='submit' value='删除选定的信息' <%if session("purview")>=3 and session("purview")<=4 and PurviewChecked=False then response.write "disabled"%>> 
            <input name="Action" type="hidden" id="Action" value="Del"></td>
          </tr>
        </table>
<%
   end sub 
%>
      </form>
      <br> 
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="table">
        <tr class="back">
          <form name="searchsoft" method="get" action="Pro_List.Asp">
            <td height="30" align="left" valign="middle" class="hback"> <strong> &nbsp;查找信息：</strong> 
              <input name="Title" type="text" class=smallInput id="Title3" size="20" maxlength="50"> 
              <input name="Query" type="submit" id="Query" value="查 询">
            &nbsp;&nbsp;请输入名称。如果为空，则查找所有信息。</td>
          </form>
        </tr>
      </table><BR>
		</td>
	</tr>
</table>

<%  
rs.close
set rs=nothing  
call CloseConn()
%>

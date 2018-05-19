<!--#include file="hhconn.asp"-->
<!--#include File="Md5.Asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table" style="margin-top:5px;">
  <tr>
    <td align="center" valign="middle" class="xingmu">管理员管理</td>
  </tr>
</table>
<script language="javascript">
function ConfirmDel()
{
   if(confirm("确定要删除选中的项目吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;	 
}

function checkAdminForm()
{
	if (document.Form1.AdminName.value=="")
		{
			alert("管理员名称不能为空，请您填写！")
			document.Form1.AdminName.focus();
			return false;
		}
	if (document.Form1.AdminPass.value=="")
		{
			alert("管理员密码不能为空，请您填写！")
			document.Form1.AdminPass.focus();
			return false;
		}
	if (document.Form1.AdminPass2.value=="")
		{
			alert("管理员确认密码不能为空，请您填写！")
			document.Form1.AdminPass2.focus();
			return false;
		}
	if (document.Form1.AdminPass.value!=document.Form1.AdminPass2.value)
		{
			alert("两次密码输入不一致！请重新输入!")
			document.Form1.AdminPass.value="";
			document.Form1.AdminPass2.value="";
			document.Form1.AdminPass.focus();
			return false;
		}
	return true;
}

function checkAdminForm2()
{
	if (document.Form1.AdminPass.value=="")
		{
			alert("管理员密码不能为空，请您填写！")
			document.Form1.AdminPass.focus();
			return false;
		}
	if (document.Form1.AdminPass2.value=="")
		{
			alert("管理员确认密码不能为空，请您填写！")
			document.Form1.AdminPass2.focus();
			return false;
		}
	if (document.Form1.AdminPass.value!=document.Form1.AdminPass2.value)
		{
			alert("两次密码输入不一致！请重新输入!")
			document.Form1.AdminPass.value="";
			document.Form1.AdminPass2.value="";
			document.Form1.AdminPass.focus();
			return false;
		}
	return true;
}				
		

function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
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
<%
Dim act
act=Trim(Request.QueryString("act"))
if act="del" and Trim(Request.Form("selectid"))<>"" then
	conn.execute "delete from [Table_manager] where adminId in ("&Trim(Request.Form("selectid"))&")"
	call sHowPop("删除成功!","Admin.Asp",1)
End if
Dim Action
Action=Trim(Request.QueryString("Action"))
select case Action
case ""
%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <form Name="Form1" action="?Action=Save" method="Post" onSubmit="return checkAdminForm();">
  <tr>
    <td width="80" align="center" class="back">用户名：</td>
    <td width="106" align="left" class="hback"><input name="AdminName" type="text" id="AdminName" style=";height:18px;" size="12" ></td>
    <td width="60" align="center" class="back">密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass" type="password" id="AdminPass" style="height:18px;" size="12" ></td>
    <td width="80" align="center" class="back">确认密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass2" type="password" id="AdminPass2" style="height:18px;" size="12" ></td>
    <td width="60" align="center" class="back"><input type="submit" name="Submit" value="提交"></td>
  </tr>
  </form>
</table>
<%case "Edit"
Dim Id
Id=Trim(Request.QueryString("id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [table_Manager] where adminid="&Id,conn,1,3
if Not oRs.eof then%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <form Name="Form1" action="?Action=Upda" method="Post" onSubmit="return checkAdminForm2();">
  <tr>
    <td width="80" align="center" class="back">用户名：</td>
    <td width="106" align="left" class="hback"><%=oRs("AdminName")%></td>
    <td width="60" align="center" class="back">密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass" type="password" id="AdminPass" style="height:18px;" size="12" ></td>
    <td width="80" align="center" class="back">确认密码：</td>
    <td width="106" align="left" class="hback"><input name="AdminPass2" type="password" id="AdminPass2" style="height:18px;" size="12" ></td>
    <td width="60" align="center" class="back"><input type="submit" name="Submit" value="提交"><Input type="hidden" value="<%=Id%>" Name="Id"></td>
  </tr>
  </form>
</table>
<%
Else
call sHowPop("出错啦~~~\n\n·错误的管理员ID信息！\n\n·请返回！","-1",2)
End if
oRs.close
set oRs=Nothing

case "Save"

set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top 1 * from [table_Manager] where AdminName='"&Trim(Request.Form("AdminName"))&"' order by AdminId desc",conn,1,3
if Not oRs.Eof then
call sHowPop("出错啦~~~\n\n·该管理员用户名信息已经存在！\n\n·请返回更换用户名重试！","-1",2)
Else
oRs.Addnew
oRs("AdminName")=Trim(Request.Form("AdminName"))
oRs("AdminPass")=Md5(Trim(Request.Form("AdminPass")))
oRs.Update
End if
oRs.close
set oRs=Nothing
call sHowPop("管理员填加成功！","Admin.Asp",1)

case "Upda"
Id=Trim(Request.Form("id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [table_Manager] where adminid="&Id,conn,1,3
if Not oRs.eof then
'oRs("AdminName")=Trim(Request.Form("AdminName"))
oRs("AdminPass")=Md5(Trim(Request.Form("AdminPass")))
oRs.Update
Else
call sHowPop("出错啦~~~\n\n·错误的管理员ID信息！\n\n·请返回！","-1",2)
End if
oRs.close
set oRs=Nothing
call sHowPop("管理员修改成功！","Admin.Asp",1)

case Else
call sHowPop("出错啦~~~\n\n·错误的参数信息！\n\n·请返回！","Admin.Asp",1)
End select%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr>
    <td width="29" align="center" class="xingmu">选择</td>
    <td width="36" align="center" class="xingmu">ID</td>
    <td width="349" align="center" class="xingmu">管理员名称</td>
    <td width="85" align="center" class="xingmu">加入时间</td>
    <td width="43" align="center" class="xingmu">操作</td>
  </tr>
<form name="from1" action="Admin.Asp?act=del" method="post"> 
<%  
'开始分页
Const MaxPerPage=13
   				dim totalPut   
   				dim CurrentPage
   				dim TotalPages
   				dim j
   				dim sql
				if request("page")<>"" then
      				currentPage=request("page")
   				else
      				currentPage=1
   				end if 
 
'打开数据库  
set rs=server.createobject("adodb.recordset")
sql="select * from [Table_Manager]  order by adminId desc"
rs.open sql,conn,3,3
if err.number<>0 then
				response.write "数据库中暂时无数据"
				end if
				if rs.eof And rs.bof then
       				Response.Write "<p align='center' > 对不起，没有查询到您需要的信息！</p>"
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

       				if currentPage=1 then
            			showContent
            			showpage totalput,MaxPerPage,"Admin.Asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"Admin.Asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"Admin.Asp"
	      				end if
	   				end if
   				   				end if

   				sub showContent
       			dim i
	   			i=0
do while not rs.eof and i<MaxPerPage
%>   
  <tr>
    <td align="center" class="back"><input name="selectid" type="checkbox" onClick="unselectall()" id="selectid" value="<%=cstr(rs("AdminID"))%>"></td>
    <td align="center" class="back"><%=Rs("AdminId")%></td>
    <td class="back"><%=Rs("AdminName")%></td>
    <td align="center" class="back"><%=ForMatDateTime(Rs("DateTime"),1)%></td>
    <td align="center" class="back"><a href="?Action=Edit&Id=<%=Rs("adminId")%>">修改</a></td>
  </tr>
<%
rs.movenext
	i=i+1
    loop
rs.close
set rs=nothing
%>   
  <tr>
    <td colspan="5" class="back"><input name="chkAll" type="checkbox" id="chkAll" onClick="CheckAll(this.form)" value="checkbox">选中本页显示的所有信息<input name="submit" type='submit' value='删除选定的信息'></td>
  </tr>
</form>  
</table>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
  <tr class="hback">
    <form method=Post action="Admin.Asp">
      <td height="30" valign="middle" bgcolor="#097B88"><%  
				End Sub   
  
				Function showpage(totalnumber,maxperpage,filename)  
  				Dim n
  				
				If totalnumber Mod maxperpage=0 Then  
					n= totalnumber \ maxperpage  
				Else
					n= totalnumber \ maxperpage+1  
				End If %>
          <%	If CurrentPage<2 Then  %>
        首 页　上一页　
        <% Else  %>
        <a href="<% = filename %>?page=1">首 
          页</a>　<a href="<% = filename %>?page=<% = CurrentPage-1 %>">上一页</a>　
        <%	End If
				If n-currentpage<1 Then  %>
        下一页 末 页
        <%	Else  %>
        <a href="<% = filename %>?page=<% = (CurrentPage+1) %>">下一页</a>　<a href="<% = filename %>?page=<% = n %>">末 
          页</a>
                              <%	End If  %>
        <b>
          <% = CurrentPage %>
        </b>/ <b>
            <% = n %>
            页</b>&nbsp;<b> </b>&nbsp; Total<b>
              <% = totalnumber %>
              </b>
        <%end function%>
      </td>
    </form>
  </tr>
</table>

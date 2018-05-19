<!--#include file="hhconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
act=request("act")
if act="add" then
kid_name=request("kid_name")
conn.execute "insert into kids(kid_name)values('"&kid_name&"')"
response.Redirect"prodkind.asp"
end if
if act="del" then
'删除类别
id=request("id")
conn.execute "delete from kids where kid_id="&id
'删除下属类别
conn.execute "delete from twoclass where kid_id="&id
conn.execute "delete from thrclass where kid_id="&id
'删除产品
conn.execute "delete from prod where kid_id="&id
response.Redirect"prodkind.asp"
end if
%>
<%
  
'开始分页
Const MaxPerPage=15
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
    sql="select * from kids "	
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
            			showpage totalput,MaxPerPage,"cp.asp"
       				else
          				if (currentPage-1)*MaxPerPage<totalPut then
            				rs.move  (currentPage-1)*MaxPerPage
            				dim bookmark
            				bookmark=rs.bookmark
            				showContent
             				showpage totalput,MaxPerPage,"cp.asp"
        				else
	        				currentPage=1
           					showContent
           					showpage totalput,MaxPerPage,"cp.asp"
	      				end if
	   				end if
   				   				end if

   				sub showContent
       			dim i
	   			i=0
	 


%>

  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
    <td height="31" colspan="3" align="center" bgcolor="#075963"><strong>产品类别管理</strong></td>
  </tr>
  <tr class="hback">
    <td width="65%" height="25" align="center">产品类别</td>
    <td height="25" colspan="2" align="center">操 作</td>
  </tr>
 
 <%
do while not rs.eof and i<MaxPerPage

%> 
  <tr class="hback">
    <td height="25" align="center"><%=rs("kid_name")%></td>
    <td width="17%" height="25" align="center"><a href="editkind.asp?id=<%=rs("kid_id")%>&kid_name=<%=rs("kid_name")%>">修改</a></td>
    <td width="18%" height="25" align="center"><a href="prodkind.asp?act=del&id=<%=rs("kid_id")%>" onClick="return test()">删除</a></td>
  </tr>  
<%

rs.movenext
	i=i+1
    loop

rs.close
set rs=nothing

%> 
</table>
  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
                <form method=Post action="ProdKind.Asp">
				 <td width="100%" height="30" valign="middle">
                    <%  
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
                      页</a>　<a href="<% = filename %>?page=<% = CurrentPage-1 %>">上一页</a>　  <%	End If
				If n-currentpage<1 Then  %>下一页 末 页 
                      <%	Else  %><a href="<% = filename %>?page=<% = (CurrentPage+1) %>">下一页</a>　<a href="<% = filename %>?page=<% = n %>">末 
                      页</a> 
                      <%	End If  %>
                      　 <b> 
                      <% = CurrentPage %>
                      </b>/ <b> 
                      <% = n %>
                      页</b>&nbsp;<b> </b>&nbsp; Total<b> 
                      <% = totalnumber %>
                      </b>&nbsp; Go 
                      <input type="text" name="page" size=2 maxlength=10 value=<% = currentpage %>>
                      页 
                      <input type='submit'  class='contents' value='跳转' name='cndok'>
               
                    <%end function%>           </td>     
                </form>
              </tr>
</table>
<script language=javascript>
  
function test()
{
  if(!confirm('确认删除吗？')) return false;
}
</script>

<br>
<br>
  <table width="98%" height="30" border="0" align="center" cellpadding="5" cellspacing="1" class="table">
    <tr class="hback">
   <form name="form1" method="post" action="">
 <td>产品类别名称
   <input name="kid_name" type="text" id="kid_name">
   <input type="submit" name="Submit" value="提交">
   <input name="act" type="hidden" id="act" value="add"></td> 
   </form>
    
  </tr>
</table>
</body>
</html>

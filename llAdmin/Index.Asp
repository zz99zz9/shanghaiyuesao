<%
Response.Buffer = True
Response.CacheControl = "no-cache"
%>
<!--#include File="hhconn.asp"-->
<!--#include File="../Inc/Config.asp"-->
<%if  session("adminname")="" then
response.write "<script language='javascript'>alert('出错啦！\n\n您尚未登录或身份已过期！\n\n可能是您长时间没有操作造成的！\n\n请您重新登录！');location.href('Login.asp');</script>"
Response.End
end if%>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=SiteName%>管理后台</title>
<meta name="keywords" content="网站内容管理系统">
<link href="/images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
<SCRIPT language="javascript">
var Str_Status="欢迎使用逐日科技制作网站内容管理系统，有问题请您查询网站：Www.WEB024.Cn";
window.status=Str_Status;
</SCRIPT>
</HEAD>
<FRAMESET id="Frame" rows="51,*" cols="*" border="0">
  <FRAME id="TopFrame" src="TopFrame.asp?SessionID=<%= Session.SessionID %>" name="topFrame" scrolling="NO" noresize >
  <FRAMESET id="MainFrame" cols="170,*" frameborder="NO" border="0" framespacing="0"  scrolling="yes"  noresize>
		<FRAME id="MenuFrame" src="Menu.asp" name="MenuFrame" scrolling="yes" frameborder="0">
		<FRAME id="ContentFrame" src="Main.asp" name="ContentFrame" scrolling="yes" frameborder="0" marginheight="0" marginwidth="0" >
  </FRAMESET>
</FRAMESET>
<NOFRAMES>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
  <p>你的浏览器版本过低！！！本系统要求IE5及以上版本才能使用本系统。</p>
  </body>
</NOFRAMES>
</HTML>
<%
set Conn = nothing
%>

<%Response.Buffer=True%>
<!--#include file="conn.asp"-->
<!--#include File="../Inc/Config.asp"-->
<!--#include File="Md5.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="<%=SiteCont%>">
<meta name="Keywords" content="<%=Sitekey%>" > 
<title><%=SiteTitle%></title>
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
<script language="javascript">
function checkform()
{
	if (document.Form1.UserName.value=='')
		{
			alert("用户名不能为空，请您填写！");
			document.Form1.UserName.focus();
			return false;
		}
	if (document.Form1.UserPass.value=='')
		{
			alert("登录密码不能为空，请您填写！");
			document.Form1.UserPass.focus();
			return false;
		}		
	return true;
}
</script>
</head>

<body>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" scope="row"><br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table width="600" height="320" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th height="72" colspan="4" background="images/Login_Top.jpg" scope="row"><br />
            <h2 style="color:#ffffff;"><%=siteName%></h2></th>
        </tr>
      <tr>
        <th width="223" height="204" align="left" scope="row"><img src="images/Login_left.jpg" width="223" height="204" /></th>
        <th width="95" height="204" background="images/Lgoin_Bg.jpg" scope="row">&nbsp;</th>
        <th width="252" height="204" background="images/Login_Center.jpg" scope="row"><table width="245" height="204" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th scope="row">
			<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <form name="Form1" action="Login.Asp" method="post" onsubmit="return checkform();">
			  <tr>
                <th width="32%" height="40" class="Font12_lan" scope="row">登录帐户：</th>
                <th width="68%" height="40" align="left" scope="row"><input name="UserName" type="text" class="Input_Bg" id="UserName"  tabindex="1" /></th>
              </tr>
              <tr>
                <th height="40" class="Font12_lan" scope="row">登录密码：</th>
                <th height="40" align="left" scope="row"><input name="UserPass" type="password" class="Input_Bg" id="UserPass" style="width:98%; height:18px;" tabindex="2" /></th>
              </tr>
              <tr>
                <th height="40" colspan="2" align="right" scope="row">
				<Input type="image" src="images/admin_submit.gif" width="80" height="24" /> 
				<Input type="hidden" name="Action" value="Login" />
				<a href="../"><img src="images/admin_home.gif" width="80" height="24" border="0" /></a>&nbsp;				</th>
                </tr>
				</form>
            </table>			</th>
          </tr>
        </table></th>
        <th width="30" height="204" scope="row"><img src="images/Login_Right.jpg" width="30" height="204" /></th>
      </tr>
      <tr>
        <th height="44" colspan="4" scope="row"><img src="images/Login_Bottom.jpg" width="600" height="44" /></th>
        </tr>
    </table></td>
  </tr>
</table>
<%
if Request.Form("Action")="Login" then
adminname=replace(replace(Trim(Request.Form("username")),"'",""),",","")
adminpass=replace(replace(Trim(Request.Form("userpass")),"'",""),",","")
set rs=server.CreateObject("adodb.recordset")
     sql="select * from [Table_manager] where adminname='"&adminname&"' and adminpass='"&md5(adminpass)&"'"
	 rs.open sql,conn,1,1	 
	 if rs.eof then
	 	response.write"<script language='javascript'>alert('用户名或密码错误，请重新登录');history.go(-1);</script>"
   	 else
     	Session.Timeout=999
     	session("adminname")=adminname  
     	response.Redirect"Index.Asp"
     end if
End if	 
%>
</body>
</html>

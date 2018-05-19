<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=gb2312" http-equiv="Content-Type" />
<title><%=SiteTitle%></title>
<meta name="keywords" content="<%=siteKey%>">
<meta name="description" content="<%=SiteCont%>" />
<link href="/styles/lib.min.css?t=1363940085795.css" rel="stylesheet" type="text/css" />
<link href="/styles/page_index.min.css?t=1363940085795.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/publicScripts/lib.min.js"></script>
<script src="/publicScripts/components/??FrontColumns_navigation01.min.js,FrontPublic_slideShow01.min.js,FrontNews_list01.min.js,FrontProducts_list01.min.js,FrontLinks_list01.min.js"></script>
<script src="/scripts/i18n/FrontNews_list01.js"></script>
<script type="text/javascript" src="/js/jquery.pack.js"></script>
<script type="text/javascript" src="/js/jQuery.blockUI.js"></script>
<script type="text/javascript" src="/js/jquery.SuperSlide.js"></script>
<link href="/styles/default.css" rel="stylesheet" type="text/css">
<link href="/styles/demo.css" rel="stylesheet" type="text/css">
</head>
<body  id="index">
<div class="pageWidth" id="box_root">
  <div id="index_all">
    <div id="top">
      <div id="dh">
        <div id="box_dh">
          <div xmlns="" class="columnSpace" id="elem-FrontColumns_navigation01-1355119869244" name="栏目导航"> 
            <script type="text/javascript"> 
	//<![CDATA[
	/***********************************************
	* All Levels Navigational Menu- (c) Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
	* This notice MUST stay intact for legal use
	* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
	***********************************************/
	FrontColumns_navigation01['FrontColumns_navigation01-1355119869244_init'] = function (){
		FrontColumns_navigation01.d2ddlevelsmenu.init("d2menubar_FrontColumns_navigation01-1355119869244", "topbar");
	}
	$(FrontColumns_navigation01['FrontColumns_navigation01-1355119869244_init']);
	// ]]>
</script>
            <div id="FrontColumns_navigation01-1355119869244" class="FrontColumns_navigation01-d2_c1">
    
              
                <!--#include virtual="dh.asp"-->
            </div>
          </div>
        </div>
      </div>
      <div id="banner">
        <div id="box_banner">
          <div xmlns="" class="columnSpace" id="elem-FrontPublic_slideShow01-1355120787138" name="公用幻灯"> 
         
            <div id="FrontPublic_slideShow01-1355120787138" class="FrontPublic_slideShow01-d1_c1"> 
            
              
              <!--FrontPublic_slideShow01 start--><img src="images/pic1.jpg" /><!--ce_slide_contente end-->
    
              <!--FrontPublic_slideShow01 end--> 
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="middle" style="background-image:url(images/bg.gif);">
    <!--#include virtual="logo.asp"-->
      <table width="979" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="225" align="left" valign="top"><table width="180" border="0" cellspacing="0" cellpadding="0">

            <tr>
              <td><%=sHowKinds()%>

</td>
            </tr>

            <tr>
              <td><img src="images/left_contact.jpg" width="180" height="123" /></td>
            </tr>
            <tr>
              <td><div id="box_center_left">
                <div id="box_left02">
                  <div id="elem-FrontSpecifies_show01-1355188654489" xmlns="" name="说明页">
                    <div id="FrontSpecifies_show01-1355188654489">
                      <div style="color:#FCFBA8;">
                        <%call sHowInfo("内左")%>
                      </div>
                    </div>
                  </div>
                </div>
                </div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
          </table></td>
          <td width="754" align="left" valign="top" style="color:#FCFBA8;"><img src="images/right_feedback.jpg" width="781" height="21" /><br />
          <br />
          <table width="781" border="0" cellspacing="0">
  <tr>
    <td width="781" valign="top" style="padding:15px;line-height:150%;"><%
act=request.Form("act")
if act="add" then
if request.Form("lyname")="" or request.Form("lyTel")="" or request.Form("lytitle")="" or request.Form("lytext")="" then
call showPop("请您详细填写表单信息,以便我们能联系到您.","-1",2)
End if
if Trim(Request.Form("lYsex"))="先生" then
lyPic="Images/boy.Gif"
Else
lYpic="Images/girl.Gif"
End if
set rs=server.CreateObject("adodb.recordset")
	    sql="select * from lyb "
		rs.open sql,conn,3,3
		rs.addnew
		Rs("lyName")=RequestText(Request.Form("lyName"))
		Rs("lysex")=Request.Form("lysex")
		Rs("lyQQ")=Request.Form("lyQQ")
		Rs("lyMsn")=Request.Form("lyMsn")
		Rs("lyEmail")=Request.Form("lyEmail")
		Rs("lytel")=Request.Form("lytel")
		rs("lyadder")=request("lyadder")
		rs("lytitle")=request("lytitle")
		rs("lytext")=request("lytext")
		Rs("LyIp")=Request.ServerVariables("REMOTE_ADDR")
		Rs("LyPic")=lypic
		Rs("Lydate")=Now() 
		rs.update		
		rs.close
		set rs=nothing		
		response.Write"<script language='javascript'>alert('留言成功，我们会尽快和您联系！');location.href('Feedback.asp');</script>"		
else
%>
      <br />
      <br />
      <table width="469" border="0" align="center" cellpadding="0" cellspacing="0">
        <form action="" method="post" name="Form1" id="Form1" onsubmit="return checkForm1();">
          <tr>
            <td width="70" height="30" align="center" valign="middle">姓名：</td>
            <td width="331" height="30" class="zi12_cheng1" ><input name="lyname" type="text" style="width:100px;"/>
              ** </td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">性别：</td>
            <td height="30"><select name="Lysex" >
              <option value="先生" selecte="selecte">先生</option>
              <option value="小姐" >小姐</option>
            </select></td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">Q Q：</td>
            <td height="30"><input name="lyQQ" type="text"  style="width:150px;"/></td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">Msn：</td>
            <td height="30"><input name="lyMsn" type="text"   style="width:150px;"/></td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">邮箱：</td>
            <td height="30"><input name="lyEmail" type="text"   style="width:150px;"/></td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">电话：</td>
            <td height="30" class="zi12_cheng1"><input name="lyTel" type="text"   style="width:150px;"/>
              ** </td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">地址：</td>
            <td height="30"><input name="lyAdder" type="text"   style="width:250px;"/></td>
          </tr>
          <tr>
            <td width="70" height="30" align="center" valign="middle">标题：</td>
            <td height="30" class="zi12_cheng1"><input name="lytitle" type="text" style="width:250px;" />
              **</td>
          </tr>
          <tr>
            <td width="70" height="30" align="center">内容：</td>
            <td height="30"><textarea name="lytext" id="lytext"  style="width:100%;height:80px;"></textarea></td>
          </tr>
          <tr>
            <td height="40" colspan="2" align="center" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="43%" align="right"><input name="Submit" type="image" src="images/submit.gif" value="提交" />
   
              <input name="act" type="hidden" id="act" value="add" /></td>
    <td width="57%"><img src="Images/back.Gif" onclick="Javascript:history.back();" style="cursor:hand;margin-left:10px;" /></td>
  </tr>
</table>
</td>
          </tr>
          <tr>
            <td height="25" colspan="2" scope="row">&nbsp;&nbsp;提示：带有*号的，为必填项！</td>
          </tr>
        </form>
      </table>
      <%end if%></td>
  </tr>
</table>
</td>
        </tr>
      </table>

    </div>
  </div>
  <div class="clearBoth"></div>
</div>
<!--#include virtual="bottom.asp"-->
</body>
</html>

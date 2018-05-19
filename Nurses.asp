<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->
<%BigclassId=Trim(Request.QueryString("BigclassId"))
smallclassId=Trim(Request.QueryString("smallclassId"))%>
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
          <td width="754" align="left" valign="top" style="color:#FCFBA8;"><img src="images/right_Nurse.jpg" width="781" height="21" /><br />
          <br />
          <table width="781" border="0" cellspacing="0">
  <tr>
    <td width="781" valign="top" style="padding:15px;line-height:150%;"><table width="650" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;">
          <%

if BigclassId<>"" then
	safeRequest(BigclassId)
	sqll=sqll & " and BigclassId="&BigclassId&""
End if

if smallclassId<>"" then
	safeRequest(smallclassId)
	sqll=sqll & " and smallclassId="&smallclassId&""
End if

sql="select  articleId,Title,BigclassId,Spec,SmallclassId,DefaultPicUrl,bigclassName,smallclassName,Product_Id,passed,Product_Id,Memo from [table_product] where passed=true  "&sqll&" order by Product_Id,articleId "
Set rs=Server.CreateObject("ADODB.Recordset")
rs.PageSize = 12 '这里设定每页显示的记录数
rs.CursorLocation = 3
rs.Open sql,conn,0,2,1 '这里执行你查询SQL并获得结果记录集
pre = true
last = true
page = trim(Request.QueryString("page"))

if len(page) = 0 then
intpage = 1
pre = false
else
if cint(page) =< 1 then
intpage = 1
pre = false
else
if cint(page) >= rs.PageCount then
intpage = rs.PageCount
last = false
else
intpage = cint(page)
end if
end if
end if
if not rs.eof then
rs.AbsolutePage = intpage
end if 
for i=1 to rs.PageSize/3
if rs.EOF or rs.BOF then exit for
%>
          <tr class="url_1">
            <%
		  for j=1 to 3
		  if Not Rs.eof then%>
            <td width="200" height="140"  align="center" valign="middle"><table width="170" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="180" align="center"><a href="Nurses_view.asp?id=<%=rs("articleid")%>&BigclassId=<%=BigclassId%>&smallclassid=<%=smallclassid%>" ><img  src="<%=Rs("DefaultPicUrl")%>" alt="<%=Rs("Memo")%>" width="113" height="150" border="0" class="pro" onMouseOver="this.className='pro1'" onMouseOut="this.className='pro'"/></a></td>
                </tr>
              <tr>
                <td height="25" align="center" class="proname"><a href="Nurses_view.asp?id=<%=rs("articleid")%>&BigclassId=<%=BigclassId%>&smallclassid=<%=smallclassid%>" target="_blank" style="color:#FFF8B7;"><%=rs("title")%></a></td>
              </tr>
            </table>
              <br /></td>
            <%
		Rs.Movenext
		End if
		Next%>
          </tr>
          <%
NExt
%>
        </table>
          <table width="650" height="25" border="0" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#808080" bordercolordark="#ffffff">
            <tr class="url_1">
              <%if rs.pagecount > 0 then%>
              <td width="12%" align="center" valign="middle" >当前页<%=intpage%>/<%=rs.PageCount%></td>
              <%else%>
              <td width="23%" align="center" valign="middle" >当前页0/0</td>
              <%end if%>
              <td width="65%" align="right" ><div class="number" align=center><a href="?page=1&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>" style="color:#FFF8B7;">首页</a></div></span>
                <%if pre then%>
                <div class="number" align=center><a href="?page=<%=intpage -1%>&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>" style="color:#FFF8B7;">上页</a></div></span>
                <%end if%>
                <%if last then%>
                <div class="number" align=center><a href="?page=<%=intpage +1%>&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>" style="color:#FFF8B7;">下页</a></div></span>
                <%end if%>
                <div class="number" align=center><a href="?page=<%=rs.PageCount%>&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>" style="color:#FFF8B7;">尾页</a></div>
                转到第
<select name="select" onChange="javascript:location=this.options[this.selectedIndex].value;">
                  <%
for i = 1 to rs.PageCount
if i = intpage then%>
                  <option value="?page=<%=i%>&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>" selected="selected"><%=i%></option>
                  <%else%>
                  <option value="?page=<%=i%>&amp;BigclassId=<%=BigclassId%>&amp;smallclassId=<%=smallclassId%>"><%=i%></option>
                  <%
end if
next
%>
                </select>
                页</td>
            </tr>
          </table>
          <%
rs.close
set rs=nothing
%></td>
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

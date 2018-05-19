<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include File="Conn.Asp"-->
<!--#include File="Inc/FuncTion.Asp"-->
<!--#Include File="Inc/config.Asp"-->
<!--#Include File="Inc/Inc.Asp"-->
<%dim class1
class1=request.QueryString("class")
if class1="" then
class1="家政知识"
end if
%>
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
              <td><img src="images/left_knowledge.gif" />

              </td>
              </tr><tr>
              <td><table width="100%"><tr><Td height='30' <% if class1="家政常识" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=家政常识'>家政常识</a></td></tr>
              <tr><Td height='30'<%if class1="服务内容" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=服务内容'>服务内容</a></td></tr>
              <tr><Td height='30'<%if class1="服务承诺" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=服务承诺'>服务承诺</a></td></tr>
              <tr><Td height='30'<%if class1="月子问答" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=月子问答'>月子问答</a></td></tr>
              <tr><Td height='30'<%if class1="育婴常识" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=育婴常识'>育婴常识</a></td></tr>
              <tr><Td height='30'<%if class1="早期教育" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=早期教育'>早期教育</a></td></tr>
              <tr><Td height='30'<%if class1="健康指导" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=健康指导'>健康指导</a></td></tr>
              <tr><Td height='30'<%if class1="月子食谱" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=月子食谱'>月子食谱</a></td></tr>
              <tr><Td height='30'<%if class1="孕期美容" then%> class='Td5'<%else%> class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'<%end if%> align=center><a Href='Knowledge.asp?class=孕期美容'>孕期美容</a></td></tr>
        </table>

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
          <td width="754" align="left" valign="top" style="color:#FCFBA8;"><img src="images/right_Knowledge.jpg" width="781" height="21" /><br />
          <br />
          <table width="781" border="0" cellspacing="0">
  <tr>
    <td width="781" valign="top" style="padding:15px;line-height:150%;"><%dim Id
Id=Trim(Request.QueryString("Id"))
safeRequest(id)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [News] where newsid="&id,conn,1,3
if oRs.eof then
call sHowPop("错误的ID信息","-1",2)
End if
oRs("NewsCounter")=oRs("NewsCounter")+1
oRs.UPdate
%>
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <th height="30" scope="row" align="center"><h1><%=oRs("Newstitle")%></h1></th>
                          </tr>
                          <tr>
                            <th scope="row"><hr align="center" width="98%" size="1"></th>
                          </tr>
                          <tr>
                            <th height="30" scope="row">信息来源：<%=oRs("newsFrom")%> 阅读次数：<%=oRs("newscounter")%>次 发布时间：<%=formatdateTime(oRs("newsdate"),1)%> <a href="javascript:history.back();" style="color:#FFF8B7;">返回</a> <a href="Javascript:window.close();" style="color:#FFF8B7;">关闭页面</a></th>
                          </tr>
                          <tr>
                            <td height="30" style="Line-height:200%;"><%=oRs("newstext")%></td>
                          </tr>
                          <tr>
                            <td ><hr align="center" width="98%" size="1"></td>
                          </tr>
                        </table>
                      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td  scope="row"><%call sHowDxNewsPN(oRs("newsKinds"),oRs("Newsid"))%></td>
                          </tr>
                      </table>
                      <%ors.close
					  set ors=nothing%>
                      </td>
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

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
'###########################显示分类名称#################################################
Function sHowJmlpKinds()  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId=9 order by smallclassId desc",conn,1,1
Content = Content & "<Table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
  Content = Content & "<Tr class='JmlcUrl'>"
    Content = Content & "<Td  height='25' class='Td5'><a Href='Jmlp.Asp?BigclassId=9&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
  Content = Content & "</tr>"	
  smalloRs.MoveNext
  End if
  Next  
Content = Content & "</Table>"	
sHowJmlpKinds = Content
End Function
'###########################显示分类名称#################################################
Function sHowKinds()

set BigoRs=Server.CreateObject("ADODB.Recordset")
BigoRs.Open "select * from [Table_ProBigClass] order by Orderid asc",conn,1,1
Content = Content & "<Table width='99%' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=1
dim show
do while not BigoRs.eof  
if Bigclassid<>"" then
if int(Bigclassid)=int(BigoRs("BigclassId"))  then
show="display:;"
dlzt="#ff0000"
else
show="display:none;"
dlzt=""
end if
else
show="display:none;"
dlzt=""
end if
  Content = Content & "<Tr>"
    
    Content = Content & "<Td  height='25' class='li'><a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"'><font color="&dlzt&"><img src='"&bigors("pic_url")&"' border=0 title="&BigoRs("BigclassName")&"/></a></td>"
 	
  Content = Content & "</tr>"
  Content = Content & "<Tr id=cat10"&i&"000 name="&Bigclassid&">"  
    Content = Content & "<Td align='left' valign='middle' style='Padding-left:2px;' >"  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId="&BigoRs("BigclassId")&" order by Orderid",conn,1,1
Content = Content & "<Table width='100%' border='0' align='center' cellpadding='0' cellspacing='1' style='margin-bottom:10px;'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
if smallclassId<>"" then
if int(smalloRs("smallclassId"))=int(smallclassId) then
fontcolor="class='Td5'"
else
fontcolor="class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'"
end if
else
fontcolor="class='Td4' onMouseOver=this.className='Td5' onMouseOut=this.className='Td4'"
end if
  Content = Content & "<Tr>"
  	for jii=1 to 1 '二级菜单几个行
	if Not smalloRs.Eof then 
	Content = Content & "<Td height='30' width='50%' "&fontcolor&" align=center><a Href='Nurses.Asp?BigclassId="&BigoRs("BigclassId")&"&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
	smalloRs.MoveNext
  	End if
    Next  
  Content = Content & "</tr>"	
  End if
  Next  
Content = Content & "</Table>"	
smalloRs.close
set smalloRs=Nothing
	Content = Content & "</td>"
  Content = Content & "</tr>"
BigoRs.MoveNext
i=i+1
Loop  
Content = Content & "</table>"
BigoRs.close
set BigoRs=Nothing
sHowKinds = Content
End Function

sub checkProdcount(BigclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub
sub checkProdcount2(BigclassId,smallclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" and smallclassId="&smallclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub

sub sHowProKinds(BigclassId,countt,ByteCount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top "&countt&" * from [Table_SmallClass] where BigclassId="&BigclassId&" order by id asc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0' width='98%;'>"
i=1
do while Not oRs.Eof and i<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='25' align='left' valign='middle' class='Td4'><img src='Images/button_004.gif' border='0' align='absmiddle'> "
	Content = Content & "<a Href='Product.Asp?smallclassId="&oRs("Id")&"'>"&GotToPic(oRs("smallclassName"),ByteCount)&"</a>"
	Content = Content & "</td>"		
  Content = Content & "</tr>" 
oRs.MoveNext
i=i+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub
'========================首页显示分类============================
'###########################显示分类名称#################################################
Function sHowKindssy()
set BigoRs=Server.CreateObject("ADODB.Recordset")
BigoRs.Open "select * from [Table_ProBigClass]  order by Orderid",conn,1,1
Content = Content & "<Table width='99%' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=1
do while not BigoRs.eof  
  Content = Content & "<Tr>"
    
    Content = Content & "<Td  height='33' align='left' style='background-image:url(images/cpdh1.jpg);padding-left:60px;' ><!--<img src='Images/Buttom_Zk.jpg' width='40' height='18' align='absmiddle' name='img10"&i&"000'    id=item$pval[catID]) style='cursor: hand;margin:0 5 2 6;' onmouseup='opencat(cat10"&i&"000,&#13;&#10; img10"&i&"000);' language=javascript />&nbsp;&nbsp;--><a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"'><b>"&BigoRs("BigclassName")&"</b></a> </td>"
 	
  Content = Content & "</tr>"
  Content = Content & "<Tr id=cat10"&i&"000 style='display:none;'>"  
    Content = Content & "<Td align='left' valign='middle' style='Padding-left:2px;' >"  
set smalloRs=Server.CreateObject("ADODB.Recordset")
smalloRs.Open "select * from [Table_ProSmallclass] where BigclassId="&BigoRs("BigclassId")&" order by smallclassId desc",conn,1,1
Content = Content & "<Table width='90%' border='0' align='center' cellpadding='0' cellspacing='0'>"
for j=1 to smalloRs.Recordcount
if Not smalloRs.Eof then 
  Content = Content & "<Tr>"
  	for jii=1 to 1 '二级菜单几个行
	if Not smalloRs.Eof then 
	Content = Content & "<Td  height='25' width='50%' class='Td5' ><img src='Images/L-.gif' width='12' height='12' valign='absmiddle' style='margin-right:5px;'/><a Href='Product.Asp?BigclassId="&BigoRs("BigclassId")&"&smallclassId="&smalloRs("smallclassId")&"'>"&smalloRs("smallclassName")&"</a></td>"	
	smalloRs.MoveNext
  	End if
    Next  
  Content = Content & "</tr>"	
  End if
  Next  
Content = Content & "</Table>"	
smalloRs.close
set smalloRs=Nothing
	Content = Content & "</td>"
  Content = Content & "</tr>"
BigoRs.MoveNext
i=i+1
Loop  
Content = Content & "</table>"
BigoRs.close
set BigoRs=Nothing
sHowKindssy = Content
End Function

sub checkProdcount(BigclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub
sub checkProdcount2(BigclassId,smallclassId)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [Table_Product] where BigclassId="&BigclassId&" and smallclassId="&smallclassId&" order by articleId desc",conn,1,1
if Not oRs.eof then
	if oRs.Recordcount<2 then
		Response.Redirect "ViewPro.asp?Id="&oRs("ArticleId")
	End if
End if
end sub

sub sHowProKinds(BigclassId,countt,ByteCount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select Top "&countt&" * from [Table_SmallClass] where BigclassId="&BigclassId&" order by id asc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0' width='98%;'>"
i=1
do while Not oRs.Eof and i<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='25' align='left' valign='middle' class='Td4'><img src='Images/button_004.gif' border='0' align='absmiddle'> "
	Content = Content & "<a Href='Product.Asp?smallclassId="&oRs("Id")&"'>"&GotToPic(oRs("smallclassName"),ByteCount)&"</a>"
	Content = Content & "</td>"		
  Content = Content & "</tr>" 
oRs.MoveNext
i=i+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub
'------------------------显示户型信息---------------------------
sub sHowProPic_1(countt,bytecountt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" articleid,Product_Id,Title,DefaultPicUrl,BigclassId,BigclassName,smallclassName,passed from [Table_Product] where passed=true  order by articleId desc",conn,1,1
Content = Content & "<table  border='0' align='center' cellpadding='0' cellspacing='0'>"
j=0
do while Not oRs.Eof and j<countt 
  Content = Content & "<tr>"
    Content = Content & "<td height='130' width='170' align='center' valign='middle' class='td3' bgcolor='#FFFFFF'>"	
	Content = Content & "<a Href='ViewPro.asp?id="&oRs("articleId")&"' ><img src='"&oRs("DefaultPicUrl")&"' width='160' height='120' border='0' alt='"&oRs("Title")&"'  /></a>"
  Content = Content & "</td>"   
  Content = Content & "</tr>" 
  
  Content = Content & "<tr>"
  Content = Content & "<td height='25' width='170' align='center' valign='middle' class='Menu_01'>" 
  Content = Content & "<a Href='ViewPro.asp?id="&oRs("articleId")&"' target='_blank'>"&GotToPic(oRs("Title"),bytecountt)&"</a><br>"	  
  Content = Content & "</td>"
	Content = Content & "</tr>"	
	Content = Content & "</td>"	
oRs.MoveNext
j=j+1
loop 
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub

'------------------------显示产品信息---------------------------
sub sHowProPic(countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" articleid,Product_Id,Title,DefaultPicUrl,BigclassId,BigclassName,Memo,Spec,smallclassName,Elite,passed from [Table_Product] where Elite=true and passed=true  order by articleId desc",conn,1,1
Content = Content & "<table width='330' border='0' align='center' cellpadding='0' cellspacing='0'>"
j=0
do while Not oRs.Eof and j<countt   
  Content = Content & "<tr>"
    Content = Content & "<td width='180' height='145' align='center' valign='middle'><table width='180' height='130' border='0' cellpadding='0' cellspacing='0'>"
      Content = Content & "<tr>"
        Content = Content & "<td width='170' height='130' class='td3' align='center' valign='middle'><a Href='ViewPro.asp?id="&oRs("articleId")&"' ><img src='"&oRs("DefaultPicUrl")&"' width='160' height='120' border='0' alt='"&oRs("Title")&"'  /></a></td>"
        Content = Content & "<td height='10' align='left' valign='bottom'><img src='images/right.gif' width='10' height='100' /></td>"
      Content = Content & "</tr>"
    Content = Content & "</table></td>"
    Content = Content & "<td width='150' height='140' align='center' valign='middle'><table width='145' border='0' align='center' cellpadding='0' cellspacing='0'>"
      Content = Content & "<tr>"
        Content = Content & "<td height='25' align='left'><a Href='Viewpro.asp?id="&oRs("articleId")&"' ><b>"&GotToPic(oRs("Title"),20)&"</b></a></td>"
      Content = Content & "</tr>"
      Content = Content & "<tr>"
        Content = Content & "<td height='25' align='left' bgcolor='#EFF3F7'>"&oRs("Memo")&"</td>"
      Content = Content & "</tr>"
      Content = Content & "<tr>"
        Content = Content & "<td height='25' align='left'>大类："&oRs("BigclassName")&"</td>"
      Content = Content & "</tr>"
      Content = Content & "<tr>"
        Content = Content & "<td height='25' align='left' bgcolor='#EFF3F7'>报价："
		if oRs("Spec")<>"" then
		Content = Content & oRs("Spec")
		Else
		Content = Content & "暂无报价"
		End if
		Content = Content & "</td>"
      Content = Content & "</tr>"
      Content = Content & "<tr>"
        Content = Content & "<td height='35' align='left'><a Href='Viewpro.asp?id="&oRs("articleId")&"' ><img src='images/viewPro.gif' width='100' height='20' border='0'/></a></td>"
      Content = Content & "</tr>"
    Content = Content & "</table></td>"
  Content = Content & "</tr>"
oRs.MoveNext
j=j+1
loop   
Content = Content & "</table>"
oRs.close
set oRs=Nothing
Response.Write Content
End sub

'--------------------新闻资讯---------------------
sub sHowcjzjd(ProType,countt,bytecount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" Prod_Id,Prod_Name,Kid_Name,Prod_Date from [Prod] where Kid_Name='"&ProType&"' order by Prod_id desc",conn,1,1
Content =Content & "<Table width='345'  border='0' align='center' cellpadding='0' cellspacing='0'>"
i=0
do while Not oRs.Eof and i<countt 
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td  height='25' width='20' class='Td5'><img src='Images/button_001.gif' border='0'></td>"
  Content =Content & "<td  height='25' align='left' class='Td5'><a Href='ViewCjzjd.Asp?id="&oRs("Prod_Id")&"' Target='_blank' title='"&oRs("Prod_Name")&"'>"&GotToPic(oRs("Prod_Name"),bytecount)&"</a></td>"  
Content =Content & "<td height='25' width='80' class='Td5'>"&ForMatDateTime(oRs("Prod_Date"),2)&"</td>"
  Content =Content & "</tr>"
  i=i+1 
  oRs.Movenext
  Loop
Content =Content & "</table>"
oRs.close
set oRs=Nothing
Response.write Content
End sub
'-------------------------显示公告信息--------------------------
Sub ShowGG()
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [News] where NewsKinds='站内公告' order by Newsid desc",conn,1,1
Response.Write "<marquee align='absmiddle'  direction='up' scrollamount='2' style='width:98%;height:75;' onmouseover=this.stop() style='CURSOR: hand' onmouseout=this.start() >"
If Not oRs.eof Then
Response.Write "<b>" & oRs("NewsTitle") & "</b>"
Response.Write "<br>"
Response.Write oRs("NewsText")
Response.Write "<br>"
Response.Write FormatDateTime(oRs("NewsDate"),1)
Response.Write "<br>"
Else
Response.Write "暂无公告信息"
End if
Response.Write "</marquee>"
oRs.close
set oRs=Nothing
End sub



'-------------------显示公司荣誉-----------------------------
sub showCase(countt)
set GifoRs=Server.CreateObject("ADODB.Recordset")
GifoRs.Open "select Top "&Countt&" Prod_id,Prod_name,Prod_Pic from [Prod] where Kid_id=1 order by Prod_id desc",conn,1,1
Content=Content & "<table width='170' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=0
do while Not GifoRs.eof and i<countt  
  Content=Content & "<tr>"
  	Content=Content & "<td height='130' width='170' align='center' valign='middle' class='Td3'><a title='"&GifoRs("Prod_name")&"' href='Viewcase.Asp?id="&GifoRs("Prod_id")&"' target='_blank'><img src='"&GifoRs("Prod_Pic")&"' width='160' height='120' border='0' alt='"&GifoRs("Prod_name")&"' class='td3'/></a></td>"
  Content=Content & "</tr>"
  Content=Content & "<tr>"
  	Content=Content & "<td height='10' width='170' align='right' valign='middle'><img src='images/bottom.gif' /></td>"
  Content=Content & "</tr>" 
    Content=Content & "<tr>"
  	Content=Content & "<td height='25' width='170' align='center' valign='middle'><a title='"&GifoRs("Prod_name")&"' href='Viewcase.Asp?id="&GifoRs("Prod_id")&"' target='_blank'>"&GifoRs("Prod_name")&"</a></td>"
  Content=Content & "</tr>"
  Content=Content & "<tr>"
  	Content=Content & "<td height='5' width='170' align='center' valign='middle'></td>"
  Content=Content & "</tr>"   
i=i+1
GifoRs.MoveNext
Loop  
Content =Content & "</table>"
GifoRs.close
set GifoRs=Nothing
Response.write Content
End sub


'-------------------显示公司荣誉-----------------------------
sub sHowHonor(countt,bytecount)
set GifoRs=Server.CreateObject("ADODB.Recordset")
GifoRs.Open "select Top "&Countt&" Prod_id,Prod_name from [Prod] where Kid_id=2 order by Prod_id desc",conn,1,1
Content=Content & "<table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>"
i=0
do while Not GifoRs.eof and i<countt    
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td  height='25' width='20' class='Td4'>·</td>"
  Content =Content & "<td  height='25' align='left' class='Td4'><a title='"&GifoRs("Prod_name")&"' href='ViewHonor.Asp?id="&GifoRs("Prod_id")&"' >"&GotToPic(GifoRs("Prod_name"),bytecount)&"</a></td>"  
  Content =Content & "</tr>"  
i=i+1
GifoRs.MoveNext
Loop  
Content =Content & "</table>"
GifoRs.close
set GifoRs=Nothing
Response.write Content
End sub

'-------------------显示公司荣誉-----------------------------
sub sHowCasePic(countt)
set GifoRs=Server.CreateObject("ADODB.Recordset")
GifoRs.Open "select Top "&Countt&" Prod_id,Prod_name,Prod_Pic,Kid_id from [Prod] where Kid_id=1 order by Prod_id desc",conn,1,1
Content=Content & "<table width='98%' border='0' align='center' cellpadding='0' cellspacing='0'>"    
  Content =Content & "<Tr align='left' valign='middle'>"
i=0
do while Not GifoRs.eof and i<countt  
  Content =Content & "<td  height='145' width='230' width='150'>"
  	Content=Content & "<table width='140' height='135' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-right:10px;'>"
  Content=Content & "<tr>"
    Content=Content & "<td width='130' height='110' align='center' valign='middle' class='Td3'><a href='ViewCase.Asp?id="&GifoRs("Prod_id")&"'  target='_blank'><img src='"&GifoRs("Prod_Pic")&"' width='120' height='100' border='0' alt='"&GifoRs("Prod_Name")&"'  ></a></td>"
    Content=Content & "<td width='10' align='left' valign='top'><img src='Images/right.gif'></td>"
  Content=Content & "</tr>"
  Content=Content & "<tr>"
    Content=Content & "<td height='25' colspan='2' align='center'><a href='ViewCase.Asp?id="&GifoRs("Prod_id")&"'  target='_blank'>"&GifoRs("Prod_Name")&"</a></td>"
  Content=Content & "</tr>"
Content=Content & "</table>"
  Content=Content & "</td>"
i=i+1
GifoRs.MoveNext
Loop    
  Content =Content & "</tr>"  
Content =Content & "</table>"
GifoRs.close
set GifoRs=Nothing
Response.write Content
End sub

'-------------------显示招聘信息-------------------------
sub sHowJob()
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top 4 JobsId,JobsTitle from [Jobs] order by Jobsid desc",conn,1,1
Content =Content & "<table width='90%' border='0' cellpadding='0' cellspacing='0' align='center'>"
do while Not oRs.eof 
  Content =Content & "<tr>"
    Content =Content & "<td height='21' align='left' valign='middle' >·<a Href='Job.Asp' target='_blank'>"&oRs("JobsTitle")&"</a></td>"
 Content =Content & "</tr>"
oRs.Movenext
Loop
Content =Content & "</table>"
oRs.close
set oRs=Nothing
Response.write Content
End sub

'-------------------显示招聘信息-------------------------
sub sHowLYB(countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" LYId,LyTitle,Lydate,LyText from [lyb] where Lyreply<>'' order by Lyid desc",conn,1,1
Content =Content & "<table width='98%' border='0' cellpadding='0' cellspacing='0' align='center'>"
do while Not oRs.eof 
  Content =Content & "<tr class='LeftMenu'>"
    Content =Content & "<td height='25' align='left' valign='middle' class='Td5'> <img src='images/Button_008.gif' style='margin-right:5px;' align='absmiddle'><a Href='Lyb.Asp' target='_blank'>"&GotToPic(oRs("LyTitle"),28)&"</a>("&FormatDateTime(oRs("Lydate"),2)&")</td>"
 Content =Content & "</tr>"
  Content =Content & "<tr >"
    Content =Content & "<td align='left' valign='middle' style='padding:5;line-height:150%;'>"&GotToPic(oRs("LyText"),70)&"</td>"
 Content =Content & "</tr>" 
oRs.Movenext
Loop
Content =Content & "</table>"
oRs.close
set oRs=Nothing
Response.write Content
End sub

'--------------------新闻资讯---------------------
sub sHowNews(NewsType,countt,bytecount)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select top "&countt&" * from [News] where NewsKinds='"&NewsType&"' order by Newsid desc",conn,1,1
Content =Content & "<Table width='265'  border='0' align='center' cellpadding='0' cellspacing='0'>"
i=0
do while Not oRs.Eof and i<countt 
  Content =Content & "<Tr align='center' valign='middle'>"
  Content =Content & "<td  height='25' width='25' class='Td5'><img src='images/dot.gif' width='13' height='11'></td>"
  Content =Content & "<td  height='25' align='left' class='Td5'><a Href='ViewNews.Asp?id="&oRs("NewsId")&"' Target='_blank' title='"&oRs("Newstitle")&"'>"&GotToPic(oRs("Newstitle"),bytecount)&"</a></td>"  
  'Content =Content & "<td  height='25' width='80' align='right' class='Td5'>"&FormatDateTime(oRs("NewsDate"),2)&"</td>"    
  Content =Content & "</tr>"
  i=i+1 
  oRs.Movenext
  Loop
Content =Content & "</table>"
oRs.close
set oRs=Nothing
Response.write Content
End sub

'-------------------显示上一条下一条活动资讯-----------------------------
sub sHowDxNewsPN(NewsType,Newsid)
Content =Content & "<table width='98%' height='50' cellpadding='0' cellspacing='0' align='center'>"
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td height='25' align='left' >上一条："
set PoRs=Server.CreateObject("ADODB.Recordset")
PoRs.Open "select Top 1 * from [News] where NewsKinds='"&NewsType&"' and NewsId>"&NewsId&" order by Newsid asc",conn,1,1
  if Not PoRs.eof then 
  Content =Content & "<a Href='?id="&PoRs("NewsId")&"' title='"&PoRs("Newstitle")&"' style='color:#FFF8B7;'>"&PoRs("Newstitle")&"</a>"
  Else
  Content =Content & "没有了!"
  End if
  Content =Content & "</td>"
  Content =Content & "</tr>"
  PoRs.close
  set PoRs=Nothing
  
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td height='25' align='left' >下一条："
set NoRs=Server.CreateObject("ADODB.Recordset")
NoRs.Open "select Top 1 * from [News] where NewsKinds='"&NewsType&"' and NewsId<"&NewsId&" order by Newsid desc",conn,1,1
  if Not NoRs.eof then 
  Content =Content & "<a Href='?id="&NoRs("NewsId")&"' title='"&NoRs("Newstitle")&"' style='color:#FFF8B7;'>"&NoRs("Newstitle")&"</a>"
  Else
  Content =Content & "没有了!"
  End if
  Content =Content & "</td>"
  Content =Content & "</tr>"
  NoRs.close
  set NoRs=Nothing  
Content =Content & "</table>"
Response.write Content
End sub

'-------------------显示上一条下一条集团资讯-----------------------------
sub sHowNewsPN(Newsid)
Content =Content & "<table width='98%' height='50' cellpadding='0' cellspacing='0' align='center'>"
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td height='25' align='left' >上一条："
set PoRs=Server.CreateObject("ADODB.Recordset")
PoRs.Open "select Top 1 * from [News] where NewsKinds='集团动态' and NewsId>"&NewsId&" order by Newsid asc",conn,1,1
  if Not PoRs.eof then 
  Content =Content & "<a Href='?id="&PoRs("NewsId")&"' title='"&PoRs("Newstitle")&"'>"&PoRs("Newstitle")&"</a>"
  Else
  Content =Content & "没有了!"
  End if
  Content =Content & "</td>"
  Content =Content & "</tr>"
  PoRs.close
  set PoRs=Nothing
  
  Content =Content & "<Tr align='left' valign='middle'>"
  Content =Content & "<td height='25' align='left' >下一条："
set NoRs=Server.CreateObject("ADODB.Recordset")
NoRs.Open "select Top 1 * from [News] where NewsKinds='集团动态' and NewsId<"&NewsId&" order by Newsid desc",conn,1,1
  if Not NoRs.eof then 
  Content =Content & "<a Href='?id="&NoRs("NewsId")&"' title='"&NoRs("Newstitle")&"'>"&NoRs("Newstitle")&"</a>"
  Else
  Content =Content & "没有了!"
  End if
  Content =Content & "</td>"
  Content =Content & "</tr>"
  NoRs.close
  set NoRs=Nothing  
Content =Content & "</table>"
Response.write Content
End sub

'----------------------------显示公司相关信息-----------------------
Sub sHowInfo(typee)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [GsJs] where Type_wj='"&typee&"' order by GsjsId desc",conn,1,1
If Not oRs.eof Then
Content=Content & oRs("GsjsText")
Else
Content=Content & "暂无信息"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'----------------------------显示大类名称-----------------------
Sub sHowBigclassname(n)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [GsJs] where Type_wj='"&typee&"' order by GsjsId desc",conn,1,1
If Not oRs.eof Then
Content=Content & oRs("GsjsText")
Else
Content=Content & "暂无信息"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'----------------------------显示公司相关信息-----------------------
Sub sHowInfo_1(typee,countt)
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [GsJs] where Type_wj='"&typee&"' order by GsjsId desc",conn,1,1
If Not oRs.eof Then
Content=Content & LEft(oRs("GsjsText"),countt) & "……"
Else
Content=Content & "暂无信息"
End if
oRs.close
set oRs=Nothing
Response.write Content
End sub
'-----------------------------------------------------------------
function nohtml(str) 
 dim re 
 set re=new regexp 
 re.ignorecase =true 
 re.global=true 
 re.pattern="(<.[^<]*>)" 
 str=re.replace(str,"") 
 re.pattern="(</[^<]*>)" 
 str=re.replace(str,"") 
 nohtml=str 
 set re=nothing 
end function


%>



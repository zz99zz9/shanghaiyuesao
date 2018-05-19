<!--#include file="conn.asp"-->
<%
formName=request("formName")
EditName=request("EditName")
'response.write formname&"====="&EditName
%>
<html>
<head>
<title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/skin/Css_1/1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
td{font-size:12px}
a{color:#000000;text-decoration: none}
a:hover{text-decoration: underline}
.tx{height:16px;width:30px;border-color:black black #000000;border-top-width:0px;border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 12px; background-color: #eeeeee; color: #0000FF}
.button{font-size:12px;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1{height:20px;width:30px;font-size:12px;border:1px solid;border-color:black black #000000;color: #0000FF}
.back_southidc {BACKGROUND-IMAGE:url('image/titlebg.gif');COLOR:000000;}
.back_southidc {BACKGROUND-IMAGE:url('image/titlebg.gif');COLOR:000000;}
.table_southidc {BACKGROUND-COLOR: A4B6D7;}
.table_southidc {BACKGROUND-COLOR: A4B6D7;}
.tr_southidc {BACKGROUND-COLOR: ECF5FF;}
.tr_southidc {BACKGROUND-COLOR: ECF5FF;}
-->
</style>
<script language="javascript">
<!--
function mysub()
{
  var strFileName=form1.file1.value;
  if (strFileName=="")
  {
    alert("请选择要上传的文件");
    return false;
  }
	esave.style.visibility="visible";
}
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="upload.asp" enctype="multipart/form-data"  onSubmit="return mysub()"><!--Yr_upload.asp
  <form action="upload.asp" method="post" enctype="multipart/form-data">-->
  <table width="400" border="0" align="center" cellpadding="2" cellspacing="1" class="table">
    <tr class="hback">
      <td  class="xingmu"height="25" align="center"><strong>图片上传</strong>
        <input type="hidden" name="EditName" value="<%=EditName%>">
        <input type="hidden" name="FormName" value="<%=formName%>">
        <input type="hidden" name="act" value="uploadfile"></td>
    </tr>
    <tr  class="hback">
      <td height="80" align="center">选择文件:
 <input type="file" name="file1" style="width:300" class="tx1" value=""/> </td>
    </tr>
    <tr  class="hback">
      <td height="25" align="center"><input type="submit" name="Submit" value="开始上传" > </td>
    </tr>
  </table>
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
	<TR><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<TR> 
	          <td bgcolor=#eeeeee align=center><font color=red>正在上传文件，请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr>
    </table>
  </div>
</form>
</body>
</html>

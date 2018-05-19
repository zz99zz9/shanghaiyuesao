var jspath=document.scripts;
jspath=jspath[jspath.length-1].src.substring(0,jspath[jspath.length-1].src.lastIndexOf("/")+1);

var online=new Array();
if (!document.layers)
document.write('<div id="divStayTopLeft" style="position:absolute">');
document.write('<table cellSpacing="0" cellPadding="0" width="110" border="0" id="qqtab">');
document.write('    <tr>');
document.write('      <td width="110" onclick="if(document.all.qqtab.style.display==\'none\'){document.all.qqtab.style.display=\'\'} else {document.all.qqtab.style.display=\'none\'}"><img src="'+jspath+'top.gif" border="0"></td>');
document.write('    </tr>');
document.write('    <tr id="qqstab">');
document.write('      <td valign="middle" align="center" background="'+jspath+'middle.gif">');
document.write('<table border="0" width="90" cellSpacing="0" cellPadding="0">');
document.write('  <tr>');
document.write('    <td width="90" height="5" border="0" colspan="2"></td>');
document.write('  </tr>');
document.write('  <tr>');
if (online[0]==0)
  {
    document.write('    <td width="90" height="29" valign="middle" align="center">');
    document.write('<a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=tianhezhuzao&site=cnalichn&s=2" ><img width="80"  border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=tianhezhuzao&site=cnalichn&s=2" alt="贸易通客服" /></a>');
    document.write('    </td>');
  }
else
  {
    document.write('    <td width="90" height="29" valign="middle" align="center">');
    document.write('<a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=tianhezhuzao&site=cnalichn&s=2" ><img width="80" border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=tianhezhuzao&site=cnalichn&s=2" alt="贸易通客服" /></a>');
    document.write('    </td>');
  }
document.write('  </tr>');
document.write('  <tr>');
if (online[0]==0)
  {
    document.write('    <td width="90" height="29" valign="middle" align="center">');
    document.write('<a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=121913895&Site=惠州市通涌五金机械有限公司&Menu=yes"><img width="80"  border="0" SRC="http://wpa.qq.com/pa?p=1:121913895:7" alt="QQ在线客服" align="absmiddle"></a> ');
    document.write('    </td>');
  }
else
  {
    document.write('    <td width="90" height="29" valign="middle" align="center">');
    document.write('<a target="blank" href="http://wpa.qq.com/msgrd?V=1&Uin=121913895&Site=惠州市通涌五金机械有限公司&Menu=yes"><img width="80"  border="0" SRC="http://wpa.qq.com/pa?p=1:121913895:7" alt="QQ在线客服" align="absmiddle"></a> ');
    document.write('    </td>');
  }
document.write('  </tr>');
document.write('</table>');
document.write('</td>');
document.write('    </tr>');
document.write('    <tr>');
document.write('<td width="110"><a href="/" target="_blank"><img src="'+jspath+'bottom.gif" border="0"></a></td>');
document.write('    </tr>');
document.write('</table>');
var verticalpos="frombottom"
if (!document.layers)
document.write('</div>')
function scrollqq()
{
  var posXqq,posYqq;
 if (window.innerHeight)
 {
  posXqq=window.pageXOffset;
  posYqq=window.pageYOffset;
   }
   else if (document.documentElement && document.documentElement.scrollTop)
      {
    posXqq=document.documentElement.scrollLeft;
    posYqq=document.documentElement.scrollTop;
    }
    else if (document.body)
      {
    posXqq=document.body.scrollLeft;
    posYqq=document.body.scrollTop;
      }
     var divStayTopLeft=document.getElementById("divStayTopLeft");
    divStayTopLeft.style.top=(posYqq+400-200)+"px";
  divStayTopLeft.style.left=(posXqq+screen.width-135)+"px";
  setTimeout("scrollqq()",500);
    }
  scrollqq();


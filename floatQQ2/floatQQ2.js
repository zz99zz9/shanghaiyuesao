<!--
var jspath=document.scripts;
 jspath="floatqq2/"//jspath[jspath.length-1].src.substring(0,jspath[jspath.length-1].src.lastIndexOf("/")+1);
 //alert(jspath);

function WriteQqStr()
{
	document.write('<DIV id=backi style="RIGHT: 0px; OVERFLOW: visible; POSITION: absolute; TOP: 140px">');
	document.write('<table border="0" cellpadding="0" cellspacing="0" width="72">');
	document.write('<tr><td><a href="javascript:close_float_left();void(0);" title="close"><IMG src="'+jspath+'img/01.gif" border=0></a></td></tr>');
	document.write('<tr><td><A href="tencent://message/?uin=1162721029&Site=www.yuesaozhongxin.com&Menu=yes"><IMG src="'+jspath+'img/02.gif" border=0></A></td></tr>');
	document.write('<tr><td><A href="tencent://message/?uin=2714981907&Site=www.yuesaozhongxin.com&Menu=yes"><IMG src="'+jspath+'img/02.gif" border=0></A></td></tr>');
//	document.write('<tr><td><A href="tencent://message/?uin=2643251232&Site=www.zhuyarui.com&Menu=yes"><IMG src="'+jspath+'img/02.gif" border=0></A></td></tr>');
	//document.write('<tr><td><A href="tencent://message/?uin=1134266978&Site=www.zhuyarui.com&Menu=yes"><IMG src="'+jspath+'img/02.gif" border=0></A></td></tr>');	
	//document.write('<tr><td><A href="http://amos1.taobao.com/msg.ww?v=2&uid=haiyangwangzi&site=cntaobao&s=1" target=_blank><IMG src="'+jspath+'img/04.gif" border=0></A></td></tr>');
	//document.write('<tr><td><A href="/list.php?fid=1"><IMG src="'+jspath+'img/06.gif" border=0></A></td></tr>');
	document.write('<tr><td><A href="/Feedback.asp" target="_blank"><IMG src="'+jspath+'img/05-1.gif" border=0></A></td></tr>');
	document.write('</table>');
	document.write('</DIV>');
}

function close_float_left(){backi.style.visibility='hidden';}

lastScrollY=0; 
function heartBeat(){ 
diffY=document.documentElement.scrollTop; 
percent=.1*(diffY-lastScrollY); 
if(percent>0)percent=Math.ceil(percent); 
else percent=Math.floor(percent); 
document.all.backi.style.pixelTop+=percent; 
lastScrollY=lastScrollY+percent; 
} 

if (!document.layers) {WriteQqStr();window.setInterval("heartBeat()",1); }
//-->
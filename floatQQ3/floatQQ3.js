var jspath=document.scripts;
jspath=jspath[jspath.length-1].src.substring(0,jspath[jspath.length-1].src.lastIndexOf("/")+1);

document.write('<link rel="stylesheet" type="text/css" href="'+jspath+'images/qq.css">');
document.write('<div class="QQbox" id="divQQbox" >');
document.write('  <div class="Qlist" id="divOnline" onmouseout="hideMsgBox(event);" style="display : block;">');
document.write('    <div class="t"></div>');
document.write('<div class="infobox">����Ӫҵ��ʱ��<br>8:00-20:00</div>');
document.write('    <div class="con">');

document.write('      <ul>');

document.write('        <li><a href="tencent://message/?uin=1162721029&amp;Site=QQ��ѯ&amp;Menu=yes" target="_blank"><IMG src="'+jspath+'images/02.gif" border=0></a></li>');

document.write('        <li><a href="tencent://message/?uin=2714981907&amp;Site=QQ��ѯ&amp;Menu=yes" target="_blank"><IMG src="'+jspath+'images/02.gif" border=0></a></li>');

document.write('        <li><a href="tencent://message/?uin=943420569&amp;Site=QQ��ѯ&amp;Menu=yes" target="_blank"><IMG src="'+jspath+'images/02.gif" border=0></a></li>');

document.write('        <li><img src="/floatQQ3/images/2.gif"></li>');

document.write('      </ul>');

document.write('    </div>');

document.write('    <div class="b"></div>');

document.write('  </div>');

document.write('  <div id="divMenu" onmouseover="OnlineOver();" style="display : none;">><img src="'+jspath+'images/qq_1.gif" class="press" alt="������ѯ"></div>');

document.write('</div>');



//<![CDATA[

var tips; var theTop = 145/*����Ĭ�ϸ߶�,Խ��Խ����*/; var old = theTop;

function initFloatTips() {

tips = document.getElementById('divQQbox');

moveTips();

};

function moveTips() {

var tt=50;

if (window.innerHeight) {

pos = window.pageYOffset

}

else if (document.documentElement && document.documentElement.scrollTop) {

pos = document.documentElement.scrollTop

}

else if (document.body) {

pos = document.body.scrollTop;

}

pos=pos-tips.offsetTop+theTop;

pos=tips.offsetTop+pos/10;



if (pos < theTop) pos = theTop;

if (pos != old) {

tips.style.top = pos+"px";

tt=10;

//alert(tips.style.top);

}



old = pos;

setTimeout(moveTips,tt);

}

//!]]>

initFloatTips();







function OnlineOver(){

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "block";

document.getElementById("divQQbox").style.width = "117px";

}



function OnlineOut(){

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "block";



}



if(typeof(HTMLElement)!="undefined")    //��firefox����contains()������ie�²�������
{   
      HTMLElement.prototype.contains=function(obj)   
      {   
          while(obj!=null&&typeof(obj.tagName)!="undefind"){ //ͨ��ѭ���Ա����ж��ǲ���obj�ĸ�Ԫ��
   ��������if(obj==this) return true;   
   ��������obj=obj.parentNode;
   ����}   
          return false;   
      };   
}  


function hideMsgBox(theEvent){ //theEvent���������¼���Firefox�ķ�ʽ

�� if (theEvent){

�� var browser=navigator.userAgent; //ȡ�����������

�� if (browser.indexOf("Firefox")>0){ //�����Firefox

���� if (document.getElementById('divOnline').contains(theEvent.relatedTarget)) { //�������Ԫ��

���� return; //������ʽ

} 

} 

if (browser.indexOf("MSIE")>0){ //�����IE

if (document.getElementById('divOnline').contains(event.toElement)) { //�������Ԫ��

return; //������ʽ

}

}

}

/*Ҫִ�еĲ���*/

document.getElementById("divMenu").style.display = "none";

document.getElementById("divOnline").style.display = "block";

}









   
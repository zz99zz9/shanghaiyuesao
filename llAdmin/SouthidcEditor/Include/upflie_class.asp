<%
'----------------------------------------------------------------------
'转发时请保留此声明信息,这段声明不并会影响你的速度!
'*******************   无惧上传类 v1.2  ************************************
'作者:梁无惧
'网站:http://www.25cn.com
'电子邮件:yjlrb@21cn.com
'版权声明:版权所有,源代码公开,各种用途均可免费使用,但是修改后必须把修改后的文件
'发送一份给作者.并且保留作者此版权信息
'**********************************************************************
'----------------------------------------------------------------------
dim oupfilestream
'----------------------------------------------------------------------
'文件上传类
class upfile_class

dim form,file,version,err 

private sub class_initialize
 version = "无惧上传类 version v1.2"
 err = -1
end sub

private sub class_terminate  
  '清除变量及对像
  if err < 0 then
    form.removeall
    set form = nothing
    file.removeall
    set file = nothing
    oupfilestream.close
    set oupfilestream = nothing
  end if
end sub
   
public sub getdata (maxsize)
   '定义变量
  dim requestbindata,sspace,bcrlf,sinfo,iinfostart,iinfoend,tstream,istart,ofileinfo
  dim ifilesize,sfilepath,sfiletype,sformvalue,sfilename
  dim ifindstart,ifindend
  dim iformstart,iformend,sformname
   '代码开始
  if request.totalbytes < 1 then  '如果没有数据上传
    err = 1
    exit sub
  end if
  if maxsize > 0 then '如果限制大小
    if request.totalbytes > maxsize then
    err = 2	'如果上传的数据超出限制
    exit sub
    end if
  end if
  set form = server.createobject ("scripting.dictionary")
  form.comparemode = 1
  set file = server.createobject ("scripting.dictionary")
  file.comparemode = 1
  set tstream = server.createobject ("adodb.stream")
  set oupfilestream = server.createobject ("adodb.stream")
  oupfilestream.type = 1
  oupfilestream.mode = 3
  oupfilestream.open 
  oupfilestream.write request.binaryread (request.totalbytes)
  oupfilestream.position = 0
  requestbindata = oupfilestream.read 
  iformend = oupfilestream.size
  bcrlf = chrb (13) & chrb (10)
  '取得每个项目之间的分隔符
  sspace = midb (requestbindata,1, instrb (1,requestbindata,bcrlf)-1)
  istart = lenb  (sspace)
  iformstart = istart+2
  '分解项目
  do
    iinfoend = instrb (iformstart,requestbindata,bcrlf & bcrlf)+3
    tstream.type = 1
    tstream.mode = 3
    tstream.open
    oupfilestream.position = iformstart
    oupfilestream.copyto tstream,iinfoend-iformstart
    tstream.position = 0
    tstream.type = 2
    tstream.charset = "gb2312"
    sinfo = tstream.readtext      
    '取得表单项目名称
    iformstart = instrb (iinfoend,requestbindata,sspace)-1
    ifindstart = instr (22,sinfo,"name=""",1)+6
    ifindend = instr (ifindstart,sinfo,"""",1)
    sformname = mid  (sinfo,ifindstart,ifindend-ifindstart)
    '如果是文件
    if instr  (45,sinfo,"filename=""",1) > 0 then
      set ofileinfo = new fileinfo_class
      '取得文件属性
      ifindstart = instr (ifindend,sinfo,"filename=""",1)+10
      ifindend = instr (ifindstart,sinfo,"""",1)
      sfilename = mid  (sinfo,ifindstart,ifindend-ifindstart)
      ofileinfo.filename = mid (sfilename,instrrev (sfilename, "\")+1)
      ofileinfo.filepath = left (sfilename,instrrev (sfilename, "\"))
      ofileinfo.fileext = mid (sfilename,instrrev (sfilename, ".")+1)
      ifindstart = instr (ifindend,sinfo,"content-type: ",1)+14
      ifindend = instr (ifindstart,sinfo,vbcr)
      ofileinfo.filetype = mid  (sinfo,ifindstart,ifindend-ifindstart)
      ofileinfo.filestart = iinfoend
      ofileinfo.filesize = iformstart -iinfoend -2
      ofileinfo.formname = sformname
      file.add sformname,ofileinfo
    else
    '如果是表单项目
      tstream.close
      tstream.type = 1
      tstream.mode = 3
      tstream.open
      oupfilestream.position = iinfoend 
      oupfilestream.copyto tstream,iformstart-iinfoend-2
      tstream.position = 0
      tstream.type = 2
      tstream.charset = "gb2312"
      sformvalue = tstream.readtext
      if form.exists (sformname) then
        form (sformname) = form (sformname) & ", " & sformvalue
        else
        form.add sformname,sformvalue
      end if
    end if
    tstream.close
    iformstart = iformstart+istart+2
    '如果到文件尾了就退出
  loop until  (iformstart+2) >= iformend 
  requestbindata = ""
  set tstream = nothing
end sub
end class

'----------------------------------------------------------------------------------------------------
'文件属性类
class fileinfo_class
dim formname,filename,filepath,filesize,filetype,filestart,fileext
'保存文件方法
public function savetofile (path)
  on error resume next
  dim ofilestream
  set ofilestream = createobject ("adodb.stream")
  ofilestream.type = 1
  ofilestream.mode = 3
  ofilestream.open
  oupfilestream.position = filestart
  oupfilestream.copyto ofilestream,filesize
  ofilestream.savetofile path,2
  ofilestream.close
  set ofilestream = nothing 
end function
 
'取得文件数据
public function filedata
  oupfilestream.position = filestart
  filedata = oupfilestream.read (filesize)
end function

end class
%>






<%
'----------------------------------------------------------------------
'ת��ʱ�뱣����������Ϣ,�������������Ӱ������ٶ�!
'*******************   �޾��ϴ��� v1.2  ************************************
'����:���޾�
'��վ:http://www.25cn.com
'�����ʼ�:yjlrb@21cn.com
'��Ȩ����:��Ȩ����,Դ���빫��,������;�������ʹ��,�����޸ĺ������޸ĺ���ļ�
'����һ�ݸ�����.���ұ������ߴ˰�Ȩ��Ϣ
'**********************************************************************
'----------------------------------------------------------------------
dim oupfilestream
'----------------------------------------------------------------------
'�ļ��ϴ���
class upfile_class

dim form,file,version,err 

private sub class_initialize
 version = "�޾��ϴ��� version v1.2"
 err = -1
end sub

private sub class_terminate  
  '�������������
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
   '�������
  dim requestbindata,sspace,bcrlf,sinfo,iinfostart,iinfoend,tstream,istart,ofileinfo
  dim ifilesize,sfilepath,sfiletype,sformvalue,sfilename
  dim ifindstart,ifindend
  dim iformstart,iformend,sformname
   '���뿪ʼ
  if request.totalbytes < 1 then  '���û�������ϴ�
    err = 1
    exit sub
  end if
  if maxsize > 0 then '������ƴ�С
    if request.totalbytes > maxsize then
    err = 2	'����ϴ������ݳ�������
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
  'ȡ��ÿ����Ŀ֮��ķָ���
  sspace = midb (requestbindata,1, instrb (1,requestbindata,bcrlf)-1)
  istart = lenb  (sspace)
  iformstart = istart+2
  '�ֽ���Ŀ
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
    'ȡ�ñ���Ŀ����
    iformstart = instrb (iinfoend,requestbindata,sspace)-1
    ifindstart = instr (22,sinfo,"name=""",1)+6
    ifindend = instr (ifindstart,sinfo,"""",1)
    sformname = mid  (sinfo,ifindstart,ifindend-ifindstart)
    '������ļ�
    if instr  (45,sinfo,"filename=""",1) > 0 then
      set ofileinfo = new fileinfo_class
      'ȡ���ļ�����
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
    '����Ǳ���Ŀ
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
    '������ļ�β�˾��˳�
  loop until  (iformstart+2) >= iformend 
  requestbindata = ""
  set tstream = nothing
end sub
end class

'----------------------------------------------------------------------------------------------------
'�ļ�������
class fileinfo_class
dim formname,filename,filepath,filesize,filetype,filestart,fileext
'�����ļ�����
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
 
'ȡ���ļ�����
public function filedata
  oupfilestream.position = filestart
  filedata = oupfilestream.read (filesize)
end function

end class
%>






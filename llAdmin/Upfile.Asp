<!--#include file="hhconn.asp"-->
<!--#include FILE="fileupload_5xsoft.asp"-->
<html>
<head>
<title>�ļ��ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
<!--
body {
	background-color: #eeeeee;
}
-->
</style></head>
<body>
<%
  ''����ǰ�����ں�ʱ��תΪ�ļ���
  Function MakeFileName()
    Dim fname
    fname = Now()
    fname = Trim(fname)
    fname = Replace(fname, "-", "")
    fname = Replace(fname, "/", "")
    fname = Replace(fname, " ", "") 
    fname = Replace(fname, ":", "")
    fname = Replace(fname, "PM", "")
    fname = Replace(fname, "AM", "")
    fname = Replace(fname, "����", "")
    fname = Replace(fname, "����", "")
    MakeFileName = fname
  End Function 

  Dim upload,file,formName,formPath
  Dim i,l,fileType,NewFileName,filenamelist
  '�������ļ�����
  NewFileName = MakeFileName()
  '�����ϴ�����
  Set upload = New upload_5xsoft
  '�ϴ��ļ�Ŀ¼
  formPath = Server.MapPath("../UploadFiles")&"/"
  '�г������ϴ��˵��ļ�
  For Each formName in upload.objFile
    '����һ���ļ�����
    Set file = upload.file(formName)  
    '��� FileSize > 0 ˵�����ļ�����
    If file.FileSize>0 Then
      'ȡ���ļ���չ��      
      fileType = file.FileName '�ļ����Լ���չ��
      i = instr(fileType,".")  '�Ƿ���ڡ�.��
      l = Len(fileType)  
      If i>0 Then
        fileType = Right(fileType,l-i+1) '�õ���չ��
      End If
      NewFileName = NewFileName & fileType
      filenamelist = formPath & NewFileName  '���ļ����Ե�ַ������
      file.SaveAs filenamelist   ''�����ļ�
    End If
    Set file = Nothing
  next
  
  '���ļ���Ϣ���������ֶ�
  Response.Write "<script> parent.myform.txtcontent.value+='../UploadFiles/"&NewFileName&"'</script>"
  'ѡ�С���ͼ�����
  Response.Write "<script>parent.myform.attpic.checked=true;</script>"
  '��ʾ��ʾ��Ϣ
  Response.Write ""

  set upload=nothing  ''ɾ���˶���
%>
</body>
</html>
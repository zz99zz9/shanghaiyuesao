<!--#include file="UpLoad_Class.vbs.asp"-->
<%
dim upload
'

'
set upload = new AnUpLoad
upload.Exe = "jpg|bmp|jpeg|gif|png|ppt|pps|pdf|zip|rar|7z"
upload.MaxSize = 30 * 1024 * 1024 '2M
upload.GetData()
if upload.ErrorID>0 then 
	response.Write upload.Description
else
	dim file,savpath
	savepath = "/Uploadfiles"
	set file = upload.files("file1")
	if not(file is nothing) then
		if file.saveToFile(savepath,0,true) then
		'	response.Write "文件'" & file.LocalName & "'上传成功，保存位置/'" & savepath & "/" & file.filename & "',文件大小" & file.size & "字节"
		'	file.saveAs Server.mappath(filename)
			response.write "<script>window.opener.document.myform.DefaultPicUrl.value='" & savepath & "/" & file.filename & "';window.opener.document.myform.title.value='" & file.LocalName & "'</script>"'
		
         '   response.end()
			%><script language="javascript">
		//	window.opener.document.myform.DefaultPicUrl.value='UploadFiles/2012032718015227610.jpg'
window.alert("文件上传成功!！");
window.close();
</script>
            <%
		else
			response.Write file.Exception
		end if
	end if
end if
set upload = nothing
%>
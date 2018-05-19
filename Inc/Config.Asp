<%
Set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from Table_SiteInfo ",conn,1,1
SiteName=oRs("Sitename")				'网站名称
SiteTitle=oRs("SiteTitle")				'网站标题
siteKey=oRs("SiteKey")					'网站关键字
SiteCont=oRs("SiteCont")				'网站描述
SiteURl=oRs("SiteURl")					'网站地址
SiteCopyRight=oRs("SiteCopyRight")		'网站版权信息
SiteBeiAn=oRs("SiteBeiAn")				'网站备案信息
WebmasterName=oRs("WebmasteRName")      '站长姓名网站公告
WebmasterEmail=oRs("WebmasteREmail")    '站长信箱手机号码
CoName=oRs("CoName")					'企业名称
CoTel=oRs("CoTel")						'企业电话
CoFax=oRs("CoFax")						'企业传真
CoMail=oRs("CoMail")					'企业传真
CoAddr=oRs("CoAddr")					'企业地址
CoCode=oRs("CoCode")					'企业邮编
oRs.close
set oRs=Nothing
QQ1="497124326"
QQ2="467626573"
%>
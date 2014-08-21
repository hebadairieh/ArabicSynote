<html>
<head>
<title><g:message code="org.synote.resource.compound.multimediaResource.create.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-2" id="user_nav_div">
			<g:render template="/common/userNav" model="['active':'recordings']"/>
		</div>
		<div class="col-md-10" id="user_content_div">
			<h2><g:message code="org.synote.resource.compound.multimediaResource.create.title" /></h2>
			<br/>
			<br/>
			<div id="my_synote_content">

			<g:link class="user" action="createinet" title="internet" params="[lang: params.lang]">
				<img src="${resource(dir: 'images/skin', file: 'network_64.png')}" alt="internet"/><br /><g:message code="Internet" />
			</g:link>

			<g:link class="user" action="createyt" title="Youtube" params="[lang: params.lang]">
				<img src="${resource(dir: 'images/skin', file: 'youtube_64.png')}" alt="youtube"/><br /><g:message code="Youtube" />
			</g:link>
			<g:link class="user" action="createdm" title="DailyMotion" params="[lang: params.lang]">
				<img src="${resource(dir: 'images/skin', file: 'dailymotion_64.png')}" alt="dailymotion"/><br /><g:message code="DailyMotion" />
			</g:link>
			<syn:fileUploadEnabled>
			<g:link class="user" action="createlocal" title="Upload from local disk" params="[lang: params.lang]">
				<img src="${resource(dir: 'images/skin', file: 'harddisk_64.png')}" alt="upload"/><br /><g:message code="Local.Disk" /></g:link>
			</syn:fileUploadEnabled>
			<syn:viascribeXmlUploadEnabled>
			<g:link class="user" action="createxml" title="Synchronised XML" params="[lang: params.lang]">
				<img src="${resource(dir: 'images/skin', file: 'xml_64.png')}" alt="synchronised xml"/><br />Synchronised XML</g:link>
			</syn:viascribeXmlUploadEnabled>
			</div>
		</div>
	</div>
</div>
</body>
</html>

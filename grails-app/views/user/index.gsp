<html>
<head>
<title><g:message code="org.synote.user.index.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-2" id="user_nav_div">
			<g:render template="/common/userNav" model='["active":null]'/>
		</div>
		<div class="col-md-10" id="user_content_div">
			<h2><g:message code="org.synote.user.index.title" /></h2>
			<g:render template="/common/message"/>
			<div id="my_synote_content">

			<syn:allowRegistering>
				<g:link class="user" action="showUserProfile" title="Show user profile" params="[lang: params.lang]">
							  <g:if test="${params.lang == 'en'}">
								 	<img src="${resource(dir: 'images/mysynote', file: 'view-pim-contacts.png')}" /><br /><g:message code="User.Profile" />
							  </g:if>
				  			<g:if test="${params.lang == 'ar'}">
				  			<img src="${resource(dir: 'images/mysynote', file: 'view-pim-contacts-ar.png')}" /><br /><g:message code="User.Profile" />
				  		</g:if>
			</g:link>

				<!-- <g:link class="user" action="changePassword" title="Change password"><img src="${resource(dir: 'images/mysynote', file: 'edit-rename.png')}" /><br />Change password</g:link>
				-->
			</syn:allowRegistering>
			<g:link class="" action="listGroups" title="My Groups" params="[lang: params.lang]">
			  <g:if test="${params.lang == 'en'}">
				 <asset:image src="user-group-properties.png"  />
			  </g:if>
  			<g:if test="${params.lang == 'ar'}">
				 <asset:image src="user-group-properties-arabic.png"  />
				</g:if>
			<br/><g:message code="My.Groups" /></g:link>


			<g:link class="user" action="listRecordings" title="My Recordings" params="[lang: params.lang]"><img src="${resource(dir: 'images/mysynote', file: 'recording_64.png')}" /><br /><g:message code="My.Recordings" /></g:link>
			<g:link class="user" action="listSynmarks" title="My Synmarks" params="[lang: params.lang]">

						  <g:if test="${params.lang == 'en'}">
						  <img src="${resource(dir: 'images/mysynote', file: 'synmark_64.png')}" />						  </g:if>
			  			<g:if test="${params.lang == 'ar'}">
			  			<img src="${resource(dir: 'images/mysynote', file: 'synmark_64-ar.png')}" />			  		</g:if>

			<br /><g:message code="My.Synmarks" /></g:link>
			<g:link class="user" action="listTranscripts" title="My Transcripts" params="[lang: params.lang]">

						  <g:if test="${params.lang == 'en'}">
							 	<img src="${resource(dir: 'images/mysynote', file: 'transcript_64.png')}" />
						  </g:if>
			  			<g:if test="${params.lang == 'ar'}">
			  			<img src="${resource(dir: 'images/mysynote', file: 'transcript_64-ar.png')}" />
			  		</g:if>

			<br /><g:message code="My.Transcripts" /></g:link>
			<g:link class="user" action="listTags" title="My Tags" params="[lang: params.lang]"><img src="${resource(dir: 'images/mysynote', file: 'tag_64.png')}" /><br /><g:message code="My.Tags" /></g:link>
			<syn:twitterEnabled>
			<g:link class="user" controller="twitter" action="index" title="Upload Tweets" params="[lang: params.lang]"><img src="${resource(dir: 'images/mysynote', file: 'twitter.png')}" /><br />Upload Tweets</g:link>
			</syn:twitterEnabled>
			<syn:ibmhtsEnabled>
			<g:link class="user" controller="IBMTransJob" action="list" title="IBM Transcript Service" params="[lang: params.lang]"><img src="${resource(dir: 'images/mysynote', file: 'view-media-playlist-4.png')}" /><br />Transcript Jobs</g:link>
			</syn:ibmhtsEnabled>
			<!-- <g:link class="user" controller="logout" action="index" title="Log out"><img src="${resource(dir: 'images/mysynote', file: 'application-exit-2.png')}" /><br />Log out</g:link>-->

			</div>
		</div>
	</div>
</div>
</body>
</html>

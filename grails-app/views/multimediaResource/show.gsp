<html>
<head>
<title><g:message
	code="org.synote.resource.compound.multimediaResource.show.title" /></title>
<meta name="layout" content="main" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#recording_replay").button({
			icons:{
				primary:"ui-icon-play"
			}
		});
		$("#recording_print").button({
			icons:{
				primary:"ui-icon-print"
			}
		});
		if($("#recording_edit")!=null)
		{
			$("#recording_edit").button({
				icons:{
					primary:"ui-icon-pencil"
				}
			});
		}
		if($("#recording_delete")!=null)
		{
			$("#recording_delete").button({
				icons:{
					primary:"ui-icon-trash"
				}
			});
		}

	});
</script>
</head>
<body>
<div class="span-24" id="user_nav">
	<g:render template="/common/userNav"/>
</div>
<div class="span-24">
	<div class="span-22 prepend-1 append-1">
		<h1><g:message code="org.synote.resource.compound.multimediaResource.show.title" /></h1>
		<g:render template="/common/message" />
		<table class="ui-widget">
		<tr>
			<th class="ui-widget-header">Property</th>
			<th class="ui-widget-header">Value</th>
		</tr>
		<tbody>
			<tr class="ui-widget-content prop">
				<td class="name">Id:</td>
				<td class="value">
				${fieldValue(bean: multimediaResource, field: 'id')}
				</td>
			</tr>
			<tr class="ui-widget-content prop">
				<td class="name">Title:</td>
				<td class="value">
				${fieldValue(bean: multimediaResource, field: 'title')}
				</td>
			</tr>
			<tr class="ui-widget-content prop">
				<td class="name">Url:</td>
				<td class="value">
				${fieldValue(bean: multimediaResource, field: 'url')}
				</td>
			</tr>
			<tr class="ui-widget-content prop">
				<td class="name">Permission:</td>
				<td class="value">
				${fieldValue(bean: multimediaResource, field: 'perm')}
				</td>
			</tr>
			<tr class="ui-widget-content prop">
				<td class="name">Owner:</td>
				<td class="value">
				${fieldValue(bean: multimediaResource, field: 'owner')}
				</td>
			</tr>
			<syn:isOwnerOrAdmin owner="${multimediaResource?.owner.id}">
				<tr class="ui-widget-content prop">
					<td class="name" style="vertical-align: top;">Group Permissions:</td>
					<td>
						<g:each status="i" var="resourcePermission" in="${resourcePermissionList.sort {it.group?.name}}">
							<g:link controller="userGroup" action="show" id="${resourcePermission?.group?.id}" params="[lang: params.lang]">
								${resourcePermission?.group?.name} (${resourcePermission?.perm})
							</g:link>
							<br/>
							</g:each>
					</td>
				</tr>
			</syn:isOwnerOrAdmin>
		</tbody>
	</table>
	<div class="prepend-top append-bottom">
	<div class="span-20">
		<g:link class="replay" controller="recording" action="replay_old" id="${multimediaResource?.id}" elementId="recording_replay" title="Replay recording" params="[lang: params.lang]">Replay</g:link>
		<g:link class="print" controller="recording" action="print" id="${multimediaResource?.id}" elementId="recording_print" title="Display the recording in accessible style" params="[lang: params.lang]">Print Friendly</g:link>
		<syn:isOwnerOrAdmin owner="${multimediaResource?.owner?.id}">
			<g:link controller="multimediaResource" action="edit" id="${multimediaResource?.id}" elementId="recording_edit" title="Edit recording" params="[lang: params.lang]">Edit</g:link>
			<g:link controller="multimediaResource" action="delete" id="${multimediaResource?.id}" elementId="recording_delete" onclick="return confirm('Are you sure?');" title="Delete recording" params="[lang: params.lang]">Delete</g:link>
		</syn:isOwnerOrAdmin>
	</div>
	<div class="span-4 right" id="more_action_tab">
		<!-- More action list -->
		<g:if test="${multimediaResource.perm?.val >= org.synote.permission.PermissionValue.findByName('ANNOTATE').val}">
			<syn:twitterEnabled>
				<g:link class="tweetUpload" elementId="recording_twitter" controller="twitter" action="create" id="${multimediaResource?.id}" title="Upload the Tweets as Synmarks" params="[lang: params.lang]">Upload Tweets</g:link></span>
			</syn:twitterEnabled>
		</g:if>
		<syn:isOwnerOrAdmin owner="${multimediaResource?.owner?.id}">
			<syn:ibmhtsEnabled>
				<syn:ibmhtsAddingJobEnabled>
					<g:link class="generateTranscript" action="generateTranscript" id="${multimediaResource?.id}"
							title="Generate transcript using IBM Transcript service" params="[lang: params.lang]">Generate Transcript</g:link>
				</syn:ibmhtsAddingJobEnabled>
			</syn:ibmhtsEnabled>
		</syn:isOwnerOrAdmin>
	</div>
	</div>
</div>
</div>
</body>
</html>

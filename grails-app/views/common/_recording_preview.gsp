<!-- set thumbnail url -->
<g:if test="${preview_row.thumbnail?.size()>0 && preview_row.isVideo==true}">
	<g:set var="preview_thumbnail_src" value="${preview_row.thumbnail}"/>
</g:if>
<g:elseif test="${preview_row.isVideo == false }">
	<g:set var="preview_thumbnail_src" value="${resource(dir: 'images', file: 'audio_default.png')}"/>
</g:elseif>
<g:else>
	<g:set var="preview_thumbnail_src" value="${resource(dir: 'images', file: 'video_default.jpg')}"/>
</g:else>

<!-- set duration -->
<g:if test="${preview_row.duration == -1}">
	<g:set var="preview_duration" value="unknown"/>
</g:if>
<g:else>
	<g:set var="preview_duration" value="${preview_row.duration }"/>
</g:else>

<!-- set title depending on length -->
<g:if test="${preview_row.title?.size() > 40}">
	<g:set var="preview_title" value="${preview_row.title?.substring(0,40)+'...'}"/>
</g:if>
<g:else>
	<g:set var="preview_title" value="${preview_row.title}"/>
</g:else>

<div style="margin-top:20px;">
	<div style="position:relative;">
		<g:link controller='recording' action='replay' id="${preview_row.id}" title="play ${preview_row.title}" params="[lang: params.lang]">
			<img class="thumbnail-img" src="${preview_thumbnail_src}"/>
			<div style="position:absolute;z-index:1;left:0;bottom:0">
				<span class="label label-inverse label-duration"><syn:printTime time="${preview_duration}"/></span>
			</div>
		</g:link>
	</div>
	<div>
		<span><b>${preview_title}</b></span>
	</div>
	<div>
		<span class="owner-info"><g:message code="by" /> ${preview_row.owner_name}</span>
		<br/>
	  	<span class="datetime-info">${preview_row.date_created}</span>
	  	<br/>
	  	<span class="views-info">${preview_row.views} <g:message code="Views" /></span>
	</div>
</div>
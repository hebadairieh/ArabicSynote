<ul class="nav nav-pills nav-stacked">
	<li class="nav-header"><g:message code="Menu" /></li>
	<g:if test="${active == 'user_profile'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="showUserProfile" title="show user profile" params="[lang: params.lang]">
    	<i class="icon-user-profile-small"></i>
        <g:message code="User.Profile" />
        </g:link></li>
    <g:if test="${active == 'group'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="listGroups" params="[lang: params.lang]">
    	<i class="icon-group-small">
     </i><g:message code="My.Groups" /></g:link></li>
    <g:if test="${active == 'recordings'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="listRecordings" params="[lang: params.lang]">
    	<i class="icon-recordings-small">
%{--          <img src="${resource(dir:'images',file:'skin/recording_16.png')}">
 --}%        </i><g:message code="My.Recordings" /></g:link></li>
    <g:if test="${active == 'synmarks'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="listSynmarks" params="[lang: params.lang]">
    	<i class="icon-synmarks-small">
%{--          <img src="${resource(dir:'images',file:'skin/synmark_16.png')}">
 --}%        </i><g:message code="My.Synmarks" /></g:link></li>
    <g:if test="${active == 'transcripts' }">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="listTranscripts" params="[lang: params.lang]">
    	<i class="icon-transcripts-small">
%{--         <img src="${resource(dir:'images',file:'skin/transcript_16.png')}">
 --}%        </i><g:message code="My.Transcripts" /></g:link></li>
    <g:if test="${active == 'tags'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="user" action="listTags" params="[lang: params.lang]">
    	<i class="icon-tag-c-small">
%{--          <img src="${resource(dir:'images',file:'skin/tag_16.png')}">
 --}%
        </i><g:message code="My.Tags" /></g:link></li>
    <syn:twitterEnabled>
    <g:if test="${active == 'tweets'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="twitter" action="index"><i class="icon-twitter-small" params="[lang: params.lang]"></i>
    	Upload Tweets</g:link></li>
    </syn:twitterEnabled>
    <syn:ibmhtsEnabled>
    <g:if test="${active == 'transjobs'}">
    	<li class="active">
    </g:if>
    <g:else>
    	<li>
    </g:else><g:link controller="iBMTransJob" action="index" params="[lang: params.lang]"><i class="icon-document-small"></i>
    	Transcript Jobs</g:link></li>
    </syn:ibmhtsEnabled>
</ul>

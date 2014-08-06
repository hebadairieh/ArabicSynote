<html>
<head>
<title><g:message code="org.synote.resource.compound.multimediaResource.list.title" /></title>
<meta name="layout" content="main" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-10" id="user_content_div">
			<h2 class="heading-inline"><g:message code="org.synote.resource.compound.multimediaResource.list.title" /></h2>
			<span id="recording_count_span" style="padding:5px" class="pull-right label label-info">${multimediaList.records} <g:message code="recordings" /></span>
			<g:render template="/common/message" />
			<div class="row">
				<div>
					<div class="pull-right span7">
						<g:form class="form-inline pull-right" action="list">
							<label for="sidx"><g:message code="Sorted.By"/>:</label>
								<select name="sidx" class="form-control">
									<g:if test="${params.sidx == 'date_created'}">
										<option value="date_created" selected="selected"><g:message code="Date.Created"/></option>
									</g:if>
									<g:else>
										<option value="date_created"><g:message code="Date.Created"/></option>
									</g:else>
									<g:if test="${params.sidx == 'title'}">
										<option value="title" selected="selected"><g:message code="title" /></option>
									</g:if>
									<g:else>
										<option value="title"><g:message code="title" /></option>
									</g:else>
									<g:if test="${params.sidx =='perm'}">
										<syn:isLoggedIn>

											<option value="user_perm_val" selected="selected"><g:message code="permission" /></option>
										</syn:isLoggedIn>
										<syn:isNotLoggedIn>
											<option value="public_perm_val" selected="selected"><g:message code="permission" /></option>
										</syn:isNotLoggedIn>
									</g:if>
									<g:else>
										<syn:isLoggedIn>
											<option value="user_perm_val"><g:message code="permission" /></option>
										</syn:isLoggedIn>
										<syn:isNotLoggedIn>
											<option value="public_perm_val"><g:message code="permission" /></option>
										</syn:isNotLoggedIn>
									</g:else>
								</select>
							<button type="button" class="btn btn-default" value="Submit" /><g:message code="Submit" />
						</g:form>
					</div>
				</div>
			</div>
			<div>
				<div id="recording_list_div">
					<g:if test="${multimediaList.rows?.size() == 0}">
						<div class="nodata"><g:message code="No.recordings.have.been.found" /></div>
					</g:if>
					<g:each in="${multimediaList.rows}" var="row">
						<g:render template="/common/recording" model="['row':row,'actionEnabled':true, 'viewTranscriptsEnabled':false,'viewSynmarksEnabled':false]"/>
					</g:each>
				</div>
			</div>
			<div class="row" id="recording_pagination">
				<g:render template="/common/pagination"
					model="['currentPage':multimediaList.page,'rows':params.rows, 'sidx':params.sidx, 'text':params.text,
						'sord':params.sord,'ctrl':'multimediaResource', 'act':'list', 'total':multimediaList.total]"/>
			</div>
		</div>
		<div class="col-md-2" id="most_views_div">
			<h4 ><g:message code="Most.viewed" /></h4>
			<br/>
			<g:each in="${viewList.rows}" var="preview_row">
				<div style="padding-left:15px">
					<g:render template="/common/recording_preview" model="['preview_row':preview_row]" />
				</div>
			</g:each>
		</div>
	</div>
</div>
</body>
</html>

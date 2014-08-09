<%@ page import="org.synote.user.User"%>
<%@ page import="org.synote.user.group.UserGroup"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="org.synote.user.showUserProfile.title" /></title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-2" id="user_nav_div">
			<syn:isLoggedIn>
				<g:render template="/common/userNav" model="['active':'user_profile']"/>
			</syn:isLoggedIn>
		</div>
		<div class="col-md-10" itemscope="itemscope" itemtype="http://schema.org/Table">
			<g:if test="${params.lang == 'ar'}">
				 <h1><g:message code="Profile" /> ${userInstance.userName}</h1>
			</g:if>
			<g:if test="${params.lang == 'en'}">
						<h1>${userInstance.userName}'s Profile</h1>
			</g:if>

			<g:render template="/common/message" model="[bean: userInstance]" />

			<dl class="dl-horizontal well" itemscope="itemscope" itemtype="http://schema.org/Person">
				<dt><g:message code="user.name"  /></dt>
				<dd>${fieldValue(bean: userInstance, field: "userName")}</dd>
				<dt><g:message code="First.Name" /></dt>
				<dd itemprop="givenname">${fieldValue(bean: userInstance, field: "firstName")}</dd>
				<dt><g:message code="Last.Name"/></td>
				<dd itemprop="familyName">${fieldValue(bean: userInstance, field: "lastName")}</dd>
				<dt><g:message code="Email" /></dt>
				<dd itemprop="email">${fieldValue(bean: userInstance, field: "email")}</dd>

				<dt><g:message code="enabled"  /></dt>
				<dd><g:formatBoolean boolean="${userInstance?.enabled}" /></dd>
				<dt><g:message code="Date.Created"  /></dt>
				<dd valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}" format="dd-MMMMM-yyyy"/></dd>
				<dt><g:message code="Groups"  /></dt>
				<dd valign="top"  class="value">
					<g:if test="${userInstance?.groups?.size() > 0 }">
						<g:each in="${userInstance?.groups}" var="g">
						<span><g:link controller="userGroup" action="show" id="${g?.id}" params="[lang: params.lang]">
								${g?.encodeAsHTML()}
							</g:link></span>
							<br/>
						</g:each>
					</g:if>
					<g:else>
						<g:message code="No.groups" />
					</g:else>
				</dd>
				<dt><g:message code="last.updated" /></dd>
				<dd><g:formatDate date="${userInstance?.lastUpdated}" format="dd-MMMMM-yyyy" /></dt>
				<dt><g:message code="last.login"  /></dd>
				<dd><g:formatDate date="${userInstance?.lastLogin}" format="dd-MMMMM-yyyy"/></dt>
			</dl>
			<div class="row">
				<div class="col-md-6 offset1">
					<g:link class="btn" controller='user' action='editUserProfile' elementId="user_profile_edit" params="[lang: params.lang]">
					<g:message code="Edit.your.profile" /></g:link>
					<syn:allowRegistering>
						<g:link class="btn btn-warning" controller='user' action='changePassword' elementId="user_profile_change_password" params="[lang: params.lang]">
						<g:message code="Change.password" /></g:link>
					</syn:allowRegistering>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>

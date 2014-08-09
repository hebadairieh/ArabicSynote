<head>
<title><g:message code="org.synote.user.login.title" /></title>
<meta name="layout" content="main" />
<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.validate-1.9.1.min.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){
		document.forms['loginForm'].elements['j_username'].focus();
		$("#loginForm").validate(
		{
			highlight: function(label) {
			    $(label).closest('.control-group').addClass('error');
			},
		});
	});
</script>
</head>
<body>
<h1 class="hiding"><g:message code="org.synote.user.login.title" /></h1>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h2><g:message code="sign.in.to.synote" /></h2>
			<p><b><g:message code="With.a.Synote.account.you.can" /></b></p>
			<ul>
				<li><g:message code="Create.Recordings" /></li>
				<li><g:message code="Set.your.recordings.public.or.private" /></li>
				<li><g:message code="Edit.transcript.and.presentation.slides.for.you.own.recordings" /></li>
				<li><g:message code="Make.annotations.on.your.and.your.friends'.recordings" /></li>
				<li><g:message code="Create.groups.and.add.recordings.that.shared.with.the.members.in.the.group" /></li>

			</ul>
			<p><b><g:message code="Do.not.have.an.account?" /></b></p>
			<g:link controller="register" action="index" title="Register" class="btn btn-success" params="[lang: params.lang]">
					<g:message code="Get.a.free.account" /></g:link><br/><br/>
			<p><b><g:message code="Or.you.can.still.enjoy.Synote" /></b></p>
			<ul>
				<li><g:message code="View.public.recordings.list"/></li>
				<li><g:message code="Watch.recordings.in.Synote.player.but.you.cannot.make.annotations."/></li>
			</ul>
		</div>
		<!-- login form -->
		<div class="col-md-4 col-md-offset-1 well">
			<h3><g:message code="Login" /></h3>
			<hr/>
			<g:render template="/common/message"/>
			%{-- <form action='${postUrl}' method='POST' name='loginForm'> --}%
			<g:form name="loginForm" url="[controller:'j_spring_security_check']" params="[lang: params.lang]">
			  <fieldset>
			    <div class="form-group">
			     	<label for="j_username" class="control-label"><b><em>*</em><g:message code="user.name" /></b></label>
			      	<div class="controls">
			        	%{-- <input type='text' autocomplete="off" class="form-control required" name='j_username' id='j_username' value='${request.remoteUser}'
			        		placeholder="Synote user name"/> --}%
			        		<g:textField class="form-control required" name='j_username' id='j_username' value='${request.remoteUser}' placeholder="Synote user name" />
			      	</div>
			    </div>
			    <div class="form-group">
			     	<label for="j_password" class="control-label"><b><em>*</em><g:message code="password" /></b></label>
			      	<div class="controls">
						%{-- <input type='password' name='j_password' class="form-control required" id='j_password' placeholder="password"/> --}%
						<g:passwordField name='j_password' class="form-control required" id='j_password' placeholder="password"/>
			      	</div>
			    </div>
			    <div class="form-group">
			    	<label class="checkbox" for="_spring_security_remember_me">
			    		<input type="checkbox" name="_acegi_security_remember_me" id="_acegi_security_remember_me" /><g:message code="Keep.me.signed.in" />
			    	</label>
			    </div>
			    <syn:forgetPasswordEnabled>
				<div id="forget_password_div">
					<a href="#"><g:message code="Forgotten.Password?" /></a> (not implemented yet)
				</div>
				</syn:forgetPasswordEnabled>

			    <div class="form-actions">
		            %{-- <input class="btn btn-large btn-primary" id="loginForm_submit" type="submit" value="<g:message code="Login"/>"  /> --}%

		          <g:actionSubmit value="${message(code: 'Login')}" class="btn btn-large btn-primary" id="loginForm_submit" />

		        </div>
			  </fieldset>
			%{-- </form> --}%
			</g:form>
		</div>
	</div>
</div>
</body>

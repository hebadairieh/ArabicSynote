<head>
<meta name="layout" content="main" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><g:message code="User.Registration" /></title>
<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.validate-1.9.1.min.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#registrationForm").validate(
		{
			rules: {
			    password: "required",
			    confirm: {
			      equalTo: "#password"
			    }
			 },
			highlight: function(label) {
				$(label).closest('.control-group').addClass('error');
			}
		});
	});
</script>
</head>

<body>
<h1 class="hiding"><g:message code="User.Registration" /></h1>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-2 well">
			<h3><g:message code="Create.a.Synote.account" /></h3>
			<hr/>
			<g:render template="/common/message" model="[bean: user]" />
			<div>
				<g:form method='POST' name='registrationForm' class="form-horizontal" controller="register" action="save">
				  <fieldset>

				    <div class="form-group">
				    	<label for="userName" class="col-sm-4 control-label"><b><em>*</em><g:message code="user.name" /></b></label>
				      	<div class="col-sm-6">
				        	<input type='text' autocomplete="off" class="required form-control" name='userName' id='userName' value='${fieldValue(bean: user, field: 'userName')}' />
							<p class="help-block"><g:message code="The.username.you.would.like.to.use.in.Synote" /></p>
				      	</div>
				    </div>
				    <div class="form-group">
				     	<label for="password" class="col-sm-4 control-label"><b><em>*</em><g:message code="password" /></b></label>
				      	<div class="col-sm-6">
							<input type='password' name='password' class="required form-control" id='password'/>
				      	</div>
				    </div>
				    <div class="form-group">
				     	<label for="confirm" class="col-sm-4 control-label"><b><em>*</em><g:message code="Confirm.Password" /></b></label>
				      	<div class="col-sm-6">
							<input type='password' name='confirm' class="required form-control" id='confirm'/>
				      	</div>
				    </div>
					<div class="form-group">
					    <label for="firstName" class="col-sm-4 control-label"><b><em>*</em><g:message code="First.Name" /></b></label>
					    <div class="col-sm-6">
					    	<input type='text' autocomplete="off" class="required form-control" name='firstName' id='firstName' value='${fieldValue(bean: user, field: 'firstName')}' />
					    </div>
					</div>
					<div class="form-group">
					    <label for="lastName" class="col-sm-4 control-label"><b><em>*</em><g:message code="Last.Name" /></b></label>
					    <div class="col-sm-6">
					    	<input type='text' autocomplete="off" class="required form-control" name='lastName' id='lastName' value='${fieldValue(bean: user, field: 'lastName')}' />
					    </div>
					</div>
					<div class="form-group ">
					    <label for="email" class="col-sm-4 control-label"><b><em>*</em><g:message code="Email" /></b></label>
					    <div class="col-sm-6">
					    	<div class="input-group">
					    		<div class="input-group-addon"><i class="fa fa-envelope"></i></div>
					    		<input type='text' class="required email form-control" name='email' id='email' value='${fieldValue(bean: user, field: 'email')}' />
					    	</div>
					    </div>
					</div>


					<syn:captchaEnabled>
					<div class="form-group">
					    <label for="captcha" class="col-sm-4 control-label"><b><em>*</em><g:message code="Enter.Code" /></b></label>
					    <div class="col-sm-6">
					    	<input type='text' autocomplete="off" class="required form-control" name='captcha' id='captcha' />
							<p class="help-block"><img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle" /></p>
					    </div>
					</div>
					</syn:captchaEnabled>
					<div class="checkbox">
			    		<label for="termsAndConditions">
			    			<input type="checkbox" name="termsAndConditions" id="termsAndConditions" class="required"/>
						<g:message code="I.have.read.and.agreed.the" /> <g:link controller="user" action="termsAndConditions" params="[lang: params.lang]"><g:message code="Synote.Terms.and.Conditions" /></g:link>
			    		</label>
			   		</div>
				    <div class="form-actions">
			             <button class="btn btn-large btn-primary" id="registrationForm_submit" type="submit"><g:message code="Register"/></button>

			             <button class="btn btn-large btn-default" id="registrationForm_reset"  type="reset">Reset</button>
			        </div>
				  </fieldset>
				</g:form>
			</div>
		</div>
	</div>
</div>
</body>

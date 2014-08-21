<g:if test="${perm_val == 0}">
	<span class="label label-danger">${perm_name.toLowerCase()}</span>
</g:if>
<g:elseif test="${perm_val == 100}">
	<span class="label label-warning">${perm_name.toLowerCase()}</span>
</g:elseif>
<g:elseif test="${perm_val == 200}">
	<span class="label label-success">${perm_name.toLowerCase()}</span>
</g:elseif>
<g:elseif test="${perm_val == 300}">
	<span class="label label-inverse">${perm_name.toLowerCase()}</span>
</g:elseif>
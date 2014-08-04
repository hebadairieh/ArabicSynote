<g:if test="${total > 0}">
	<g:set var="page_prev" value="${currentPage>1?currentPage-1:currentPage}"/>
	<g:set var="page_next" value="${currentPage<total?currentPage+1:currentPage}"/>
	<g:set var="cPage" value="${currentPage>total?total:(currentPage <=0?1:currentPage)}"/>
	<div class="pagination-centered">
		<ul class="pagination">
			<g:if test="${cPage==1?'disabled':''}">
				<li class='disabled'><g:link url="#" title="previous page">Prev</g:link>
				</li>
			</g:if>
			<g:else>
				<li><g:link controller="${ctrl}" action="${act}" id="${id}"
					params="[page:page_prev,query:query,rows:rows,sidx:sidx,sord:sord]" title="previous page">Prev</g:link>
			</li>
			</g:else>
			<g:if test="${total<=7}">
				<g:set var="pages" value="${(1..total)}"/>
			</g:if>
			<g:else>
				<g:if test="${cPage <=4}">
					<g:set var="pages" value="${(1..7)}"/>
				</g:if>
				<g:elseif test="${cPage>=total-3}">
					<g:set var="pages" value="${(total-6..total)}"/>
				</g:elseif>
				<g:else>
					<g:set var="startPage" value="${cPage-3}" />
					<g:set var="endPage" value="${cPage+3}" />
					<g:set var="pages" value="${(startPage..endPage)}"/>
				</g:else>
			</g:else>
			<g:each var="i" in="${pages}">
				<li class="${cPage==i?'active':''}"><g:link controller="${ctrl}" action="${act}" id="${id}"
					params="[page:i,query:query,rows:rows,sidx:sidx,sord:sord]" title="page ${i}">${i}</g:link>
				</li>
			</g:each>
			<g:if test="${cPage==total}">
				<li class='disabled'><g:link url="#" title="next page">Next</g:link>
				</li>
			</g:if>
			<g:else>
				<li><g:link controller="${ctrl}" action="${act}" id="${id}"
					params="[page:page_next,query:query,rows:rows,sidx:sidx,sord:sord]" title="next page">Next</g:link>
				</li>
			</g:else>
		</ul>
	</div>
</g:if>

<footer>
	<div "itemscope="itemscope" itemtype="WPFooter">
			<span>
				<a href="http://www.soton.ac.uk" target="_blank"
					title="University of Southampton">&copy; <span itemprop="copyrightYear">2013</span> <span itemprop="copyrightHolder">University of Southampton</span></a>
			</span>|
			<span>
				<g:link controller="user" action="contact"
					target="_blank" title="Contact Us">Contact Us</g:link>
			</span>|
			<span>
				<g:link
			action="termsAndConditions" controller="user" title="Legal"
			target="_blank">Legal</g:link>
			</span>|
			<span>
				<g:link
			action="accessibility" controller="user" title="Accessibility"
			target="_blank">Accessibility</g:link>
			</span>|
			<span>
				<a href="http://www.synote.ecs.soton.ac.uk" target="_blank"
			title="About synote">About Synote</a>
			</span>|
			<span>
				<a href="http://blog.lsl.ecs.soton.ac.uk/synote/" target="_blank"
			title="Synote News">Synote News</a>
			</span>|
			<span>
				<img src="${resource(dir: 'images', file: 'licenses-bsd-88x31.png')}" alt="BSD license"/>
			</span>|
			<span>
				Funded by: <a href="http://www.jisc.ac.uk" target="_blank"><img src="${resource(dir: 'images', file: 'jisc-small.jpg')}" alt="JISC"/></a>
			</span>|
			<span>
				<g:meta name="app.version"/>-Build<g:meta name="app.build"/>
			</span>
			<g:if test="${java.util.Locale.getDefault().getLanguage() == 'ar'}">
				<g:if test="${params.lang == 'ar'}">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'en']" class="menuButton">English</g:link>
				</g:if>
				<g:if test="${params.lang == 'en'}">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'ar']" class="menuButton">Arabic</g:link>
				</g:if>
				<g:if test="${params.lang == null }">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'en']" class="menuButton">English</g:link>
				</g:if>
			</g:if>

			<g:if test="${java.util.Locale.getDefault().getLanguage() == 'en'}">
				<g:if test="${params.lang == 'ar'}">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'en']" class="menuButton">English</g:link>
				</g:if>
				<g:if test="${params.lang == 'en'}">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'ar']" class="menuButton">Arabic</g:link>
				</g:if>
				<g:if test="${params.lang == null }">
					<g:link controller="${params.controller}" action="${params.action}" params="[lang:'ar']" class="menuButton">Arabic</g:link>
				</g:if>
			</g:if>

	</div>
</footer>

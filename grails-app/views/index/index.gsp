<html>
<head>
<title><g:message code="org.synote.home.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
%{--  <h1 class="hiding"><g:message code="org.synote.home.title" /></h1>
 --}%
 <!-- Synote introduction and slide show -->
 <div class="row">
  <div class="col-md-6 align-lang">
   <h2><g:message code="What.is.Synote"/></h2>

   %{-- <h2>
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
   </h2> --}%
   <p>
   <g:message code="What.is.Synote.desc1"/>
   </p>
   <p>
   <g:message code="What.is.Synote.desc2"/>
   </p>
   <div>
    <g:link controller="user" action="help" fragment="step" title="5 steps quick start" class="btn btn-info" params="[lang: params.lang]">
      <g:message code="5.steps.quick.start" /></g:link>
    <g:link controller="register" action="index" title="Register" class="btn btn-success" params="[lang: params.lang]">
    <g:message code="get.a.free.account" /></g:link>
   </div>
  </div>
  <div class="col-md-6">
   %{-- <div id="carousel-home" class="carousel slide" data-ride="carousel">
       <!-- Carousel items -->
       <div class="carousel-inner">
        <div class="carousel-inner">
      <div class="item">
       <img src="${resource(dir:'images',file:'test/web_design.jpg')}" alt="Step 1" />
       <div class="carousel-caption">
        <h4>Share your annotations on the Web</h4>
       </div>
      </div>
      <div class="item">
       <img src="${resource(dir:'images',file:'test/varioggetti.jpg')}" alt="Step 2" />
       <div class="carousel-caption">
        <h4>Working on desktop and mobile devices</h4>
       </div>
      </div>
      <div class="item">
       <img src="${resource(dir:'images',file:'test/seo.jpg')}" alt="Step 3" />
       <div class="carousel-caption">
        <h4>Search engine optimisation for media fragments</h4>
       </div>
      </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#slider" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#slider" data-slide="next">&rsaquo;</a>
    </div> --}%
               <div id="carousel-home" class="carousel slide  " data-ride="carousel">
                   <ol class="carousel-indicators">
                       <li data-target="#carousel-home" data-slide-to="0" class="active"></li>
                       <li data-target="#carousel-home" data-slide-to="1"></li>
                      <li data-target="#carousel-home" data-slide-to="2"></li>

                   </ol>

                   <div class="carousel-inner">
                       <div class="item active">

                           <img src="${resource(dir:'images',file:'test/web_design.jpg')}" alt="seo" style="margin:0 auto;display: block;">
                           <div class="carousel-caption slider-caption">
                               <h4><g:message code="Share.your.annotations.on.the.Web" /></h4>
                           </div>
                       </div>
                       <div class="item">
                       <g:if test="${params.lang == 'ar'}">
                         <img src="${resource(dir:'images',file:'test/slider-arabic1.png')}" alt="seo" style="margin:0 auto;display: block;">
                         </g:if>
                         <g:if test="${params.lang == 'en'}">
                       <img src="${resource(dir:'images',file:'test/varioggetti.jpg')}" alt="seo" style="margin:0 auto;display: block;">
                         </g:if>

                           <div class="carousel-caption slider-caption">
                               <h4><g:message code="Working.on.desktop.and.mobile.devices" /></h4>
                           </div>
                       </div>
                       <div class="item">
                            <asset:image src="seo.jpg" alt="seo" style="margin:0 auto;display: block;"/>
                           %{-- <img src="${resource(dir:'images',file:'test/seo.jpg')}" alt="seo" style="margin:0 auto;display: block;"> --}%
                           <div class="carousel-caption slider-caption">
                               <h4><g:message code="Search.engine.optimisation.for.media.fragments" /></h4>
                           </div>
                       </div>
                   </div>
                   <a class=" left
    carousel-control" href="#carousel-home" data-slide="prev">
                       <span class="glyphicon glyphicon-chevron-left"></span>
                   </a>
                   <a class=" right
    carousel-control" href="#carousel-home" data-slide="next">
                       <span class="glyphicon glyphicon-chevron-right"></span>
                   </a>

               </div>
   </div>
   <script type="text/javascript">
   //  //start the carousel
   //  $('.carousel').carousel({
   //   interval: 2000
   //  });
   // </script>
  </div>
 </div>
 <div class="row">
  <div class="container">
   <div class="row">
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"multimedia_48.png")}" title="annotation multimedia online"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Multimedia.Online" /></h3>
     <p><g:message code="Multimedia.Online.desc" /></p>
    </div>
   </div>
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"sync_48.png")}" title="synchronised"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Synchronised" /></h3>
     <p><g:message code="Synchronised.desc" /></p>
    </div>
   </div>
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"media_fragment_48.png")}" title="media fragment"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Media.Fragments" /></h3>
     <p><g:message code="Media.Fragments.desc" /> </p>
    </div>
   </div>
   </div>
   <div class="row">
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"linkeddata_48.png")}" title="linked data"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Linked.Data" /></h3>
     <p><g:message code="Linked.Data.desc" />
     <g:link controller="user" action="help" fragment="linkeddata" params="[lang: params.lang]"><g:message code="Learn.More" />...</g:link></p>
    </div>
    </div>
    <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"speech_recognition_48.png")}" title="speech recognition"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Speech.Recognition"/></h3>
     <p><g:message code="Speech.Recognition.desc"/></p>
    </div>
    </div>
    <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"pda_48.png")}" title="mobile access"/>
    </div>
    <div class="col-md-8">
     <h3><g:message code="Mobile.Access"/></h3>
     <p><g:message code="Mobile.Access.desc"/>
      <a href="http://users.ecs.soton.ac.uk/wj1e11/synotemobile/" target="_blank"><g:message code="Go.to.the.demo"/></a></p>
    </div>
    </div>
   </div>
  </div>
 </div>
</body>
</html>

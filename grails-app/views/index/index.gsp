<html>
<head>
<title><g:message code="org.synote.home.title" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
 <h1 class="hiding"><g:message code="org.synote.home.title" /></h1>
 <!-- Synote introduction and slide show -->
 <div class="row">
  <div class="col-md-6 align-lang">
   <h2><g:message code="What.is.Synote"/></h2>
   <h2>
     <label>${params.lang}</label>
   </h2>
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
    <g:link controller="user" action="help" fragment="step" title="5 steps quick start" class="btn btn-info">
      5 Steps quick start</g:link>
    <g:link controller="register" action="index" title="Register" class="btn btn-success">
      Get a free account</g:link>
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
                   </ol>

                   <div class="carousel-inner">
                       <div class="item active">
                           <img src="${resource(dir:'images',file:'test/web_design.jpg')}" alt="seo">
                           <div class="carousel-caption slider-caption">
                               <h4>ﻣﺤﺮﻙ اﻟﺒﺤﺚ اﻷﻣﺜﻞ ﻟﺸﻈﺎﻳﺎ ﻭﺳﺎﺋﻞ اﻹﻋﻼﻡ</h4>
                           </div>
                       </div>
                       <div class="item">
                           <img src="${resource(dir:'images',file:'test/varioggetti.jpg')}" alt="seo">
                           <div class="carousel-caption slider-caption">
                               <h4>ﻣﺸﺎﺭﻛﺔ اﻟﺸﺮﻭﺡ اﻟﺨﺎﺻﺔ ﺑﻚ ﻋﻠﻰ اﻹﻧﺘﺮﻧﺖ</h4>
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
     <h3>Multimedia Online</h3>
     <p>Annotate most audio and video resources online as long as they are accessible through URLs, including YouTube video.</p>
    </div>
   </div>
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"sync_48.png")}" title="synchronised"/>
    </div>
    <div class="col-md-8">
     <h3>Synchronised</h3>
     <p>Listen to recordings whilst viewing the transcript and slides and making synchronised notes.</p>
    </div>
   </div>
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"media_fragment_48.png")}" title="media fragment"/>
    </div>
    <div class="col-md-8">
     <h3>Media Fragments</h3>
     <p>Annotate only a certain part of audio-visual resources from all over the Web and share them online. </p>
    </div>
   </div>
   </div>
   <div class="row">
   <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"linkeddata_48.png")}" title="linked data"/>
    </div>
    <div class="col-md-8">
     <h3>Linked Data</h3>
     <p>Automatically publish media fragments and annotations using Linked Data and they are searchable by Google.
     <g:link controller="user" action="help" fragment="linkeddata">Learn more...</g:link></p>
    </div>
    </div>
    <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"speech_recognition_48.png")}" title="speech recognition"/>
    </div>
    <div class="col-md-8">
     <h3>Speech Recognition</h3>
     <p>Transcripts can be automatically uploaded via speech recognition if linked to this type of service.</p>
    </div>
    </div>
    <div class="col-md-4">
    <div class="col-md-4 align-lang">
     <img src="${resource(dir:'images',file:"pda_48.png")}" title="mobile access"/>
    </div>
    <div class="col-md-8">
     <h3>Mobile Access</h3>
     <p>Check your annotations and transcript on mobile devices, such as iPhone, iPad and Android tablet.
      <a href="http://users.ecs.soton.ac.uk/wj1e11/synotemobile/" target="_blank">Go to the demo</a></p>
    </div>
    </div>
   </div>
  </div>
 </div>
</body>
</html>

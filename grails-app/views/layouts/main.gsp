<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional with HTML5 microdata//EN" "xhtml1-transitional-with-html5-microdata.dtd">
<html lang="en">
<head>
 <title><g:layoutTitle default="Synote" /></title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 <meta name="author" content="Yunjia Li"/>
%{--  <link rel="stylesheet" type="text/css" href="${resource(dir: 'bootstrap', file: 'css/bootstrap.min.css')}" />
%{--  --}% %{-- <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'main.css')}" /> --}%
 <link rel="shortcut icon" href="${resource(dir: 'images', file: 'synote_icon.ico')}" type="image/x-icon" />
 %{-- <script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery-1.7.1.min.js')}"></script> --}%
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
 <script id="scriptInit" type="text/javascript">
  //In case I forget to remove console.log in IE
  var alertFallback = true;
  if (typeof console === "undefined" || typeof console.log === "undefined") {
       console = {};
       if (alertFallback) {
           console.log = function(msg) {
                //Do nothing
           };
       } else {
           console.log = function() {};
       }
  };
 </script>

 <asset:javascript src="application.js"/>
 <asset:javascript src="bootstrap.js"/>

  <g:if test="${java.util.Locale.getDefault().getLanguage() == 'ar'}">
  	<g:if test="${params.lang == 'ar'}">
  		<asset:stylesheet src="application-ar.css"/>
      <asset:stylesheet src="MyStyle.css"/>
  	</g:if>
  	<g:if test="${params.lang == 'en'}">
  		<asset:stylesheet src="application.css"/>
      <asset:stylesheet src="main.css"/>

  	</g:if>
  	<g:if test="${params.lang == null }">
  		<asset:stylesheet src="application-ar.css"/>
      <asset:stylesheet src="MyStyle.css"/>
  	</g:if>
  </g:if>

  <g:if test="${java.util.Locale.getDefault().getLanguage() == 'en'}">
  	<g:if test="${params.lang == 'ar'}">
  		<asset:stylesheet src="application-ar.css"/>
      <asset:stylesheet src="MyStyle.css"/>
  	</g:if>
  	<g:if test="${params.lang == 'en'}">
  		<asset:stylesheet src="application.css"/>
      <asset:stylesheet src="main.css"/>
  	</g:if>
  	<g:if test="${params.lang == null }">
  		<asset:stylesheet src="application.css"/>
      <asset:stylesheet src="main.css"/>
  	</g:if>
  </g:if>


 <g:layoutHead />
</head>
<body itemscope="itemscope" itemtype="http://schema.org/WebPage" itemref="bottomMainFooter">
<meta itemprop="author" content="Yunjia Li"/>
 <!-- Top Navigation bar -->
 <nav id="navbar_div" class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom:0px !important;" itemscope="itemscope" itemtype="WPHeader">
   <div class="container">
    <!-- top menu -->
    <div class="nav-collapse">
     <syn:isLoggedIn>
     <div class="btn-group pull-right">
      <g:link class="btn btn-success" controller="user" action="showUserProfile" title="Show user profile" params="[lang: params.lang]">
       <i class="fa fa-user"></i>
       <syn:loggedInUsername />
      </g:link>
      <a href="#" class="btn dropdown-toggle btn-success" data-toggle="dropdown">
       <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
          <li><g:link controller="user" action="showUserProfile" title="Show user profile" params="[lang: params.lang]"><g:message code="My.Profile" /></g:link></li>
          <syn:isAdminLoggedIn>
       <li><g:link controller="admin" action="index" title="Administration" params="[lang: params.lang]"><g:message code="Administration" /></g:link></li>
       </syn:isAdminLoggedIn>
             <li class="divider"></li>
             <li><g:link controller="logout" action="index" title="Log out" params="[lang: params.lang]"><g:message code="Log.out" /></g:link></li>
               </ul>
     </div>
     <div class="btn-group pull-right">
      <g:link class="btn" controller="multimediaResource" action="create" title="create a recording" params="[lang: params.lang]">
       <i class="icon-plus-sign"></i>
       <g:message code="Create" />
      </g:link>
      <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
       <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
          <li>
           <g:link controller="multimediaResource" action="create" title="create a recording" params="[lang: params.lang]">
         <g:message code="Create.a.recording" /> </g:link>
          </li>
          <li>
           <g:link controller="user" action="createGroup" title="create a group" params="[lang: params.lang]">
            <g:message code="Create.a.group" params="[lang: params.lang]"/> </g:link>
          </li>
               </ul>
     </div>
     <div class="btn-group pull-right">
      <g:link controller="user" action="index" title="Edit my profile" class="btn" params="[lang: params.lang]">
      <i class="icon-briefcase"></i>
      <g:message code="org.synote.user.index.title" /></g:link>
     </div>
     </syn:isLoggedIn>
     <syn:isNotLoggedIn>
     <div class="btn-group pull-right">
      <g:link controller="login" action="auth" title="Log in" elementId="main_login_a" class="btn btn-primary" params="[lang: params.lang]">
       <g:message code="Login"/></g:link>
      <syn:allowRegistering>
       <g:link controller="register" action="index" title="Register" class="btn btn-success" params="[lang: params.lang]">
         <g:message code="Register"/></g:link>
      </syn:allowRegistering>
     </div>
     </syn:isNotLoggedIn>
     <div class="collapse navbar-collapse" id="collap">
     <ul class="nav navbar-nav">
         <li>
%{--           <a href="${resource(dir: '/',params:"[lang: params.lang]")}" title="home" >
 --}%          <g:link url="/synote/?lang=${params.lang}" title="home" params="[lang: params.lang]">
          <i class="icon-home icon-white"></i><g:message code="Home"/>
          </g:link>
%{--            </a>
 --}%         </li>
      <!-- Recordings -->
         <li><g:link controller="multimediaResource" action="list" title="Multimedia recordings" params="[lang: params.lang]">
          <i class="icon-film icon-white"></i><g:message code="Browse"/></g:link>
         </li>

      <!-- Groups -->
         <li><g:link controller="userGroup" action="list" title="Groups list" params="[lang: params.lang]">
       <i class="icon-user icon-white"/></i><g:message code="Groups"/></g:link>
      </li>
      <li><g:link controller="user" action="help" target="_blank" title="help" params="[lang: params.lang]">
       <i class="icon-info-sign icon-white"/></i><g:message code="Help"/></g:link>
      </li>
     </ul>
     </div>
    </div>
   </div>
 </nav>
%{--      <nav class="navbar navbar-inverse navbar-fixed-top">
         <div class="container-fluid">
             <div class="navbar-header">
                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collap">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                 </button>
             </div>
             <div class="collapse navbar-collapse" id="collap">
                 <ul class="nav navbar-nav">
                     <li><a href="Help-Arabic.html">ﻣﺴﺎﻋﺪﺓ</a>
                     </li>
                     <li><a href="Groups-Arabic.html">اﻟﻤﺠﻤﻮﻋﺎﺕ</a>
                     </li>
                     <li><a href="Browse-Arabic.html">ﺗﺼﻔﺢ</a>
                     </li>
                     <li><a href="Home-Arabic.html">اﻟﺼﻔﺤﺔ اﻟﺮﺋﻴﺴﻴﺔ</a>
                     </li>
                 </ul>

                 <div class="btn-group pull-left
 ">
                     <a href="#" class="btn btn-success">ﺗﺴﺠﻴﻞ ﻓﻲ اﻟﻤﻮﻗﻊ
 </a>
                     <a href="#" class="btn btn-primary">ﺗﺴﺠﻴﻞ اﻟﺪﺧﻮﻝ
 </a>


                 </div>

             </div>
         </div>
     </nav> --}%
 <!-- The search bar -->
 <div id="search_bar_div">
  <div class="container">
   <div class="row">
    <div class="col-md-2 align-lang" style="text-align:center;">
     <img itemprop="primaryImageOfPage" src="${resource(dir: 'images', file: 'synote_logo_small.png')}" alt="Synote"/>
    </div>
    <div class="col-md-10">
     <g:render template="/common/search" />
    </div>
   </div>
  </div>
 </div>
 <div id="main_content" class="container" itemprop="maincontentOfPage" itemscope="itemscope" itemtype="http://schema.org/WebPageElement">
  <g:layoutBody />
 </div>
 <g:render template="/common/footer"/>
</body>
</html>

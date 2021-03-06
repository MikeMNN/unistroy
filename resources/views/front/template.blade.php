<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>{{ trans('front/site.title') }}</title>
		<meta name="description" content="">	
		<meta name="viewport" content="width=device-width, initial-scale=1">

		@yield('head')

		{!! HTML::style('css/main_front.css') !!}

		<!--[if (lt IE 9) & (!IEMobile)]>
			{!! HTML::script('js/vendor/respond.min.js') !!}
		<![endif]-->
		<!--[if lt IE 9]>
			{!! HTML::style('https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js') !!}
			{!! HTML::style('https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js') !!}
		<![endif]-->

		{!! HTML::style('http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800') !!}
		{!! HTML::style('http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic') !!}
        <link href="http://unistroy/public/favicon.ico" rel="shortcut icon" type="image/x-icon" />

	</head>

  <body>

	<!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
    <div id="container-wrapper">
	<header role="banner">
	<div class="logo col-md-16 mod-left">
		<div class="logo-image" itemscope="">
			<a itemprop="url" href="/public" title={{ trans('front/site.title') }}>
				<img class="logo-img" itemprop="logo" src="/public/img/unistroy.png" alt="Юнистрой">
			</a>
		</div>
	</div>
		<!--<div class="brand">{{ trans('front/site.title') }}</div>
		<div class="address-bar">{{ trans('front/site.sub-title') }}</div>--->
		<div id="flags" class="text-center"></div>
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">{{ trans('front/site.title') }}</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li {!! Request::is('/') ? 'class="active"' : '' !!}>
							{!! link_to('/', trans('front/site.home')) !!}
						</li>
						@if(session('statut') == 'visitor' || session('statut') == 'user')
							<li {!! Request::is('contact/create') ? 'class="active"' : '' !!}>
								{!! link_to('contact/create', trans('front/site.contact')) !!}
							</li>
						@endif
						<!--<li {!! Request::segment(1) == ('services') || Request::segment(1) == ('service') ? 'class="active"' : '' !!}>
							{!! link_to('services', trans('front/site.services')) !!}-->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{trans('front/site.services')}}<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>{!! link_to('service/cellings', trans('front/site.cellings')) !!}</li>
                                <li>{!! link_to('service/walls', trans('front/site.wall')) !!}</li>
                                <li>{!! link_to('service/floor', trans('front/site.floor')) !!}</li>
                                <li>{!! link_to('service/opennings', trans('front/site.opennings')) !!}</li>
                                <li>{!! link_to('service/etc', trans('front/site.etc')) !!}</li>
                            </ul>
						</li>
                        <li {!! Request::is('gallery/our') ? 'class="active"' : '' !!}>
                            {!! link_to('gallery/our', trans('front/site.gallery')) !!}
                        </li>
						@if(Request::is('auth/register'))
							<li class="active">
								{!! link_to('auth/register', trans('front/site.register')) !!}
							</li>
						@elseif(Request::is('password/email'))
							<li class="active">
								{!! link_to('password/email', trans('front/site.forget-password')) !!}
							</li>
						@else
							@if(session('statut') == 'visitor')
								<li {!! Request::is('auth/login') ? 'class="active"' : '' !!}>
									{!! link_to('auth/login', trans('front/site.connection')) !!}
								</li>
							@else
								@if(session('statut') == 'admin')
									<li>
										{!! link_to_route('admin', trans('front/site.administration')) !!}
									</li>
								@elseif(session('statut') == 'redac') 
									<li>
										{!! link_to('service', trans('front/site.redaction')) !!}
									</li>
								@endif
								<li>
									{!! link_to('auth/logout', trans('front/site.logout')) !!}
								</li>
							@endif
						@endif
						<li class="imgflag">
							<a href="{!! url('language') !!}"><img width="32" height="32" alt="en" src="{!! asset('img/' . (session('locale') == 'ru' ? 'russian' : 'english') . '-flag.png') !!}"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		@yield('header')	
	</header>

	<main role="main" class="container">
		@if(session()->has('ok'))
			@include('partials/error', ['type' => 'success', 'message' => session('ok')])
		@endif	
		@if(isset($info))
			@include('partials/error', ['type' => 'info', 'message' => $info])
		@endif
		@yield('main')
	</main>

        <p class="off-set"></p>
	<footer role="contentinfo">
		 @yield('footer')
        <div class="text-left1"><p><small>&copy; {{ trans('front/site.footer') }}</small></p></div>
    </footer>

		
	{!! HTML::script('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js') !!}
	<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
	{!! HTML::script('js/plugins.js') !!}
	{!! HTML::script('js/main.js') !!}

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
		function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
		e=o.createElement(i);r=o.getElementsByTagName(i)[0];
		e.src='//www.google-analytics.com/analytics.js';
		r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
		ga('create','UA-XXXXX-X');ga('send','pageview');
	</script>

	@yield('scripts')
    </div>
  </body>
</html>
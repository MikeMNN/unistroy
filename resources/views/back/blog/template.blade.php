@extends('back.template')

@section('head')

	{!! HTML::style('ckeditor/plugins/codesnippet/lib/highlight/styles/default.css') !!}

@stop

@section('main')

 <!-- Entête de page -->
  @include('back.partials.entete', ['title' => trans('back/blog.dashboard'), 'icone' => 'wrench', 'fil' => link_to('service', 'Услуги') . ' / ' . trans('back/blog.creation')])

	<div class="col-sm-12">
		@yield('form')

		{!! Form::control('text', 0, 'title', $errors, trans('back/blog.title')) !!}

		<div class="form-group {!! $errors->has('slug') ? 'has-error' : '' !!}">
			{!! Form::label('slug', trans('back/blog.permalink'), ['class' => 'control-label']) !!}
			{!! url('/') . '/ ' . Form::text('slug', null, ['id' => 'permalien']) !!}
			<small class="text-danger">{!! $errors->first('slug') !!}</small>
		</div>

		{!! Form::submit(trans('front/form.send')) !!}

		{!! Form::close() !!}
	</div>

@stop

@section('scripts')

	{!! HTML::script('ckeditor/ckeditor.js') !!}
	
	<script>

	  var config = {
			codeSnippet_theme: 'Monokai',
			language: '{{ config('app.locale') }}',
			height: 100,
			filebrowserBrowseUrl: '{!! url($url) !!}',
			toolbarGroups: [
				{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
				{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
				{ name: 'links' },
				{ name: 'insert' },
				{ name: 'forms' },
				{ name: 'tools' },
				{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
				{ name: 'others' },
				//'/',
				{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
				{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
				{ name: 'styles' },
				{ name: 'colors' }
			]
		};

    CKEDITOR.replace( 'summary', config);

		config['height'] = 400;		

		CKEDITOR.replace( 'content', config);

    $("#title").keyup(function(){
			var str = sansAccent($(this).val());
			str = str.replace(/[^a-zA-Z0-9\s]/g,"");
			str = str.toLowerCase();
			str = str.replace(/\s/g,'-');
			$("#permalien").val(str);        
		});

  </script>

@stop
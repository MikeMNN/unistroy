@extends('back.blog.template')

@section('form')
	{!! Form::model($post, ['route' => ['service.update', $post->id], 'method' => 'put', 'class' => 'form-horizontal panel']) !!}
@stop

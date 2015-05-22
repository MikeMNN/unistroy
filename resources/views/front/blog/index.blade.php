@extends('front.template')

@section('main')

    <div class="row">

        <div class="col-lg-12">
            {!! Form::open(['url' => 'service/search', 'method' => 'get', 'role' => 'form', 'class' => 'pull-right']) !!}
                {!! Form::control('text', 12, 'search', $errors, null, null, null, trans('front/services.search')) !!}
            {!! Form::close() !!}
        </div>

    </div>

    <div class="row">

        @foreach($posts as $post)
            <div class="box-1-1">
                <div class="col-lg-12 text-left">
                    <h4>{!! link_to('service/' . $post->slug, $post->title) !!}</h4>
                </div>
                <div class="col-lg-12">
                    <p>{!! $post->content !!}</p>
                </div>
            </div>
        @endforeach
     
        <div class="col-lg-12 text-center">
            {!! $links !!}
        </div>
        <p class="off-set"></p>
    </div>

@stop


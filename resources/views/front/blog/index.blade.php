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
        <hr>
        @if($type == 1)
        <h2 class="text-center">{{trans('front/site.cellings')}}</h2>
            @elseif($type == 2)
            <h2 class="text-center">{{trans('front/site.wall')}}</h2>
                      @elseif($type == 3)
                        <h2 class="text-center">{{trans('front/site.floor')}}</h2>
                          @elseif($type == 4)
                            <h2 class="text-center">{{trans('front/site.opennings')}}</h2>
                              @elseif($type == 5)
                                <h2 class="text-center">{{trans('front/site.etc')}}</h2>
        @endif
        <hr>
        <?php $iter = 0;
        ?>
        @foreach($posts as $post)
            <?php $iter++; ?>
            <div class="box-1-1">
                <div class="col-lg-12 text-left">
                    <h4>{!! link_to('service/' . $post->slug, $post->title) !!}</h4>
                </div>
            </div>
        @endforeach
     
        <div class="col-lg-12 text-center">
            {!! $links !!}
        </div>
    </div>
    <p class="off-set"></p>
@stop


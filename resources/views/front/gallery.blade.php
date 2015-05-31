@extends('front.template')

@section('main')
    <div class="row">
        <hr>
        <h2 class="text-center">{{trans('front/gallery.title')}}</h2>
        <hr>
        <p class="off-set"></p>
        <div class="box-1-1">
            <div class="col-lg-12">
        @foreach($pictures as $picture)
                    <?php print "<div class='img_160x160'><a rel='simplebox' href='$picture->filename'><img alt='' title='$picture->title' src='$picture->filename' style='float:left; height:160px; width:160px' /></a></div>" ?>
        @endforeach
            </div>
        </div>
        <p class="off-set"></p>
        <div class="col-lg-12 text-center op-offset">
            {!! $links !!}
        </div>
        <p class="off-set"></p>
    </div>
@stop

@section('scripts')
    <script type="text/javascript" src="/public/simplebox/simplebox_util.js"></script>
    <script type="text/javascript">
        (function(){
            var boxes=[],els,i,l;
            if(document.querySelectorAll){
                els=document.querySelectorAll('a[rel=simplebox]');
                Box.getStyles('simplebox_css','/public/simplebox/simplebox.css');
                Box.getScripts('simplebox_js','/public/simplebox/simplebox.js',function(){
                    simplebox.init();
                    for(i=0,l=els.length;i<l;++i)
                        simplebox.start(els[i]);
                    simplebox.start('a[rel=simplebox_group]');
                });
            }
        })();</script>

@stop
@extends('front.template')

@section('head')

  {!! HTML::style('ckeditor/plugins/codesnippet/lib/highlight/styles/monokai.css') !!}

@stop

@section('main')
	<div class="row">
		<div class="box">
			<div class="col-lg-12">
				<hr>
				<h2 class="text-center">{{ $post->title }}</h2>
				<hr>
				{!! $post->summary !!}<br>
				{!! $post->content !!}
				@if($post->count())
                    <?php $iter =0;?>
					<div class="text-center">
						@if($post->count() > 0)
							<h3>{{ trans('front/services.materials') }} :</h3>
                            <select onchange="document.getElementById('Mat').value = this.options[this.selectedIndex].value;num();" name="id" id="type_site">
							@foreach($post->materials as $materials)
                                    <?if($iter == 0)
                                        $iter = $materials->cost;?>
                                    <?php print "<option value='$materials->cost'>$materials->name ($materials->content)</option>" ?>
							@endforeach
                            </select>

						@endif
					</div>
				@endif
			</div>
		</div>
	</div>

	<div class="row">
		<div class="box">
			<div class="col-lg-12">
                <div class="col-lg-13">
                    <p></p>
                </div>
				<div class="col-lg-14">
                    <div class="cost-rectangle" id="cost-rectangle1">
                    <p class="text-right" id="PostCost">{{ trans('front/services.ServiceCost') }} <input class="no-border" id="Post" size="4" value={{$post->cost}} disabled></p>
                    <p class="text-right" id="MatCost">{{ trans('front/services.MaterialCost') }} <input class="no-border" id="Mat" size="4" value={{$iter}} disabled></p>
                    <p class="text-right">{{ trans('front/services.metres') }} <input onchange="num();" type="number" class="no-border" id="Count" value="0" size="4"></p>
                        @if(session('statut') != 'visitor')
                            <p class="text-right">{{ trans('front/services.discount') }} 5%</p>
                            <div id="dom-target" style="display: none;">
                                <?php $output = "0.95";echo htmlspecialchars($output);?>
                            </div>
                        @else
                            <p class="text-right-warn">{{ trans('front/services.discount') }} 0%</p>
                            <p class="little">{{ trans('front/services.warn') }}</p>
                            <div id="dom-target" style="display: none;">
                                <?php $output = "1";echo htmlspecialchars($output);?>
                            </div>
                        @endif
						@if(session()->has('warning'))
							@include('partials/error', ['type' => 'warning', 'message' => session('warning')])
						@endif
                        <hr class="line-cost">
                        <form name="myForm" class="input-number">
                            <p class="text-right">{{ trans('front/services.TotalPrice') }} <input class="no-border"  id="rezult" size="4" value="0" disabled></p>
                        </form>

                    </div>
				</div>
			</div>
		</div>
	</div>
    <script>
        var str = $("p:first").text();
        $("p:last").text(str);
    </script>
</div>

@stop

@section('scripts')

	{!! HTML::script('ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js') !!}
    <!--onfocus="this.select (); fW ()" onblur="fS ()"-->
	@if(session('statut') != 'visitor')
		{!! HTML::script('ckeditor/ckeditor.js') !!}
	@endif

    <script>
        function num () {
            var a = document.getElementById("Post").value*1;
            var b = document.getElementById("Mat").value*1;
            var c = document.getElementById("Count").value*1;
            if(!isInt(c))
                if(!isFloat(c))
                    c = 0;
            var d = document.getElementById("dom-target").textContent;
            var e = parseFloat(d, 10);
            document.getElementById ('rezult').value = (b + a) * c * e;
        }

        function isInt(n){
            return Number(n)===n && n%1===0;
        }

        function isFloat(n){
            return   n===Number(n)  && n%1!==0
        }
    </script>

    <script>
        function fW () {//для целых чисел (в т.ч. < 0)
            for (var t = document.getElementById('cost-rectangle1').getElementsByTagName ('input'), k = j = s = 0; j < t.length; j++)
            {if (t [j].value.length && !t [j].value.replace (/^\-?\d+/g, '').length)
                {s += t [j].value * 1; k++;}}
            var sum = (document.getElementById('Post').value*1 + document.getElementById('Mat').value*1);
            document.getElementById ('rezult').value = sum; TIM = setTimeout (fW, 10)}
        function fS () {clearTimeout (TIM)}
    </script>

    <script>

		@if(session('statut') != 'visitor')

			CKEDITOR.replace('comments', {
				language: '{{ config('app.locale') }}',
				height: 200,
				toolbarGroups: [
					{ name: 'basicstyles', groups: [ 'basicstyles'] }, 
					{ name: 'links' },
					{ name: 'insert' }
				],
				removeButtons: 'Table,SpecialChar,HorizontalRule,Anchor'
			});

			function buttons(i) {
				return "<input id='val" + i +"' class='btn btn-default' type='submit' value='{{ trans('front/blog.valid') }}'><input id='btn" + i + "' class='btn btn-default btnannuler' type='button' value='{{ trans('front/blog.undo') }}'></div>";
			}

			$(function() {

				$('a.editcomment span').tooltip();
				$('a.deletecomment span').tooltip();

				// Set comment edition
				$('a.editcomment').click(function(e) {   
					e.preventDefault();
					$(this).hide();
					var i = $(this).attr('id').substring(7);
					var existing = $('#contenu' + i).html();
					var url = $('#formcreate').find('form').attr('action');
					jQuery.data(document.body, 'comment' + i, existing);
					var html = "<div class='row'><form id='form" + i + "' method='POST' action='" + url + '/' + i + "' accept-charset='UTF-8' class='formajax'><input name='_token' type='hidden' value='" + $('input[name="_token"]').val() + "'><div class='form-group col-lg-12 '><label for='comments' class='control-label'>{{ trans('front/blog.change') }}</label><textarea id='cont" + i +"' class='form-control' name='comments" + i + "' cols='50' rows='10' id='comments" + i + "'>" + existing + "</textarea><small class='help-block'></small></div><div class='form-group col-lg-12'>" + buttons(i) + "</div>";
					$('#contenu' + i).html(html);
					CKEDITOR.replace('comments' + i, {
						language: '{{ config('app.locale') }}',
						height: 200,
						toolbarGroups: [
							{ name: 'basicstyles', groups: [ 'basicstyles'] }, 
							{ name: 'links' },
							{ name: 'insert' }
						],
						removeButtons: 'Table,SpecialChar,HorizontalRule,Anchor'
					});
				});


				// Validation 
				$(document).on('submit', '.formajax', function(e) {  
					e.preventDefault();
					var i = $(this).attr('id').substring(4);
					$('#val' + i).parent().html('<i class="fa fa-refresh fa-spin fa-2x"></i>').addClass('text-center');
					$.ajax({
						method: 'put',
						url: $(this).attr('action'),
						data: $(this).serialize()
					})
					.done(function(data) {
						$('#comment' + data.id).show();
						$('#contenu' + data.id).html(data.content);	
					})
					.fail(function(data) {
						var errors = data.responseJSON;
						$.each(errors, function(index, value) {
							$('textarea[name="' + index + '"]' + ' ~ small').text(value);
							$('textarea[name="' + index + '"]').parent().addClass('has-error');
							$('.fa-spin').parent().html(buttons(index.slice(-1))).removeClass('text-center');
						});
					});
				});

			});

		@endif

		hljs.initHighlightingOnLoad();

	</script>

@stop

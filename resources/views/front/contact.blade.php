@extends('front.template')

@section('main')
	<div class="row">
		<div class="box">
            <div class="module-ct">
                <div class="custommap">
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2289.5282319222442!2d82.897553!3d54.981372!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x42dfe6e6bdb00f5b%3A0xc38bbb948d8ccca1!2z0L_Quy4g0JrQsNGA0LvQsCDQnNCw0YDQutGB0LAsIDEsINCd0L7QstC-0YHQuNCx0LjRgNGB0LosINCd0L7QstC-0YHQuNCx0LjRgNGB0LrQsNGPINC-0LHQuy4sIDYzMDA2NA!5e0!3m2!1sru!2sru!4v1431601427907" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="100%" height="350">
                        </iframe>
                    </p>
                </div>
            </div>
            <div class="col-lg-13">
                <h2 class="intro-text-1 text-center">{{ trans('front/contact.contact') }}</h2>
                <br>
                <div class="contact-info">
                    <span class="glyphicon glyphicon-map-marker"></span>
                </div>
            </div>
			<div class="col-lg-14">
				<h2 class="intro-text-1 text-center">{{ trans('front/contact.title') }}</h2>
                <div class = "form-offset-1">
				<legend>{{ trans('front/contact.text') }}</legend>
				
				{!! Form::open(['url' => 'contact', 'method' => 'post', 'role' => 'form']) !!}	
				
					<div class="row">

						{!! Form::control('text', 6, 'name', $errors, trans('front/contact.name')) !!}
						{!! Form::control('email', 6, 'email', $errors, trans('front/contact.email')) !!}
						{!! Form::control('textarea', 15, 'message', $errors, trans('front/contact.message')) !!}
						{!! Form::text('address', '', ['class' => 'hpet']) !!}		

					  	{!! Form::submit(trans('front/form.send'), ['col-lg-15']) !!}

					</div>
					
				{!! Form::close() !!}
                </div>
			</div>
		</div>
	</div>
@stop
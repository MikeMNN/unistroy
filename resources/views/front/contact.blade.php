@extends('front.template')

@section('main')
	<div class="row">
		<div class="box">
            <div class="module-ct">
                <div class="custommap">
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2289.843358077814!2d82.9263921!3d54.9758461!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x42dfe7aac4d5d7db%3A0xc5633989f5581182!2z0J_RgNC40LPQvtGA0L7QtNC90LDRjyDRg9C7LiwgMTUsINCd0L7QstC-0YHQuNCx0LjRgNGB0LosINCd0L7QstC-0YHQuNCx0LjRgNGB0LrQsNGPINC-0LHQuy4sINCg0L7RgdGB0LjRjywgNjMwMDI0!5e0!3m2!1sru!2s!4v1433122812961" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="100%" height="350">
                        </iframe>
                    </p>
                </div>
            </div>
            <div class="col-lg-13">
                <h2 class="intro-text-1 text-center">{{ trans('front/contact.contact') }}</h2>
                <p class="off-set">
                    <p><span class="glyphicon glyphicon-map-marker"> {{ trans('front/contact.adress') }}</span></p>
                    <p><span class="glyphicon glyphicon-earphone"> {{ trans('front/contact.phone') }}:8(913)7733364</span> </p>
                    <p><span class="glyphicon glyphicon-envelope"> {{ trans('front/contact.mail') }}:Yunus_07@mail.ru</span> </p>
                </p>
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
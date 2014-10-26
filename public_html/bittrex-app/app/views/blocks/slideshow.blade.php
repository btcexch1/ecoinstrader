<div id="slideshow">
	<div class="container">
		<div class="carousel" data-role="carousel">
		    <div class="slide">
		    	<div class="info-left">
		    		<img src="{{asset('assets/img/exchange.png')}}"/>
		    		<p class="btn-signup"><a href="<?=url('/user/register', $parameters = array(), $secure = null);?>">{{Lang::get('frontend_texts.open_account')}}</a></p>
		    	</div>
				<div class="info-right">
					<img src="{{asset('assets/img/EcoinsTrader.png')}}"/>
				</div>
		    </div>
		    <div class="slide">
		        <div class="info-left">
		    		...Hi....
		    	</div>
				<div class="info-right">
					<img class="img-logo" src="{{asset('assets/img/bitcoin-logo.png')}}"/><span class="bold">Ecoins</span><span class="bold">Trader</span>
				</div>
		    </div>
		</div>
	</div>
</div>
@section('script.footer')
@parent
<script type="text/javascript">
	$('.carousel').carousel({
		auto: false,
	    period: 3000,
	    duration: 2000,
	    height: 400,
	    markers: {
	        type: "cycle",
	        position: "bottom-center"

	    }
	});
</script>
@stop
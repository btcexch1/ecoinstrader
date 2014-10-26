<div id="news_twitter_feed">
	<div class="container">
		<div id="twitter-feed">
		  	<a class="twitter-timeline" width="380" height="300" href="https://twitter.com/Bitcoinex_"  data-widget-id="455547349930999809">Tweets by @Bitcoinex_</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		</div>
		@if(!empty($news))
		<div id="news">
		  <h3>{{{ trans('texts.lastest_news')}}}</h3>
		  <p><a href="<?=url('/page/all-news')?>">+ Show all news<i class="icon-arrow-right-5"></i></a></p>
		    <table class="table noborder">
		    	@foreach($news as $new)
		    	<tr>
					<td>{{date('Y-m-d',strtotime($new->created_at))}}</td>
					<td>{{ HTML::link('/post/'.$new->permalink, $new->title) }}</td>
				</tr>
				@endforeach				
		    </table>
		</div>  
		@endif
	</div>
</div>
@section('script.footer')
@parent
<script>
jQuery( document ).ready(function($) {
    $("#news_twitter_feed").find('.timeline-header.customisable-border').css('background-color','#00a651');
    $("#news_twitter_feed").find('.timeline-header .summary a').css('color','#fff');
});
</script>
@stop
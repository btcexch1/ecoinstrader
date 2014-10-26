<h3>{{{ trans('texts.recent_market_history')}}}</h3>  
<p class="show-all"><a href="<?=url('page/all-trades')?>">+ {{{ trans('texts.show_all_recent_market_history')}}}<i class="icon-arrow-right-5"></i></a></p>
<div id="trade_histories_{{{Session::get('market_id')}}}" class="scrolltable">
  <table class="table striped hovered">
    <thead>
      <tr><th>{{{ trans('texts.date')}}}</th><th>{{{ trans('texts.type')}}}</th><th>{{{ trans('texts.price')}}} 1 {{{$coinmain}}}</th><th>{{trans('texts.total')}} {{{ $coinmain }}}</th><th>{{trans('texts.total')}} {{{$coinsecond}}}</th></tr> 
    </thead>
    <tbody>
      <tr style="display:none" class="header-tb"><td colspan="5"></td></tr>
      @foreach($trade_history as $history)     
        <tr id="trade-{{$history->id}}" class="order">
          <td><span>{{$history->created_at}}</span></td><!-- title="26 sec. ago" -->
          @if($history->type == 'sell')          
            <td><b style="color:red">{{ ucwords($history->type) }}</b></td>            
          @else          
            <td><b style="color:green">{{ ucwords($history->type) }}</b></td>            
          @endif          
          <td>{{{sprintf('%.8f',$history->price)}}}</td><td>{{{sprintf('%.8f',$history->amount) }}}</td>
          <td>{{{ sprintf('%.8f',$history->price*$history->amount) }}}</td>
        </tr> 
      @endforeach  
    </tbody>
  </table>
</div>
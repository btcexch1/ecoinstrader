<div class="content-inbox">  
  <h3>{{{ trans('texts.top_buy_orders')}}}</h3>
  <div id="orders-b-list">   
    <div id="orders_buy_{{{Session::get('market_id')}}}" class="scrolltable">
      <table class="table striped hovered">
        <thead>
          <tr class="header-tb"><th>{{{ trans('texts.price')}}}</th><th>{{{ $coinmain }}}</th><th>{{{ $coinsecond }}}</th></tr> 
        </thead>
        <tbody>           
          <?php $total_amount=0; $total_value=0; ?>               
          @foreach($buy_orders as $buy_order)
           <?php  
            $total_amount+= $buy_order->total_from_value; 
            $total_value+= $buy_order->total_to_value;
            $price = sprintf('%.8f',$buy_order->price);
            $class_price = str_replace(".", "-", $price);
            $class_price = str_replace(",", "-", $class_price);
           ?>
            <tr id="order-{{$buy_order->id}}" class="order price-{{$class_price}}" onclick="use_price(2,<?php echo $buy_order->price ?>,<?php echo $buy_order->total_from_value ?>)" data-sort="{{sprintf('%.8f',$buy_order->price)}}"><td class="price">{{sprintf('%.8f',$buy_order->price)}}</td><td class="amount">{{{sprintf('%.8f',$buy_order->total_from_value)}}}</td><td class="total">{{{sprintf('%.8f',$buy_order->total_to_value)}}}</td></tr>
          @endforeach 
        </tbody>
      </table>
      </div>
  </div> 
</div>
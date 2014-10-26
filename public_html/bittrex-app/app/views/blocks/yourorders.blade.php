<h3>{{{ trans('texts.your_orders')}}}</h3>  
<div id="yourorders_{{{Session::get('market_id')}}}">
  <table class="table striped hovered">
    <thead>
      <tr><th>{{{ trans('texts.type')}}}</th><th>{{{ trans('texts.price')}}} 1 {{{$coinmain}}}</th><th>{{{ trans('texts.amount')}}} {{{ $coinmain }}}</th><th>{{{ trans('texts.total')}}} {{{$coinsecond}}}</th><th>{{{ trans('texts.date')}}}</th><th>{{{ trans('texts.action')}}}</th></tr>
    </thead>
    <tbody>        
      @if(isset($current_orders_user))
        <tr style="display:none" class="header-tb"><td colspan="5"></td></tr>
        @foreach($current_orders_user as $order) 
           <?php
            $price = sprintf('%.8f',$order->price);
            $class_price = str_replace(".", "-", $price);
            $class_price = str_replace(",", "-", $class_price);
          ?>
          <tr class="order order-{{$class_price}}" id="yourorder-{{$order->id}}">
          @if($order->type == 'sell')          
            <td><b style="color:red">{{ ucwords($order->type) }}</b></td>            
          @else          
            <td><b style="color:green">{{ ucwords($order->type) }}</b></td>            
          @endif         
            <td><span class="price">{{{sprintf('%.8f',$order->price)}}}</span></td><td><span class="amount">{{{sprintf('%.8f',$order->from_value)}}}</span><span style="color:#868686"></span></td>
            <td><span class="total">{{{sprintf('%.8f',$order->to_value)}}}</span><span style="color:#868686"></span></td>
            <td><span>{{{$order->created_at}}}</span></td><!-- title="26 sec. ago" -->
            <td><a href="javascript:cancelOrder({{{$order->id}}});">{{trans('texts.cancel')}}</a></td>
          </tr>
        @endforeach 
      @endif
    </tbody>
  </table>
  </div>
@section('script.footer')
@parent
<script>
function cancelOrder(order_id){
        $.post('<?php echo action('OrderController@doCancel')?>', {isAjax: 1, order_id: order_id }, function(response){
              var obj = $.parseJSON(response); 
              if(obj.status == 'success'){
                socket.emit( 'doTrade', obj.message_socket);
                //app.BrainSocket.message('doTrade',obj.message_socket);               
                $.Dialog({ shadow: true, overlay: true, draggable: true, icon: '', title: 'Message', width: 500, padding: 10, content: 'This Window is draggable by caption.',
                    sysButtons: {                 
                        btnClose: true
                    },
                    sysBtnCloseClick: function(e){
                        location.reload();
                    },              
                    onShow: function(){
                        //$.Dialog.title();
                        $.Dialog.content('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');
                        $('body').click(function(event) {
                          location.reload();
						  $('.window-overlay .window').css('top','216px');  
                        });
                    }

                  });
              }else{
                //$('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
                $.Dialog({ shadow: true, overlay: true, draggable: true, icon: '', title: 'Message', width: 500, content: 'This Window is draggable by caption.',  onShow: function(){ $.Dialog.content('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>'); }
                });
              }              
              //$('#messageModal').modal({show:true});  
              //console.log('Obj: ',obj);
            });
      }
</script>
@stop
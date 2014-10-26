<div class="content-inbox">  
  <h3>{{{ trans('texts.buy')}}} {{{ $coinmain }}}</h3>
  <center>{{{ trans('texts.your_balance')}}}: <a href="javascript:void(0)" onclick="a_calc(17)"><b><span id="cur_to" class="money_rur">{{{ $balance_coinsecond }}}</span> {{{ $coinsecond }}}</b></a></center>
  <hr>
  <form>
    <table class="table noborder">
      <tr>
        <td><label>{{{ trans('texts.amount')}}} {{{ $coinmain }}}</label></td>
        <td>
          <div class="input-control text">
              <input id="b_amount" name="b_amount" type="text" value="0" maxlength="15">
              <button class="btn-clear"></button>
          </div>
        </td> 
      </tr> 
      <tr>
        <td><label>{{{ trans('texts.price_per')}}} {{{ $coinmain }}}</label></td>
        <td>
          <div class="input-control text" data-role="input-control">
              <input id="b_price" name="b_price" type="text"  maxlength="15" value="{{$sell_lowest}}">
              <button class="btn-clear">{{{ $coinsecond }}}</button>                    
          </div>
        </td> 
      </tr> 
      <tr>
        <td><label>{{{ trans('texts.total')}}}</label></td>
        <td>
          <b id="b_all"></b> <b>{{{ $coinsecond }}}</b>
        </td> 
      </tr> 
      <tr>
        <td><label>{{{ trans('texts.trading_fee')}}}</label></td>
        <td>
          <b id="b_fee"></b> <b>{{{ $coinsecond }}} (<span id="fee_buy">{{$fee_buy}}</span>%)</b>
        </td> 
      </tr> 
      <tr>
        <td><label>{{{ trans('texts.net_total')}}}</label></td>
        <td>
          <b id="b_net_total">0</b> <b>{{{ $coinsecond }}}</b>
        </td> 
      </tr>         
    </table>
    <hr>
    <span id="b_message"></span>
    <input type="hidden" name="buy_market_id" id="buy_market_id" value="{{{Session::get('market_id')}}}">
    <center><button type="button" class="button primary" id="do_buy"><i class="icon-arrow-right-5"></i>{{ trans('texts.buy')}} {{{ $coinmain }}}</button></center>
  </form>
</div>
@section('script.footer')
@parent
<script type="text/javascript">
function updateDataBuy(){
    var amount = $('#b_amount').val();    
    var price = $('#b_price').val();
    var fee = $('#fee_buy').html();
    var total = amount*price;
    var fee_amount = total*(fee/100);
    $('#b_all').html(total.toFixed(8));
    $('#b_fee').html(fee_amount.toFixed(8));
    $('#b_net_total').html((total+fee_amount).toFixed(8));
  }
$(function(){  
  updateDataBuy();
  $('#b_amount, #b_price').keyup(function(event) {
    updateDataBuy();
  });
  $('#do_buy').click(function(e) {
      $(this).hide();
     e.preventDefault(); 
      var market_id = $('#buy_market_id').val();
      var price = parseFloat($('#b_price').val()).toFixed(8);
      var amount = parseFloat($('#b_amount').val()).toFixed(8); 
      var balance = parseFloat($('#cur_to').html());
      var fee = $('#fee_buy').html();
      var total = amount*price;
      var fee_amount = total*(fee/100); 
      var net_total = total+fee_amount;
     
      if(!$('body').hasClass('logged')) {
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.login_to_buy')}}</p>');
        $(this).show();        
      }else if(isNaN(price) || price < 0.00000001){
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.message_min_price',array('price'=> '0.00000001'))}}</p>');
        $(this).show();
      }
      else if(isNaN(amount) || amount < {{$limit_trade['min_amount']}} || amount > {{$limit_trade['max_amount']}}){
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.message_limit_trade',array('min_amount'=> $limit_trade['min_amount'],'max_amount'=> $limit_trade['max_amount']))}}</p>');
        $(this).show();
      }      
      else if(balance < net_total){
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.buy_not_enough')}}</p>');
        $(this).show();
      }
	  else if((net_total +{{$amount_sum_day}}) > {{$limit_day}}){
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.limit_sum_day')}} {{$limit_day}} {{ $coinsecond }}</p>');
        $(this).show();
      }
      /*else if((amount*price)>10){
        $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;">{{trans('messages.message_max_total',array('total'=> '10'))}}</p>');
      }*/else{ $('#b_message').html('<p style="color:red; font-weight:bold;text-align:center;"></p>');
        $.post('<?php echo action('OrderController@doBuy')?>', {isAjax: 1, price: price, amount: amount, market_id:market_id }, function(response){          
          var obj = $.parseJSON(response);   
          console.log('Obj: ',obj);       
          //app.BrainSocket.message('doTrade',obj.message_socket);
          socket.emit( 'doTrade', obj.message_socket);
          if(obj.status == 'success'){
            $.Dialog({ shadow: true, overlay: true, draggable: true, icon: '',  title: 'Message', width: 500, padding: 10, content: 'This Window is draggable by caption.', sysButtons: {  btnClose: true  },
                  sysBtnCloseClick: function(e){
                      //location.reload();                      
                  },              
                  onShow: function(){
                      //$.Dialog.title();
                      $.Dialog.content('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');
                      /*$('body').click(function(event) {
                        location.reload();
                      });*/
                    $('#do_buy').show();
                  }
                });
          }else{            
            $.Dialog({  shadow: true, overlay: true, draggable: true, icon: '', title: 'Message', width: 500, padding: 10, content: 'This Window is draggable by caption.',  onShow: function(){  $.Dialog.content('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>'); } });
              $('#do_buy').show();
          }
          
        });
      }
    });
});

</script>
@stop
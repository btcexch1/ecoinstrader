<!-- Security -->
@section('title')
{{{ trans('texts.coin_withdrawals')}}}
@stop
<div id="coin_deposits">
    <h2>{{{ trans('texts.coin_withdrawals')}}} @if(isset($current_coin)) {{' - '.$current_coin}} @endif</h2> 
    @if ( Session::get('error') )
        <div class="alert alert-error alert-danger">
        	<button type="button" class="close" data-dismiss="alert">×</button>
            @if ( is_array(Session::get('error')) )
                {{ head(Session::get('error')) }}
            @else
                {{ Session::get('error') }}
            @endif
        </div>
    @endif

    @if ( Session::get('notice') )
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert">×</button>
            {{ Session::get('notice') }}
        </div>
    @endif     
	Below is a list of withdrawals that you have made.
	<br><br>
	<span class="text-high">To make a new withdrawal, please visit the {{ HTML::link('user/profile/balances', trans('user_texts.balance')) }} page and select the Withdraw option under the actions menu for the coin.</span>
	<br><br>
	<form class="form-inline" method="POST" action="{{Request::url()}}">
        @if($filter=='')
        <div class="input-control text size1" data-role="input-control">
          <label>{{{ trans('texts.coin')}}}</label>  
        </div>
        <div class="input-control select size2" data-role="input-control">
            <select id="pair" style="margin-right: 20px;" name="wallet">
                <option value="" selected="selected">{{trans('texts.all')}}</option>
                @foreach($wallets as $key=> $wallet)
                    <option value="{{$wallet['id']}}">{{$wallet->type}}</option>
                @endforeach
            </select>
        </div>
        @endif
        <div class="input-control text size1" data-role="input-control">
          <label>{{{ trans('texts.type')}}}</label>
        </div>
        <div class="input-control select size2" data-role="input-control">
           <select id="type" name="status" style="margin-right: 20px;">
              <option value="" selected="selected">{{trans('texts.all')}}</option>
              <option value="0">{{trans('texts.pending')}}</option>
              <option value="1">{{trans('texts.complete')}}</option>
          </select> 
        </div>
        <div class="input-control text size1" data-role="input-control">
          <button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
        </div>
    </form>    
    <br>
	<table class="table striped hovered">
        <thead>
	        <tr>
	            <th>{{{ trans('texts.date')}}}</th>
	            <th>{{{ trans('texts.coin')}}}</th>
	            <th>{{{ trans('texts.amount')}}}</th>
	            <th>{{{ trans('texts.fee')}}}</th>
	            <th>{{{ trans('texts.receiving_address')}}}</th>
	            <!-- <th>{{{ trans('texts.confirmations')}}}</th> -->
	            <th>{{{ trans('texts.status')}}}</th>
                <th>{{{ trans('texts.action')}}}</th>	            
	        </tr>
        </thead>
        <tbody>
	        @foreach($withdrawals as $withdrawal)
	        	<tr>
	        		<td>{{$withdrawal->created_at}}</td>
	        		<td>{{$withdrawal->type}}</td>
	        		<td>{{sprintf('%.8f',$withdrawal->amount)}}</td>
	        		<td>{{sprintf('%.8f',$withdrawal->fee_amount)}}</td>
	        		<td>{{$withdrawal->to_address}}</td>
	        		<!-- <td>{{$withdrawal->confirmations}}</td> -->
	        		@if($withdrawal->status)          
                        <td><b style="color:green">{{ ucwords(trans('texts.complete')) }}</b></td>  
	                @else  
	                	<td><b style="color:red">{{ ucwords(trans('texts.pending')) }}</b></td> 
	                @endif	 
                    <td>@if(!$withdrawal->status)<a href="javascript:cancelWithdraw({{{$withdrawal->id}}});">{{trans('texts.cancel')}}</a>@endif</td>       		
	        	</tr>
	        @endforeach
	    </tbody>
	</table>
    <!-- <div id="messageModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">      
              <div class="modal-body">
              </div>
              <div class="modal-footer"> 
                <button type="button" class="btn btn-default" data-dismiss="modal">{{{ trans('user_texts.close')}}}</button>
              </div>
            </div>
          </div>
    </div>     -->
</div>
@section('script.footer')
@parent
<script type="text/javascript">
  function cancelWithdraw(withdraw_id){
        $.post('<?php echo action('UserController@cancelWithdraw')?>', {isAjax: 1, withdraw_id: withdraw_id }, function(response){
              var obj = $.parseJSON(response); 
              if(obj.status == 'success'){               
               /* $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
                $('#messageModal').on('hidden.bs.modal', function (e) {              
                  location.reload();
                });*/
                $.Dialog({ shadow: true, overlay: true, draggable: true, icon: '',  title: 'Message', width: 500, padding: 10, content: 'This Window is draggable by caption.', sysButtons: {  btnClose: true  },
                  sysBtnCloseClick: function(e){
                      location.reload();
                  },              
                  onShow: function(){
                      //$.Dialog.title();
                      $.Dialog.content('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');
                      $('body').click(function(event) {
                        location.reload();
                      });
                  }
                });
              }else{
                //$('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
                $.Dialog({  shadow: true, overlay: true, draggable: true, icon: '', title: 'Message', width: 500, padding: 10, content: 'This Window is draggable by caption.',  onShow: function(){  $.Dialog.content('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>'); } });
              }              
              //$('#messageModal').modal({show:true});  
              console.log('Obj: ',obj);
            });
      }
  </script>
@stop
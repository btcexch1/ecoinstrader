@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.markets')}}</h2>
@if ( is_array(Session::get('error')) )
        <div class="alert alert-error">{{ head(Session::get('error')) }}</div>
	@elseif ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
<a href="javascript:void()" id="add_market_link">{{trans('admin_texts.add_market')}}</a>

<form class="form-horizontal" role="form" id="add_new_market" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@addNewMarket') ?: URL::to('/admin/add-market') }}}">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.from')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
	    		<select class="form-control" required="" name="wallet_from" id="wallet_from">
	    			<option value="">---Select wallet ---</option>
	    			@foreach($wallets as $wallet)
	    				<option value="{{$wallet->id}}">{{$wallet->type}}</option>
	    			@endforeach
	    		</select>			  
			</div>	      	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.to')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <select class="form-control" required="" name="wallet_to" id="wallet_to">
	    			<option value="">---Select wallet ---</option>
	    			@foreach($wallets as $wallet)
	    				@if( $wallet->type=='BTC' || $wallet->type=='LTC' )
	    				<option value="{{$wallet->id}}">{{$wallet->type}}</option>
	    				@endif
	    			@endforeach
	    		</select>	
			</div>	      
	    </div>
	</div>	
	<div class="form-group">		
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="do_add">Add</button>
	    </div>
	</div>
</form>
<table class="table table-striped" id="list-fees">
	<tr>
		<th>{{trans('admin_texts.id')}}</th> 	
	 	<th>{{trans('admin_texts.from')}}</th>
	 	<th>{{trans('admin_texts.to')}}</th>
	 	<th>{{trans('admin_texts.status')}}</th>
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 	
	@foreach($markets as $market)
		@if(isset($wallets[$market->wallet_from]) && isset($wallets[$market->wallet_to]))
		<tr><td>{{$market->id}}</td><td>{{$wallets[$market->wallet_from]->type}}</td><td>{{$wallets[$market->wallet_to]->type}}</td>
			@if($market->active)
				<td  class="status">{{Lang::get('admin_texts.enabled')}}</td>
			@else
				<td class="status"><b style="color:red">{{Lang::get('admin_texts.disabled')}}</b></td>
			@endif
			<td>
				<a href="javascript:void()" onclick="deleteMarket({{$market->id}})" class="delete_market">{{trans('admin_texts.delete')}}</a> | 
				<?php
				 if($market->active){ ?>
				 	<a href="javascript:void()" onclick="disableMarket({{$market->id}},0)" class="delete_market">{{trans('admin_texts.disable')}}</a>
				 	<?php			 	
				 }
				 else{
				 	?>
				 	<a href="javascript:void()" onclick="disableMarket({{$market->id}},1)" class="delete_market">{{trans('admin_texts.enable')}}</a>
				 	<?php
				 }
				?>
				
			</td>
		</tr>
		@endif
	@endforeach
	
</table>
<div id="pager"></div>
<div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">		
	<div class="modal-body">		
	</div>
	<div class="modal-footer">
		<button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
	</div>
</div>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
function deleteMarket(market_id){
	var r = confirm("<?php echo Lang::get('admin_texts.warning_delete_market') ?>");
	if (r == true) {
		$.post('<?php echo action('Admin_SettingController@deleteMarket')?>', {isAjax: 1, market_id: market_id }, function(response){
	       	var obj = $.parseJSON(response);
		    console.log('obj: ',obj);
		    if(obj.status == 'success'){
	            $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
	            $('#messageModal').on('hidden.bs.modal', function (e) {              
	              location.reload();
	            });
	        }else{
	            $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
	        }
	        $('#messageModal').modal({show:true, keyboard:false}); 
	    });
	}
    return false;
}
function disableMarket(market_id,status){
	$.post('<?php echo action('Admin_SettingController@disableMarket')?>', {isAjax: 1, market_id: market_id, status:status }, function(response){
       	var obj = $.parseJSON(response);
	    console.log('obj: ',obj);
	    if(obj.status == 'success'){
            $('#messageModal .modal-body').html('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');            
            $('#messageModal').on('hidden.bs.modal', function (e) {              
              location.reload();
            });
        }else{
            $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
        }
        $('#messageModal').modal({show:true, keyboard:false}); 
    });
    return false;
}

    $(document).ready(function() {
    	$('#add_new_market').hide();
        $('#add_market_link').click(function(event) {
        	$('#add_new_market').toggle("slow");
        });
        $("#add_new_market").validate({
            rules: {
                wallet_from: {
                    required: true,
                },
                wallet_to: {
                    required: true,
                },
            },
            messages: {
                wallet_from: {
                    required: "Please provide a wallet from.",
                },
                wallet_to: {
                    required: "Please provide a wallet to.", 
                },
            }
	});

   });
</script>
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/markets'); ?>"+'/'+page; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop
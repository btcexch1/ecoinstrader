@extends('admin.layouts.master')
@section('content')
<h2>Edit Deposit</h2>
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
<form class="form-horizontal" role="form" id="edit_wallet" method="POST" action="{{{URL::to('/admin/edit-method-deposit')}}}">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_id')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" required="" name="id" id="type" value="{{{ $MethodDepositCurrency->id }}}" readonly>
			</div>	      	      
	    </div>
	</div>
<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_name')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="dname" id="name"  class="form-control" value="{{{ $MethodDepositCurrency->dname }}}">
			</div>	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_fee')}} (%)</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="dfee" id="name"  class="form-control" value="{{{ $MethodDepositCurrency->dfee }}}">
			</div>	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_min_value')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input  type="text"  class="form-control" name="dmin" id="wallet_username" value="{{{ $MethodDepositCurrency->dmin }}}">			  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_description')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <textarea type="text" cols="28" rows="5" name="ddes" id="password" class="form-control">{{{ $MethodDepositCurrency->ddes }}}</textarea>	  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_min_fee')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <input type="text" name="dminfee" id="password" class="form-control"  value="{{{ $MethodDepositCurrency->dminfee }}}">
			</div>
	    </div>
	</div>
	
	<div class="form-group">		
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" class="form-control" id="wallet_id" name="id" value="{{$MethodDepositCurrency->id}}">
	      <button type="submit" class="btn btn-primary" id="do_add">{{Lang::get('admin_texts.save')}}</button>
	      <a href="{{URL::previous()}}"><button type="button" class="btn btn-default">{{trans('admin_texts.back')}}</button></a>
	    </div>
	</div>
</form>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
    $(document).ready(function() {    	
        $("#edit_wallet").validate({
            rules: {
                type: "required",
                name: "required",
                ip: "required",
                port: {
                    required: true,
                    number: true
                },                
               
            },
            messages: {
                type: "Please provide a type of wallet.", 
                name: "Please provide a name of wallet.", 
                ip: "Please provide a ip.",  
                port: {
                    required: "Please provide a port.",
                    number: "Port must be a number."
                },              
               
            }
	});

   });
</script>
@stop
@extends('admin.layouts.master')
@section('content')
<h2>Edit Withdraw</h2>
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
<form class="form-horizontal" role="form" id="edit_wallet" method="POST" action="{{{URL::to('/admin/edit-method-withdraw') }}}">
	<input type="hidden" name="_token" value="{{{ Session::getToken() }}}">
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_id')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" class="form-control" required="" name="id" id="id" value="{{{ $withdrawUSD->id }}}" readonly>
			</div>	      	      
	    </div>
	</div>
<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_name')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="wname" id="wname"  class="form-control" value="{{{ $withdrawUSD->wname }}}">
			</div>	      
	    </div>
	</div>	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_fee')}} (%)</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input type="text" name="wfee" id="wfee"  class="form-control" value="{{{ $withdrawUSD->wfee }}}">
			</div>	      
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_min_value')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			  <input  type="text"  class="form-control" name="wmin" id="wmin" value="{{{ $withdrawUSD->wmin }}}">			  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_description')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <textarea type="text" cols="28" rows="5" name="wdes" id="wdes" class="form-control">{{{ $withdrawUSD->wdes }}}</textarea>	  
			</div>
	    </div>
	</div>
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{Lang::get('admin_texts.method_min_fee')}}</label>
	    <div class="col-sm-10">
	    	<div class="input-append">
			 <input type="text" name="wminfee" id="wminfee" class="form-control"  value="{{{ $withdrawUSD->wminfee }}}">
			</div>
	    </div>
	</div>
	
	<div class="form-group">		
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" class="form-control" id="method_id" name="method_id" value="{{$withdrawUSD->id}}">
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
                wname: "required",             
                wfee: {
                    required: true,
                    number: true
                },
                wmin: {
                    required: true,
                    number: true
                },
                wminfee: {
                    required: true,
                    number: true
                }
            },
            messages: {
                wname: "Please provide a name of method.",
                wfee: {
                    required: "Please provide a fee.",
                    number: "Fee must be a number."
                },              
                wmin: {
                    required: "Please provide a minimum value.",
                    number: "Please enter a number."
                },  
                wminfee: {
                    required: "Please provide a minimum fee.",
                    number: "Please enter a number."
                },  
            }
	});

   });
</script>
@stop
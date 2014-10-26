@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('ckeditor/ckeditor.js') }}
{{ HTML::script('ckfinder/ckfinder.js') }}
<h2>{{trans('admin_texts.add')}} {{$type}}</h2>
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

<form class="form-horizontal" role="form" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@addNewPost') ?: URL::to('/admin/add-post') }}}" id="add_post">	
	<div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">{{trans('admin_texts.title')}}</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="title" id="title">	      
	    </div>
	</div>	
	<div class="form-group">
	    {{--<label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.body')}}</label>--}}
	    <div class="col-sm-10">	      
	      <textarea class="form-control" id="body" name="body" cols="90" rows="10"></textarea>	     
	       <script type="text/javascript"> 
	       $(function() {	 
	       	var editor = CKEDITOR.replace('body', { filebrowserBrowseUrl : '<?php echo asset("ckfinder/ckfinder.html"); ?>', filebrowserImageBrowseUrl : '<?php echo asset("ckfinder/ckfinder.html?Type=Images");?>', filebrowserFlashBrowseUrl : '<?php echo asset("ckfinder/ckfinder.html?Type=Flash"); ?>', filebrowserUploadUrl : '<?php echo asset("ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files");?>', filebrowserImageUploadUrl : '<?php echo asset("ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images");?>', filebrowserFlashUploadUrl : '<?php echo asset("ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash");?>', filebrowserWindowWidth : '800', filebrowserWindowHeight : '480' }); 
	       	CKFinder.setupCKEditor( editor, "<?php echo asset('ckfinder/')?>" ); }) 
	       </script>
	    </div>
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox" id="show_menu" name="show_menu" value="1"> Show on menu
		        </label>
		      </div>      
	    </div>
  	</div> 
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" class="form-control" name="type" id="type" value="{{$type}}">
	      <button type="submit" class="btn btn-primary" id="add_new">{{trans('admin_texts.add')}}</button>
	    </div>
	</div>
</form>
{{ HTML::script('assets/js/jquery.validate.min.js') }}
<script type="text/javascript">
$(document).ready(function() {    	
        $("#add_post").validate({
            rules: {               
                title: "required",
                body: "required",
            },
            messages: {
                title: "Please provide a title for this article.", 
                body: "Please provide a body for this article.", 
            }
	});

   });
</script>
@stop
@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.restore_database')}}</h2>
{{--@if(isset($message_error))
<div class="alert alert-error">{{{ $message_error }}}</div>
@else
<form class="form-horizontal" role="form" method="POST" action="{{{ Confide::checkAction('Admin_SettingController@updateSetting') ?: URL::to('/admin/update-setting') }}}" enctype="multipart/form-data">
	@if ( Session::get('error') )
      <div class="alert alert-error">{{{ Session::get('error') }}}</div>
	@endif
	@if ( Session::get('success') )
      <div class="alert alert-success">{{{ Session::get('success') }}}</div>
	@endif

	@if ( Session::get('notice') )
	      <div class="alert">{{{ Session::get('notice') }}}</div>
	@endif
	<p>You can now upload your dump file up to {{$upload_max_filesize}} bytes ({{round($upload_max_filesize/1024/1024)}} Mbytes);
  directly from your browser to the server. Alternatively you can upload your dump files of any size via FTP.</p>	
	
	<div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">{{trans('admin_texts.file_restore')}}</label>
	    <div class="col-sm-10">
	      <input type="file" class="form-control" id="dumpfile" name="dumpfile" accept="*/*" size="60">	     
	    </div>
	</div>
	
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	    	<input type="hidden" name="start" value="1">
	    	<input type="hidden" name="foffset" value="0">
	    	<input type="hidden" name="totalqueries" value="0">
	    	<input type="hidden" name="MAX_FILE_SIZE" value="{{$upload_max_filesize}}">
	      <button type="submit" class="btn btn-primary" name="uploadbutton">{{trans('admin_texts.restore')}}</button>
	    </div>
	</div>
	<p>Note: The current mySQL connection charset is <i>{{$charset}}</i>. Your restore file must be encoded in <i>{{$charset}}</i> in order to avoid problems with non-latin characters. You can change the connection charset using the $db_connection_charset variable in {{'app/libraries/bigdump.php'}}</p>
</form>

<script type="text/javascript">
(function($){ 
	$(document).ready(function(){
		
	});
})(jQuery);
</script>--}}
@endif
@stop
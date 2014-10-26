@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/colorPicker.js') }}
<h2>{{trans('admin_texts.restore_database')}}</h2>
<div id="messages"></div>
<form class="form-horizontal" role="form">
	<div class="form-group">	    
	    <div class="col-sm-10">	       
	      	<div class="input-append">
			  <input type="file" class="form-control" name="file_restore" id="file_restore">
			</div>     
	    </div>	    
	</div>
	<div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-primary" id="backup_database">{{trans('admin_texts.restore')}}</button>
	    </div>
	</div>
</form>

<script type="text/javascript">
(function($){ 
	$(document).ready(function(){
		$('#backup_database').click(function(event) {
			$('#messages').html("<p class='success'>Backup successfully!</p>");
		});
	});
})(jQuery);
</script>
@stop
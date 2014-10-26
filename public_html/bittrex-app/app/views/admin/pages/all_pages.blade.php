@extends('admin.layouts.master')
@section('content')	
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.all_pages')}}</h2>
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
<div><a href="{{URL::to('admin/content/add-news')}}">{{trans('admin_texts.add_news')}}</a></div>
<table class="table table-striped" id="list-fees">
	<tr>
	 	<th>ID</th>
	 	<th>{{trans('admin_texts.title')}}</th>	 	
	 	<th>{{trans('admin_texts.action')}}</th>
	</tr> 	
	@foreach($pages as $page)
		<tr><td>{{$new->id}}</td><td><a href="{{URL::to('post')}}/{{$new->permalink}}" target="_blank">{{$new->title}}</a></td><td><a href="{{URL::to('admin/edit-post')}}/{{$new->id}}" class="edit_page">{{trans('admin_texts.edit')}}</a>  | <a href="javascript:void()" onclick="deletePost({{$new->id}})" class="delete_page">{{trans('admin_texts.delete')}}</a></td></tr>
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
<script type='text/javascript'>
function deletePost(post_id){
    $.post('<?php echo action('Admin_SettingController@deletePost')?>', {isAjax: 1, post_id: post_id }, function(response){
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
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/content/all-news'); ?>"+'/'+page; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop
@extends('admin.layouts.master')
@section('content')
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<h2>{{trans('admin_texts.login_histories')}}</h2>
<?php
$query_string = '';
foreach (Request::query() as $key => $value) {
    $query_string .= $key."=".$value."&";
}
$query_string = trim($query_string,'&');
?>
<form class="form-inline" method="get" action="{{{URL::to('/admin/manage/login-histories')}}}">
    <label>{{{ trans('admin_texts.user')}}}</label>        
    <select id="pair" style="margin-right: 20px;" name="user">
        <option value="" @if(isset($_GET['username']) == '') selected @endif>{{trans('texts.all')}}</option>
        @foreach($users as $key=> $user)
            <option value="{{$user->id}}" @if(isset($_GET['user']) && $_GET['user']==$user->id) selected @endif>{{$user->username}}</option>
        @endforeach
    </select>	
	<button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
</form>
<div id="messages"></div>
<table class="table table-striped" id="list-fees">
	<tr>	 	
	 	<th>{{trans('admin_texts.no')}}</th>
	 	<th>{{{trans('admin_texts.username')}}}</th>
	 	<th>{{trans('admin_texts.ip_address')}}</th>	 	
	 	<th>{{trans('admin_texts.date')}}</th>
	</tr> 
	<?php $active = array('active','partly filled'); ?>
        @foreach($login_histories as $key=>$login_history)
            <tr>
            	<td>{{$key+1}}</td>
            	<td>{{$login_history->username}}</td>
                <td>{{$login_history->ip_address}}</td>
                <td>{{$login_history->date}}</td>
               
            </tr>
        @endforeach 
</table>
<div id="pager"></div>
<script type='text/javascript'>
    var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){
        	return "<?php echo URL::to('admin/manage/login-histories'); ?>"+'/'+page+'<?php echo "?".$query_string ?>'; 
        }
    }
    $('#pager').bootstrapPaginator(options);
</script>
@stop
<!-- Orders History -->
@section('title')
{{{ trans('texts.orders_history')}}}
@stop
<?php
$query_string = '';
foreach (Request::query() as $key => $value) {
    if($key!='pager_page') $query_string .= $key."=".$value."&";
}
$query_string = trim($query_string,'&');
if($query_string!='') $query_string = "&".$query_string;
?>
<div id="orders_history">
    <h2>{{{ trans('texts.orders_history')}}} @if(isset($current_coin)) {{' - '.$current_coin}} @endif</h2>

    <form class="form-inline" method="GET" action="{{Request::url()}}">
        @if($filter=='')
            <div class="input-control text size1">
                <label>{{{ trans('texts.market')}}}</label>
            </div>
            <div class="input-control text size2">
                <select id="pair" style="margin-right: 20px;" name="market">
                     <option value="" @if(isset($_GET['market']) == '') selected @endif>{{trans('texts.all')}}</option>
                    @foreach($markets as $key=> $market)
                        <option value="{{$market['id']}}" @if(isset($_GET['market']) && $_GET['market']==$market['id']) selected @endif>{{ strtoupper($market['wallet_from'].'/'.$market['wallet_to'])}}</option>
                    @endforeach
                </select>
            </div>
        @endif       
        <div class="input-control text size1">
            <label>{{{ trans('texts.type')}}}</label>
        </div>
        <div class="input-control text size2">
            <select id="type" name="type" style="margin-right: 20px;">
                <option value="" @if(isset($_GET['type']) == '') selected @endif>{{trans('texts.all')}}</option>
                <option value="sell" @if(isset($_GET['type']) && $_GET['type'] == 'sell') selected @endif>{{trans('texts.sell')}}</option>
                <option value="buy" @if(isset($_GET['type']) && $_GET['type'] == 'buy') selected @endif>{{trans('texts.buy')}}</option>
            </select>  
        </div>
        <div class="input-control text size1">
            <label>{{{ trans('texts.show')}}}</label>
        </div>
        <div class="input-control text size2">
             <select id="view" name="status">
               <option value="" @if(isset($_GET['status']) == '') selected @endif>{{trans('texts.all')}}</option>
                <option value="active" @if(isset($_GET['status']) && $_GET['status'] == 'active') selected @endif>{{trans('texts.active')}}</option>
                <option value="filled" @if(isset($_GET['status']) && $_GET['status'] == 'filled') selected @endif>{{trans('texts.filled')}}</option>
                <option value="partly filled" @if(isset($_GET['status']) && $_GET['status'] == 'partly filled') selected @endif>{{trans('texts.partly_filled')}}</option>           
            </select> 
        </div>
        <div class="input-control text size1">
            <button type="submit" class="btn btn-primary" name="do_filter">{{trans('texts.filter')}}</button>
        </div>
    </form>
   
    <table class="table striped hovered">
        <thead>
        <tr>
            <th>{{{ trans('texts.market')}}}</th>
            <th>{{{ trans('texts.type')}}}</th>
            <th>{{{ trans('texts.price')}}}</th>
            <th>{{{ trans('texts.amount')}}}</th>
            <th>{{{ trans('texts.total')}}}</th>
            <th>{{{ trans('texts.status')}}}</th>
           <!--  <th>{{{ trans('texts.action')}}}</th> -->
        </tr>
        </thead>
        <tbody>
        <?php $active = array('active','partly filled'); ?>
        @foreach($ordershistories as $ordershistory)
            <tr>
                <td>{{$markets[$ordershistory->market_id]['wallet_from'].'/'.$markets[$ordershistory->market_id]['wallet_to']}}</td>
                @if($ordershistory->type == 'sell')          
                    <td><b style="color:red">{{ ucwords($ordershistory->type) }}</b></td>            
                @else          
                    <td><b style="color:green">{{ ucwords($ordershistory->type) }}</b></td>            
                 @endif
                <td>{{sprintf('%.8f',$ordershistory->price)}}</td>
                <td>{{sprintf('%.8f',$ordershistory->from_value)}}</td>
                <td>{{sprintf('%.8f',$ordershistory->to_value)}}</td>
                <td>{{$ordershistory->status}}</td>
                <!-- <td>@if(in_array($ordershistory->status,$active)) <a href="javascript:cancelOrder({{{$ordershistory->id}}});">{{trans('texts.cancel')}}</a> @endif</td> -->
            </tr>
        @endforeach  
        </tbody>
    </table>
    <div id="pager"></div>
</div>
<!-- Modals -->
    
    <div id="messageModal" class="modal hide fade" tabindex="-1" role="dialog">     
        <div class="modal-body">        
        </div>
        <div class="modal-footer">
            <button class="btn close-popup" data-dismiss="modal">{{{ trans('texts.close')}}}</button>
        </div>
    </div>
@section('script.footer')
@parent
{{ HTML::script('assets/js/bootstrap-modal.js') }}
<script type="text/javascript">
function cancelOrder(order_id){
    $.post('<?php echo action('OrderController@doCancel')?>', {isAjax: 1, order_id: order_id }, function(response){
      var obj = $.parseJSON(response); 
      $('#messageModal .modal-body').html('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
      $('#messageModal').modal({show:true});         
      if(obj.status == 'success'){
        $('#messageModal button.close-popup') .click(function() {
          location.reload();
        }); 
      }
      console.log('Obj: ',obj);
    });
}
</script>
{{ HTML::script('assets/js/bootstrap-paginator.js') }}
<script type="text/javascript">
var options = {
        currentPage: <?php echo $cur_page ?>,
        totalPages: <?php echo $total_pages ?>,
        alignment:'right',
        pageUrl: function(type, page, current){ console.log('Page: ',page);
            var url="<?php echo URL::to('user/profile/orders'); ?>";
            <?php if(!empty($filter)){ ?>
                url="<?php echo URL::to('user/profile/orders').'/'.$filter; ?>"; 
            <?php }?>
            console.log('url: ',url);
            console.log('query_string: ','<?php echo $query_string ?>');
            return url+'?pager_page='+page+'<?php echo $query_string ?>';
        }
    }
    $('#pager').bootstrapPaginator(options);
    $('#pager').find('ul').addClass('pagination');
</script>
@stop
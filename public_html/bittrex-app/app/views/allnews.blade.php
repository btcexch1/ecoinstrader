<!-- Trade History -->
@extends('layouts.main')
@section('title')
{{{ trans('texts.lastest_news')}}}
@stop
@section('body')
<div class="container">
    <div class="content">  
        <div id="allnews" class="content-body">            
          <h3>{{{ trans('texts.lastest_news')}}}</h3>          
            <table class="table striped hovered">
                @foreach($news as $new)
                <tr>
                    <td>{{date('Y-m-d',strtotime($new->created_at))}}</td>
                    <td>{{ HTML::link('/post/'.$new->permalink, $new->title) }}</td>
                </tr>
                @endforeach             
            </table>         
        </div>
    </div>
</div>
@stop
@section('script.footer')
@parent
@stop
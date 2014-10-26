@section('title')
{{Lang::get('user_texts.verify_account')}}
@stop
<!-- Edit Profile -->
<div id="edit_profile">
    <h2>{{Lang::get('user_texts.verify_account')}}</h2> 
    @if ( Session::get('error') )
        <div class="notice marker-on-bottom bg-darkRed fg-white">
            @if ( is_array(Session::get('error')) )
                {{ head(Session::get('error')) }}
            @else
                {{ Session::get('error') }}
            @endif
        </div>
    @endif

    @if ( Session::get('notice') )
        <div class="notice marker-on-bottom fg-white">            
            {{ Session::get('notice') }}
        </div>
    @endif   
    <form id="registerForm" method="POST" action="{{{ Confide::checkAction('UserController@addInfoVerify') ?: URL::to('/user/add-infoverify') }}}" enctype="multipart/form-data">    
    <h3>{{Lang::get('user_texts.where_you')}}</h3>
    <table class="table register">
        <tbody>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.address')}} 1</td>
                <td>                    
                    <div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['address_1'])) echo $userinfo['address_1'] ?>" id="address_1" name="address_1" required minlength="2">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.address')}}</td>
                <td><div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['address_2'])) echo $userinfo['address_2'] ?>" id="address_2" name="address_2" minlength="2">
                    </div></td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.city')}}</td>
                <td><div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['city'])) echo $userinfo['city'] ?>" id="city" name="city" required minlength="2">
                    </div></td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.postal_code')}}</td>
                <td><div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['postal_code'])) echo $userinfo['postal_code'] ?>" id="postal_code" name="postal_code" required minlength="2">
                    </div></td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.country')}}</td>
                <td><div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['country'])) echo $userinfo['country'] ?>" id="country" name="country" required minlength="2">
                    </div></td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.state_province')}}</td>
                <td><div class="input-control text size2">
                        <input type="text" value="<?php if(isset($userinfo['state'])) echo $userinfo['state'] ?>" id="state" name="state" minlength="2" required>
                    </div></td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.date_birth')}}</td>
                <td>                        
                    <div class="input-control text size3" data-role="datepicker" data-date='<?php if(isset($userinfo['date_birth'])) echo $userinfo['date_birth']; else echo date('Y-m-d'); ?>' data-format='yyyy-m-d' data-effect='slide' data-other-days='1' locale='{{Session::get( 'locale' )}}'>
                        <input type="text" value="<?php if(isset($userinfo['date_birth'])) echo $userinfo['date_birth'] ?>" id="date_birth" name="date_birth">                        
                    </div>
                </td>
            </tr>
            
        </tbody>
    </table>
    <h3>{{Lang::get('user_texts.photo')}}</h3>
    <table class="table register">
        <tbody>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.government_photo')}}</td>
                <td><div class="input-control text size2">
                        <input type="file" id="government_photo_1" name="government_photo_1" minlength="2">                        
                    </div><br>
                    <em>{{Lang::get('user_texts.note_government_photo')}}</em><br>
                    <em>{{Lang::get('user_texts.format_accept_1')}}</em>
                    <p><a href="javascript:void(0)" onclick="showImage('{{asset('assets/img/id_example.png')}}');">{{LAng::get('user_texts.view_example')}}</a></p>
                </td>
                <td>
                    @if(!empty($userinfo['government_photo_1'])) <span>{{Lang::get('user_texts.current_photo')}}</span> <img width="150" src="{{asset($userinfo['government_photo_1'])}}"> @endif
                </td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.government_photo_face')}}</td>
                <td><div class="input-control text size2">
                        <input type="file" id="government_photo_2" name="government_photo_2" minlength="2">                        
                    </div><br>
                    <em>{{Lang::get('user_texts.format_accept_1')}}</em>
                    <p><a href="javascript:void(0)" onclick="showImage('{{asset('assets/img/nonuseg.jpg')}}');">{{LAng::get('user_texts.view_example')}}</a></p>
                </td>
                <td>@if(!empty($userinfo['government_photo_2'])) <span>{{Lang::get('user_texts.current_photo')}}</span> <img width="150" src="{{asset($userinfo['government_photo_2'])}}"> @endif</td>
            </tr>
            <tr>
                <td style="width:180px;" align="right">{{trans('user_texts.utility_bill')}}</td>
                <td><div class="input-control text size2">
                        <input type="file" id="utility_bill" name="utility_bill" minlength="2">                        
                    </div><br>
                    <em>{{Lang::get('user_texts.format_accept_2')}}</em>
                    <p><a href="javascript:void(0)" onclick="showImage('{{asset('assets/img/bill_example.gif')}}');">{{LAng::get('user_texts.view_example')}}</a></p>
                </td>
                <td>@if(!empty($userinfo['utility_bill'])) <span>{{Lang::get('user_texts.current_photo')}}</span> <img width="150" src="{{asset($userinfo['utility_bill'])}}"> @endif</td>
            </tr>
        </tbody>
    </table>    
    <br><br>   
   <button type="submit" class="btn btn-primary">{{Lang::get('user_texts.verify_account')}}</button>
    <br><br>
    </form>
</div>
@section('script.footer')
@parent
{{ HTML::script('assets/vendors/metro-ui/js/metro-calendar.js') }}
{{ HTML::script('assets/vendors/metro-ui/js/metro-datepicker.js') }}
<script type="text/javascript">
    function showImage(url){
        $.Dialog({  shadow: true, overlay: true, draggable: true, icon: '', title: '', width: '40%', height:'40%',  padding: 10, content: 'This Window is draggable by caption.',  onShow: function(){  $.Dialog.content('<img src="'+url+'" />'); } });
        return false;
    }    
    jQuery(document).ready(function($) {
    });
</script>
@stop
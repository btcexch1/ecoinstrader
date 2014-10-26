@extends('layouts.main')
@section('title')
Coin Voting
@stop
@section('body')
<div class="container">
  <div id="voting" class="content">
      <h1>Coin Voting</h1>
      <!-- We're always looking to add new markets for the best altcoins, and to help us with this we'd like to ask you, our users to vote on what you'd like to see offered at MintPal.<br><br>
      Below is a list of coins that we're considering adding, ordered by the most voted. Please vote for your chosen coin below, due to the recent abuse of the system by bots, only registered users with a trade history are permitted to vote for coins. Every user is limited to <strong>5 (five)</strong> votes per hour.<br><br>
      We're also accepting payment votes! We've put a lot of time and capital in to making the exchange, and we believe it's only right to let users show their confidence in new coins by allowing them to use their wallets. Each <strong>0.00010000 BTC</strong> received will count for 1 vote. All payment votes will be publicly visible, as you can see by clicking the addresses below, and will go directly to improving MintPal's infrastructure. Payment votes are automatically credited every 15 minutes after 1 network confirm.<br><br>
      Although the majority of new markets will come from the voting system, we reserve the right to add new markets outside of the system where we feel necessary. Have a new coin that isn't on the list? Please contact us at support [@] mintpal.com and we'll get the coin added.
      <br><br> -->
      <table class="table striped hovered">
          <thead>
            <tr>
                <th>{{{ trans('texts.coin_code')}}}</th>
                <th>{{{ trans('texts.coin_name')}}}</th>
                <th>{{{ trans('texts.btc_payment_address')}}}</th>
                <th>Votes</th>              
            </tr>
          </thead>
          <tbody>        
              @foreach($coinvotes as $coinvote)
              <tr>
                <td>{{$coinvote->code}}</td>
                <td>{{$coinvote->name}}</td>
                <td><a href="https://blockchain.info/address/{{$coinvote->btc_address}}" target="_blank">{{$coinvote->btc_address}}</a></td>
                <td><span id="numvote_{{$coinvote->id}}">@if(isset($coinvote->num_vote)) {{$coinvote->num_vote}} @else 0 @endif</span> @if ( !Auth::guest() ) <button name="vote_now" onclick="voteNow({{$coinvote->id}})" class="btn btn-primary vote_now">Vote Now</button> @endif</td>
              </tr>
              @endforeach
          </tbody>
      </table>
  </div>
</div>
@stop
@section('script.footer')
@parent
<script type="text/javascript">

function voteNow(coinvote_id){         
      $.post('<?php echo action('VoteCoinController@doVoting')?>', {isAjax: 1, coinvote_id: coinvote_id}, function(response){
          var obj = $.parseJSON(response);
          console.log('obj: ',obj);
          if(obj.status == 'success'){
            $.Dialog({
              shadow: true,
              overlay: false,
              draggable: true,
              icon: '',
              title: 'Message',
              width: 500,
              padding: 10,
              content: 'This Window is draggable by caption.',
              sysButtons: {                 
                  btnClose: true
              },
              sysBtnCloseClick: function(e){
                  location.reload();
              },              
              onShow: function(){
                  //$.Dialog.title();
                  $.Dialog.content('<p style="color:#008B5D; font-weight:bold;text-align:center;">'+obj.message+'</p>');
              }

            });
          }else{            
            $.Dialog({
              shadow: true,
              overlay: false,
              draggable: true,
              icon: '',
              title: 'Message',
              width: 500,
              padding: 10,
              content: 'This Window is draggable by caption.',              
              onShow: function(){                  
                  $.Dialog.content('<p style="color:red; font-weight:bold;text-align:center;">'+obj.message+'</p>');
              }
              });
          }
          
      });
      return false;
}
</script>
@stop
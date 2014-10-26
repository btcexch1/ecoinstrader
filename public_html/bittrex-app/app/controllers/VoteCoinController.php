<?php
class VoteCoinController extends BaseController {
   public function doVoting(){
   		if ( Auth::guest() ){
			echo json_encode(array('status'=>'error','message'=> Lang::get('texts.request_login')));
			exit;
		}		
		$user = Confide::user();
		$user_id = $user->id;
		$coinvote_id = $_POST['coinvote_id'];
		$user_vote = Vote::where('user_id',$user_id)->where('coinvote_id',$coinvote_id)->first();
		if(isset($user_vote->user_id)){
			echo json_encode(array('status'=>'error','message'=> Lang::get('texts.you_voted')));
			exit;
		}else{
			/*$trade = Trade::where('seller_id',$user_id)->orwhere('buyer_id',$user_id)->first();
			if(!isset($trade->id)){
				echo json_encode(array('status'=>'error','message'=> Lang::get('texts.must_have_trade')));
				exit; 
			}*/
			$date = date( "Y-m-d");
			$times_vote = Vote::where('created_at','>=',$date)->where('user_id',$user_id)->orderby('created_at','desc')->get()->toArray();
			$count = count($times_vote);
			if($count>5){
				echo json_encode(array('status'=>'error','message'=> Lang::get('texts.over_perday'),'count'=>$count, 'times_vote'=>$times_vote));
				exit; 
			}else{
				$vote = new Vote();
				//Vote::insert();
				$vote->coinvote_id = $coinvote_id;
				$vote->user_id = $user_id;
				$vote->save();
				echo json_encode(array('status'=>'success','message'=> Lang::get('texts.vote_success'),'count'=>$count, 'times_vote'=>$times_vote,'vote_id'=>$vote->id));
				exit; 
			}
			
		}
   }
}

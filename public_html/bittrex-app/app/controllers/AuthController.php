<?php

class AuthController extends BaseController {
	private $authy;

    public function __construct()
    {       
        $this->authy = new Authy_Api(Config::get('auth.authy'));
    }

    public function getAuthy(){
        return $this->authy;
    }
    public function ajaxRequestInstallation()
    {
        $user = Auth::user();

        $installation = $this->authy->registerUser($user->email, Input::get('phone'),Input::get('code_area'));       
        if($installation->ok()) { 
            User::where('id', $user->id)->update(array('authy' => $installation->id()));        
            echo json_encode(array('status'=>'success','id'=>$installation->id(),'phone'=>Input::get('phone'), 'code_area'=>Input::get('code_area')));
            exit;            
        }else{
            echo json_encode(array('status'=>'error','errors'=>$installation->errors(),'phone'=>Input::get('phone'), 'code_area'=>Input::get('code_area')));
            exit;
        }
    } 

    public function ajaxUninstallation()
    {
        $user = Auth::user();

        $uninstallation = $this->authy->deleteUser($user->authy);       
        if($uninstallation->ok()) { 
            User::where('id', $user->id)->update(array('authy' => ''));        
            echo json_encode(array('status'=>'success','mesage'=> trans('messages.uninstall_two_auth_success')));
            exit;            
        }else{
            echo json_encode(array('status'=>'error','errors'=>$uninstallation->errors()));
            exit;
        }
    } 

    public function ajVerifyToken()
    {
        //$user = Auth::user();       
        $verification = $this->authy->verifyToken(Input::get('authy_id'), Input::get('token'), array('force' => 'true'));
        //echo "<pre>verification: "; print_r($verification); echo "</pre>";
        if($verification->ok()) {            
            echo json_encode(array('status'=>'success'));
            exit; 
        }else {            
            echo json_encode((array)$verification->errors()+array('status'=>'error','message'=> trans('messages.unable_verify_token')));
            exit;          
        }
    } 

    /*
     ** verify sms from facebook and google login
     */
    public function socialAjVerifyToken()
    {           
        $verification = $this->authy->verifyToken(Input::get('authy_id'), Input::get('token'), array('force' => 'true'));
        //echo "<pre>verification: "; print_r($verification); echo "</pre>";
        if($verification->ok()) {            
            $user_id=Input::get('user_login');
            $user=User::find($user_id);
            if(isset($user->id)){
                Auth::login($user);
                return Redirect::to('/');                    
            }        
        }else {      
            return Redirect::to('sms-verify')->with((array)$verification->errors()+array('error'=> trans('messages.unable_verify_token')));      
            // echo json_encode((array)$verification->errors()+array('status'=>'error','message'=> trans('messages.unable_verify_token')));
            // exit;          
        }
    }    
}
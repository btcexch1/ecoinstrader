<?php

class Setting extends Eloquent
{
    protected $table = 'settings';
    public $timestamps = false;

    public function getSetting($name,$default_value=0){
    	$setting = Setting::where('name', '=', $name)->first();
        if(isset($setting->value))
            return $setting->value;
        else return $default_value;
    }

    public function putSetting($name,$value=0){
    	$setting = Setting::where('name', '=', $name)->first();
    	if(isset($setting->id))
    		Setting::where('name', $name)->update(array('value' => $value));
    	else {
    		$this->name = $name;
    		$this->value = $value;
    		$this->save();
    	}
    }
}
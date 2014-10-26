<?php
class Role extends Eloquent
{
    protected $table = 'roles';
    /**
     * Set timestamps off
     */
    public $timestamps = false;

    /**
     * Get users with a certain role
     */
    public function users()
    {
        return $this->belongsToMany('User', 'users_roles');
    }

    public static function getRoleByName($name){
        $id = self::where('name', '=', $name)->pluck('id');
        return $id;
    }
}

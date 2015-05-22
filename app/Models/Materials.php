<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materials extends Model {

    protected $table = 'materials';

    /**
     * Many to Many relation
     *
     * @return Illuminate\Database\Eloquent\Relations\belongToMany
     */
    public function service()
    {
        return $this->belongsToMany('App\Models\Service');
    }

}

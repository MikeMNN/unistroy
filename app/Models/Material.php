<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Material extends Model  {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'materials';

    /**
     * Many to Many relation
     *
     * @return Illuminate\Database\Eloquent\Relations\belongToMany
     */
    public function posts()
    {
        return $this->belongsToMany('App\Models\Services');
    }

}
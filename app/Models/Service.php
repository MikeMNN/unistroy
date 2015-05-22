<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\DatePresenter;

class Service extends Model {

    use DatePresenter;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'services';


    public function materials()
    {
        return $this->belongsToMany('App\Models\Materials');
    }

}

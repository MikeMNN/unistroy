<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\DatePresenter;

class Picture extends Model {

    use DatePresenter;
	//
    protected $table = 'pictures';
}

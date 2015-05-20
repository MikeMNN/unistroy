<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class ServicesController extends Controller {

    public function create()
    {
        return view('services.contact');
    }

    public function store()
    {
    }

}

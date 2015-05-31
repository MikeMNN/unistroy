<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\GalleryRepository;

use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use App\Http\Requests\SearchRequest;

class GalleryController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */

    protected $picture_gestion;

    protected $nbrPages;

    public function __construct(
        GalleryRepository $picture_gestion)
    {
        $this->picture_gestion = $picture_gestion;
        $this->nbrPages = 12;

        $this->middleware('redac', ['except' => ['index', 'show']]);
        $this->middleware('ajax', ['only' => ['indexOrder', 'updateSeen', 'updateActive']]);

    }
        public function index()
	{
		$pictures = $this->picture_gestion->index($this->nbrPages);
        $links = str_replace('/?', '?', $pictures->render());

        return view('front.gallery', compact('pictures', 'links'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}

<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\ServiceRepository;

use Illuminate\Http\Request;

class ServicesController extends Controller {

    /**
     * The BlogRepository instance.
     *
     * @var App\Repositories\BlogRepository
     */
    protected $service_gestion;

    /**
     * The UserRepository instance.
     *
     * @var App\Repositories\UserRepository
     */
    protected $user_gestion;

    /**
     * The pagination number.
     *
     * @var int
     */
    protected $nbrPages;

    /**
     * Create a new BlogController instance.
     *
     * @param  App\Repositories\BlogRepository $blog_gestion
     * @param  App\Repositories\UserRepository $user_gestion
     * @return void
     */
    public function __construct(
        ServicesRepository $service_gestion,
        UserRepository $user_gestion)
    {
        $this->user_gestion = $user_gestion;
        $this->service_gestion = $service_gestion;
        $this->nbrPages = 2;

        //$this->middleware('redac', ['except' => ['indexFront', 'show', 'tag', 'search']]);
        //$this->middleware('ajax', ['only' => ['indexOrder', 'updateSeen', 'updateActive']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function indexFront()
    {
        $posts = $this->service_gestion->indexFront($this->nbrPages);
        $links = str_replace('/?', '?', $services->render());

        return view('front.service.index', compact('services', 'links'));
    }

    /**
     * Display a listing of the resource.
     *
     * @param  Illuminate\Contracts\Auth\Guard $auth
     * @return Response
     */
    public function index(Guard $auth)
    {
        $statut = $this->user_gestion->getStatut();
        $posts = $this->service_gestion->index(10, $statut == 'admin' ? null : $auth->user()->id);

        $links = str_replace('/?', '?', $posts->render());

        return view('back.service.index', compact('services', 'links'));
    }

    /**
     * Display a listing of the resource.
     *
     * @param  Illuminate\Http\Request $request
     * @return Response
     */
    public function indexOrder(Request $request)
    {
        $statut = $this->user_gestion->getStatut();
        $posts = $this->service_gestion->index(10, $statut == 'admin' ? null : $request->user()->id, $request->input('name'), $request->input('sens'));

        $links = str_replace('/?', '?', $posts->render());

        return response()->json([
            'view' => view('back.service.table', compact('statut', 'services'))->render(),
            'links' => $links
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $url = config('medias.url');

        return view('back.service.create')->with(compact('url'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  App\Http\Requests\PostRequest $request
     * @return Response
     */
    public function store(PostRequest $request)
    {
        $this->service_gestion->store($request->all(), $request->user()->id);

        return redirect('service')->with('ok', trans('back/service.stored'));
    }

    /**
     * Display the specified resource.
     *
     * @param  Illuminate\Contracts\Auth\Guard $auth
     * @param  string $slug
     * @return Response
     */
    public function show(
        Guard $auth,
        $slug)
    {
        $user = $auth->user();

        return view('front.service.show',  array_merge($this->service_gestion->show($slug), compact('user')));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  App\Repositories\UserRepository $user_gestion
     * @param  int  $id
     * @return Response
     */
    public function edit(
        UserRepository $user_gestion,
        $id)
    {
        $url = config('medias.url');

        return view('back.service.edit',  array_merge($this->service_gestion->edit($id), compact('url')));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Http\Requests\PostUpdateRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(
        PostRequest $request,
        $id)
    {
        $this->service_gestion->update($request->all(), $id);

        return redirect('service')->with('ok', trans('back/service.updated'));
    }

    /**
     * Update "vu" for the specified resource in storage.
     *
     * @param  Illuminate\Http\Request $request
     * @param  int  $id
     * @return Response
     */
    public function updateSeen(
        Request $request,
        $id)
    {
        $this->service_gestion->updateSeen($request->all(), $id);

        return response()->json();
    }

    /**
     * Update "active" for the specified resource in storage.
     *
     * @param  Illuminate\Http\Request $request
     * @param  int  $id
     * @return Response
     */
    public function updateActive(
        Request $request,
        $id)
    {
        $this->service_gestion->updateActive($request->all(), $id);

        return response()->json();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $this->service_gestion->destroy($id);

        return redirect('service')->with('ok', trans('back/service.destroyed'));
    }

    /**
     * Get tagged posts
     *
     * @param  Illuminate\Http\Request $request
     * @return Response
     */
    public function tag(Request $request)
    {
        $tag = $request->input('tag');
        $posts = $this->blog_gestion->indexTag($this->nbrPages, $tag);
        $links = str_replace('/?', '?', $posts->appends(compact('tag'))->render());
        $info = trans('front/blog.info-tag') . '<strong>' . $this->blog_gestion->getTagById($tag) . '</strong>';

        return view('front.blog.index', compact('posts', 'links', 'info'));
    }

    /**
     * Find search in blog
     *
     * @param  App\Http\Requests\SearchRequest $request
     * @return Response
     */
    public function search(SearchRequest $request)
    {
        $search = $request->input('search');
        $posts = $this->service_gestion->search($this->nbrPages, $search);
        $links = str_replace('/?', '?', $services->appends(compact('search'))->render());
        $info = trans('front/service.info-search') . '<strong>' . $search . '</strong>';

        return view('front.service.index', compact('services', 'links', 'info'));
    }


}

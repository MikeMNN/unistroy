<?php namespace App\Repositories;

use App\Models\Service, App\Models\Materials, App\Models\Post, App\Models\Tag, App\Models\Comment;

class BlogRepository extends BaseRepository{

	/**
	 * The Tag instance.
	 *
	 * @var App\Models\Tag
	 */
	protected $material;

	/**
	 * The Comment instance.
	 *
	 * @var App\Models\Comment
	 */

	/**
	 * Create a new BlogRepository instance.
	 *
	 * @param  App\Models\Post $post
	 * @param  App\Models\Tag $tag
	 * @param  App\Models\Comment $comment
	 * @return void
	 */
	public function __construct(
		Service $service,
		Materials $materials)
	{
		$this->model = $service;
		$this->tag = $materials;
	}

	/**
	 * Create or update a post.
	 *
	 * @param  App\Models\Post $post
	 * @param  array  $inputs
	 * @param  bool   $user_id
	 * @return App\Models\Post
	 */
  	private function savePost($post, $inputs, $user_id = null)
	{	
		$post->title = $inputs['title'];
		$post->summary = $inputs['summary'];	
		$post->content = $inputs['content'];	
		$post->slug = $inputs['slug'];
		$post->active = isset($inputs['active']);	
		if($user_id) $post->user_id = $user_id;

		$post->save();

		return $post;
	}

	/**
	 * Create a query for Post.
	 *
	 * @return Illuminate\Database\Eloquent\Builder
	 */
  	private function queryActiveWithUserOrderByDate()
	{	
		return $this->model
		->select('id', 'title', 'slug', 'content', 'cost')
            ->orderBy('title', 'asc');
	}

	/**
	 * Get post collection.
	 *
	 * @param  int  $n
	 * @return Illuminate\Support\Collection
	 */
	public function indexCellings($n)
	{
		$query = $this->queryActiveWithUserOrderByDate();

		return $query->where('type', 1)
            ->paginate($n);
	}

    public function indexWalls($n)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->where('type', 2)
            ->paginate($n);
    }

    public function indexFloor($n)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->where('type', 3)
        ->paginate($n);
    }

    public function indexOpennings($n)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->where('type', 4)
            ->paginate($n);
    }

    public function indexEtc($n)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->where('type', 5)
            ->paginate($n);
    }

	/**
	 * Get post collection.
	 *
	 * @param  int  $n
	 * @param  int  $id
	 * @return Illuminate\Support\Collection
	 */
	public function indexTag($n, $id)
	{
		$query = $this->queryActiveWithUserOrderByDate();

		return $query->whereHas('materials', function($q) use($id) { $q->where('materials.id', $id); })
					->paginate($n);
	}

	/**
	 * Get search collection.
	 *
	 * @param  int  $n
	 * @param  string  $search
	 * @return Illuminate\Support\Collection
	 */
	public function search($n, $search)
	{
		$query = $this->queryActiveWithUserOrderByDate();

		return $query->where(function($q) use ($search) {
			$q->where('title', 'like', "%$search%");
		})->paginate($n);
	}

	/**
	 * Get post collection.
	 *
	 * @param  int     $n
	 * @param  int     $user_id
	 * @param  string  $orderby
	 * @param  string  $direction
	 * @return Illuminate\Support\Collection
	 */
	public function index($n, $user_id = null, $orderby = 'title', $direction = 'desc')
	{
		$query = $this->model
		->select('services.id', 'title',  'content')
		->orderBy($orderby, $direction);

		if($user_id) 
		{
			$query->where('user_id', $user_id);
		} 

		return $query->paginate($n);
	}

	/**
	 * Get post collection.
	 *
	 * @param  string  $slug
	 * @return array
	 */
	public function show($slug)
	{
		$post = $this->model->whereSlug($slug)->firstOrFail();

		return compact('post');
	}

	/**
	 * Get post collection.
	 *
	 * @param  int  $id
	 * @return array
	 */
	public function edit($id)
	{
		$post = $this->model->with('tags')->findOrFail($id);

		$tags = [];

		foreach($post->tags as $tag) {
			array_push($tags, $tag->tag);
		}

		return compact('post', 'tags');
	}

	/**
	 * Update a post.
	 *
	 * @param  array  $inputs
	 * @param  int    $id
	 * @return void
	 */
	public function update($inputs, $id)
	{
		$post = $this->getById($id);
		$post = $this->savePost($post, $inputs);

		// Tag gestion
		$tags_id = [];
		if(array_key_exists('tags',  $inputs) && $inputs['tags'] != '') {

			$tags = explode(',', $inputs['tags']);

			foreach ($tags as $tag) {
				$tag_ref = $this->tag->whereTag($tag)->first();
				if(is_null($tag_ref)) {
					$tag_ref = new $this->tag();	
					$tag_ref->tag = $tag;
					$tag_ref->save();
				} 
				array_push($tags_id, $tag_ref->id);
			}
		}

		$post->tags()->sync($tags_id);
	}

	/**
	 * Update "seen" in post.
	 *
	 * @param  array  $inputs
	 * @param  int    $id
	 * @return void
	 */
	public function updateSeen($inputs, $id)
	{
		$post = $this->getById($id);

		$post->seen = $inputs['seen'] == 'true';

		$post->save();			
	}

	/**
	 * Update "active" in post.
	 *
	 * @param  array  $inputs
	 * @param  int    $id
	 * @return void
	 */
	public function updateActive($inputs, $id)
	{
		$post = $this->getById($id);

		$post->active = $inputs['active'] == 'true';	

		$post->save();			
	}

	/**
	 * Create a post.
	 *
	 * @param  array  $inputs
	 * @param  int    $user_id
	 * @return void
	 */
	public function store($inputs, $user_id)
	{
		$post = new $this->model;	
		$post = $this->savePost($post, $inputs, $user_id);

		// Tags gestion
		if(array_key_exists('tags',  $inputs) && $inputs['tags'] != '') {

			$tags = explode(',', $inputs['tags']);

			foreach ($tags as $tag) {
				$tag_ref = $this->tag->whereTag($tag)->first();
				if(is_null($tag_ref)) {
					$tag_ref = new $this->tag();	
					$tag_ref->tag = $tag;
					$post->tags()->save($tag_ref);
				} else {
					$post->tags()->attach($tag_ref->id);
				}
			}
		}

		// Maybe purge orphan tags...
	}

	/**
	 * Destroy a post.
	 *
	 * @param  int $id
	 * @return void
	 */
	public function destroy($id)
	{
		$model = $this->getById($id);

		$model->tags()->detach();
		
		$model->delete();
	}	

	/**
	 * Get post slug.
	 *
	 * @param  int  $comment_id
	 * @return string
	 */
	public function getSlug($comment_id)
	{
		return $this->comment->findOrFail($comment_id)->post->slug;
	}

	/**
	 * Get tag name by id.
	 *
	 * @param  int  $tag_id
	 * @return string
	 */
	public function getTagById($tag_id)
	{
		return $this->tag->findOrFail($tag_id)->tag;
	}

}
          @foreach ($posts as $post)
            <tr {!! !$post->seen && session('statut') == 'admin'? 'class="warning"' : '' !!}>
              <td class="text-primary"><strong>{{ $post->title }}</strong></td>
              <td>{{ $post->created_at }}</td>
              <td>{!! link_to('service/' . $post->slug, trans('back/blog.see'), ['class' => 'btn btn-success btn-block btn']) !!}</td>
              <td>{!! link_to_route('service.edit', trans('back/blog.edit'), [$post->id], ['class' => 'btn btn-warning btn-block']) !!}</td>
              <td>
              {!! Form::open(['method' => 'DELETE', 'route' => ['service.destroy', $post->id]]) !!}
                {!! Form::destroy(trans('back/blog.destroy'), trans('back/blog.destroy-warning')) !!}
              {!! Form::close() !!}
              </td>
            </tr>
          @endforeach
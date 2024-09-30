<div class="user">
    <div class="user_image"><img src="/img/profile.jpg"/></div>
    <div class="user_name"><p>{{ $user->name }}</p></div>
    <div class="user_email"><p>{{ $user->email }}</p></div>
    @if($user->coordinator($user->pivot->idproject))
        <div class="user_name"><p>Coordinator</p></div>
    @else    
        <form method="POST" action="{{ route('coordinator', [$user->id, $user->pivot->idproject]) }}">
            {{ csrf_field() }}
            {{ method_field('PUT')}}
            <button class="members-button1" type="submit">Make Coordinator</button>
        </form>
    @endif
</div>
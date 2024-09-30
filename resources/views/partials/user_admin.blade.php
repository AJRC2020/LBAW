@if(!$user->admin)

<div class="user">
    <div class="user_image"><img src="/img/profile.jpg"/></div>
    <div class="user_name"><p>{{ $user->name }}</p></div>
    <div class="user_email"><p>{{ $user->email }}</p></div>
    <form method="POST" action="{{ route('delete user', $user->id) }}">
        {{ csrf_field() }}
        {{ method_field('DELETE') }}
        <button class="user_button_delete" type="submit">DELETE</button>
    </form>
</div>
@endif
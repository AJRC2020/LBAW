<div class="profile" data-id="{{ $user->id }}">
    <p class="profile_name">{{ $user->name }}</p>
    <img src="/img/profile.jpg"/>
    <p>{{ $user->email }}</p>
    <form method="POST" action="{{ route('user', $user->id) }}">
        {{ csrf_field() }}
        <input placeholder="Password" id="password" type="password" name="password" required>
        @if ($errors->has('password'))
            <span class="error">
                {{ $errors->first('password') }}
            </span>
        @endif
        <input placeholder="New Password" id="new_password" type="password" name="new_password" required>
        @if ($errors->has('new_password'))
            <span class="error">
                {{ $errors->first('new_password') }}
            </span>
        @endif
        <input placeholder="New Password" id="new_password_confirmation" type="password" name="new_password_confirmation" required>
        <button type="submit">Change Password</button>
    </form>
</div>
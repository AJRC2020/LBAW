<form method="POST" action="{{ route('delete notes', $notification->id) }}">
    {{ csrf_field() }}
    {{ method_field('DELETE') }}
    <button type="submit"><div class="notification_div">
        <p class="notificaton_message">{{ $notification->content }}</p>
        <p class="notificaton_message2">{{ $notification->date }}</p>
    </div></button>
</form>
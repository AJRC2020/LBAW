@if($message->iduser != Auth::id())
    <div class="message-container">
        <div class="forum-div-right-all_msg-message">
            <div class="forum_image"><img src="/img/profile.jpg"/></div>
            <p class="name">{{ $message->user->name }}</p>
            <div class="forum-div-right-all_msg-message-m">
                <p>{{ $message->content }}</p>
            </div>
        </div>
    </div>
@else
    <div class="message-container">
        <div class="forum-div-right-all_msg-you">
            <div class="forum_image"><img src="/img/profile.jpg"/></div>
            <p class="name">You</p>
            <div class="forum-div-right-all_msg-message-y">
                <p>{{ $message->content }}</p>
            </div>
        </div>
    </div>
@endif
<div class="invite-div" id="{{ $invite->id }}">
    <p class="invite-div-tile">{{ $invite->project->name }}</p>
    <p class="invite-div-inviter">Inviter: {{ $invite->inviter->name }}</p>
    <form method="POST" action="{{ route('accept invite', $invite->id) }}">
            {{ csrf_field() }}
            {{ method_field('PUT') }} 
            <button class="invite-acceptbutton" type="submit">Accept</button>    
    </form>
    <form method="POST" action="{{ route('decline invite', $invite->id) }}">
            {{ csrf_field() }}
            {{ method_field('PUT') }} 
            <button class="invite-refusebutton" type="submit">Refuse</button>   
    </form>
</div>
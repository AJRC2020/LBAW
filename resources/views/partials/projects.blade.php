<a href="{{ route('project', $project->id) }}"><div class="projects-div1-project" id="{{ $project->id }}">
    <div class="projects-div1-project-div1">
        <img src="/img/projectImg1.jpg"/>  
    </div>
    <div class="projects-div1-project-div2">
        <p class="projects-div1-project-div2-projectName">{{ $project->name }}</p>
        <p class="projects-div1-project-div2-projectManager">Project Manager: {{ $project->creator() }}</p>
    </div>
</div></a>
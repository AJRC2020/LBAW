<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&family=Roboto:wght@100&display=swap" rel="stylesheet">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('ManageMe', 'ManageMe') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <section id="style">
        @yield('style')
    </section>
    <script type="text/javascript">
        // Fix for Firefox autofocus CSS bug
        // See: http://stackoverflow.com/questions/18943276/html-5-autofocus-messes-up-css-loading/18945951#18945951
    </script>
    <script type="text/javascript" src={{ asset('js/app.js') }} defer>
    </script>
  </head>
  <body>
    <main>
      <header class="navbar">
      <h1 class="navbar-icon"><a href="/">ManageME</a></h1>
        <h1 class="navbar-login"><a href="/logout">Logout</a></h1>
        <h1 class="navbar-faq"><a href="{{ route('user', Auth::id()) }}">Profile</a></h1>
        <h1 class="navbar-services"><a href="{{ route('admin projects', Auth::id()) }}">Projects</a></h1>
        <h1 class="navbar-about"><a href="{{ route('users', Auth::id()) }}">Users</a></h1>
      </header>
      <section id="content">
          @yield('content')
    </section>  
    </main>
  </body>
</html>

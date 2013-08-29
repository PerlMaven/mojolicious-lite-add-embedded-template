use Mojolicious::Lite;

plugin 'DefaultHelpers';

get '/' => sub {
    my $self = shift;
    $self->render('index', msg => 'Hello World');
} => 'index';

get '/echo' => sub {
    my $self = shift;
    $self->render('echo');
};

post '/echo' => sub {
    my $self = shift;
    $self->render( 'echo', msg => $self->param('q') );
};

app->secret('My extra secret passphrase.');

app->start;

__DATA__

@@ echo.html.ep

What are you looking for?
<form method="POST"><input name="q"><input type="submit" value="Echo"></form>

% if (defined stash('msg')) {
   You typed: <%= stash 'msg' %>
% }

<p><a href="<%= url_for 'index' %>">Index</a></p>

@@ index.html.ep

<h1><%= $msg %></h1>

<p><a href="<%= url_for 'echo' %>">Echo</a></p>

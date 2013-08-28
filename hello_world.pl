use Mojolicious::Lite;

get '/' => { text => 'Hello World' };

get '/echo' => sub {
    my $self = shift;
    $self->render('echo', msg => undef);
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

% if (defined $msg) {
   You typed: <%= $msg %>
% }


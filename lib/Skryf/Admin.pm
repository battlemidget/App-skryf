package Skryf::Admin;
# ABSTRACT: Skryf admin routines

use Mojo::Base 'Mojolicious::Controller';
use Mojo::Util qw(hmac_sha1_sum);
use Skryf::Model::User;

has model => sub {
    my $self = shift;
    Skryf::Model::User->new(dbname => $self->config->{dbname});
};

has user => sub {
    my $self = shift;
    return $self->model->get($self->session('username'));
};

sub dashboard {
    my $self = shift;
    $self->stash(user => $self->user);
    $self->render('/admin/dashboard');
}

1;

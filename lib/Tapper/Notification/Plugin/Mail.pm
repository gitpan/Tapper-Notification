package Tapper::Notification::Plugin::Mail;
BEGIN {
  $Tapper::Notification::Plugin::Mail::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Notification::Plugin::Mail::VERSION = '4.1.1';
}

use strict;
use warnings;
use 5.010;
use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTP;
use Email::Simple;
use Moose;

has cfg  => (is => 'rw', isa=> 'HashRef');


sub notify
{
        my ($self, $address, $text) = @_;

        my $transport = Email::Sender::Transport::SMTP->new({
                                                             host => $self->cfg->{mailhost},
                                                            });
        my $email = Email::Simple->create(
                                          header => [
                                                     To      => $address,
                                                     From    => $self->cfg->{sender} || 'tapper@tapper',
                                                     Subject => "Tapper notification",
                                                    ],
                                          body => $text,
                                         );
        sendmail($email, { transport => $transport });
        return;
}


1; # End of Tapper::Notification::Plugin::resume::OSRC

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Notification::Plugin::Mail

=head1 NAME

Tapper::Notification::Plugin::Mail - notification plugin - Mail

=head1 ABOUT

Notify the user about matching events using Mail.

=head1 FUNCTIONS

=head2 notify

Send mail to user.

@param string - address
@param string - text to send

=head1 AUTHOR

AMD OSRC Tapper Team, C<< <tapper at amd64.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-tapper-notification at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Tapper-Notification>.  I
will be notified, and then you'll automatically be notified of
progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Tapper::Notification::Plugin::resume::OSRC

=head1 COPYRIGHT & LICENSE

Copyright 2011 AMD OSRC Tapper Team, all rights reserved.

This program is released under the following license: freebsd

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut


use strict;
use warnings;

use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTP ();
use Email::Simple ();
use Email::Simple::Creator ();

my $smtpserver = 'Server_IP_here';
my $smtpport = 25;
my $smtpuser   = 'bob';
my $smtppassword = 'Summer15';

my $transport = Email::Sender::Transport::SMTP->new({
  host => $smtpserver,
  port => $smtpport,
  sasl_username => $smtpuser,
  sasl_password => $smtppassword,
});

my $email = Email::Simple->create(
  header => [
    To      => 'mymail@gmail.com',
    From    => 'sender@example.com',
    Subject => 'Hi!',
  ],
  body => "This is my message\n",
);

sendmail($email, { transport => $transport });

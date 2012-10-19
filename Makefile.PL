
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Daemon and plugins to handle MCP notifications",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Log::Log4perl" => 0,
    "Tapper::Schema::TestTools" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::MockModule" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-Notification",
  "EXE_FILES" => [
    "bin/tapper-notify-daemon"
  ],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::Notification",
  "PREREQ_PM" => {
    "App::Daemon" => 0,
    "Data::DPath" => 0,
    "Email::Sender::Simple" => 0,
    "Email::Sender::Transport::SMTP" => 0,
    "Email::Simple" => 0,
    "File::Spec::Functions" => 0,
    "Hash::Merge::Simple" => 0,
    "Language::Expr" => 0,
    "LockFile::Simple" => "0.208",
    "Module::Find" => "0.11",
    "Moose" => 0,
    "Tapper::Base" => 0,
    "Tapper::Config" => 0,
    "Tapper::Model" => 0,
    "Tapper::Reports::DPath" => 0,
    "Try::Tiny" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.1.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




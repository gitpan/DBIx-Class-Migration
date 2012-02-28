
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Make it easy to migrate DBIC based databases",
  "AUTHOR" => "John Napiorkowski <jjnapiork\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Path" => 0,
    "File::Spec::Functions" => 0,
    "Test::Most" => 0,
    "Test::Requires" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "DBIx-Class-Migration",
  "EXE_FILES" => [
    "bin/dbic-migration"
  ],
  "LICENSE" => "perl",
  "NAME" => "DBIx::Class::Migration",
  "PREREQ_PM" => {
    "Class::Load" => 0,
    "Config::Tiny" => 0,
    "DBD::SQLite" => 0,
    "DBIx::Class::DeploymentHandler" => "0.001008",
    "DBIx::Class::Fixtures" => "1.001014",
    "DBIx::Class::Schema::Loader" => "0.07017",
    "Devel::PartialDump" => 0,
    "File::Copy" => 0,
    "File::Path" => 0,
    "File::ShareDir::ProjectDistDir" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "JSON::XS" => 0,
    "Moose" => 0,
    "MooseX::Attribute::ENV" => 0,
    "MooseX::Getopt" => 0,
    "MooseX::Traits::Pluggable" => 0,
    "MooseX::Types::LoadableClass" => 0,
    "Pod::Usage" => 0
  },
  "VERSION" => "0.005",
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




use Common::Must;
use Test::Spec;
use Perl::Critic;
use PPI::Document::File;
use Carp qw/croak/;
use Cwd qw/getcwd/;
my @files;
my @glob_stack = ('lib/*');

sub glob_wrapper {
  my $pattern = shift;
  my @globs = glob $pattern;

  push @glob_stack, map { "$_/*" } grep { $_ !~ qr/\.pm/ } @globs;
  push @files, grep { $_ =~ qr/\.pm/ } @globs;
  return;
}

do {
  my $pattern = shift @glob_stack;
  glob_wrapper($pattern);
} while (scalar(@glob_stack) > 0);

my $current_dir = getcwd;
my $critic = Perl::Critic->new(-profile => "$current_dir/.perlcriticrc");
describe "Perl::Criticについて" => sub {
  for my $file_path (@files) {
    my $file = PPI::Document::File->new($file_path);

    context $file_path => sub {
      my @violations;
      before all => sub {
        @violations = $critic->critique($file);
        if (scalar(@violations) > 0) {
          warn "$file_path: $_" for @violations;
        };
      };

      it 'no violation' => sub {
        is scalar(@violations), 0;
      };
    };
  }
};

runtests unless caller;
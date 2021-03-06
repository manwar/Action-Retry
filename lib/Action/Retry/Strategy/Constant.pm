package Action::Retry::Strategy::Constant;

# ABSTRACT: Constant sleep time strategy

use Moo;

=head1 SYNOPSIS

To be used as strategy in L<Action::Retry>

=cut

with 'Action::Retry::Strategy';
with 'Action::Retry::Strategy::HelperRole::RetriesLimit';

=attr sleep_time

  ro, Int, defaults to 1000 ( 1 second )

The number of milliseconds to wait between retries

=cut

has sleep_time => (
    is => 'ro',
    lazy => 1,
    default => sub { 1000 },
);

sub compute_sleep_time { $_[0]->sleep_time }

sub reset { return }

sub next_step { return }

sub needs_to_retry { 1 }

# Inherited from Action::Retry::Strategy::HelperRole::RetriesLimit

=attr max_retries_number

  ro, Int|Undef, defaults to 10

The number of times we should retry before giving up. If set to undef, never
stop retrying

=cut

1;

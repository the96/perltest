package Types::UInt;
use Common::Must;

use Types::Standard qw/Int/;
use Type::Library -base;
use Type::Utils;

use Exporter qw/import/;
our @EXPORT = qw/UInt/;

declare 'UInt',
  as Int,
  where { $_ >= 0 };

1;
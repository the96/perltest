package Calc;
use Common::Must;
use Types::UInt;

use Function::Return;
use Function::Parameters;

method add_number(UInt $a, UInt $b) :Return(UInt) {
  return $a + $b;
}

1;
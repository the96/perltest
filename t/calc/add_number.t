use Test::Spec;
use Calc;

describe '加算処理について' => sub {
  it '正常実行時' => sub {
    my $result = Calc->add_number(1, 2);
    is $result, 3;
  };

  it '負の値を渡すと死ぬ' => sub {
    trap {
      Calc->add_number(-1, -1);
    };
    ok $trap->die;
  };
};

runtests unless caller;
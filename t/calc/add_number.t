use Test::Spec;
use Calc;

describe '加算処理について' => sub {
  context '正常系' => sub {
    it '正しい計算結果が得られる' => sub {
      my $result = Calc->add_number(1, 2);
      is $result, 3;
    };

    it '名前付きで呼び出せる' => sub {
      my $result = Calc->add_number_with_named_parameter(a => 3, b => 2);
      is $result, 5;
    };
  };

  context '異常系' => sub {
    it '負の値を渡すと死ぬ' => sub {
      trap {
        Calc->add_number(-1, -1);
      };
      ok $trap->die;
    };
  };
};

runtests unless caller;
use Common::Must;
use Test::Spec;

describe 't/ok.t' => sub {
  it 'テストが成功する' => sub {
    ok 1;
  };
};

runtests unless caller;
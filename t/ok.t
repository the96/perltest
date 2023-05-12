use Test::Spec;

warn @INC;
describe 't/ok.t' => sub {
  it 'テストが成功する' => sub {
    ok 1;
  };
};

runtests unless caller;
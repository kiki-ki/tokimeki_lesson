require 'test/unit'
require_relative 'dog'

class TestDog < Test::Unit::TestCase
  def test_initialize
    # kind: :chihuahua でビルドすると成功すること
    assert_nothing_raised(ArgumentError) { Dog.new(name: 'pochi', kind: :chihuahua) }

    # kind: :pomeranian でビルドすると成功すること
    assert_nothing_raised(ArgumentError) { Dog.new(name: 'pochi', kind: :pomeranian) }

    # kind: :scottishfold でビルドすると失敗すること
    assert_raise(ArgumentError) { Dog.new(name: 'pochi', kind: :scottishfold) }
  end

  def test_call
    dog = Dog.new(name: 'pochi', kind: :chihuahua)

    # 名前で呼ぶと`Bow-wow`と返ってくる
    assert_equal('Bow-wow', dog.call(dog.name))

    # 食事と呼ぶと`Bow-wow`と返ってくる
    assert_equal('Bow-wow', dog.call('meal'))

    # その他の言葉なら`...`と返ってくる
    assert_equal('...', dog.call('how are you?'))
  end

  def test_trick
    dog = Dog.new(name: 'pochi', kind: :chihuahua)

    # :hands をお願いすると成功すること
    assert_nothing_raised(StandardError) { Dog.new(name: 'pochi', kind: :chihuahua).trick(:hands) }

    # 対応していないtrickをお願いすると失敗すること
    assert_raise(ArgumentError) { dog.trick(:short_conte) }
  end
end

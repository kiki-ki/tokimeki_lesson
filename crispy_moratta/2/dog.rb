class Dog
  attr_reader :name # 名前
              :kind # 犬種

  def initialize(name:, kind:)
    @name = name
    @kind = kind

    validate
  end

  def call(word)
  end

  def trick(type)
  end

  def self.kinds
    [
      :chihuahua,
      :bulldog
    ]
  end

  def self.tricks
    [
      :hands,
      :afro
    ]
  end

  private

  def read_trick_txt(trick)
    file = File.open("./tricks/#{trick}.txt")
    body = file.read
    file.close
    body
  end

  def validate
    validate_kind
  end

  def validate_kind
    # 対応していない犬種ならエラーを起こす
    unless self.class.kinds.include?(@kind)
      raise ArgumentError.new("#{@kind} is invalid kind")
    end
  end
end

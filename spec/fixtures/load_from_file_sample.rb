class LoadFromFileSample
  extend Loica::Build::Utils::LoadFromFile

  def initialize
    self.class.on_new.call if self.class.on_new
  end

  class << self
    attr_accessor :on_new
  end
end

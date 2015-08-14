class ConfigurationSample < Loica::Build::Configuration
  def initialize
    super
    self.class.on_new.call if self.class.on_new
  end

  class << self
    attr_accessor :on_new
  end
end

class HrtBus::Config
  class << self 
    attr_accessor :timeout, :buses_uri
  end
  def self.configure(&block)
    yield self
  end
end

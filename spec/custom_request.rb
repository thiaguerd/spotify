class CustomRequest
  attr_accessor :protocol, :host_with_port

  def initialize(options = {})
    @protocol = options[:protocol] || 'http://'
    @host_with_port = options[:host_with_port] || 'test.host'
  end
end

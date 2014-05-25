$LOAD_PATH.unshift(File.dirname(File.realpath(__FILE__)) + '/../lib')
require 'tabbit'

RSpec.configure do |config|
  config.order = 'random'
end

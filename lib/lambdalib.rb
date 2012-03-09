require "lambdalib/version"
require "lambdalib/ASCII_LOGO"
require "lambdalib/railtie" if defined? Rails

Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |ext| load ext } if defined? Rake

module Lambdalib
  ROOT_DIR = File.dirname(__FILE__) + "/../"
end

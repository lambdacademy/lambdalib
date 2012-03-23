require "lambdalib/version"
require "lambdalib/ascii_logo"
require "lambdalib/railtie" if defined? Rails
require "lambdalib/problem"
require "lambdalib/pset"
require "lambdalib/routes"
require "lambdalib/engine"

#Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |ext| load ext } if defined? Rake

module Lambdalib
  ROOT_DIR = File.dirname(__FILE__) + "/../"
end

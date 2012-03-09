# disabling now, because of DB testing...
#ENV["RAILS_ENV"] = "test"
require 'config/environment'
require 'colored'

def assert(expression)
  throw AssertionError unless expression
end


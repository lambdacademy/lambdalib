# encoding: utf-8

require 'colored'

namespace :lambda do
  desc "Check"
  task :check do
    puts Lambdalib::ascii_logo
    puts
  end
end

desc "Run for λcademy"
task :lambda => [ "lambda:check" ] do
end

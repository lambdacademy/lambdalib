# encoding: utf-8

require 'colored'

namespace :lambda do
  desc "Check"
  task :check => :environment do
    puts Lambdalib::ascii_logo
    puts

    # TODO: refactor
    Lambdalib::print_problems

    puts "  Checking project, please be patient...".white.bold
    puts

    Lambdalib::run_tests
    puts
  end
end

desc "Run for λcademy"
task :lambda => [ "lambda:check" ] do
end

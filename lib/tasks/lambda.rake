# encoding: utf-8

require 'colored'

namespace :lambda do
  desc "Check"
  task :test do
    puts "HOWDY"
  end

  task :check, [ :arg ] => :environment do |t, args|
    unless args.present?
      puts "Missing problem. Syntax is `rake lambda:check[pset/problem]`"
      exit 1
    end

    parts = args[:arg].split '/'

    pset = parts[0]
    problem = parts[1]

    problem_class = "#{ pset.camelize }::Pset::#{ problem.camelize }".constantize
    print problem_class.check.to_json
  end
end

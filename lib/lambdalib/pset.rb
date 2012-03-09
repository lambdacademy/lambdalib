
module Lambdalib
  def self.print_problems
    @@problems.each do |problem|
      puts "  #{ problem.short_name.cyan }: #{ 'incomplete'.red }"
      puts "  #{ problem.description }"
      puts
    end
  end

  def self.add_problem(problem)
    @@problems ||= []
    @@problems.push problem
  end

  def self.run_tests
    @@problems.each do |problem|
      problem.tests.each do |test|
        cmd = "ruby -I#{ problem.root_dir }:#{ Lambdalib::ROOT_DIR }:. #{ test }"
        #puts "  trying to run #{ cmd.yellow }"
        system cmd
      end
    end
  end

  class Pset
    # TODO refactor with class attributes?
    def self.short_name(short_name)
      @@short_name = short_name
    end

    def short_name
      @@short_name
    end

    # TODO refactor with class attributes?
    def self.description(description)
      @@description = description
    end

    def description
      @@description
    end

    def self.root_dir(dir)
      @@root_dir = dir
    end

    def root_dir
      @@root_dir
    end

    def self.add_test(file)
      @@tests ||= []
      # TODO refactor, allow support of other relative paths and whatnot
      @@tests.push(@@root_dir + "/../../" + file)
    end

    def tests
      @@tests
    end

    # TODO: fix potential init ordering issues?
    Lambdalib::add_problem self.new
  end
end


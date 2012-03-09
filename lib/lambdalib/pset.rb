
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

  class Pset
    # TODO refactor with class attributes?
    def self.short_name(short_name)
      @@short_name = short_name
    end

    def short_name
      @@short_name
    end

    def self.description(description)
      @@description = description
    end

    def description
      @@description
    end

    # TODO: fix potential init ordering issues?
    Lambdalib::add_problem self.new
  end
end


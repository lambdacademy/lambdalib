
module Lambdalib
  class Pset
    class Problem
      def self.find_by_name(name)
        puts "Lambdalib::Problem.find_by_name"
        puts "finding ... #{ "::#{ name.camelize }".constantize.inspect }"
      end
    end
  end
end


module Lambdalib
  class Pset
    class Problem
      def self.short_name(name)
        @@short_name = name
      end

      def self.add_test(test)
        @@tests ||= [ ]
        @@tests.push test
      end

      def self.pset_module_name
        name.split("::")[0]
      end

      def self.code
        name.split("::")[-1].underscore
      end

      def self.description_view_path
        "app/views/#{ pset_module_name.underscore }/problem/#{ code }"
      end

      def self.root_path
        "#{ pset_module_name }::ROOT_DIR".constantize
      end

      def self.path_of(uri)
        File.expand_path File.join( root_path, uri )
      end

      def self.description
        path = path_of description_view_path
        ActionView::Base.new(Rails.configuration.paths['app/views'].first).render :file => path
      end

      def self.check
        puts "@@tests.length = #{ @@tests.length }"
        @@tests.map do |test|
          file = path_of "problems/tests/#{ test }.rb"
          cmd = "ruby -I#{ root_path }:#{ Lambdalib::ROOT_DIR }:. #{ file }"
          `#{ cmd }`
        end
      end
    end
  end
end

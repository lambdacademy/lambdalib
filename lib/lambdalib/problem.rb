module Lambdalib
  class Pset
    class Problem
      def self.short_name(name)
        @@short_name = name
      end

      def self.add_test(test)
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

      def self.description
        root_path = "#{ pset_module_name }::ROOT_DIR".constantize
        puts "ROOT PATH = #{ root_path }"
        path = File.expand_path File.join( root_path, description_view_path )
        puts "PATH = #{ path }"
        ActionView::Base.new(Rails.configuration.paths['app/views'].first).render :file => path
      end
    end
  end
end

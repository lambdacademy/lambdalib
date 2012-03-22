module Lambdalib
  class Routes
    def self.add_hooks(router)
      router.instance_exec do
        mount Lambdalib::Engine => '/lambda'
      end
    end
  end
end

require "roda"

class Roda
  module RodaPlugins
    module ResolveContainer
      module RequestMethods
        def resolve(key)
          component = Otus::Container[key]
          yield component
        end
      end
    end

    register_plugin :resolve_container, ResolveContainer
  end
end

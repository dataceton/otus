require "roda"

class Roda
  module RodaPlugins
    module JSONRender
      module RequestMethods
        def render(template, ...)
          response["Content-Type"] = "application/json"
          view = Otus::Container["views.#{template}"]
          view.call(...).output
        end
      end
    end

    register_plugin :json_render, JSONRender
  end
end

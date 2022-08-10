# require 'otus/view'

module Otus
  module Views
    class Success < View
      config.template = "shared/_success"

      expose :status, decorate: false, default: "success"
    end
  end
end

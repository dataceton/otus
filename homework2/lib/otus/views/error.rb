# require 'otus/view'

module Otus
  module Views
    class Error < View
      config.template = "shared/_error"

      expose :message, decorate: false
      expose :data, decorate: false, default: nil
    end
  end
end

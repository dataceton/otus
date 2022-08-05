# require 'otus/view'

module Otus
  module Views
    class Error < View
      config.template = "shared/_error"

      expose :message
    end
  end
end

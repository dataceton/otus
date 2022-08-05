# require 'otus/view'

module Otus
  module Views
    class Fail < View
      config.template = "shared/_fail"

      expose :data, default: nil
    end
  end
end

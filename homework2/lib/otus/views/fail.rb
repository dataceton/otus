# require 'otus/view'

module Otus
  module Views
    class Fail < View
      config.template = "shared/_fail"

      expose :data, decorate: false, default: nil
    end
  end
end

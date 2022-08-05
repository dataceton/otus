# require 'otus/view'

module Otus
  module Views
    module Users
      class Show < View
        include Import["users.repository"]

        config.template = "users/show"

        expose :user
      end
    end
  end
end

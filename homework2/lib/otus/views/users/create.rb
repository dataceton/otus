module Otus
  module Views
    module Users
      class Create < View
        include Import["users.repository"]

        config.template = "users/show"

        expose :user
      end
    end
  end
end

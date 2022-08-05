module Otus
  module Views
    module Users
      class Show < View
        include Import["users.repository"]

        config.template = "users/delete"

        expose :result do |id:|
          # repository.delete(id)
        end
      end
    end
  end
end

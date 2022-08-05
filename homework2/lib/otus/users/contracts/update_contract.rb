module Otus
  module Users
    module Contracts
      class UpdateContract < Dry::Validation::Contract
        include Import["users.repository"]

        params do
          optional(:username).filled(:string)
          optional(:first_name).filled(:string)
          optional(:last_name).filled(:string)
          optional(:phone).filled(:string)
          optional(:email).filled(:string)
        end

        rule(:username).validate(:uniqueness)
        rule(:email).validate(:uniqueness)
        rule(:phone).validate(:uniqueness)
      end
    end
  end
end

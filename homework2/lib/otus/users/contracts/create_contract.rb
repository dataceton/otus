module Otus
  module Users
    module Contracts
      class CreateContract < Dry::Validation::Contract
        include Import["users.repository"]

        params do
          required(:username).filled(:string)
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
          required(:phone).filled(:string)
          required(:email).filled(:string)
        end

        rule(:username).validate(:uniqueness)
        rule(:email).validate(:uniqueness)
        rule(:phone).validate(:uniqueness)
      end
    end
  end
end

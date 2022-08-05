require "dry/monads"
require "dry/monads/do"
require "dry/matcher/result_matcher"

module Otus
  module Users
    module Commands
      class Create
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        include Import[
          "users.repository",
          "users.contracts.create_contract"
        ]

        def call(params)
          result = yield validate(params)
          user = yield persist(result)

          Success(user)
        end

        private

        def validate(params)
          create_contract.call(params)
        end

        def persist(result)
          Success(repository.create(result.to_h))
        end
      end
    end
  end
end

require "dry/monads"
require "dry/monads/do"
require "dry/matcher/result_matcher"

module Otus
  module Users
    module Commands
      class Update
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        include Import["users.contracts.update_contract"]

        def call(user, params)
          result = yield validate(params)
          user = yield persist(user, result)

          Success(user)
        end

        private

        def validate(params)
          update_contract.call(params)
        end

        def persist(user, result)
          user = repository.build(prepare_attributes(user, result))
          if repository.save(user)
            Success(user)
          else
            Failure
          end
        end

        def prepare_attributes(user, result)
          user.attributes.merge(result.to_h)
        end
      end
    end
  end
end

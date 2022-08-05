require "dry/monads"
require "dry/monads/do"
require "dry/matcher/result_matcher"

module Otus
  module Users
    module Commands
      class Delete
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        include Import["users.repository"]

        def call(id)
          if repository.delete(id)
            Success
          else
            Failure
          end
        end
      end
    end
  end
end

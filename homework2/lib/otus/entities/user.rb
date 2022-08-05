require "dry-struct"
module Otus
  module Entities
    class User < Dry::Struct
      attribute :id, Types::Integer.optional
      attribute :username, Types::String
      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute :phone, Types::String
      attribute :email, Types::String
    end
  end
end

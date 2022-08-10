module Otus
  module Users
    class Repository
      include Import[:database]

      class NotFound < StandardError; end

      def find(id)
        result = database[:users].where(id: id).first
        Entities::User.new(result) if result
      end

      def find!(id)
        result = find(id)
        raise NotFound, "User not found" unless result
        result
      end

      def create(params)
        id = database[:users].insert(params)
        Entities::User.new(id: id, **params)
      end

      def save(user)
        database[:users].where(id: user.id).update(user.attributes)
      end

      def delete(id)
        database[:users].where(id: id).delete.positive?
      end

      def unique?(**params)
        database[:users].where(params).empty?
      end

      def build(params)
        Entities::User.new(params)
      end
    end
  end
end

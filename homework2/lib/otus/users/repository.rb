module Otus
  module Users
    class Repository
      include Import["persistance.db"]

      class NotFound < StandardError; end

      def find(id)
        result = db[:users].where(id: id).first
        Entities::User.new(result) if result
      end

      def find!(id)
        result = find(id)
        raise NotFound, "User not found" unless result
        result
      end

      def create(params)
        id = db[:users].insert(params)
        Entities::User.new(id: id, **params)
      end

      def save(user)
        db[:users].where(id: user.id).update(user.attributes)
      end

      def delete(id)
        db[:users].where(id: user.id).delete.positive?
      end

      def unique?(**params)
        db[:users].where(params).empty?
      end

      def build(params)
        Entities::User.new(params)
      end
    end
  end
end

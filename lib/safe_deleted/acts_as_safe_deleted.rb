module SafeDeleted
  module ActsAsSafeDeleted
    extend ActiveSupport::Concern

    included do
      def soft_delete
        self.update(is_active: false)
        true
      end
    end

    class_methods do
      def active
        where(is_active: true)
      end

      def inactive
        where(is_active: false)
      end

      def soft_delete_all
        update_all(is_active: false)
        true
      end
    end
  end
end

module Monthly
  module ActsAsMonthly
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_monthly(options = {})
        table_name = self.table_name
        default_scope -> { order("#{table_name}.#{self.name.underscore}_date ASC, #{table_name}.created_at ASC") }
        scope :at_month, lambda { |initial_date|
          where("#{self.name.underscore}_date >= ? and #{self.name.underscore}_date < ?", initial_date, initial_date.next_month.beginning_of_month)
        }
      end
    end
  end
end

ActiveRecord::Base.send :include, Monthly::ActsAsMonthly

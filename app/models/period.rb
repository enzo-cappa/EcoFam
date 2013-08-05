class Period < ActiveRecord::Base
  has_many :spends

  validates :year, uniqueness: { scope: :month }, numericality: {only_integer: true, greater_than: 0}
  validates :month, numericality: {only_integer: true, greater_than: 0, less_than: 13}

  scope :actual, -> {where(month: Time.now.month, year: Time.now.year).first}

  def next
    next_month = DateTime.new(self.year, self.month, 1) + 1.month
    Period.where(month: next_month.month, year: next_month.year).first
  end

  def prev
    prev_month = DateTime.new(self.year, self.month, 1) - 1.month
    Period.where(month: prev_month.month, year: prev_month.year).first
  end
end

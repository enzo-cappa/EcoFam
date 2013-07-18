class Spend < ActiveRecord::Base
  can_be_tagged
  acts_as_monthly
  before_save :clear_date_when_needs_confirmation

  validates :titulo, :presence => true
  validates :amount, :presence => true, :numericality => true

  def needs_confirmation=(needs_confirmation)
    if "1" == needs_confirmation
      #FIXME: Constant string
      self.add_tag("confirmar")
    end
  end

  def needs_confirmation
    self.tags.where(name: "confirmar").length > 0
  end

  def tags_not_confirm
    self.tags.where.not(name: "confirmar")
  end
  private
  def clear_date_when_needs_confirmation
    if self.needs_confirmation
      self.spend_date = self.spend_date.end_of_month
    end
  end
end

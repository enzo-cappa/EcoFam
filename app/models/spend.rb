class Spend < ActiveRecord::Base
  
  acts_as_taggable
  
  public
  
  def Spend.total
    self.sum(:ammount, :conditions => ['done = ?', true])
  end
end

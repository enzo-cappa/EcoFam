class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def by_period
    if params[:year] && params[:month]
      @period = Period.where(month: params[:month], year: params[:year]).first_or_create
    else
      @period = Period.actual
    end

    @prev_period = @period.prev
    @next_period = @period.next
  end
end

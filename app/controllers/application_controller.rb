class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def by_period
    if params[:year] && params[:month]
      year = params[:year]
      month = params[:month]
    end

    year = Time.now.year unless year
    month = Time.now.month unless month

    @period_date = DateTime.new(year.to_i, month.to_i, 1)

    @prev_period = @period_date - 1.month
    @next_period = @period_date + 1.month
  end
end

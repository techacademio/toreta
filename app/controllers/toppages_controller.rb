class ToppagesController < ApplicationController
  def index
    if logged_in?
      @recruits = current_company.recruits.order('created_at DESC')
    end
  end
end

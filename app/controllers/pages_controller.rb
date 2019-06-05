class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @result = Journey.new
  end

  def dashboard
  end
end

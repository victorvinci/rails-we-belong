class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about disclaimer]

  def home
    @companies = Company.all.sample(3)
  end

  def about
  end

  def disclaimer
  end

end

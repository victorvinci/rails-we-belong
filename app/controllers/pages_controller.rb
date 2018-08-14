class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about disclaimer]

  def home
  end

  def about
  end

end

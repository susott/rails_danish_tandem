class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :design, :about]

  def home
  end

  def design
    @user = current_user
  end

  def about
  end
end

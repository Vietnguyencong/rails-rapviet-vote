class HomeController < ApplicationController
  def index
    @rappers = Rapper.all
  end
end

class HomepageController < ApplicationController
  def index
    flash[:alert] = "Hello, world!"
  end
end

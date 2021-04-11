class PaymentController < ApplicationController
  def checkout
  end

  def failure
  end

  def success
  end

  def selected
    @plan = params[:plan]
    @price = params[:price]
  end
end

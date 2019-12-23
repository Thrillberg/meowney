class MeowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meows = Meow.all
  end

  def show
  end

  def new
    redirect_to new_payment_path unless current_user.stripe_customer_id

    @meow = Meow.new
  end

  def create
    @meow = Meow.new(params.require(:meow).permit(:body))
    if @meow.save
      Stripe::Charge.create({
        amount: 500,
        currency: 'usd',
        customer: current_user.stripe_customer_id,
      })
      redirect_to root_path
    else
      render :new
    end
  end
end

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
    render layout: "meow"
  end

  def create
    @meow = Meow.new(params.require(:meow).permit(:body, :cost))
    if @meow.save
      Stripe::Charge.create({
        amount: @meow.cost + 50,
        currency: 'usd',
        customer: current_user.stripe_customer_id,
      })
      redirect_to root_path
    else
      render :new
    end
  end
end

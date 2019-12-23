class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    render layout: "payment"
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create({
      source: token,
      email: current_user.email,
    })

    current_user.update(stripe_customer_id: customer.id)

    Stripe::Charge.create({
      amount: 500,
      currency: 'usd',
      customer: customer.id,
    })

    redirect_to new_meow_path
  end
end

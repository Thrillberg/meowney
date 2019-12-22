require "stripe"
Stripe.api_key = ENV.fetch("MEOWNEY_STRIPE_API_KEY")

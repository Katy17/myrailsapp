if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_zgFe3FidYTmXEylCA6QmS9dU',
    secret_key: 'sk_test_x8DV0TEEHkYlN72PtJZ9197Z'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
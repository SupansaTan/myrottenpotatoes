# Replace API_KEY and API_SECRET with the values you got from Twitter
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "Lb50Djt5MKJIiqrcs6y4z06i2", "W4P5Q9BMoQ06l9RdvQ4lQPbKnLmDAQXj2oed2tdp7hGjm4HtGf"
  end
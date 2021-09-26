if Rails.env.development?
    raise "Unsafe to run Cucumber features in development mode. " +
      "This can happen when running Cucumber via 'rake cucumber'. " +
      "Use 'rake' or 'cucumber' instead."
  end
  